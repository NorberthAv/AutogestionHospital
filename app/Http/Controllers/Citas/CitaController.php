<?php

namespace App\Http\Controllers\Citas;

use stdClass;
use Carbon\Carbon;
use App\Api\ServicioApi;
use App\Models\Citas\Cita;
use Illuminate\Http\Request;
use App\Models\Mensajeria\Correo;
use App\Models\Documentos\Recipes;
use Illuminate\Support\Facades\DB;
use App\Models\Hospitales\Hospital;
use App\Http\Controllers\Controller;
use App\Models\Beneficiario\Persona;
use App\Http\Requests\Cita\StoreCita;
use App\Models\Mensajeria\CorreoEnvio;
use App\Models\Especialidades\Categoria;
use RealRashid\SweetAlert\Facades\Alert;
use App\Http\Requests\Calendario\Horarios;
use App\Models\Especialidades\Especialidad;
use App\Http\Controllers\Correo\APIcorreolaravel;

class CitaController extends Controller
{
    public function __construct(ServicioApi $servicioapi)
    {
        $this->servicioapi = $servicioapi;
    }
    public function index()
    {
        //
        $breadcrumb = [
            [
                'link' => '#',
                'name' => 'Home'
            ],
            [
                'link' => '#',
                'name' => 'Registro de Citas'
            ]
        ];

        $paso = 1;
        $especialidades = Especialidad::comboEspecialidadesActivasconMedicos();
        $categorias = Categoria::combocategoria();
        return view('home', compact('breadcrumb','paso','especialidades','categorias'));
    }
    public function gethospital(Request $request){

        $hospital = Hospital::Hospital_especialidad($request->especialidad);

        return response()->json($hospital);
    }
    public function getcategoria(Request $request){

        $categorias = Categoria::Categoria_especialidad($request->especialidad);
        return response()->json($categorias);
    }
    public function store(StoreCita $request){

        DB::beginTransaction();
        try {
            $data_persona = Persona::guardarPC($request);
            $validarDisponibilidadEspecialidades = Especialidad::disponibilidadhoras($request->especialidad,$request->hospital);
            if(!$validarDisponibilidadEspecialidades){
                Alert::error('Hospital', 'El Hospital seleccionado no ha cargado el numero de citas disponibles diarias.');
                DB::rollback();
                return redirect()->back();
            }
            $obtenerUltimaCitaEspecialidad = Cita::ultimacitaagendada($request->especialidad,$request->hospital,$validarDisponibilidadEspecialidades->citas_diarias);

            $cita = Cita::guardarCita($request,$data_persona->id,$obtenerUltimaCitaEspecialidad);
        $consultarHospital = Hospital::consultarHospital($request->hospital);
        $hospital = 'Hospital';
        if($consultarHospital){
            $hospital = $consultarHospital->hospital.' ('.$consultarHospital->entidad.'-'.$consultarHospital->municipio.'-'.$consultarHospital->parroquia.' )';
        }
        $creacionCorreo = Correo::guardarCorreo($request,$cita->id,$consultarHospital,$obtenerUltimaCitaEspecialidad);
        $correoEnvio = CorreoEnvio::envioCorreo($creacionCorreo->id,$request->correo);
        $descripcion = 'Recipe de para cita de la especialidad';


        if($request->archivo){
            $archivo = $request->file('archivo');
            $data = file_get_contents($archivo->path());
            $file_base64 = base64_encode($data);
            $fecha = now();
            $timeStamp = $fecha->getTimestamp();
            $nombre = $timeStamp;
            $hash = hash_file('sha256', $archivo->path());
            $nombre = $nombre . '_' . $hash . '.pdf';
            $tipo_documento_id = 1;
            $respuesta = $this->servicioapi->subirArchivo($file_base64,$cita->id, $data_persona->id,$hash, $nombre);

            if ($respuesta == 'ok') {
                $Oficio = Recipes::guardarArchivo($nombre,$hash,$tipo_documento_id,$descripcion,$data_persona->id);
                $citaGuardada = Cita::actualizarArchivo($cita->id,$Oficio->id);


                // -----------------------------Funciona PYTHON-------------------------------
                // $respuestacorreo = $this->servicioapi->enviocorreo($parametrosCorreo);
                // if($respuestacorreo->resp == 'ok'){
                //     Alert::success('Cita', 'La Cita fue Agendada Correctamente.');
                // }else{
                //     Alert::error('Error al enviar el Correo', 'Verificar Servicio.');
                //     DB::rollback();
                //     return redirect()->back();
                // }
                 // -----------------------------Funciona PYTHON-------------------------------
            }
        }
       $Dia_cita = Carbon::parse($cita->start)->format('d/m/Y');
        $parametrosCorreo = [
            'archivo'            => $file_base64?? null,
            'recipe'             => $nombre??null,
            'hospital'           => $hospital,
            'telefono_hospital'  => $consultarHospital->telefono,
            'correo_hospital'    => $consultarHospital->correo,
            'correo_paciente'    => $data_persona->correo,
            'cedula_paciente'    => $data_persona->cedula,
            'nombre_paciente'    => $data_persona->nombre,
            'apellido_paciente'  => $data_persona->apellido,
            'cuerpo_correo'      => $creacionCorreo->descripcion,
            'fecha_cita'         => $Dia_cita,
            'hora_cita'          => $cita->hora,
         ];
        $correoenvioPHP = APIcorreolaravel::contact($parametrosCorreo);

         DB::commit();
        Alert::success('Cita', 'La Cita fue Agendada Correctamente.')
        ->html("Para el Día: <strong>{$Dia_cita}</strong><br> En la Hora: <strong>{$cita->hora}</strong>");
        return redirect()->back();

        } catch (\Illuminate\Database\QueryException $e) {
dd($e);
        DB::rollback();
        return redirect()->back();
        }

    }

    public function show(){

        // $cita = Cita::select('*')->get();
        $cita = Cita::obtenereventos();
        foreach ($cita as $val) {
        $hora = Carbon::createFromFormat('h:i A', $val->hora)->format('H:i:s');
        $fecha = Carbon::createFromFormat('Y-m-d H:i:s', $val->start)->format('Y-m-d');

            $eventos[] = [
                'title' => $val->title,
                'start' => "$fecha $hora",
                'color' => $val->color,
                'allDay' => false

            ];
        }


        return response()->json($eventos);

        // $citas = usort($cita, object_sorter('hora'));
    //    $cita = $cita->orderBy('hora', 'ASC');

// dd($cita);
        // return response()->json($cita);

    }



}

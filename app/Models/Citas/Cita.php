<?php

namespace App\Models\Citas;

use Carbon\Carbon;
use Illuminate\Support\Facades\DB;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use PhpOffice\PhpSpreadsheet\Calculation\Financial\Amortization;

class Cita extends Model
{
    use HasFactory;
    protected $table = "cita";
    protected $fillable = [
        'id',
        'paciente_id',
        'especialidad_id',
        'categoria_id',
        'correo_id',
        'start',
        'end',
        'hora',
        'archivo_id',
        'title',
        'estatus',
        'user_id',
        'hospital_id',

    ];
     /** scope filtro entidad */
    public static function obtenereventos(){
        return DB::table('v_cita')->select('*')->orderByRaw("to_timestamp(hora, 'HH12:MI AM')")->get();
    }
    public static function ultimacitaagendada($especialidad,$hospital,$citasDiarias){
        $now = Carbon::now();
        $nowValid = Carbon::now()->format('Y-m-d');


        $ultimacitaagendada = Cita::select('id','start','hora')->where('especialidad_id',$especialidad)
        ->where('hospital_id',$hospital)
        ->orderBy('id','DESC')->first();

        if($ultimacitaagendada != null){
            $getcitasEspecialidadDia = Cita::select('*')
            ->where('especialidad_id',$especialidad)
            ->where('hospital_id',$hospital)
            ->where('start',$ultimacitaagendada->start)->get();

            $cuentaCitasAgendadas = $getcitasEspecialidadDia->count();
            $fecha = Carbon::createFromFormat('Y-m-d H:i:s', $ultimacitaagendada->start);
            $fecha->addDay();
            if($cuentaCitasAgendadas < $citasDiarias){
                $fechaagendada = Carbon::createFromFormat('Y-m-d H:i:s', $ultimacitaagendada->start);
                $horasuma = Carbon::createFromFormat('h:i A', $ultimacitaagendada->hora);
                $horasuma->addHours(1);

                if($fechaagendada->isBefore($nowValid) || $fechaagendada->isSameYear($nowValid) && $fechaagendada->isSameMonth($nowValid) && $fechaagendada->isSameDay($nowValid)){
                    $now->addDay();
                    $fechaCita =  Carbon::createFromFormat('Y-m-d H:i:s', $now)->format('Y-m-d H:i:s');
                    $hora  = '7:00 AM';
                }else{
                    $fechaCita =  $ultimacitaagendada->start;
                    $hora = Carbon::createFromFormat('Y-m-d H:i:s', $horasuma)->format('h:i A');
                }
                    $resulta = [
                            'fecha' => $fechaCita,
                            'hora'  => $hora
                        ];
            }else{
                // 7:00 AM ----- Dia Siguiente

                if($fecha->isBefore($nowValid)){
                    $now->addDay();
                    $newfecha =  Carbon::createFromFormat('Y-m-d H:i:s', $now)->format('Y-m-d H:i:s');
                }else{
                    $newfecha =  Carbon::createFromFormat('Y-m-d H:i:s', $fecha)->format('Y-m-d H:i:s');
                }


                 $resulta = [
                    'fecha' => $newfecha,
                    'hora'  => '7:00 AM'
                    ];

            }
        }else{
            $now->addDay();
            $newfecha =  Carbon::createFromFormat('Y-m-d H:i:s', $now)->format('Y-m-d H:i:s');
            $resulta = [
                'fecha' => $newfecha,
                'hora'  => '7:00 AM'
                ];
        }




        return $resulta;
    }
    public static function guardarCita($request, $idpersona,$horario)
    {


        $consulta = Cita::select('*')
            ->where('paciente_id', $idpersona)
            ->where('especialidad_id', $request->especialidad)
            ->where('hospital_id',$request->hospital)
            ->where('categoria_id', $request->categoria)->first();

        $especialidad = DB::table('especialidad')->select('*')->where('id', $request->especialidad)->first();

        $title = $horario['hora'].' - '. $especialidad->descripcion;

        if ($consulta != null) {
            if ($consulta->archivo_id == null) {
                $archivoPrevio = null;
            } else {
                $archivoPrevio = $consulta->archivo_id;
            }
        } else {
            $archivoPrevio = null;
        }

        return Cita::updateOrCreate(
            [
                'paciente_id' => $idpersona,
                'especialidad_id' => $request->especialidad,
                'categoria_id' => $request->categoria,
                'hospital_id' => $request->hospital,
            ],
            [
                'title' => $title,
                'start' => $horario['fecha'],
                'end' => $horario['fecha'],
                'hora' => $horario['hora'],
                'archivo_id' => $archivoPrevio,
            ]
        );
    }
    public static function actualizarArchivo($id_cita, $id_archivo)
    {

        return Cita::where('id', $id_cita)->update(
            [
                'archivo_id' => $id_archivo,
            ]
        );
    }
    public static function combocitas()
    {
        return Cita::select('*')->get();
    }
}

<?php

namespace App\Models\Mensajeria;

use Carbon\Carbon;
use Illuminate\Support\Facades\DB;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;


class Correo extends Model
{
    use HasFactory;
    protected $table = "correo";
    protected $fillable = [
        'id',
        'descripcion',
        'asunto',
        'cita_id',
        'estatus',
        'user_id',
    ];
public static function guardarCorreo($request,$cita_id,$consultarHospital = null,$horario = null){

    $consulta = DB::table('v_cita')->select('*')->where('id',$cita_id)->first();

    $fecha = Carbon::parse($consulta->start)->format('d/m/Y');
    $hospital = 'Hospital';
    $asunto ='Cita: '.$consulta->title.' del Paciente '.$request->nombre.' '.$request->apellido.' Titular de la cedula: '.$request->cedula;
    if($consultarHospital != null){
        $hospital = $consultarHospital->hospital.' ('.$consultarHospital->entidad.'-'.$consultarHospital->municipio.'-'.$consultarHospital->parroquia.' )';
    }

    $descripcion = '<p style="text-align: center;">
    <b>'.$hospital.'</b><br>
    <b>Contacto del Hospital</b><br>
    <b>Correo del Hospital:</b>&nbsp;'.$consultarHospital->correo.'.<br>
    <b>Telefono del hospital:</b>&nbsp;'. $consultarHospital->telefono.'.
    </p>
    <p><b>Cita de la Especialidad:</b>&nbsp;'.$consulta->especialidad.
    '.<br><b>De la Categoria:</b>&nbsp;'.$consulta->categoria.'.<br>Con el Paciente:&nbsp;'.
    $request->nombre.'&nbsp;'.$request->apellido.'.<br>Titular de la cedula:&nbsp;'.$request->cedula.
    '.</p>
    <p>
    <br><b>Datos de contacto del paciente</b><br>
    <b>Telefono:</b>&nbsp;'.$request->telefono.'<br>
    <b>Correo:</b>&nbsp;'.$request->correo.
     '</p>
     <p>
     Cita Asignada para el Dia:&nbsp;<b>'.$fecha. '</b>&nbsp;En el Horario:&nbsp;<b>'.$horario['hora'].
     '</b>.</p>';



     $guarda = Correo::create([
        'descripcion'  => $descripcion,
        'asunto'   => $asunto,
        'cita_id'   => $cita_id,
        'enviado'       => false,
        'estatus'       => true,
        // 'user_id'       => Auth::id(),
    ]);
return $guarda;

}

}

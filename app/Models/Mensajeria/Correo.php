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
public static function guardarCorreo($request,$cita_id){

    $consulta = DB::table('v_cita')->select('*')->where('id',$cita_id)->first();

    $fecha = Carbon::parse($request->start)->format('d/m/Y');

    $asunto ='Cita: '.$consulta->title.' del Paciente '.$request->nombre.' '.$request->apellido.' Titular de la cedula: '.$request->cedula;

    $descripcion = '<p>Cita de la Especialidad:&nbsp;'.$consulta->especialidad.
    '.<br> De la Categoria:&nbsp;'.$consulta->categoria.'.<br>Con el Paciente:&nbsp;'.
    $request->nombre.'&nbsp;'.$request->apellido.'.<br>Titular de la cedula:&nbsp;'.$request->cedula.
    '.<br>Con los datos de contacto:</p>
    <p>
     Telefono:'.$request->telefono.'<br>
     Correo:'.$request->correo.
     '</p>
     <p>
     Cita Asignada para el Dia:&nbsp;'.$fecha. '&nbsp;En el Horario:&nbsp;'.$request->cita_hora.
     '.</p>';



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

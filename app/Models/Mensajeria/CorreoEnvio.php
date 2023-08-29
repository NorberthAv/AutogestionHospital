<?php

namespace App\Models\Mensajeria;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class CorreoEnvio extends Model
{
    use HasFactory;
    protected $table = "correo_enviado";
    protected $fillable = [
        'id',
        'email',
        'email_paciente',
        'correo_id',
        'fecha_envio',
        'intento',
        'enviado',
        'generado',
        'enviado',
        'estatus',
        'user_id'

    ];

    public static function envioCorreo($correo_id,$emailPaciente){
        return CorreoEnvio::create([
            'email'  => 'norberthavilan@gmail.com',
            'email_paciente' =>$emailPaciente,
            'correo_id'     => $correo_id,
            'enviado'       => false,
            'estatus'       => false,
        ]);


    }
}

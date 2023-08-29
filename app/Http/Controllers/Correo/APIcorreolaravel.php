<?php

namespace App\Http\Controllers\Correo;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Mail;

class APIcorreolaravel extends Controller
{
    public static function contact($parametros){
        $subject = "SOLICITUD de CITA";
        $for = ["norberthavilan@gmail.com"];

        if(isset($parametros['correo_paciente'])){
            $correo_p = $parametros['correo_paciente'];
            array_push($for, $correo_p);
        }
        $cuerpo = $parametros['cuerpo_correo'];
        $html_correo = '
        <html>
        <body><h3>Solicitud de CITA</h3><br>'
        .$cuerpo.
        '</body>
        </html>
        ';
        Mail::send([], [], function($message) use ($for, $subject, $parametros, $html_correo) {
            $message->from("enviocorreomed@gmail.com", "Hospital Prueba");
            $message->to($for);
            $message->subject($subject);
            if (isset($parametros['archivo'])) {
                $archivo_base64 = $parametros['archivo'];
                $archivo_decodificado = base64_decode($archivo_base64);
                $nombre_archivo = $parametros['recipe']; // Cambiar el nombre y extensión del archivo según tu caso
                $message->attachData($archivo_decodificado, $nombre_archivo);
            }
            $message->setBody($html_correo, 'text/html');
        });


        return true;
    }

}

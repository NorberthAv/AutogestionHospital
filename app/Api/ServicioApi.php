<?php

namespace App\Api;

use GuzzleHttp\Client;

class ServicioApi extends GuzzleHttpRequest
{


/**
 * CONSULTAS AL API
 */

 public function subirArchivo($archivo, $cita_id, $paciente_id, $hash, $nombre) {
    $baseUrl = config('app.url_api_cime');
    $client = new Client(['base_uri' => $baseUrl]);

    $response = $client->request('POST', 'archivo/subir', [
        'form_params' => [
            'archivo' => $archivo,
            'cita_id' => $cita_id,
            'paciente_id' => $paciente_id,
            'hash' => $hash,
            'nombre' => $nombre,
        ]
    ]);

    $resp = json_decode($response->getBody()->getContents()); //ok - error
    return $resp->respuesta;
}

  // Eliminar Archivos
  public function eliminarArchivo($oficina_id, $solicitud_id, $nombre) {
      $baseUrl = config('app.url_api_gestor_archivo_not');
      $client = new Client(['base_uri' => $baseUrl]);
      $response = $client->request('POST', 'eliminararchivosol', [
          'form_params' => [
              'oficina_id' => $oficina_id,
              'solicitud_id' => $solicitud_id,
              'nombre' => $nombre,
          ]
      ]);
      $resp = json_decode($response->getBody()->getContents()); //ok - error
      return $resp->respuesta;
  }

 public function descargarArchivos($parametros)
  {

    $baseUrl = config('app.url_api_gestor_archivo_not');
    $client = new Client(['base_uri' => $baseUrl]);
    $response = $client->request('POST', 'descargar', [
      'form_params' => $parametros
    ]);


    $resp = json_decode($response->getBody()->getContents()); //ok - error
    return $resp;
  }
  public function enviocorreo($parametrosCorreo)
  {

    $baseUrl = config('app.url_api_correo');
    $client = new Client(['base_uri' => $baseUrl]);
    $response = $client->request('POST', '/enviar_correo', [
      'form_params' => $parametrosCorreo
    ]);


    $resp = json_decode($response->getBody()->getContents()); //ok - error
    // dd($resp);
    return $resp;
  }
//Obetener datos personas saime
// public function consultarPersona($parametros)
// {
//     if($parametros['letra'] == 'P') {
//         foreach($parametros as $k => $v) {
//             if($k == 'cedula') {
//                 unset($parametros[$k]);
//             }

//             if($k == 'letra') {
//                 $parametros['letra'] = $v;
//             } else {
//                 $parametros['pasaporte'] = $v;
//             }
//         }

//         return $this->post('buscarpersonapasaporte',$parametros);
//     } else {
//         return  $this->post('buscarpersona',$parametros);
//     }
    //return  $this->post('buscarpersona',$parametros);

// }
//Obetener datos de abogados
// public function buscarAbogadoCedula($parametros)
// {

//     return  $this->post('buscarabogadocedula',$parametros);

// }
// public function numImpreAbogado($parametros)
// {

//     return  $this->post('buscarabogado',$parametros);

// }

//Obetener datos de denominacion mercantil
// public function consultarDenominacion($parametros)
// {

//     return  $this->post('buscardenominacion',$parametros);

// }

public function find($id)
{
    return $this->get("posts/{$id}");

}
// public function subirArchivoGestor($archivo, $oficina_id, $planilla_id, $usuario_ciudadano_id, $hash, $nombre) {


//        $baseUrl = config('app.url_api_gestor_archivo_not');
//        $client = new Client(['base_uri' => $baseUrl]);

//        $response = $client->request('POST', 'subir',
//        [ 'form_params' =>

//         [
//           'archivo' => $archivo,
//           'planilla_id' => $planilla_id,
//           'usuario_ciudadano_id' => $usuario_ciudadano_id,
//           'oficina_id' => $oficina_id,
//           'hash' => $hash,
//           'nombre' => $nombre, ]

//         ]);


//        $resp = json_decode($response->getBody()->getContents()); //ok - error

//        return $resp->respuesta;

//        }

    // Subir Archivos


    // public function subirNota($parametros) {


    //    $baseUrl = config('app.url_api_gestor_archivo_not');
    //    $client = new Client(['base_uri' => $baseUrl]);

    //    $response = $client->request('POST', 'subirNota',
    //    [ 'form_params' => $parametros
    //     ]);


    //    $resp = json_decode($response->getBody()->getContents()); //ok - error

    //    return $resp->respuesta;

    //    }

    //    public function eliminarArchivoGestorPlanilla($archivo, $oficina_id, $planilla_id)
    //    {
    //        $baseUrl = config('app.url_api_gestor_archivo_not');
    //        $client = new Client(['base_uri' => $baseUrl]);
    //        $response = $client->request('POST', 'eliminararchivo', [
    //            'form_params' => [
    //                'nombre' => $archivo,
    //                'oficina_id' => $oficina_id,
    //                'planilla_id' => $planilla_id
    //            ]
    //        ]);
    //        $resp = json_decode($response->getBody()->getContents()); //ok - error

    //        return $resp->respuesta;
    //    }



//   public function descargarDocumentos($parametros)
//   {

//     $baseUrl = config('app.url_api_gestor_archivo_not');
//     $client = new Client(['base_uri' => $baseUrl]);
//     $response = $client->request('POST', 'descargar_documento', [
//       'form_params' => $parametros
//     ]);


//     $resp = json_decode($response->getBody()->getContents()); //ok - error
//     return $resp;
//   }

//   public function consultarVehiculo($parametros)
//     {
//         $baseUrl = config('app.url_api_datos_vehiculos_intt');
//         return $this->post($baseUrl, $parametros);
//     }

//     public function calcular($parametros)
//   {

//     $baseUrl = config('app.url_api_calculo_not');
//     $client = new Client(['base_uri' => $baseUrl]);
//     $response = $client->request('POST', 'calcular', [
//       'form_params' => $parametros
//     ]);


//     $resp = json_decode($response->getBody()->getContents()); //ok - error
//     return $resp;
//   }

//   public function tasavehiculo($parametros)
//   {

//     $baseUrl = config('app.url_api_calculo_not');
//     $client = new Client(['base_uri' => $baseUrl]);
//     $response = $client->request('POST', 'tasavehiculo', [
//       'form_params' => $parametros
//     ]);


//     $resp = json_decode($response->getBody()->getContents()); //ok - error
//     return $resp;
//   }
}

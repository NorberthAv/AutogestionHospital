<?php

namespace App\Api;
use GuzzleHttp\Client;

class GuzzleHttpRequest
{
    protected $client;
    
public function __construct(Client $client)
    {
        $this->client = $client;
    }


protected function get($metodo)
{
    $response =$this->client->request('GET', $metodo);
    //->getBody()->getContents() para obetener el cuerpo de la respuesta del api
    return json_decode(($response->getBody()->getContents())); 
}

protected function post($metodo,$parametros)
{
    $response =$this->client->request('POST',$metodo,
    [
        'form_params' =>$parametros,
       
    ]
    );
    //->getBody()->getContents() para obetener el cuerpo de la respuesta del api
    return json_decode(($response->getBody()->getContents())); 
}
}

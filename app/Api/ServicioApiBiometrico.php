<?php

namespace App\Api;
use GuzzleHttp\Client;
use GuzzleHttp\RequestOptions;
use Jumbojett\OpenIDConnectClient;
//verificar($url);
class ServicioApiBiometrico

{

//public $url='https://desalabs.ex-cle.com:7443';

/* if(isset($_POST['accion'])){
    if($_POST['accion']='verificar'){
        $paramarray=[];
        //echo getToken($url); die;
        //print_r($_POST);
        $wsq=str_replace(" ","+",$_POST['wsq']);
        $paramarray=[
                "identificationCode"=>$_POST['identificationCode'],
                "identificationSerial"=>$_POST['identificationSerial'],
                "wsq"=>$wsq
                ];

        $params=json_encode($paramarray);
     
        verificar($url,$params);
        //print_r($params);
       
    }
}
 */
//getToken($url);
public function  getToken($url){

    $client_id=env('CLIENT_ID');
    $client_secret=env('CLIENT_SECRET');
    $endponit_token=env('ENDPONIT_TOKEN');

    $oidc = new OpenIDConnectClient($url,
    $client_id,
    $client_secret);
//$oidc->providerConfigParam(array('token_endpoint'=>$url.'/BCS/connect/token'));
$oidc->providerConfigParam(array('token_endpoint'=>$url.$endponit_token));
//https://desalabs.ex-cle.com:7443/BaS_CI/Transaction/connect/token
$oidc->addScope('BAS');

//Add username and password
//$oidc->addAuthParam(array('username'=>'ClientTest'));
//$oidc->addAuthParam(array('password'=>'Sarem'));

// this assumes success (to validate check if the access_token property is there and a valid JWT) :
$clientCredentialsToken = $oidc->requestClientCredentialsToken()->access_token;

return $clientCredentialsToken;

}

public function verificar($url,$params){

$client = new Client([
        'base_uri' => $url,
        'timeout'  => 20.0,
]);

$token=$this->getToken($url);
$headers = [
    'Authorization' => 'Bearer ' . $token,        
    'Content-Type' => 'application/json', 'Accept' => 'application/json'
];
//bcs/api/transaction
$endponit_transaction=env('ENDPONIT_TRANSACTION');
$request = $client->request('POST', $endponit_transaction,
[

    'headers' => $headers,
    'body' =>json_encode($params)
]
);

//echo $request->getStatusCode();
//print_r($request->getBody()->getContents());
return $request->getBody()->getContents();

}
}
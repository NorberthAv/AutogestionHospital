<?php

namespace App\Models\Documentos;


use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Recipes extends Model
{
    use HasFactory;
    protected $table = "archivo";
    protected $fillable = [
        'id',
        'nombre',
        'hash',
        'tipo_documento_id',
        'descripcion',
        'paciente_id',
        'estatus',
        'user_id',
    ];
    public static function guardarArchivo($nombre,$hash,$tipo_documento_id,$descripcion,$paciente_id){

// dd($request);
        return Recipes::updateOrCreate(
           ['nombre' => $nombre,'paciente_id'=>$paciente_id, ],
           [
               'hash'=>$hash,
               'descripcion'=>$descripcion ,
               'tipo_documento_id' => $tipo_documento_id
           ]
           );

   }
}

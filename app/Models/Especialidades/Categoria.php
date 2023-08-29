<?php

namespace App\Models\Especialidades;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Categoria extends Model
{
    use HasFactory;
    protected $table = "categoria";
    protected $fillable = [
        'id',
        'descripcion',
        'estatus',
        'user_id',
        'especialidad_id',
    ];
    public static function combocategoria(){
        return Categoria::select('*')->get();
    }
    public static function Categoria_especialidad($especialidad_id){
        return Categoria::select('*')->where('especialidad_id',$especialidad_id)->get();
    }
}

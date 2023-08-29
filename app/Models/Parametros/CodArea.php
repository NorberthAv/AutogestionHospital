<?php

namespace App\Models\Parametros;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class CodArea extends Model
{
    use HasFactory;
    protected $table = "parametro.codigo_telefono";
    protected $fillable = [
        'id',
        'codigo',
        'tipo',
        'activo',
        'estatus',
        'user_id',
    ];
}

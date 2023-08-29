<?php

namespace App\Models\Beneficiario;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Persona extends Model
{
    use HasFactory;
    protected $table = "paciente";
    protected $fillable = [
        'id',
        'cedula',
        'nombre',
        'apellido',
        'telefono',
        'correo',
    ];
    public static function guardarPC($request){



         return Persona::updateOrCreate(
            ['cedula' => $request->cedula,'nombre'=>$request->nombre, ],
            [
                'apellido'=>$request->apellido ,
                'telefono'=>$request->telefono,
                'correo' => $request->correo
            ]
            );

    }
}

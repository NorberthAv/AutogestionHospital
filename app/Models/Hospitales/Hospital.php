<?php

namespace App\Models\Hospitales;

use Illuminate\Support\Facades\DB;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Hospital extends Model
{
    use HasFactory;
    protected $table = "hospital";
    protected $fillable = [
        'id',
        'hospital',
        'direccion',
        'correo',
        'telefono',
        'entidad_id',
        'municipio_id',
        'parroquia_id',
        'tipo_hospital_id',
        'estatus',
        'user_id',
    ];
    public static function comboHospitales(){
        return Hospital::select('*')->get();
    }
    public static function Hospital_especialidad($especialidad_id){
        return DB::table('v_medico_especialidad')
        ->where($especialidad_id)
        ->where('medico_activo',true)
        ->where('estatus',true)->get();
    }

}

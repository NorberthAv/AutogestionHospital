<?php

namespace App\Models\Especialidades;

use Illuminate\Support\Facades\DB;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Especialidad extends Model
{
    use HasFactory;
    protected $table = "especialidad";
    protected $fillable = [
        'id',
        'descripcion',
        'estatus',
        'user_id',
        'citas_diarias',
    ];
    public static function comboEspecialidades(){
        return Especialidad::select('*')->get();
    }
    public static function comboEspecialidadesActivasconMedicos(){
        return DB::table('v_especialidades_medicos_activas')->select('*')->get();
    }
    public static function disponibilidadhoras($especialidad_id){
        return Especialidad::select('*')->where('id',$especialidad_id)->first();
    }
}

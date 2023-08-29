<?php

namespace App\Rules\Calendario;

use App\Models\Citas\Cita;
use Illuminate\Contracts\Validation\Rule;

class RuleCitasExistentes implements Rule
{
    protected $field;

    public function __construct($field)
    {
        $this->field = $field;
    }

    public function passes($attribute, $value)
    {
        $valorstart = request()->input($this->field);

        $consulta = Cita::select('*')->where('start',$valorstart)->where('hora',$value)->first();
        if($consulta == null){
            return true;
        }else{
            return false;
        }


    }

    public function message()
    {
        // return 'El Horario seleccionado para la cita ya a sido agendado ' . $this->field;
        return 'El Horario seleccionado para la cita ya ha sido agendado';
    }
}



// class MatchLengthRule implements Rule
// {
//     protected $field;

//     public function __construct($field)
//     {
//         $this->field = $field;
//     }

//     public function passes($attribute, $value, $parameters, $validator)
//     {
//         $otherFieldValue = $validator->getData()[$this->field];
//         return strlen($otherFieldValue) == $value;
//     }

//     public function message()
//     {
//         return 'La longitud de :attribute debe ser igual a la longitud de ' . $this->field;
//     }
// }

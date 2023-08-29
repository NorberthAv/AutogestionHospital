<?php

namespace App\Rules\Formulario;

use App\Models\Parametros\CodArea;
use Illuminate\Contracts\Validation\Rule;

class ValidateCodArea implements Rule
{
    /**
     * Create a new rule instance.
     *
     * @return void
     */
    public function __construct()
    {
        //
    }

    /**
     * Determine if the validation rule passes.
     *
     * @param  string  $attribute
     * @param  mixed  $value
     * @return bool
     */
    public function passes($attribute, $value)
    {
        $partes = explode('(', $value); // Separar el número de teléfono en dos partes utilizando el paréntesis de apertura como separador
        $parte2 = explode(')', $partes[1]); // Separar la segunda parte utilizando el paréntesis de cierre como separador
        $codigoArea = $parte2[0]; // Extraer el código de área de la segunda parte
        $consulta = CodArea::where('codigo',$codigoArea)->first();
        if($consulta == null){
            return false;

        }else{
            return true;
        }
    }

    /**
     * Get the validation error message.
     *
     * @return string
     */
    public function message()
    {
        return 'Codigo de Area Incorrecto.';
    }
}

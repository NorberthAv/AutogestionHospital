<?php

namespace App\Rules\Formulario;

use Illuminate\Contracts\Validation\Rule;

class ValidateCorreo implements Rule
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
        $nombreUsuario = explode('@', $value)[0];
        $ultimoCaracter = substr($nombreUsuario, -1);

        if (preg_match('/^[a-zA-Z0-9]$/', $ultimoCaracter)) {
            return true;
        }else{
            return false;
        }
    }

    /**
     * Get the validation error message.
     *
     * @return string
     */
    public function message()
    {
        return 'EL ultimo digito antes del @ debe ser una letra o numero.';
    }
}

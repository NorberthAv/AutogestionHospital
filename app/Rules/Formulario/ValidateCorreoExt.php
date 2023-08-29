<?php

namespace App\Rules\Formulario;

use Illuminate\Contracts\Validation\Rule;

class ValidateCorreoExt implements Rule
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
        $email = $value;
        if (preg_match('/\.[a-z]{2,3}$/', $email)) {
            return true;
        } else {
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
        return 'Su correo no posee una extensión válida';
    }
}

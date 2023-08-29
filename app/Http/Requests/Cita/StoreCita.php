<?php

namespace App\Http\Requests\Cita;

use App\Rules\Formulario\ValidateCorreo;
use App\Rules\Formulario\ValidateCodArea;
use App\Rules\Formulario\ValidateCorreoExt;
use Illuminate\Foundation\Http\FormRequest;
use App\Rules\Calendario\RuleCitasExistentes;

class StoreCita extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        return [
            //
            'nombre'        => 'required|regex:/^[a-zA-ZñÑáéíóúÁÉÍÓÚ\s]+$/',
            'apellido'      => 'required|regex:/^[a-zA-ZñÑáéíóúÁÉÍÓÚ\s]+$/',
            'cedula'        => 'required|regex:/^[0-9]+$/|numeric',
            'telefono'      => ['required', new ValidateCodArea(),],
            'correo'        => ['required','email', new ValidateCorreo(),new ValidateCorreoExt(),],
            'especialidad'  => 'required',
            'categoria'     => 'required',
        ];
    }
    public function messages()
    {
        return [
            'numeric'   => 'Solo Numeros',
            'regex'     => 'Carácter inválido',
            'max'       => 'El campo excede el limite de caracteres correctos',
            'email'     =>'Formato de Correo Invalido',
            'required'  => 'campo obligatorio',
        ];
    }
}

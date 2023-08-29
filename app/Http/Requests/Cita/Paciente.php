<?php

namespace App\Http\Requests\Cita;

use Illuminate\Foundation\Http\FormRequest;

class Paciente extends FormRequest
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
            'nombre' => 'required',
            'apellido' => 'required',
            'cedula' => 'required',
            'telefono' => 'required',
            'correo' => 'required',

        ];
    }

    public function messages()
    {
        return [
            'required' => 'campo obligatorio',
        //     'habilitado_diario.required' => 'Campo obligatorio.',
        //     'habilitado_diario.numeric' => 'Campo numérico.',
        //     'habilitado_diario.digits_between' => 'Mínimo 1 y máximo 6 caracteres.',
        ];
    }
}

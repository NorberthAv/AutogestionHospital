<?php

namespace App\Http\Requests\Calendario;

use Illuminate\Foundation\Http\FormRequest;
use App\Rules\Calendario\RuleCitasExistentes;

class Horarios extends FormRequest
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
            'start' => 'required',
            'cita_hora' => [
                'required',
                new RuleCitasExistentes('start'),
            ],
        ];
    }

    public function messages()
    {
        return [
            'required' => 'campo obligatorio',
        ];
    }
}

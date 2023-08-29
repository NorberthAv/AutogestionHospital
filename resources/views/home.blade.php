@extends('layouts.app')

@section('title', 'Home')

@section('content')

    <div class="container-fluid">

        {{-- <div class="col-8 container-calend">
            <div class="card">
                <div class="card-header bg-info">
                    <h3 class="card-title title">Calendario de Citas<h3>
                </div>
                <div class="card-body">
                    @include('Formularios.datos-calendario')
                </div>
            </div>

        </div> --}}
            <div class="base-form">
                <div class="card" id="formulario_card">
                    <div class="card-header bg-info">
                        <h3 class="card-title title">Formulario de Registro Cita<h3>
                    </div>
                    <div class="card-body">
                        <div class="alert alert-danger" role="alert" id="alerthora" style="display: none">
                            Debe Seleccionar una Hora antes de Solicitar su Cita.
                        </div>

                            <form role="form" id="calendarioEnvio" name="calendarioEnvio" data-toggle="validator" enctype="multipart/form-data" method="POST"
                            action="{{ url('/registro-base') }}" >
                            @csrf
                            {{-- <fieldset id="disabled-field" disabled> --}}
                            @include('Formularios.datos-base')
                            @include('Formularios.datos-cita')
                            <br>
                            {{-- </fieldset> --}}
                            <button type="button" id="btnSave" onclick="validarHora();" class="btn btn-outline-info">Guardar Cita</button>

                            </form>
                    </div>
                </div>
            </div>
        </div>






@include('sweetalert::alert')
{!! JsValidator::formRequest('App\Http\Requests\Cita\StoreCita', '#calendarioEnvio') !!}
@endsection

@section('js')
<script type="text/javascript">
    $(document).ready(function() {
        // $('#calendarioEnvio input, #calendarioEnvio select').prop('disabled', true);
        // $('#btnSave').hide()
    });

    function validarHora(){
        // if($('#cita_hora').val() == '' || $('#cita_hora').val() == 'Seleccione horario deseado'){
        //     $('#alerthora').fadeIn();
        //                 setTimeout(function() {
        //                     $('#alert').fadeOut();
        //     }, 3000);
        // }else{
            $('#calendarioEnvio').submit();
        // }

    }
</script>
@endsection

{{-- <div id="alertvacio" class="alert alert-danger desva" style="display: none" role="alert">
    Debe Seleccionar Especialidad y Categoria.
</div> --}}

    {{-- @foreach ($data_persona as $item)
        {{ $item }}
    @endforeach --}}
    {{-- <input type="hidden" id="datos_personales" name="datos_personales" value="{{$data_persona->id}}"> --}}
    <div class="row">
        <div class="col-6">
            <label for="especialidad"><b>Especialidad:</b></label>
            <br>
            <select name="especialidad" id="especialidad" class="form-control" onchange="cargaCategoria();">
                <option value="">Seleccione una Especialidad</option>
                @foreach ($especialidades as $k => $v)
                <option value="{{ $v->id }}">{{ strtoupper($v->descripcion) }}</option>
                @endforeach

            </select>
        </div>
        <div class="col-6">
            <label for="categoria"><b>Categoria:</b></label>
            <br>
            <select name="categoria" disabled id="categoria" class="form-control">
                <option value="">Seleccione una Categoria</option>

            </select>
        </div>
          <div class="col-12">
            <label for="hospital"><b>Hospital:</b></label>
            <br>
            <select name="hospital" disabled id="hospital" class="form-control">
                <option value="">Seleccione un Hospital</option>

            </select>
        </div>
        <div class="form-group">
            <label for="archivo"><b>Archivo:</b></label>
            <input id="archivo" name="archivo" type="file" accept=".pdf" class="form-control" readonly>
        </div>
        {{-- <input type="hidden" id="end" name="end">
        <div class="form-group">
            <label for="cita_hora"><b>Hora de Cita:</b></label>
            <input id="cita_hora" name="cita_hora" class="form-control" placeholder="Seleccione un Horario" readonly>
        </div> --}}
        {{-- <div class="col-12">
            <br> --}}
            {{-- <button type="button" class="btn btn-sm btn-outline-primary mt-2"
                style="float: right; margin:1%;" onclick="valida();">Siguiente</button> --}}
            {{-- <button type="button" class="btn btn-sm btn-outline-danger mt-2" style="float: right; ">Volver</button> --}}
        {{-- </div> --}}
    </div>




<script type="text/javascript">
    $(document).ready(function() {

    });
     function cargaHospital()
    {
        var selectespecialidad      = $('#especialidad').val();
        $('#categoria').empty();
        $.ajaxSetup({
            headers: {
                'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
            }
        });
        $.ajax({
            url: "{{route('cargaCategoria.list')}}",
            dataType: 'json',
            type: 'post',
            data:{
                'especialidad': selectespecialidad,
                '_token': '{{csrf_token()}}',
            },
            success: function(data){
                if(data.length>0)
                {

                    $("#categoria").append('<option value="">Seleccione...</option>');
                    data.forEach(element => {
                        console.log(element);
                        var categoria_id =element.id
                        var categoria_descripcion = element.descripcion;
                        $("#categoria").append('<option value='+categoria_id+'>'+categoria_descripcion+'</option>');
                    });
                    $('#categoria').removeAttr('disabled');
                    //persona_id
                }

            },
            error: function(err)
            {

            }
        });
    }
    function cargaCategoria()
    {
        var selectespecialidad      = $('#especialidad').val();
        $('#categoria').empty();
        $.ajaxSetup({
            headers: {
                'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
            }
        });
        $.ajax({
            url: "{{route('cargaCategoria.list')}}",
            dataType: 'json',
            type: 'post',
            data:{
                'especialidad': selectespecialidad,
                '_token': '{{csrf_token()}}',
            },
            success: function(data){
                if(data.length>0)
                {

                    $("#categoria").append('<option value="">Seleccione...</option>');
                    data.forEach(element => {
                        console.log(element);
                        var categoria_id =element.id
                        var categoria_descripcion = element.descripcion;
                        $("#categoria").append('<option value='+categoria_id+'>'+categoria_descripcion+'</option>');
                    });
                    $('#categoria').removeAttr('disabled');
                    //persona_id
                }

            },
            error: function(err)
            {

            }
        });
    }
    function valida(){
        let especialidad = $('#especialidad').val();
        let categoria = $('#categoria').val();
        let hospital = $('#hospital').val();


        if(especialidad !='' && categoria !='' && hospital != ''){
            $('#datosCita').submit();
        }else{
            $('#alertvacio').fadeIn();
                setTimeout(function() {
                    $('#alertvacio').fadeOut();
                }, 5000);
        }

    }


</script>

{{-- @endsection --}}



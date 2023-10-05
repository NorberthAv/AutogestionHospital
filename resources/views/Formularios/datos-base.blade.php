    <div class="row">
        {{-- <div class="form-group col-12">
            <label for="start"><b>Fecha:</b></label>
            <input type="text" class="form-control" id="fecha_muestra" name="fecha_muestra" placeholder="DD-MM-YYYY" readonly>
            <input type="hidden" class="form-control" id="start" name="start" placeholder="DD-MM-YYYY" readonly>

        </div> --}}
        <div class="col-6">
            <label for="nombre"><b>Nombres:</b></label>
            <input type="text" class="form-control mt-2" id="nombre" maxlength="25" name="nombre">
        </div>
        <div class="col-6">
            <label for="apellido"><b>Apellidos:</b></label>
            <input type="text" class="form-control mt-2" id="apellido" maxlength="25" name="apellido">
        </div>
        <div class="col-6">
            <label for="cedula"><b>Cédula:</b></label>
            <input type="text" class="form-control mt-2" id="cedula" placeholder="26452325" maxlength="8"
                name="cedula">
        </div>
        <div class="col-6">
            <label for="telefono"><b>Teléfono:</b></label>
            <input type="text" class="form-control mt-2" id="telefono" placeholder="(XXXX) XXX-XX-XX"
                name="telefono" maxlength="11">
        </div>
        <div class="col-12">
            <label for="correo"><b>Correo:</b></label>
            <input type="email" class="form-control mt-2" id="correo" placeholder="ejemplo@ejemplo.com"
                name="correo">
        </div>
    </div>


    {{-- {!! JsValidator::formRequest('App\Http\Requests\Cita\Paciente', '#registro-cita') !!} --}}
    <script type="text/javascript">
        $('#telefono').mask('(0000) 000-00-00');
    </script>

<div class="row">
    <div class="col-12">
        <div id="agenda"></div>
    </div>
</div>

<div class="modal fade" id="modal_event" data-backdrop="static" data-keyboard="false" tabindex="-1"
    aria-labelledby="titulo_docs" aria-hidden="true">
    <div class="modal-dialog modal-sm">


            <div class="modal-content ">
                <div class="modal-header mb-3 bg-info text-white text-center">
                  <h4> SOLICITUD DE CITA</h4>
                </div>
                <div class="modal-body">
                    <div class="card mb-0">
                        <div class="card-body">

                            <div class="row" id="contenidocita">

                            </div>

                        </div>
                    </div>
                </div>


    </div>
</div>
</div>
@include('sweetalert::alert')
{{-- {!! JsValidator::formRequest('App\Http\Requests\Calendario\Horarios', '#calendarioEnvio') !!} --}}

{{-- <script src="https://weareoutman.github.io/clockpicker/dist/jquery-clockpicker.min.js"></script> --}}
{{-- <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.47/js/bootstrap-datetimepicker.min.js"></script> --}}
<script src="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>
<script type="text/javascript">

    var firstOpen = true;
    var time;
    $(document).ready(function() {

        $('#cita_hora').timepicker({
            timeFormat: 'h:mm p',
            interval: 60,
            // ----------------Hora de Almuerzo---------------
            // disableTimeRanges: [['12:00 PM', '1:00 PM']],
            // disableTextInput: true,
            // ----------------Hora de Almuerzo---------------
            // defaultTime: '7',

            disableTime: ['12:00 pm'],
            startTime: '7:00',
            minTime: '7',
            maxTime: '10:00pm',
            dynamic: false,
            dropdown: true,
            scrollbar: true
		});

        $('#cita_hora').val('');
        const fechaInicial = new Date();
        fechaInicial.setDate(fechaInicial.getDate() + 1);

        var calendarEl = document.getElementById('agenda');
        var calendar = new FullCalendar.Calendar(calendarEl, {
            themeSystem: 'bootstrap5',
            initialView: 'dayGridMonth',
            initialDate: fechaInicial,
            dayMaxEventRows: true, // for all non-TimeGrid views
            views: {
                timeGrid: {
                dayMaxEventRows: 6 // adjust to 6 only for timeGridWeek/timeGridDay
                }
            },
            locale: 'es',
            headerToolbar: {
                left: 'prev,next today',
                center: 'title',
                // right: 'dayGridMonth,timeGridWeek,listWeek'
                right: 'dayGridMonth'

            },



            validRange: function(nowDate) {
      // Obtener la fecha de inicio del calendario
            // Establecer un rango de fechas válidas que comienza en la fecha de inicio del calendario y continúa hasta una fecha posterior a la fecha actual
            return {
                start: fechaInicial,
                end: moment().endOf('year')
            };
            },
            displayEventTime:false,
            selectable: false,
            // hiddenDays: [ 0, 6 ],------>quita los sabados y domingos
            dateClick: function(info) {
                let fecha = info.dateStr;
                let fechaFormateada = fecha.split('-').reverse().join('-');
                $('#fecha_muestra').val(fechaFormateada);
                $('#start').val(info.dateStr);
                $('#end').val(info.dateStr);
                $('#calendarioEnvio input, #calendarioEnvio select').prop('disabled', false);
                $('#btnSave').show();
            },
            events:"{{ route('showcita.show') }}",
//
            // --------------------Funcion ver Datos de Evento---------------
            eventClick:function(info){

                modalevt(info)
                console.log('aqui');

                // Swal.fire({
                // title: 'CITA:',
                // text: info.event.title,
                // icon: 'success',
                // confirmButtonColor: '#17a2b8',

                // });

            },
            // --------------------Funcion ver Datos de Evento---------------
        });
        calendar.render();
    });
    function modalevt(info){
        $('#contenidocita').empty()
        $('#modal_event').modal('show');
                $('#contenidocita').append(`
                <div>
                    <p>${info.event.title}</p>
                </div>
                `);
    }
    const cerrarModal = () => {
        $('#modal_event').modal('hide')
    }
       // $('#cita_hora').clockpicker({
    //     donetext: 'Done',
    //     twelvehour: true,
    //     autoclose: false,
    //     leadingZeroHours: false,
    //     upperCaseAmPm: true,
    //     leadingSpaceAmPm: true,
    //     afterHourSelect: function() {
    //         $('#cita_hora').clockpicker('realtimeDone');
    //     },
    //     afterMinuteSelect: function() {
    //         $('#cita_hora').clockpicker('realtimeDone');
    //     },
    //     afterAmPmSelect: function() {
    //         $('#cita_hora').clockpicker('realtimeDone');
    //     }
    // });


    // $('#cita_hora').clockpicker({
    //     donetext: 'Done',
    //     twelvehour: true,
    //     // autoclose: true,
    //     // leadingZeroHours: false,
    //     // upperCaseAmPm: true,
    //     // leadingSpaceAmPm: true,
    //     // afterShow: function() {
    //     //     $(".clockpicker-minutes").find(".clockpicker-tick").filter(function(index,element){
    //     //     return !($.inArray($(element).text(), choices)!=-1)
    //     //     }).remove();
    //     // }
    // });
      // $('#cita_hora').datetimepicker({
        //     // useCurrent: false,
        //     format: "hh A"
        // }).on('dp.show', function() {
        //     if(firstOpen) {
        //         time = moment().startOf('day');
        //         firstOpen = false;
        //     } else {
        //         time = "01:00 PM"
        //     }
        //     $(this).data('DateTimePicker').date(time);
        // });
            // $('#cita_hora').on('propertychange input', (e) => {
    //     console.log(e.target.value.length)
    //     if (e.target.value.length == 1) {
    //         e.target.value = '';
    //     } else {
    //         const min = e.target.value.split(':');
    //         e.target.value = min[0] + ':' + min[1].substr(0,5);
    //     }
    // }).on('keydown', (e) => {
    //     if (e.key === "Backspace" || e.key === "Delete") {
    //         $('#cita_hora').val('')
    //     }
    // });

</script>

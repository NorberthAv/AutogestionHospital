<form action="calendario" method="POST">
    @csrf
    <div class="row">
        <div class="col-12">
            <div id="agenda">
calendario
            </div>

        </div>

        <div class="col-12">
            <br>
            <button type="button" class="btn btn-sm btn-outline-primary mt-2" style="float: right;">Siguiente</button>
        </div>
    </div>
</form>
<div class="modal fade" id="modal_event" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="titulo_docs" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-xl">
        <div class="modal-content">
            <div class="modal-header text-center">
                <h5 class="modal-title w-100" id="titulo_docs">Evento</h5>
            </div>
            <div class="modal-body">
                <div class="card mb-0">
                    <div class="card-body">
                        <div class="form-group">
                            <label for="title">Cita de XXXX</label>
                            <input type="text" id="title" name="title">
                        </div>
                        <div class="form-group">
                            <label for="star"></label>
                            <input type="text" id="star" name="star">
                        </div>
                        <div class="form-group">
                            <label for=""></label>
                            <input type="text">
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal-footer">Cerrar</button>
            </div>
        </div>
    </div>
</div>
<script>

    document.addEventListener('DOMContentLoaded', function() {
      var calendarEl = document.getElementById('agenda');
      var calendar = new FullCalendar.Calendar(calendarEl, {

        //   themeSystem: 'bootstrap5' Tema
        slotEventOverlap: false,
        eventLimit: 3,
        initialView: 'dayGridMonth',
        locale: 'es',
        headerToolbar:{
            left:'prev,next today',
            center:'title',
            right:'dayGridMonth,timeGridWeek,listWeek'
        }
        dateClick:function(info){
            $(modal_event).modal('show');
        }
        // events:'ruta para consultar eventos'
        // --------------------Funcion ver Datos de Evento---------------
        // eventClick:function(info){
        //     let evento = info.event
        // }
        // --------------------Funcion ver Datos de Evento---------------
      });
      calendar.render();
    });

  </script>

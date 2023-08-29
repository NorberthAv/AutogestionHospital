<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Citas\CitaController;
use App\Http\Controllers\RegisterController;
use App\Http\Controllers\SessionsController;



/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

// Route::get('/', function () {
//     return view('home');
// })->name('home.index');
// ->middleware('auth');

Route::get('/', [CitaController::class, 'index'])->name('home');

/*
-------------------------------Rutas --------------------
*/

    Route::resource('/registro-base', CitaController::class)->only(['index', 'create', 'store', 'edit']);
    Route::post('/registro-base/paso1-2', [CitaController::class, 'irPaso2'])->name('irpaso-2.reg');
    Route::post('/registro-cita/paso2-3', [CitaController::class, 'irPaso3'])->name('irpaso-3.reg');
    Route::post('/registro-calendario/envio', [CitaController::class, 'envio'])->name('envio.reg');
    Route::get('/registro-calendario/show', [CitaController::class, 'show'])->name('showcita.show');
    Route::post('/registro-calendario/Carga/Categoria', [CitaController::class, 'getcategoria'])->name('cargaCategoria.list');
    Route::post('/registro-calendario/Carga/Hospital', [CitaController::class, 'gethospital'])->name('cargahospital.list');

    // Route::get('/medidadecretada/verDocumento/{id}/verPDF', [DecretadasController::class, 'descargarArchivos'])->name('documento.verNotas');



// Auth::routes();

// Route::get('/home', [App\Http\Controllers\HomeController::class, 'index'])->name('home');

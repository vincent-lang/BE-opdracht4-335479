<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\gegevensController;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "web" middleware group. Make something great!
|
*/

Route::get('/', [gegevensController::class, 'index'])->name('instructeur.index');

Route::get('/instructeur/{instructeur}/list', [gegevensController::class, 'list'])->name('instructeur.list');

Route::get('/instructeur/{instructeur}/addPage', [gegevensController::class, 'addPage'])->name('instructeur.addPage');

Route::get('/instructeur/{instructeur}/{row}/add', [gegevensController::class, 'add'])->name('instructeur.add');

Route::get('/instructeur/{instructeur}/{row}/editPage', [gegevensController::class, 'edit'])->name('instructeur.editPage');

Route::put('/instructeur/{instructeur}/{row}/update', [gegevensController::class, 'update'])->name('instructeur.update');

Route::get('/instructeur/{instructeur}/{row}/delete', [gegevensController::class, 'delete'])->name('instructeur.delete');

Route::get('/instructeur/{instructeur}/notActive', [gegevensController::class, 'notActive'])->name('instructeur.notActive');

Route::get('/instructeur/{instructeur}/active', [gegevensController::class, 'active'])->name('instructeur.active');

Route::get('/instructeur/{instructeur}/{row}/else', [gegevensController::class, 'addedToSomeoneElse'])->name('instructeur.else');

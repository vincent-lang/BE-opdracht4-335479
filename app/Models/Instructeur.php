<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Builder;

class Instructeur extends Model
{
    use HasFactory;

    protected $fillable = [
        'IsActief'
    ];

    public function scopeIndexGegevens(Builder $information): void
    {
        $information
            ->select('*')
            ->orderBy('AantalSterren', 'desc')
            ->get();
    }
    public function scopeIndexAmount(Builder $information): void
    {
        $information
            ->select('Id')
            ->get();
    }
}

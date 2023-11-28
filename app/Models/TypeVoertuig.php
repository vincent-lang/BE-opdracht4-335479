<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class TypeVoertuig extends Model
{
    use HasFactory;
    protected $fillable = [
        'Id',
        'TypeVoertuig',
        'Rijbewijscategorie'
    ];

    public function scopeEditTypeVoertuigGegevens(Builder $information): void
    {
        $information
            ->select('TypeVoertuig', 'Id')
            ->get();
    }
}

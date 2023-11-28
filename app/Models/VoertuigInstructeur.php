<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Support\Facades\DB;

class VoertuigInstructeur extends Model
{
    use HasFactory;

    protected $fillable = [
        'InstructeurId'
    ];

    public function scopeListGegevens(Builder $information): void
    {
        $information
            ->select('*')
            ->join('voertuigs', 'voertuig_instructeurs.VoertuigId', '=', 'voertuigs.Id')
            ->join('instructeurs', 'voertuig_instructeurs.InstructeurId', '=', 'instructeurs.Id')
            ->join('type_voertuigs', 'voertuigs.TypeVoertuigId', '=', 'type_voertuigs.Id')
            ->get();
    }

    public function scopeAllPageGegevens(Builder $information): void
    {
        $information
            ->select('voertuigs.Id', 'Kenteken', 'Type', 'Bouwjaar', 'Brandstof', 'Achternaam', 'TypeVoertuig', 'Rijbewijscategorie')
            ->join('voertuigs', 'voertuig_instructeurs.VoertuigId', '=', 'voertuigs.Id')
            ->join('instructeurs', 'voertuig_instructeurs.InstructeurId', '=', 'instructeurs.Id')
            ->join('type_voertuigs', 'voertuigs.TypeVoertuigId', '=', 'type_voertuigs.Id')
            ->orderBy('instructeurs.Achternaam', 'desc')
            ->get();
    }
}

<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Builder;

class Voertuig extends Model
{
    use HasFactory;

    protected $fillable = [
        'Kenteken',
        'Type',
        'Bouwjaar',
        'Brandstof'
    ];

    public function scopeListVoertuigGegevens(Builder $information): void
    {
        $information
            ->select('Voertuig_instructeurs.*', 'Voertuigs.Id', 'Voertuigs.Type', 'Voertuigs.Kenteken', 'Voertuigs.Bouwjaar', 'Voertuigs.Brandstof', 'Type_voertuigs.Rijbewijscategorie', 'Type_voertuigs.TypeVoertuig')
            ->leftjoin('Voertuig_Instructeurs', 'Voertuigs.Id', '=', 'voertuig_instructeurs.VoertuigId')
            ->join('Instructeurs', 'instructeurs.Id', '=', 'Voertuig_Instructeurs.InstructeurId')
            ->join('Type_voertuigs', 'voertuigs.TypeVoertuigId', '=', 'Type_voertuigs.Id')
            ->orderBy('Type_voertuigs.Rijbewijscategorie', 'asc')
            ->get();
    }

    public function scopeAddPageGegevens(Builder $information): void
    {
        $information
            ->select('Voertuig_instructeurs.*', 'Voertuigs.Id', 'Voertuigs.Type', 'Voertuigs.Kenteken', 'Voertuigs.Bouwjaar', 'Voertuigs.Brandstof', 'Type_voertuigs.Rijbewijscategorie', 'Type_voertuigs.TypeVoertuig')
            ->leftJoin('Voertuig_Instructeurs', 'Voertuigs.Id', '=', 'voertuig_instructeurs.VoertuigId')
            ->join('Type_voertuigs', 'Voertuigs.TypeVoertuigId', '=', 'Type_voertuigs.Id')
            ->whereNull('voertuig_instructeurs.VoertuigId')
            ->get();
    }

    public function scopeEditGegevens(Builder $information): void
    {
        $information
            ->select('Voertuig_instructeurs.*', 'Voertuigs.Id', 'Voertuigs.Type', 'Voertuigs.Kenteken', 'Voertuigs.Bouwjaar', 'Voertuigs.Brandstof', 'Type_voertuigs.Rijbewijscategorie', 'Type_voertuigs.TypeVoertuig', 'voertuigs.TypeVoertuigId')
            ->leftJoin('Voertuig_Instructeurs', 'Voertuigs.Id', '=', 'voertuig_instructeurs.VoertuigId')
            ->join('Type_voertuigs', 'Voertuigs.TypeVoertuigId', '=', 'Type_voertuigs.Id')
            ->get();
    }

    public function scopeAllPageGegevens(Builder $information): void
    {
        $information
            ->select('Voertuig_instructeurs.*', 'Voertuigs.Id', 'Voertuigs.Type', 'Voertuigs.Kenteken', 'Voertuigs.Bouwjaar', 'Voertuigs.Brandstof', 'Type_voertuigs.Rijbewijscategorie', 'Type_voertuigs.TypeVoertuig')
            ->leftJoin('Voertuig_Instructeurs', 'Voertuigs.Id', '=', 'voertuig_instructeurs.VoertuigId')
            ->join('Type_voertuigs', 'Voertuigs.TypeVoertuigId', '=', 'Type_voertuigs.Id')
            ->whereNull('voertuig_instructeurs.VoertuigId')
            ->get();
    }
}

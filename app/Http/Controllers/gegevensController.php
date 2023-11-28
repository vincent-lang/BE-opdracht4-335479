<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Routing\Controller;
use App\Models\VoertuigInstructeur;
use App\Models\Instructeur;
use App\Models\save;
use App\Models\TypeVoertuig;
use App\Models\Voertuig;
use Illuminate\Support\Facades\DB;

class gegevensController extends Controller
{
    public function index()
    {
        $instructeurs = Instructeur::IndexGegevens()->get();
        $Amount = Instructeur::indexAmount()->get();
        $instructeursAmount = count($Amount);
        return view('instructeur.index', compact('instructeurs', 'instructeursAmount'));
    }

    public function delete(Instructeur $instructeur, $row)
    {
        $instructeurId = $instructeur->Id;
        $voertuigId = $row;

        DB::table('voertuig_instructeurs')->where('VoertuigId', $voertuigId)->delete();
        DB::table('saves')->where('VoertuigId', $voertuigId)->delete();

        return redirect(route('instructeur.list', [$instructeurId]))->with('succes', 'Het door u geselecteerde voertuig is verwijderd');
    }

    public function notActive(Instructeur $instructeur)
    {
        $instructeurId = $instructeur->Id;

        $activeInfo = DB::table('instructeurs')->select('IsActief')->where('Id', $instructeurId)->get();
        if ($activeInfo[0]->IsActief == true) {
            $active = array(
                'IsActief' => 0
            );

            DB::table('instructeurs')->where('Id', $instructeurId)->update($active);
        }
        return redirect(route('instructeur.index'))->with('succes', 'Instructeur ' . $instructeur->Voornaam  . ' ' . $instructeur->Tussenvoegsel . ' ' . $instructeur->Achternaam . ' is ziek/met verlof gemeld');
    }

    public function active(Instructeur $instructeur)
    {
        $instructeurId = $instructeur->Id;

        $activeInfo = DB::table('instructeurs')->select('IsActief')->where('Id', $instructeurId)->get();
        if ($activeInfo[0]->IsActief == false) {
            $active = array(
                'IsActief' => 1
            );

            DB::table('instructeurs')->where('Id', $instructeurId)->update($active);
        }
        return redirect(route('instructeur.index'))->with('succes', 'Instructeur ' . $instructeur->Voornaam  . ' ' . $instructeur->Tussenvoegsel . ' ' . $instructeur->Achternaam . ' is beter/terug van verlof gemeld');
    }
}

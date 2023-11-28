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

    public function delete(Instructeur $instructeur)
    {
        $instructeurId = $instructeur->Id;

        if ($instructeur->IsActief == false) {
            return redirect(route('instructeur.index'))->with('succes', 'cant delete him :(');
        } else {
            DB::table('voertuig_instructeurs')->where('InstructeurId', $instructeurId)->delete();
            DB::table('saves')->where('InstructeurId', $instructeurId)->delete();
            DB::table('instructeurs')->where('Id', $instructeurId)->delete();

            return redirect(route('instructeur.index'))->with('succes', 'delete him!!!');
        }
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

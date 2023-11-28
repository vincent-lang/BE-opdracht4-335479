<?php

namespace App\Http\Controllers;

use Illuminate\Routing\Controller;
use App\Models\Instructeur;
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

    public function list(Instructeur $instructeur)
    {
        $id = $instructeur->Id;
        $instructeurs = Instructeur::ListGegevens()->where('Id', '=', $id)->get();
        $voertuigData = Voertuig::ListVoertuigGegevens()->where('instructeurs.Id', '=', $id)->get();

        $addedData = DB::table('voertuig_instructeurs')->select('VoertuigId',  DB::raw('count(InstructeurId) as amount'))->groupBy('VoertuigId')->get();
        return view('instructeur.list', compact('instructeurs', 'voertuigData', 'addedData'));
    }

    public function addPage(Instructeur $instructeur)
    {
        $id = $instructeur->Id;
        $voertuigData = Voertuig::AddPageGegevens()->get();
        return view('instructeur.addPage', ['instructeurs' => $instructeur], compact('voertuigData'));
    }

    public function delete(Instructeur $instructeur)
    {
        $instructeurId = $instructeur->Id;

        if ($instructeur->IsActief == false) {
            return redirect(route('instructeur.index'))->with('succes', 'Instructeur ' . $instructeur->Voornaam  . ' ' . $instructeur->Tussenvoegsel . ' ' . $instructeur->Achternaam . ' kan niet definitief worden verwijdert, verander eerst de status ziekte/verlof');
        } else {
            DB::table('voertuig_instructeurs')->where('InstructeurId', $instructeurId)->delete();
            DB::table('saves')->where('InstructeurId', $instructeurId)->delete();
            DB::table('instructeurs')->where('Id', $instructeurId)->delete();

            return redirect(route('instructeur.index'))->with('succes', 'Instructeur ' . $instructeur->Voornaam  . ' ' . $instructeur->Tussenvoegsel . ' ' . $instructeur->Achternaam . ' is definitief verwijdert en al zijn eerder toegewezen voertuigen zijn vrijgegeven');
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

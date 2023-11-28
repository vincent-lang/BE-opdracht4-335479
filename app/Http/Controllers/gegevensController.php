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

use function PHPUnit\Framework\isEmpty;

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

    public function add(Instructeur $instructeur, $row)
    {
        $instructeurId = $instructeur->Id;
        $voertuigId = $row;
        $DatumToekenning = date('y-m-d');
        $DatumAangemaakt = date('y-m-d h:i:s');
        $DatumGewijzigd = date('y-m-d h:i:s');
        $data = VoertuigInstructeur::insert(array(
            'VoertuigId' => $voertuigId,
            'InstructeurId' => $instructeurId,
            'DatumToekenning' => $DatumToekenning,
            'DatumAangemaakt' => $DatumAangemaakt,
            'DatumGewijzigd' => $DatumGewijzigd
        ));

        $data = save::insert(array(
            'VoertuigId' => $voertuigId,
            'InstructeurId' => $instructeurId,
            'DatumToekenning' => $DatumToekenning,
            'DatumAangemaakt' => $DatumAangemaakt,
            'DatumGewijzigd' => $DatumGewijzigd
        ));
        return redirect(route('instructeur.list', [$instructeurId]));
    }

    public function edit(Instructeur $instructeur, $row)
    {
        $instructeurId = $instructeur->Id;
        $voertuigId = $row;
        $voertuigData = Voertuig::EditGegevens()->where('Voertuigs.Id', '=', $voertuigId)->get();
        $instructeurData = Instructeur::EditGegevens()->where('Instructeurs.Id', '!=', $instructeurId)->get();
        $typeVoertuigData = TypeVoertuig::EditTypeVoertuigGegevens()->where('Type_Voertuigs.TypeVoertuig', '!=', $voertuigData[0]->TypeVoertuig)->get();
        return view('instructeur.editPage', ['instructeurs' => $instructeur], compact('voertuigData', 'instructeurData', 'typeVoertuigData'));
    }

    public function update(Request $request, Instructeur $instructeur, $row)
    {
        // $req = $request->all();
        // dd($req);
        $instructeurId = $instructeur->Id;
        $Idata = $request->validate([
            'InstructeurId' => 'required|integer',
        ]);
        $Vdata = $request->validate([
            'Type' => 'required|string',
            'Bouwjaar' => 'required|date',
            'Brandstof' => 'required|string',
            'Kenteken' => 'required|string'
        ]);
        $TVdata = $request->validate([
            'TypeVoertuigId' => 'required|integer'
        ]);
        $voertuigInstructeur = DB::table('voertuig_instructeurs')->where('VoertuigId', $row)->update($Idata);
        $voertuig = DB::table('voertuigs')->where('Id', $row)->update($Vdata);
        $typeVoertuig = DB::table('voertuigs')->where('Id', $row)->update($TVdata);
        // dd($voertuigInstructeur);

        return redirect(route('instructeur.list', [$instructeurId]));
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

            DB::table('voertuig_instructeurs')->where('InstructeurId', $instructeurId)->delete();
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


            $saveVid = DB::table('saves')->select('VoertuigId')->where('InstructeurId', $instructeurId)->get();
            $DatumToekenning = date('y-m-d');
            $DatumAangemaakt = date('y-m-d h:i:s');
            $DatumGewijzigd = date('y-m-d h:i:s');
            foreach ($saveVid as $key) {
                $voertuigGegevens = $key->VoertuigId;
                $data = VoertuigInstructeur::insert(array(
                    'VoertuigId' => $voertuigGegevens,
                    'InstructeurId' => $instructeurId,
                    'DatumToekenning' => $DatumToekenning,
                    'DatumAangemaakt' => $DatumAangemaakt,
                    'DatumGewijzigd' => $DatumGewijzigd
                ));
            }
        }
        return redirect(route('instructeur.index'))->with('succes', 'Instructeur ' . $instructeur->Voornaam  . ' ' . $instructeur->Tussenvoegsel . ' ' . $instructeur->Achternaam . ' is beter/terug van verlof gemeld');
    }

    public function addedToSomeoneElse(Instructeur $instructeur, $row)
    {
        $id = $instructeur->Id;
        $addedData = DB::table('Voertuig_instructeurs')->select('VoertuigId', 'InstructeurId')->where('InstructeurId', '!=', $id)->where('VoertuigId', '=', $row)->get();
        if ($addedData->isEmpty()) {
        } else {
            DB::table('Voertuig_instructeurs')->select('VoertuigId', 'InstructeurId')->where('InstructeurId', '!=', $id)->where('VoertuigId', '=', $row)->delete();
            DB::table('saves')->select('VoertuigId', 'InstructeurId')->where('InstructeurId', '!=', $id)->where('VoertuigId', '=', $row)->delete();
            return redirect(route('instructeur.list', [$id]))->with('succes', 'Het geselecteerde voertuig is weer toegewezen aan ' . $instructeur->Voornaam  . ' ' . $instructeur->Tussenvoegsel . ' ' . $instructeur->Achternaam);
        }
    }
}

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="/css/app.css">
    <title>Document</title>
</head>

<body>
    <h3>Door instructeur gebruikte voertuigen</h3>
    <h3>Naam: {{$instructeurs[0]->Voornaam}} {{$instructeurs[0]->Tussenvoegsel}} {{$instructeurs[0]->Achternaam}}</h3>
    <h3>Datum in dienst: {{$instructeurs[0]->DatumInDienst}}</h3>
    <h3>Aantal sterren: {{$instructeurs[0]->AantalSterren}}</h3>
    <h3>
        <a href="{{route('instructeur.addPage', [$instructeurs[0]->Id])}}">Toevoegen voertuig</a>
    </h3>
    <div>
        @if(session()->has('succes'))
        <div>
            <h3 class="succes-text">
                {{session('succes')}}
            </h3>
        </div>
        <script>
            setTimeout(function() {
                window.location.href = "{{route('instructeur.list', [$instructeurs[0]->Id])}}"
            }, 3000);
        </script>
        @endif
    </div>
    @if($voertuigData->isEmpty())
    <h3>
        Geen voertuigen toegewezen.
    </h3>
    <script>
        setTimeout(function() {
            window.location.href = "{{route('instructeur.index')}}"
        }, 3000);
    </script>
    @else
    <table>
        <thead>
            <th>Type voertuig</th>
            <th>Type</th>
            <th>Kenteken</th>
            <th>Bouwjaar</th>
            <th>Brandstof</th>
            <th>Rijbewijs categorie</th>
            <th>Wijzigen</th>
            <th>Verwijderen</th>
            <th>Toegewezen</th>
        </thead>
        <tbody>
            @foreach ($voertuigData as $row)
            <tr>
                <td>{{$row->TypeVoertuig}}</td>
                <td>{{$row->Type}}</td>
                <td>{{$row->Kenteken}}</td>
                <td>{{$row->Bouwjaar}}</td>
                <td>{{$row->Brandstof}}</td>
                <td>{{$row->Rijbewijscategorie}}</td>
                <td>
                    <a href="{{route('instructeur.editPage', [$instructeurs[0]->Id, $row->Id])}}">
                        <img class="small-img" src="/img/wijzig.png" alt="wijzig.png">
                    </a>
                </td>
                <td>
                    <a href="{{route('instructeur.delete', [$instructeurs[0]->Id, $row->Id])}}">
                        <img class="small-img" src="/img/delete.png" alt="delete.png">
                    </a>
                </td>
                @foreach($addedData as $test)
                @if($test->VoertuigId == $row->Id)
                @if($test->amount > 1)
                <td>
                    <a href="{{route('instructeur.else', [$instructeurs[0]->Id, $row->Id])}}">
                        <img class="small-img" src="/img/kruisje.png" alt="kruisje.png">
                    </a>
                </td>
                @else
                <td>
                    <img class="small-img" src="/img/vinkje.png" alt="vinkje.png">
                </td>
                @endif
                @endif
                @endforeach
            </tr>
            @endforeach
        </tbody>
    </table>
    @endif
    <h3>
        <a href="{{route('instructeur.index')}}">go back</a>
    </h3>
</body>

</html>
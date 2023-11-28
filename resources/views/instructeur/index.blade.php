<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="/css/app.css">
    <title>Document</title>
</head>

<body>
    <h3>Instructeurs in dienst</h3>
    <h3>aantal instructeurs: {{$instructeursAmount}}</h3>
    @if(session()->has('succes'))
    <h3 class="succes-text">
        {{session('succes')}}
    </h3>
    <script>
        setTimeout(function() {
            window.location.href = "{{route('instructeur.index')}}"
        }, 3000);
    </script>
    @endif
    <table>
        <thead>
            <th>Voornaam</th>
            <th>Tussenvoegsel</th>
            <th>Achternaam</th>
            <th>Mobiel</th>
            <th>Datum in dienst</th>
            <th>Aantal sterren</th>
            <th>Voertuigen</th>
            <th>Ziekte/Verlof</th>
            <th>Verwijderen</th>
        </thead>
        <tbody>
            @foreach($instructeurs as $instructeur)
            <tr>
                <td>{{$instructeur->Voornaam}}</td>
                <td>{{$instructeur->Tussenvoegsel}}</td>
                <td>{{$instructeur->Achternaam}}</td>
                <td>{{$instructeur->Mobiel}}</td>
                <td>{{$instructeur->DatumInDienst}}</td>
                <td>{{$instructeur->AantalSterren}}</td>
                <td>
                    <a href="{{route('instructeur.index')}}">
                        <img src="/img/car.png" alt="car.png">
                    </a>
                </td>
                @if($instructeur->IsActief == true)
                <td>
                    <a href="{{route('instructeur.notActive', [$instructeur->Id])}}">
                        <img class="small-img" src="/img/thumb.png" alt="thumb.png">
                    </a>
                </td>
                @else
                <td>
                    <a href="{{route('instructeur.active', [$instructeur->Id])}}">
                        <img class="small-img" src="/img/band_aid.png" alt="band_aid.png">
                    </a>
                </td>
                @endif
                <td>
                    <a href="{{route('instructeur.delete', [$instructeur->Id])}}">
                        <img class="small-img" src="img/delete.png" alt="delete.png">
                    </a>
                </td>
            </tr>
            @endforeach
        </tbody>
    </table>
</body>

</html>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="/css/app.css">
    <title>Document</title>
</head>

<body>
    <h3>Alle beschikbare voertuigen</h3>
    <table>
        <thead>
            <th>Type voertuig</th>
            <th>Type</th>
            <th>Kenteken</th>
            <th>Bouwjaar</th>
            <th>Brandstof</th>
            <th>Rijbewijs categorie</th>
            <th>Toevoegen</th>
        </thead>
        <tbody>
            @foreach($voertuigData as $row)
            <tr>
                <td>{{$row->TypeVoertuig}}</td>
                <td>{{$row->Type}}</td>
                <td>{{$row->Kenteken}}</td>
                <td>{{$row->Bouwjaar}}</td>
                <td>{{$row->Brandstof}}</td>
                <td>{{$row->Rijbewijscategorie}}</td>
                <td>
                    <a href="{{route('instructeur.addPage', [$instructeurs->Id])}}">
                        <img src="/img/add.png" alt="add.png">
                    </a>
                </td>
            </tr>
            @endforeach
        </tbody>
    </table>
    <h3>
        <a href="{{route('instructeur.list', [$instructeurs->Id])}}">go back</a>
    </h3>
</body>

</html>
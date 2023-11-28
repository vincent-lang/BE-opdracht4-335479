<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="/css/app.css">
    <title>Document</title>
</head>

<body>
    <h3>Wijzigen voertuiggegevens</h3>
    @foreach($voertuigData as $Vdata)
    <form class="wijzig" method="post" action="{{route('instructeur.update', [$instructeurs->Id, $Vdata->Id])}}">
        @csrf
        @method('put')
        <div class="wijzig">
            <label for="Instructeur">Instructeur:</label>
            <select name="InstructeurId" id="Instructeur">
                <option value="{{$instructeurs->Id}}">{{$instructeurs->Voornaam}} {{$instructeurs->Tussenvoegsel}} {{$instructeurs->Achternaam}}</option>
                @foreach($instructeurData as $Idata)
                <option value="{{$Idata->Id}}">{{$Idata->Voornaam}} {{$Idata->Tussenvoegsel}} {{$Idata->Achternaam}}</option>
                @endforeach
            </select>
        </div>
        <div class="wijzig">
            <label for="Type_voertuig">Type voertuig:</label>
            <select name="TypeVoertuigId" id="Type_voertuig">
                <option value="{{$Vdata->TypeVoertuigId}}">{{$Vdata->TypeVoertuig}}</option>
                @foreach($typeVoertuigData as $TVdata)
                <option value="{{$TVdata->Id}}">{{$TVdata->TypeVoertuig}}</option>
                @endforeach
            </select>
        </div>
        <div class="wijzig">
            <label for="Type">Type:</label>
            <input type="text" name="Type" value="{{$Vdata->Type}}">
        </div>
        <div class="wijzig">
            <label for="Bouwjaar">Bouwjaar:</label>
            <input type="date" name="Bouwjaar" value="{{$Vdata->Bouwjaar}}" readonly>
        </div>
        <div class="wijzig">
            <label for="Brandstof">Diesel:</label>
            @if($Vdata->Brandstof == 'Diesel')
            <input type="radio" name="Brandstof" value="Diesel" checked>
            @else
            <input type="radio" name="Brandstof" value="Diesel">
            @endif
            <label for="Brandstof">Benzine:</label>
            @if($Vdata->Brandstof == 'Benzine')
            <input type="radio" name="Brandstof" value="Benzine" checked>
            @else
            <input type="radio" name="Brandstof" value="Benzine">
            @endif
            <label for="Brandstof">Elektrisch:</label>
            @if($Vdata->Brandstof == 'Elektrisch')
            <input type="radio" name="Brandstof" value="Elektrisch" checked>
            @else
            <input type="radio" name="Brandstof" value="Elektrisch">
            @endif
        </div>
        <div class="wijzig">
            <label for="Kenteken">Kenteken:</label>
            <input type="text" name="Kenteken" value="{{$Vdata->Kenteken}}">
        </div>
        @endforeach
        <div class="wijzig">
            <input type="submit" value="Wijzig">
        </div>
    </form>
</body>

</html>
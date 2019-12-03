Import-Module C:\Users\tmp09itd\OneDrive\Code\Advent_of_Code\2019\AOC-Functions.psm1
$totalFuel = 0
$input = Get-AOCDailyInput -Day 1
foreach ($mass in $input) {
    $moduleFuel = 0
    $moduleFuel = Get-FuelRequired -Mass $mass

    $fuelMass = $moduleFuel

    do {
        $extraFuel = Get-FuelRequired -Mass $fuelMass
        if ($extraFuel -ge 0) {
            $moduleFuel += $extraFuel
        }
        $fuelMass = $extraFuel
    } while ($fuelMass -ge 0)

    $totalFuel += $moduleFuel
}

$totalFuel
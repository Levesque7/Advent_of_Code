Import-Module C:\Users\tmp09itd\OneDrive\Code\Advent_of_Code\2019\AOC-Functions.psm1
$totalFuel = 0
$input = Get-AOCDailyInput -Day 1
foreach ($mass in $input) {
    $fuel = Get-FuelRequired -Mass $mass
    $totalFuel += $fuel
}
$totalFuel
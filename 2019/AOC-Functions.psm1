Function Get-AOCDailyInput {
    Param([parameter(Mandatory)][string]$Day)
    $input = Get-Content "C:\Users\tmp09itd\OneDrive\Code\Advent_of_Code\2019\Day_$Day\input.txt"
    $input
}

Function Get-FuelRequired {
    Param([parameter(Mandatory)][int]$Mass)
    $fuel = [Math]::FLoor(($Mass/3)) - 2
    $fuel
}

Function Start-IntcodeProgram {
    $code = Get-AOCDailyInput -Day 2

}
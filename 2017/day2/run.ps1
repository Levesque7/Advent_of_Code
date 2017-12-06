$input = Get-Content .\input.txt
$sum = 0

Function Get-Max {
  Param([parameter(Mandatory=$true)][array]$array)
  $max = [convert]::ToInt32($array[0], 10)
  Foreach ($num in $array) {
    $num = [convert]::ToInt32($num, 10)
    If ($num -gt $max) { $max = $num }
  }
  $max
}

Function Get-Min {
  Param([parameter(Mandatory=$true)][array]$array)
  $min = [convert]::ToInt32($array[0], 10)
  Foreach ($num in $array) {
    $num = [convert]::ToInt32($num, 10)
    If ($num -lt $min) { $min = $num }
  }
  $min
}

For ($i = 0; $i -lt $input.length; $i++) {
  $arr = $input[$i].split("`t")
  $min = Get-Min $arr
  $max = Get-Max $arr
  $sum += ($max - $min)
  }

  $sum

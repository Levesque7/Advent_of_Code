$arr = Get-Content .\input.txt
$sum = 0

Function Test-Match {
  Param([int]$i, [int]$n)
  If ($arr[$i] -eq $arr[$n]) {
    $return = [convert]::ToInt32($arr[$i], 10)
  }
  else {
    $return = 0
  }
  $return
}

For ($i = 0; $i -lt $arr.length; $i++) {
  If (($i + ($arr.length/2)) -ge $arr.length) {
    $n = ($i + ($arr.length/2)) - $arr.length
    $test = Test-Match $i $n
    $sum += $test
  }
  else {
    $n = $i + ($arr.length/2)
    $test = Test-Match $i $n
    $sum += $test
  }
}

$sum

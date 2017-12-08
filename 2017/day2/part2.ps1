$input = Get-Content .\input.txt
$sum = 0


For ($i = 0; $i -lt $input.length; $i++) {
  $arr = $input[$i].split("`t")
  For ($n = 0; $n -lt $arr.length; $n++) {
    For ($x = 0; $x -lt $arr.length; $x++) {
      if ($x -ne $n) {
        $prod = [convert]::ToInt32($arr[$n], 10)/[convert]::ToInt32($arr[$x], 10)
      }
      if ([math]::Round($prod) -eq $prod) {
        $sum += $prod
        clv prod
      }
    }
  }
}

$sum

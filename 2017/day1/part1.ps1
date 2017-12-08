$arr = Get-Content .\input.txt
$sum = 0

For ($i = 0; $i -lt $arr.length; $i++) {
  If ($arr[$i] -eq $arr[$i + 1]) {
    $sum += [convert]::ToInt32($arr[$i], 10)
  }
}

If ($arr[$arr.length - 1] -eq $arr[0]) {
  $sum += [convert]::ToInt32($arr[$arr.length - 1], 10)
}

$sum

$input = Get-Content .\input.txt
$total = 0

Function Test-Passphrase {
  Param([parameter(Mandatory=$true)][array]$array)
  $valid = $true
  For ($i = 0; $i -lt $array.length; $i++) {
    For ($n = 0; $n -lt $array.length; $n++) {
      If ($i -ne $n) {
        If ($array[$i] -eq $array[$n]) {
          $valid = $false
        }
      }
    }
  }
  $valid
}

For ($i = 0; $i -lt $input.length; $i++) {
  $arr = $input[$i].split(" ")
  for ($n = 0; $n -lt $arr.length; $n++) {
    $charArr = $arr[$n].toCharArray()
    $sortArr = $charArr | Sort-Object
    $sorted = $sortArr -join ""
    $arr.item($n) = $sorted
  }
  $valid = Test-Passphrase $arr
  if ($valid) { $total += 1}
}

$total

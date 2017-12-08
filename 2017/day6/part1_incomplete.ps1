$input = Get-Content .\input.txt
$array = $input.split("`t")
$cycles = 0
$history = @()
$duplicate = $false

For ($i = 0; $i -lt $array.length; $i++) {
  $array[$i] = [convert]::ToInt32($array[$i], 10)
}

Function Start-Cycle {
  Param([array]$arr)
  $max = 0
  For ($i = 0; $i -lt $arr.length; $i++) {
    if ($arr[$i] -gt $max) {
      $max = $arr[$i]
      $marker = $i
      $newAlloc = Start-Distribution $arr $max $marker
    }
  }
  $newAlloc
}

Function Start-Distribution {
  Param([array]$arr, [int]$max, [int]$marker)
  $arr[$marker] = 0
  Do {
    if ($marker -lt ($arr.length - 1)) { $marker++ }
    else { $marker = 0 }
    $arr[$marker] = $arr[$marker] + 1
  } Until ($max -eq 0)
  $arr
}

Function Update-History {
  Param([array]$history, [array]$newArr, $duplicate)
  $string = $newArr -join ","
  if ($history -contains $string) {
    $history += $string
    $duplicate = $true
  }
  else {
    $history += $string
  }
  $return = @($history, $duplicate)
}

Do {
  $newArr = Start-Cycle $array
  $return = Update-History $history $newArr $duplicate
  $history = $return[0]
  $duplicate = $return[1]
  $cycles++
  $array = $newArr
} Until ($duplicate)

$cycles

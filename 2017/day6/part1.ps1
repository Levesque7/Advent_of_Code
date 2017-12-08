$input = Get-Content .\input.txt
$stringArray = $input.split("`t")
$cycles = 0
$history = @()
$duplicate = $false
$array = @()

For ($i = 0; $i -lt $stringArray.length; $i++) {
  $array += [convert]::ToInt32($stringArray[$i], 10)
}

$initial = $array -join ","
$history += $initial

Function Start-Cycle {
  Param([array]$arr)
  $max = 0
  For ($i = 0; $i -lt $arr.length; $i++) {
    if ($arr[$i] -gt $max) {
      $max = $arr[$i]
      $marker = $i
    }
  }
  $return = @($max, $marker)
  $return
}

Function Start-Distribution {
  Param([array]$arr, [int]$max, [int]$marker)
  $arr.item($marker) = 0
  Do {
    if ($marker -lt ($arr.length - 1)) { $marker++ }
    else { $marker = 0 }
    $arr.item($marker) = $arr.item($marker) + 1
    $max = $max - 1
  } Until ($max -eq 0)
  $arr
}

Function Update-History {
  Param([array]$history, [array]$newArr, $duplicate)
  $string = $newArr -join ","
  foreach ($s in $history) {
    if ($s -eq $string) {
      $duplicate = $true
    }
  }
  $history += $string
  $return = @($history, $duplicate)
  $return
}

Do {
  $result = Start-Cycle $array
  $newArr = Start-Distribution $array $result[0] $result[1]
  $return = Update-History $history $newArr $duplicate
  $history = $return[0]
  $duplicate = $return[1]
  $cycles++
  $array = $newArr
} Until ($duplicate)

$cycles

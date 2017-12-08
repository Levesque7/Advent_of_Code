$input = Get-Content .\input.txt
$jumps = 0
$i = 0

Do {
  $move = [convert]::ToInt32($input[$i], 10)
  $input[$i] = [convert]::ToInt32($input[$i], 10) + 1
  $i += $move
  $jumps++
} While ($i -lt $input.length)

$jumps

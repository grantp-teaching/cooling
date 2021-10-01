# Exercise generator for COP 

$PowerInput_kW = [math]::Round((Get-Random -Min 4.9 -Max 50.1),1)
$TargetCOP = [math]::Round((Get-Random -Min 1.5 -Max 5.5),1)
$CoolingOutput_kW = [math]::Round($PowerInput_kW * $TargetCOP,1)

$Variant = Get-Random -Min 0 -Max 2

switch ( $Variant ) {
0 {
$QuestionText = "A cooling system consumes $PowerInput_kW kW of electrical power to provide $CoolingOutput_kW kW of cooling. Determine the COP."
$Target=$COP
}
1 {
$QuestionText = "A cooling system consumes $PowerInput_kW kW of electrical power and has a COP of $TargetCOP. Determine the cooling power provided in kW."
$Target=$CoolingOutput_kW
}
2 {
$QuestionText = "A cooling system has a COP of $TargetCOP and delivers $CoolingOutput_kW kW of cooling power. Determine the electrical input in kW."
$Target = $PowerInput_kW
}
default {
	Write-Error "Variant $Variant not found"
     Return
}
}

Write-Host $QuestionText

$Answer = Read-Host "Answer = "

Write-Host "Correct answer: = $Answer"	

$NormalisedError = [math]::Round(($Answer - $Target)/$Target,2)
Write-Host "Normalised error: $NormalisedError"

if ( [Math]::Abs($NormalisedError) -lt 0.01 ) {
   Write-Host "your answer was correct"
} else {
  Write-Host "your answer was wrong"
}


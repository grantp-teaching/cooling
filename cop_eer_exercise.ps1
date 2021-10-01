# COP to EER conversion exercise

$COP = [math]::Round((Get-Random -Minimum 1.2 -Maximum 5.0),1)
$EER = [math]::Round(3.412 * $COP,1)

$QuestionSelect = Get-Random -Min 0 -Max 1 

if ( 0 -eq $QuestionSelect ) {
$QText = "A cooling system has an EER of $EER. Convert to COP."
$Target = $COP
}
elseif ( 1 -eq $QuestionSelect ) {
$QText = "A cooling system has a COP of $COP. Covert to EER."
$Target=$EER
}

Write-Host $QText

$Answer = [math]::Round((Read-Host "Answer = "), 1)

Write-Host "Correct answer = $Target"

$NormalisedError = [math]::Round(($Answer - $Target)/$Target,2)
Write-Host "Normalised error: $NormalisedError"

if ( [math]::Abs($NormalisedError) -lt 0.01 ) {
   Write-Host "your answer is correct"
   }
else {
   Write-Host "your answer is wrong"
   }


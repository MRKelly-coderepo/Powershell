#requires -RunAsAdministrator
 
Get-EventLog -LogName Security -InstanceId 4624 |
 ForEach-Object {
     [PSCustomObject]@{
         Time = $_.TimeGenerated
         LogonType = $_.ReplacementStrings[8]
         Process = $_.ReplacementStrings[9]
         Domain = $_.ReplacementStrings[5]
         User = $_.ReplacementStrings[6]
         Method = $_.ReplacementStrings[10]
         Source = $_.Source
 
     }
 } | Out-GridView
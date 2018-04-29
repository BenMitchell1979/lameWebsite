# Lame Website Demo #
This is a very simply website used for demonstation purposes. 


## Code to remember for demo ##

This section forces DSC Configurations Update and verifies status
```powershell
$acctName = 'azure-automation-demo'

$jobData = Start-AzureRmAutomationDscCompilationJob -ResourceGroupName $acctName –AutomationAccountName $acctName -ConfigurationName 'websiteDeploy'

$compilationJobId = $jobData.Id

Get-AzureRmAutomationDscCompilationJob -ResourceGroupName $acctName –AutomationAccountName $acctName -Id $compilationJobId
```
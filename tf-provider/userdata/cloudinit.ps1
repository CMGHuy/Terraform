# The following script is to create an user "USER" with password "PASSWORD" on worker instances
# This user is used when logging into the instances
# The winrm is also needed to enable for remote desktop control

# Running commands as Administrator using PowerShell
# ps1_sysnative

If (-NOT ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator"))
{
# No Administrative rights, it will display a popup window asking user for Admin rights 

$arguments = "& '" + $myinvocation.mycommand.definition + "'"
Start-Process "$psHome\powershell.exe" -Verb runAs -ArgumentList $arguments

break
}
# After user clicked Yes on the popup, your file will be reopened with Admin rights 
# Put your code here 

cmd /C 'wmic UserAccount where Name="opc" set PasswordExpires=False'

Enable-PSRemoting -Force

winrm set winrm/config/client/auth '@{Basic="true"}'
winrm set winrm/config/service/auth '@{Basic="true"}'
winrm set winrm/config/service '@{AllowUnencrypted="true"}'

# Define new user USER

$Secure_String = ConvertTo-SecureString "PASSWORD" -AsPlainText -Force
New-LocalUser -Name "USER" -Password $Secure_String
Add-LocalGroupMember -Group "Administrators" -Member "USER"

cmd /C 'wmic UserAccount where Name="USER" set PasswordExpires=False'
cmd /C 'net accounts /lockoutthreshold:400'

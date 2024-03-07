#Import Active Directory module to allow Get-ADComputer to work.  
#If running on a server, the RSAT-AD-Powershell windows feature may need to be installed, simply uncomment line 3.
#Install-WindowsFeature RSAT-AD-Powershell
Import-Module -Name ActiveDirectory

#Get list of server names from Active Directory. This returns only the name of the Server.  
#Further filtering could be done to focus on a specific OU
$Servers = Get-ADComputer -Filter * | select-object -expandproperty Name

#Loop through the returned servers variable and run a command or script on each machine.
#Uncomment either line 17 or 18 depending on need.
#If a machine is not available, it will write the name to the Unavailable-Servers.txt file
ForEach ($Server in $Servers)
{
  Try
    {
      #Invoke-Command -ComputerName -$Server -ScriptBlock {Get-ChildItem "C:\Program Files"}
      #Invoke-Command -ComputerName -$Server -FilePath <PATH_TO_PS1>
    }
  Catch
    {
      Add-Content Unavailable-Servers.txt $Server
    }
}

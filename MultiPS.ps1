Import-Module -Name ActiveDirectory

$servers = Get-ADComputer -Filter * | select-object -expandproperty Name

ForEach ($Server in $Servers)
{
  Try
    {
      #Invoke-Command -ComputerName -$Server -ScriptBlock {Get-ChildItem "C:\Program Files"}
      #Invoke-Command -ComputerName -$Server -FilePath <PATH_TO_PS1>
    }
  Catch
    {
      Add-Content Unavailable-Servers.txt $server
    }
}

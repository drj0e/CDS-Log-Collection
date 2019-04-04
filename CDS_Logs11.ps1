$( 


###########################
#Create directory for logs#
###########################

Try
{
New-Item -Path "C:\users\$env:username\Desktop\" -Name "Agilent_Logs" -ItemType "directory" 
}
Catch
{
Write-Host "an error has occured"
Write-Host $_}



############################################
#Copy Logs files from soruce to destination#
############################################

Copy-Item "C:\Windows\System32\winevt\Logs\System.evtx" -Destination "C:\users\$env:username\Desktop\Agilent_Logs"
Write-Host "Collecting Windows System Logs"

Copy-Item "C:\Windows\System32\winevt\Logs\Application.evtx" -Destination "C:\users\$env:username\Desktop\Agilent_Logs"
Write-Host "Collecting Windows Application Logs"

Copy-Item "C:\Windows\System32\winevt\Logs\Security.evtx" -Destination "C:\users\$env:username\Desktop\Agilent_Logs"
Write-Host "Collecting Windows Security Logs"


##########################
#Alternate Log Collection#
##########################


$Computername = $env:COMPUTERNAME
$StartTime = [datetime]::Today.AddDays(-5)
$EndTime = [datetime]::now

<# Event Log Levels
    1 = Critical
    2 = Error
    3 = Warning
    4 = Information
    5 = Verbose 
    #>  
$Levels = @('Placeholder-0','Critical','Error', 'Warning', 'Information', 'Verbose')

$EventFilter = @{Logname='System','Application'
                 Level=2,3
                 StartTime=$StartTime
                 EndTime=$EndTime
                 }      

foreach($Computer in $Computername) {
    try {

        $Events = Get-WinEvent -ComputerName $Computer -Verbose:$false -ErrorAction Stop -FilterHashtable $EventFilter 

        $Output = $Events | Select-Object @{n='Computer';e={$Computer}}, TimeCreated,LogName, @{n='Level';e={$Levels[$($_.Level)]}}, Message 

        #Output to Screen
        #$Output | ft

        #Export to File 
        Out-File C:\users\$env:username\Desktop\Agilent_Logs-$Computer.txt

    } catch {

        Write-warning "Error connecting to server: $Computer - $($Error[0])"
    }
}

##########################
#Collect Chemstation Logs#
##########################

 $mypath0 = ("C:\Program Files (x86)\Agilent Technologies\Logs")
 $mypath1 = ("D:\Program Files (x86)\Agilent Technologies\Logs")
 $mypath2 = ("E:\Program Files (x86)\Agilent Technologies\Logs")
 
 $a = Test-Path $mypath0, $mypath1, $mypath2

    if ($a[0] -eq $True) {
    Write-Host "File Is Here"
    Write-Host $mypath0
    Copy-Item $mypath0  -Destination "C:\users\$env:username\Desktop\Agilent_Logs" -Recurse 
 }
    else { Write-Host "Not here"
 }
      if ($a[1] -eq $True) {
    Write-Host "File Is Here"
    Write-Host $mypath1
    Copy-Item $mypath1  -Destination "C:\users\$env:username\Desktop\Agilent_Logs" -Recurse 
 }
    else { Write-Host "Not here"
 }
    if ($a[2] -eq $True) {
    Write-Host "File Is Here"
    Write-Host $mypath2
    Copy-Item $mypath2  -Destination "C:\users\$env:username\Desktop\Agilent_Logs" -Recurse 
 }
    else { Write-Host "Not here"
 }


############################
#Collect Chemstation Folder#
############################

 $mypath0 = ("C:\Users\Public\Documents\ChemStation")
 $mypath1 = ("D:\Users\Public\Documents\ChemStation")
 $mypath2 = ("E:\Users\Public\Documents\ChemStation")
 
 $a = Test-Path $mypath0, $mypath1, $mypath2

    if ($a[0] -eq $True) {
    Write-Host "File Is Here"
    Write-Host $mypath0
    Copy-Item $mypath0  -Destination "C:\users\$env:username\Desktop\Agilent_Logs" -Recurse 
 }
    else { Write-Host "Not here"
 }
      if ($a[1] -eq $True) {
    Write-Host "File Is Here"
    Write-Host $mypath1
    Copy-Item $mypath1  -Destination "C:\users\$env:username\Desktop\Agilent_Logs" -Recurse 
 }
    else { Write-Host "Not here"
 }
    if ($a[2] -eq $True) {
    Write-Host "File Is Here"
    Write-Host $mypath2
    Copy-Item $mypath2  -Destination "C:\users\$env:username\Desktop\Agilent_Logs" -Recurse 
 }
    else { Write-Host "Not here"
 }

#####################################################
#Collect AppData\Roaming\Agilent Technologies Folder#
#####################################################

 $mypath0 = ("C:\Users\$env:username\AppData\Roaming\Agilent Technologies")
 $a = Test-Path $mypath0

    if ($a[0] -eq $True) {
    Write-Host "File Is Here"
    Write-Host $mypath0
    Copy-Item $mypath0  -Destination "C:\users\$env:username\Desktop\Agilent_Logs" -Recurse 
 }
    else { Write-Host "Not here"
 }

##########################################
#Collect Agilent Program Data Logs Folder#
##########################################

 $mypath0 = ("C:\ProgramData\Agilent\LogFiles")
 $mypath1 = ("D:\ProgramData\Agilent\LogFiles")
 $mypath2 = ("E:\ProgramData\Agilent\LogFiles")
 
 $a = Test-Path $mypath0, $mypath1, $mypath2

    if ($a[0] -eq $True) {
    Write-Host "File Is Here"
    Write-Host $mypath0
    Copy-Item $mypath0  -Destination "C:\users\$env:username\Desktop\Agilent_Logs" -Recurse 
 }
    else { Write-Host "Not here"
 }
      if ($a[1] -eq $True) {
    Write-Host "File Is Here"
    Write-Host $mypath1
    Copy-Item $mypath1  -Destination "C:\users\$env:username\Desktop\Agilent_Logs" -Recurse 
 }
    else { Write-Host "Not here"
 }
    if ($a[2] -eq $True) {
    Write-Host "File Is Here"
    Write-Host $mypath2
    Copy-Item $mypath2  -Destination "C:\users\$env:username\Desktop\Agilent_Logs" -Recurse 
 }
    else { Write-Host "Not here"
 }
 
###################
#Collect SVReports#
###################

 $mypath0 = ("C:\SVReports")
 $mypath1 = ("D:\SVReports")
 $mypath2 = ("E:\SVReports")
 
 $a = Test-Path $mypath0, $mypath1, $mypath2

    if ($a[0] -eq $True) {
    Write-Host "File Is Here"
    Write-Host $mypath0
    Copy-Item $mypath0  -Destination "C:\users\$env:username\Desktop\Agilent_Logs" -Recurse 
 }
    else { Write-Host "Not here"
 }
      if ($a[1] -eq $True) {
    Write-Host "File Is Here"
    Write-Host $mypath1
    Copy-Item $mypath1  -Destination "C:\users\$env:username\Desktop\Agilent_Logs" -Recurse 
 }
    else { Write-Host "Not here"
 }
    if ($a[2] -eq $True) {
    Write-Host "File Is Here"
    Write-Host $mypath2
    Copy-Item $mypath2  -Destination "C:\users\$env:username\Desktop\Agilent_Logs" -Recurse 
 }
    else { Write-Host "Not here"
 }	
	
#######################
#Run Zip Everything Up#
#######################

Try
{
$source = "C:\users\$env:username\Desktop\Agilent_Logs"

$destination = "C:\users\$env:username\Desktop\CDS_Collection.zip"

 If(Test-path $destination) {Remove-item $destination}

Add-Type -assembly "system.io.compression.filesystem"

[io.compression.zipfile]::CreateFromDirectory($Source, $destination) 
Write-Host "Zipping the logs and moving them to the desktop"
Start-Sleep -Seconds 5
}
Catch
{
Write-Host "an error has occured"
Write-Host $_
}

)*>&1 > C:\users\$env:username\Desktop\Agilent_Logs.txt
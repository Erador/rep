<#

Purpose: 3rd Powershell lab. Practicies use of:
    Here-Strings
    Piping commands
    Writing and Reading files
    Conditional logic

Author: Sharon Jirak
File:   Lav3Spring2020.ps1
Date:   Fevruary 20, 2020

#>

Clear-Host

Set-Location $env:USERPROFILE 

Get-ChildItem -path $env:USERPROFILE -Filter *.txt | Format-Table name,length

$menu = @"
What do u want to do?
    1. Write a contact entry to a file
    2. Display all files last written to after a given date
    3. Read a specified text file
"@
$menu

$choice = Read-Host "Enter the option: "

if ($choice -eq 1){

    $cname = Read-Host "Enter the name: "
    $cphone = Read-Host "Enter the phone number: "
    $cemail = Read-Host "Enter the email: "
    $cfile = Read-Host "Enter the name of the file: "

    Add-Content $cfile -Value "$cname`n$cphone`n$cemail`n"

} elseif ($choice -eq 2) {

    $cdate = Read-Host "Earliest date of files to display: "

    Get-ChildItem -path $env:USERPROFILE | Where-Object {$_.lastwritetime -gt (Get-Date $cdate)} | Format-Table name, lastwritetime

} elseif ($choice -eq 3) {

    $cfile = Read-Host "Enter the name of file: "

    If (test-path $cfile) {
        
        Get-Content $cfile

    } else {

        Write-Host "File doesn't exist"

    }

} else {

    Write-Host "Invalid Input from $env:Computername by user: $env:USERPROFILE"

}
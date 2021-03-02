<#
===================================================================================
Powershell import script for lots of structered folders into git
===================================================================================
Autor:        Steffen Hornung
Script:       Import-Git.ps1
Version:      1.0
Date:         02.03.2021
Environment:  Windows 
Credit:       https://wiki.epfl.ch/help-git-en/how-can-i-import-an-existing-folder-into-my-repository
              for the idea of putting an existing folder into a repo
#>

#This script will, depending on the amount of data, run for a very long time
# so we put our parameters simply inside the script and call it

#region Settings
#Set Filter to narrow down what you want to import
$filter="*"
#Get list of folders you want to import
$dirs=Get-Childitem -Directory -Filter $filter
#where to copy your exports
$gitdir="S:\GIT\"
# fixed author since our application produces the data, if you have the need to be more flexible,
# adjust that to reflect your use case
$author="me<my.email@addres.se>"
#endregion Settings

#region Loop
foreach ($dir in $dirs){
	$source=$dir.fullname
	$target=$gitdir
	$datestamp=$dir.creationtime
	Copy-Item -Path $source -Destination $gitdir -Recurse -force
	$msg="Export $datestamp"
	cd $gitdir
	git add .
	git commit -m "$msg" --author=$author --date=$datestamp
}
#endregion Loop

#to take backup seriously one would need to git push to a remote location by
git remote add origin https://github.example.com/myname/myrepo
#pushing only after loop is done to save up on time
git push 
#or
git push -u origin master
#if this is your first push

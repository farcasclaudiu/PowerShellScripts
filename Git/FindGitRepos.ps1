Function GetGitRepos {
<#

usage:
	'. .\FindGitRepos.ps1; GetGitRepos <start_search_path_optional>'
	'. .\FindGitRepos.ps1; GetGitRepos'
arguments:
	if <start_search_path_optional> is missing it will be considered current script folder

remarks:
	I needed this script to find and centralise all git repos stored on my machine.
	Now I have them all under control!
	You can have them too!

#>

	Write-Host "------------------------------------------"
	if($args[0]){
		$path = $args[0] + "*"
		Write-Host "Search git repos in '$path'"
		$Files = Get-ChildItem . -Path $path -Attributes Directory,Directory+Hidden -ErrorAction SilentlyContinue -Include ".git" -Recurse
	}
	else {
		$path = $PSScriptRoot + "*"
		Write-Host "Search git repos in local '$path'"
		$Files = Get-ChildItem . -Attributes Directory,Directory+Hidden -ErrorAction SilentlyContinue -Include ".git" -Recurse
	}
	Write-Host "------------------------------------------"
	if($Files.Count>0){
		foreach ($File in $Files) {
		  write-host $($File)
		} 
	}
	else{
		Write-Host "No git repos found"
	}
	Write-Host "------------------------------------------"
}
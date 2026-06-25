$buildDependenciesProject = "vocaluxe.dependencies.csproj"
$dependencyProjects = Get-ChildItem -Path "." -Filter "*.csproj" -Recurse -File
foreach ($dependencyProject in $dependencyProjects) {
	if($($dependencyProject.Name) -eq $buildDependenciesProject) {
		continue
	}
	
	Write-Output "Packing $($dependencyProject.Name)"
	dotnet pack $($dependencyProject.FullName)
}

$buildDependenciesProjectPath = Join-Path "dependencies" $buildDependenciesProject
Write-Output "Now packing build dependencies"
dotnet pack $buildDependenciesProjectPath
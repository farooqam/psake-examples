Set-StrictMode -Version latest

Properties {
	$dotnetVerbosity = "n"
    $buildConfig = "debug"
	$project = "NetCoreConsoleApp"
	$testProject = "NetCoreConsoleAppTest"
}

Task Clean {
	Exec { dotnet clean -v $dotnetVerbosity -c $buildConfig $project }
	Exec { dotnet clean -v $dotnetVerbosity -c $buildConfig $testProject }
}

Task Build -Depends Clean {
	Exec { dotnet build -c $buildConfig -v $dotnetVerbosity $project} 
	Exec { dotnet build -c $buildConfig -v $dotnetVerbosity $testProject} 
}

Task Test -Depends Build {
	Exec { dotnet test -c $buildConfig -v $dotnetVerbosity $testProject}
} 

Task Publish -Depends Build {
	Exec { dotnet publish -c $buildConfig -v $dotnetVerbosity $project}
} 


Task Default -Depends Publish
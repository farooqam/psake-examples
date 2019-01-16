Set-StrictMode -Version latest

Properties {
	$dotnetVerbosity = "m"
    $buildConfig = "debug"
}

Task Clean {
	Exec { dotnet clean -v $dotnetVerbosity -c $buildConfig }
}

Task Build -Depends Clean {
	Exec { dotnet build -c $buildConfig -v $dotnetVerbosity } 
}

Task Default -Depends Build
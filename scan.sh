#!/bin/bash

set -e

BEGIN_CMD="mono /sonar/SonarQube.Scanner.MSBuild.exe begin /k:$SONAR_KEY /d:sonar.host.url=$SONAR_HOST /d:sonar.login=$SONAR_LOGIN "
${BEGIN_CMD}
dotnet restore SolutionDir/SolutionName.sln
dotnet msbuild SolutionDir/SolutionName.sln
END_CMD="mono /sonar/SonarQube.Scanner.MSBuild.exe end /d:sonar.login=$SONAR_LOGIN "
${END_CMD}

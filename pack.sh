#!/usr/bin/env bash

nuget restore src/Redux.NET.sln -verbosity detailed
msbuild src/Redux.NET.sln /p:Configuration=Release
nunit-console src/Redux.Tests/bin/Release/Redux.Tests.dll
nuget pack nuspec/Redux.NET.nuspec
nuget add Redux.Net.3.0.2.nupkg -source ~/localpackages

# publish to github
dotnet nuget push "Redux.Net.3.0.2.nupkg" --source "github"
# nuget restore examples/todomvc/Redux.TodoMvc.sln -verbosity detailed
# msbuild examples/todomvc/Redux.TodoMvc.sln /p:Configuration=Release
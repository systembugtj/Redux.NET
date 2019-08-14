#!/usr/bin/env bash

nuget restore src/Redux.sln -verbosity detailed
msbuild src/Redux.sln /p:Configuration=Release
nunit-console src/Redux.Tests/bin/Release/Redux.Tests.dll
nuget pack nuspec/Redux.NET.nuspec
nuget add Redux.Net.3.0.1.nupkg -source ~/localpackages


# nuget restore examples/todomvc/Redux.TodoMvc.sln -verbosity detailed
# msbuild examples/todomvc/Redux.TodoMvc.sln /p:Configuration=Release
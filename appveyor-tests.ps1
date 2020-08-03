Write-Output '============================================================'
Write-Output "Job Number: $($Env:APPVEYOR_JOB_NUMBER)"
Write-Output '============================================================'
Write-Output "Appveyor: $($Env:APPVEYOR)"
Write-Output '============================================================'
Write-Output "Build Number: $($Env:APPVEYOR_BUILD_NUMBER)"
Write-Output '============================================================'
Write-Output "Build Version: $($Env:APPVEYOR_BUILD_VERSION)"
Write-Output '============================================================'
Write-Output "Repo Tag: $($Env:APPVEYOR_REPO_TAG)"
Write-Output "True if build has started by pushed tag; otherwise false"
Write-Output '============================================================'
Write-Output "Job Number: $($Env:APPVEYOR_JOB_NUMBER)"
Write-Output '============================================================'
Write-Output "Scheduled Build: $($Env:APPVEYOR_SCHEDULED_BUILD)"
Write-Output "True if the build runs by scheduler"
Write-Output '============================================================'
Write-Output "Force Build: $($Env:APPVEYOR_FORCED_BUILD)"
Write-Output "(True or undefined) - builds started by 'New build' button or from the same API"
Write-Output '============================================================'
Write-Output "Job Number: $($Env:APPVEYOR_RE_BUILD)"
Write-Output "(True or undefined) - build started by 'Re-build commit/PR' button of from the same API"
Write-Output '============================================================'
Write-Output "Job Number: $($Env:APPVEYOR_RE_RUN_INCOMPLETE)"
Write-Output "(True or undefined) - build job started by 'Re-run incomplete' button of from the same API"
Write-Output '============================================================'
Write-Output "Docker Version: $(docker --version)"
Write-Output '============================================================'
Write-Output "Run docker build 2016"
#docker build --rm --build-arg version=ltsc2016 --tag adk .
Write-Output '============================================================'
Write-Output "Run docker build 2019"
docker build --rm --build-arg version=ltsc2019 --tag adk .
Write-Output '============================================================'
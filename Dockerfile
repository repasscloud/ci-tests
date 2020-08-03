# escape=`

ARG version=ltsc2016

FROM mcr.microsoft.com/windows/servercore:${version}

# Set PowerShell as default interpreter
SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop'; $ProgressPreference = 'SilentlyContinue';"]

# Change Execution policy
RUN Set-ExecutionPolicy -ExecutionPolicy Unrestricted -Confirm:$false -Force

# Create working directory
RUN mkdir C:\rpc
WORKDIR C:\rpc

CMD [ "$PSVersionTable" ]
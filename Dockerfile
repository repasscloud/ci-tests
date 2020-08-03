# escape=`

ARG version=ltsc2019

FROM mcr.microsoft.com/windows/servercore:${version}

# Set PowerShell as default interpreter
SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop'; $ProgressPreference = 'SilentlyContinue';"]

# Change Execution policy
RUN Set-ExecutionPolicy -ExecutionPolicy Unrestricted -Confirm:$false -Force

# Create working directory
#RUN mkdir C:\rpc
#WORKDIR C:\rpc

# Install required module to get return URL
RUN Install-PackageProvider -Name NuGet -MinimumVersion 2.8.5.208 -Force
RUN Install-Module -Name PowerShellGet -Force
RUN Get-PSRepository
RUN Get-PackageProvider
RUN Install-Module -Name GetRedirectedUrl
RUN Get-RedirectedURL -Url 'https://go.microsoft.com/fwlink/?linkid=2120254'

CMD [ "$PSVersionTable" ]
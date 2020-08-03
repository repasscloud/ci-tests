# escape=`

ARG version=ltsc2019

FROM mcr.microsoft.com/windows/servercore:${version}

# Set PowerShell as default interpreter
SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop'; $ProgressPreference = 'SilentlyContinue';"]

# Change Execution policy
RUN Set-ExecutionPolicy -ExecutionPolicy Unrestricted -Confirm:$false -Force

# Create working directory
RUN mkdir C:\rpc
WORKDIR C:\rpc

# Install required module to get return URL
#RUN Install-PackageProvider -Name NuGet -MinimumVersion 2.8.5.208 -Force
#RUN Install-Module -Name PowerShellGet -Force
#RUN Set-PSRepository -Name "PSGallery" -InstallationPolicy Trusted

# Add required Files
ADD https://download.microsoft.com/download/8/6/c/86c218f3-4349-4aa5-beba-d05e48bbc286/adk/adksetup.exe C:\rpc\adksetup.exe

# Install ADK
RUN Start-Process -FilePath C:\rpc\adksetup.exe -ArgumentList '/features OptionId.DeploymentTools /quiet /norestart'

CMD [ "$PSVersionTable" ]
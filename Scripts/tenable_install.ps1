<powershell>
	C:\ProgramData\Amazon\EC2-Windows\Launch\Scripts\InitializeInstance.ps1 –Schedule
	Invoke-WebRequest -Uri "https://ets-wb-tools.s3-us-west-2.amazonaws.com/NessusAgent-8.2.0-x64.msi" -OutFile "C:\Users\Administrator\Desktop\NessusAgent-8.2.0-x64.msi"
	Start-Process -Filepath “C:\Users\Administrator\Desktop\NessusAgent-8.2.0-x64.msi" -ArgumentList 'NESSUS_GROUPS="WBG_Shared Services" NESSUS_SERVER="cloud.tenable.com:443" /qn’
</powershell>
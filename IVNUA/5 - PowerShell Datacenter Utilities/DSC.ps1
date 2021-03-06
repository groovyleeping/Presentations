﻿#https://msdn.microsoft.com/en-us/powershell/dsc/metaconfig

Get-DscResource

start https://www.powershellgallery.com/items

[DSCLocalConfigurationManager()]
configuration LCMConfig
{
    Node localhost
    {
        Settings
        {
            RefreshMode = 'Push'
        }
    }
}

LCMConfig -OutputPath 'C:\users\public\dsc'

Set-DscLocalConfigurationManager -Path "c:\users\public\dsc"

Configuration DemoBoxConfiguration {
    Node "localhost" {
        File "DemoFolder" {
            DestinationPath = 'C:\Demo'
            Ensure = 'Present'
            Type = 'Directory'
        }

        File "DemoTxtFile" {
            DestinationPath = 'C:\Demo\Demo.txt'
            Ensure = 'Present'
            Type = 'File'
            Contents = 'This is the content to the file'
            DependsOn = '[File]DemoFolder'
        }
    }
}

#Generate the MOF file
DemoBoxConfiguration

notepad .\DemoBoxConfiguration\localhost.mof

Test-DscConfiguration .\DemoBoxConfiguration

Start-DscConfiguration .\DemoBoxConfiguration -Force

Get-WinEvent -LogName "Microsoft-Windows-Dsc/Operational"

start C:\demo

start 'C:\program files\windowspowershell\modules\xWebAdministration\1.10.0.0\DSCResources\MSFT_xIisFeatureDelegation'

start 'C:\Users\adriscoll\Documents\GitHub\Presentations\IVNUA\5 - PowerShell Datacenter Utilities\Light' 
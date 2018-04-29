Configuration deployWebsite {
    import-dscresource -modulename 'PSDesiredStateConfiguration'

    # Install WebServer
    windowsfeature WebServer {
        Ensure = 'Present'
        Name = 'Web-Server'
    }

    # Download file
    Script downloadWebsite {
        GetScript = 
            {
                @{
                    GetScript = $GetScript
                    SetScript = $SetScript
                    TestScript = $TestScript
                    Result = ('True' -in (Test-Path c:\inetpub\website.zip))
                }
            }

            SetScript = 
            {
                Invoke-WebRequest -Uri "https://github.com/BenMitchell1979/lameWebsite/raw/master/data/website.zip" -OutFile "c:\inetpub\website.zip"
            }

            TestScript = 
            {
                $Status = ('True' -in (Test-Path c:\inetpub\website.zip))
                $Status -eq $True
            }
    }

    # Unzip File
    Archive unzipWebsite {
        Ensure = 'Present'
        Path = 'C:\inetpub\website.zip'
        Destination = 'c:\inetpub\'
        Force = $True
    }
}
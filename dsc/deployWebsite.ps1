Configuration deployWebsite {
    import-dscresource -modulename 'PSDesiredStateConfiguration'

    # Install WebServer
    windowsfeature WebServer {
        Ensure = 'Present'
        Name = 'Web-Server'
    }

    # Download file
    File downloadWebsite {
        Ensure = 'Present'
        DestinationPath = 'c:\inetpub\website.zip'
        SourcePath = 'https://github.com/BenMitchell1979/lameWebsite/raw/master/data/website.zip'
        Type = 'File'
    }

    Script extractWebsite {
        SetScript = {
            Expand-Archive -Force -Path "c:\inetpub\website.zip" -DestinationPath "C:\inetpub\wwwroot\";
        }

        TestScript = {
            (test-path -Path "c:\inetpub\wwwroot");
        }

        GetScript = {
            # Nothing to see here
        }
    }
}
configure deployWebsite {
    import-dscresource -modulename 'PSDesiredStateConfiguration'

    windowsfeature WebServer {
        Ensure = 'Present'
        Name = 'Web-Server'
    }
}
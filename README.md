# FisioApp Project For iOS

## Installation

- Open the project workspace: FisioAppIOS/fisioapp.xcworkspace

## Deploy

### Verify the name / IP of your backend's servers.

`localhost` name doesn't work. For this reason, you must change the name / IP of your servers in the file:
yourAppFolder/Utils/Paths.swift

You can see an example here:
```
// FIXME: Cambiar ip
// Server
let DEBUG_HTTP_SERVER = "http://your.amazing.ip.here:3000"
let RELEASE_HTTP_SERVER = "http://fisioapp.styleapps.es"
```

If you change the routes to the endpoints, you must also change it in this file.



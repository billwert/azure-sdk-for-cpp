// Copyright (c) Microsoft Corporation. All rights reserved.
// SPDX-License-Identifier: MIT
param(
  [string] $LogFileLocation = "$($env:BUILD_SOURCESDIRECTORY)/WebSocketServer.log" 
)

if ($IsWindows) { 
  Start-Process 'python.exe' `
    -ArgumentList 'websocket_server.py' `
    -NoNewWindow -PassThru -RedirectStandardOutput $LogFileLocation
} else { 
  nohup python websocket_server.py > $LogFileLocation
}
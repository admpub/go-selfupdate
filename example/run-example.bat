
go build -o example-server.exe src/example-server/main.go
mkdir deployment
rem go build -ldflags="-X main.version=dev" -o hello-updater.exe src/hello-updater/main.go
rem copy /y .\hello-updater.exe .\deployment\hello-updater.exe
rem timeout /t 5

go build -ldflags="-X main.version=1.0" -o hello-updater.exe src/hello-updater/main.go
go-selfupdate -o .\public\hello-updater\ hello-updater.exe 1.0

copy /y .\hello-updater.exe .\deployment\hello-updater.exe

timeout /t 5

go build -ldflags="-X main.version=1.1" -o hello-updater.exe src/hello-updater/main.go
go-selfupdate -o .\public\hello-updater\ hello-updater.exe 1.1

rem copy /y .\hello-updater.exe .\deployment\hello-updater.exe

timeout /t 5

pause

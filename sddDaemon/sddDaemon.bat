
cd <folder>\sddDaemon

rem set CLASSPATH=.;

rem :again
java -DconfigDir=<setup folder> -jar sddDaemon.jar DEVELOPMENT 2 >> logs\daemon.log 2>> logs\daemon.err
rem goto again
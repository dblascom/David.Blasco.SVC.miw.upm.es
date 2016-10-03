@echo off
:: Con :: se establecen comentarios
::set se definen variables
set workspace=D:\MIW\workspace\David.Blasco.SVC.miw.upm.es
::Las variables de entorno se pueden configurar directamente en Windows cuando se tienen los permisos necesarios
set JAVA_HOME=C:\Program Files\Java\jre1.8.0_65
set M2_HOME=D:\MIW\Soft\apache-maven-3.3.9\
:: %var% se accede a una variable
set PATH=%PATH%;%JAVA_HOME%\bin;%M2_HOME%\bin
::echo saca por pantalla un mensaje
echo -----------------------------------------
echo . (C) MIW
echo -----------------------------------------
echo .
echo Workspace --- %workspace%
echo JAVA_HOME --- %JAVA_HOME%
echo M2_HOME   --- %M2_HOME%
echo .
cd %workspace%
echo ============ mvn clean test (profile: develop) =======================================================
echo .
mvn clean test
exit

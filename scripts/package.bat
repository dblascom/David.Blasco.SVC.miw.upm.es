@echo off
set workspace=D:\MIW\workspace\David.Blasco.SVC.miw.upm.es
set JAVA_HOME=C:\Program Files\Java\jre1.8.0_65
set M2_HOME=D:\MIW\Soft\apache-maven-3.3.9\
set PATH=%PATH%;%JAVA_HOME%\bin;%M2_HOME%\bin
echo -----------------------------------------
echo . Deploy Pre Production (C) MIW
echo -----------------------------------------
echo .
echo Workspace --- %workspace%
echo .
echo .

cd %workspace%
:: Test en Develop
:: -ff, --fail-fast. Stop at first failure in reactorized builds
echo ============ mvn -ff clean test (profile: develop) =======================================================
echo .
call mvn -ff clean test
if errorLevel 1 goto errorDevelop

:: Install en Pre-Production
echo ============ mvn -Dmaven.test.skip=true package -Denvironment.type=preproduction =======================================================
echo .
call mvn -Dmaven.test.skip=true package -Denvironment.type=preproduction
if errorLevel 1 goto errorPreproduction

pause
exit

:errorDevelop
echo .
echo .
echo .
echo ########  ERRORES de test en Develop
pause
exit

:errorPreproduction
echo .
echo .
echo .
echo ########  ERRORES de Test de Integration en Pre-Produccion 
pause
exit

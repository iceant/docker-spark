set TAG=3.1.2-hadoop3.2

:build
    NAME=%1
    SPATH=%2
    IMAGE=bde2020/spark-%NAME%:%TAG%
    if exist %SPATH% ( cd %SPATH% )
    else ( cd %NAME% )
    echo '--------------------------' building %IMAGE% in %cd%
    docker build -t %IMAGE% .
    cd %~dp0
EXIT /B 0

call:build base
call:build master
call:build worker
call:build submit
call:build java-template template/java
call:build scala-template template/scala
call:build python-template template/python

REM docker build -t bde2020/spark-base:3.1.2-hadoop3.2 base
REM docker build -t bde2020/spark-master:3.1.2-hadoop3.2 master
REM docker build -t bde2020/spark-worker:3.1.2-hadoop3.2 worker
REM docker build -t bde2020/spark-submit:3.1.2-hadoop3.2 submit
REM docker build -t bde2020/spark-java-template:3.1.2-hadoop3.2 template/java
REM docker build -t bde2020/spark-scala-template:3.1.2-hadoop3.2 template/scala
REM docker build -t bde2020/spark-python-template:3.1.2-hadoop3.2 template/python
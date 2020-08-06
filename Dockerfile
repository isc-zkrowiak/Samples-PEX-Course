FROM store/intersystems/iris-community:2020.3.0.200.0
USER root
# https://docs.intersystems.com/irislatest/csp/docbook/DocBook.UI.Page.cls?KEY=ADOCK_iris_iscmain
RUN mkdir /opt/app && chown irisowner:irisowner /opt/app

RUN apt-get update && \
    apt-get install -y openjdk-8-jdk && \
    wget https://packages.microsoft.com/config/ubuntu/18.04/packages-microsoft-prod.deb -O packages-microsoft-prod.deb && \
    dpkg -i packages-microsoft-prod.deb && \
    apt-get install -y apt-transport-https && \
    apt-get update && \
    apt-get install -y dotnet-sdk-2.1 && \
    apt-get install -y dotnet-runtime-2.1 && \ 
    apt-get clean 


ENV JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64/jre
ENV CLASSPATH=/datavol/Java/lib/*:/datavol/Java/bin:/usr/irissys/dev/java/lib/jackson/jackson-core-2.10.2.jar:/usr/irissys/dev/java/lib/JDK18/*

WORKDIR /opt/app
COPY irissession.sh /
RUN chmod +x /irissession.sh 

USER irisowner


COPY ./src/ ./src
SHELL ["/irissession.sh"]



RUN \
    Do $system.OBJ.Load("/opt/app/src/Installer.cls","ck") \
    Set sc = ##class(App.Installer).setup(, 3) \
    zn "INTEROP" \
    Do $system.OBJ.LoadDir("/opt/app/src/","ck",,1) \
    Do ##class(Setup.GatewayMaker).BuildGateways() 

# bringing the standard shell back
SHELL ["/bin/bash", "-c"]

WORKDIR /datavol
CMD [ "-l", "/usr/irissys/mgr/messages.log" ]

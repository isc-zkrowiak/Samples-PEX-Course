FROM store/intersystems/iris-community:2020.3.0.221.0
USER root
# https://docs.intersystems.com/irislatest/csp/docbook/DocBook.UI.Page.cls?KEY=ADOCK_iris_iscmain
RUN mkdir /opt/app && chown irisowner:irisowner /opt/app

RUN apt-get update && \
    apt-get install -y openjdk-8-jdk && \
    wget https://packages.microsoft.com/config/ubuntu/18.04/packages-microsoft-prod.deb -O packages-microsoft-prod.deb && \
    dpkg -i packages-microsoft-prod.deb && \
    apt-get install -y apt-transport-https && \
    apt-get install -y dos2unix && \
    apt-get update && \
    apt-get install -y dotnet-sdk-2.1 && \
    apt-get install -y dotnet-runtime-2.1 && \ 
    apt-get clean 


ENV JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64/jre
ENV CLASSPATH=/irisdev/app/Java/lib/*:/usr/irissys/dev/java/lib/JDK18/intersystems-utils-3.2.0.jar:/irisdev/app/Java/bin

WORKDIR /opt/app
COPY iris.script /tmp/iris.script
RUN dos2unix /tmp/iris.script
RUN chmod +x /tmp/iris.script 

USER irisowner


COPY ./src/ ./src


RUN iris start IRIS \
	&& iris session IRIS < /tmp/iris.script \
    && iris stop IRIS quietly

WORKDIR /irisdev/app
CMD [ "-l", "/usr/irissys/mgr/messages.log" ]

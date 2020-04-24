FROM docker.iscinternal.com/intersystems/iris:2020.2.0SQL1.510.0
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
    apt-get install -y curl && \
    apt-get clean && \
    curl -o /usr/local/bin/nuget.exe https://dist.nuget.org/win-x86-commandline/latest/nuget.exe;

ENV JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64/jre

USER irisowner

WORKDIR /opt/app

COPY ./Installer.cls ./
COPY ./src ./src/
COPY ./iris.key /usr/irissys/mgr/




RUN iris start $ISC_PACKAGE_INSTANCENAME quietly EmergencyId=sys,sys && \
    /bin/echo -e "sys\nsys\n" \
            " Do ##class(Security.Users).UnExpireUserPasswords(\"*\")\n" \
            " Do ##class(Security.Users).AddRoles(\"admin\", \"%ALL\")\n" \
            " Do ##class(Security.System).Get(,.p)\n" \
            " // 2**4 = 16; this sets bit 4 to enable OS authentication for the admin user" \
            " Set p(\"AutheEnabled\")=\$zboolean(p(\"AutheEnabled\"),16,7)\n" \
            " Do ##class(Security.System).Modify(,.p)\n" \
            " Do \$system.OBJ.Load(\"/opt/app/Installer.cls\",\"ck\")\n" \
            " Set sc = ##class(App.Installer).setup(, 3)\n" \
            " zn \"INTEROP\""\
            " Do \$system.OBJ.LoadDir(\"/opt/app/src/\",\"ck\",,1)\n" \
            " Do ##class(Demo.PEX.javaGateway).startGateway()"\
            " If 'sc do \$zu(4, \$JOB, 1)\n" \
            " halt" \
    | iris session $ISC_PACKAGE_INSTANCENAME && \
    /bin/echo -e "sys\nsys\n" \
    | iris stop $ISC_PACKAGE_INSTANCENAME quietly

WORKDIR /datavol
CMD [ "-l", "/usr/irissys/mgr/messages.log" ]

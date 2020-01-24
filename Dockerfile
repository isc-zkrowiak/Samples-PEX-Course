FROM docker.iscinternal.com/intersystems/iris:2020.1.0-latest

USER root

RUN mkdir /opt/app && chown irisowner:irisowner /opt/app

RUN apt-get update && \
    apt-get install -y openjdk-8-jdk && \
    apt-get install -y ant && \
    apt-get install -y maven && \
    apt-get clean;

ENV JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64/jre

USER irisowner

WORKDIR /opt/app

COPY ./Installer.cls ./
COPY ./src ./src/
COPY ./iris.key /usr/irissys/mgr/
COPY ./Export-Demo_ZacksProd-20200124171807.xml  ./src


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
            " Do \$system.OBJ.Load(\"/opt/app/src/Export-Demo_ZacksProd-20200124171807.xml\",\"ck\")\n" \
            " If 'sc do \$zu(4, \$JOB, 1)\n" \
            " halt" \
    | iris session $ISC_PACKAGE_INSTANCENAME && \
    /bin/echo -e "sys\nsys\n" \
    | iris stop $ISC_PACKAGE_INSTANCENAME quietly

WORKDIR /datavol
CMD [ "-l", "/usr/irissys/mgr/messages.log" ]
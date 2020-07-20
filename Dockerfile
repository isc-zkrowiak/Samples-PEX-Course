FROM linuxserver/code-server
FROM store/intersystems/iris-community:2020.2.0.211.0
USER root
RUN echo 'umask 000' >> /root/.bashrc

# Install .NET & Java
RUN apt-get update && \
    apt-get install -y openjdk-8-jdk && \
    wget https://packages.microsoft.com/config/ubuntu/18.04/packages-microsoft-prod.deb -O packages-microsoft-prod.deb && \
    dpkg -i packages-microsoft-prod.deb && \
    apt-get install -y apt-transport-https && \
    apt-get update && \
    apt-get install -y dotnet-sdk-2.1 && \
    apt-get install -y dotnet-runtime-2.1 && \ 
    apt-get clean 

# Shared Volume directory ARG
ARG SHARED_DIRECTORY=/home/project/shared/Samples-PEX-Course
RUN mkdir -p ${SHARED_DIRECTORY} && chown irisowner ${SHARED_DIRECTORY}
# Running Printev to debug
RUN printenv

# Java home
ENV JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64/jre

# Make production input and output directories.
RUN \
mkdir -p ${SHARED_DIRECTORY}/data/in/ && chown irisowner ${SHARED_DIRECTORY}/data/in/ &&\
mkdir -p  ${SHARED_DIRECTORY}/data/FromBankOut/ &&  chown irisowner ${SHARED_DIRECTORY}/data/FromBankOut/  &&\
mkdir -p ${SHARED_DIRECTORY}/data/ToBankOut/ && chown irisowner ${SHARED_DIRECTORY}/data/ToBankOut/

# Copy sample production message
COPY ./data/sampleRequest.txt ${SHARED_DIRECTORY}/data/

# Copy objectscript code.
RUN mkdir ${SHARED_DIRECTORY}/src/
COPY ./src/ ${SHARED_DIRECTORY}/src/

RUN ls ${SHARED_DIRECTORY}/src/

# Copy compiler script
COPY ./MakeProject.sh ${SHARED_DIRECTORY}

# Create java directories
RUN mkdir -p ${SHARED_DIRECTORY}/Java/lib/ && chown irisowner  ${SHARED_DIRECTORY}/Java/lib/

# Copy contents of Java & .NET directories.
COPY ./Java/ ${SHARED_DIRECTORY}/Java/
COPY DotNet/ ${SHARED_DIRECTORY}/DotNet/

# Copy jar files to shared volume
WORKDIR ${SHARED_DIRECTORY}/Java/lib/
RUN cp -r /usr/irissys/dev/java/lib/jackson/* ./
RUN cp -r /usr/irissys/dev/java/lib/JDK18/* ./
RUN cp -r /usr/irissys/dev/java/lib/gson/* ./
RUN ls -l ${SHARED_DIRECTORY}/Java/lib/

# Declare classpath
ENV CLASSPATH=${SHARED_DIRECTORY}/Java/lib/*:${SHARED_DIRECTORY}/Java/bin

# Copy .NET nuget packages to shared volume.
RUN mkdir -p ${SHARED_DIRECTORY}/DotNet/lib/ && chown irisowner ${SHARED_DIRECTORY}/DotNet/lib/
RUN cp -r /usr/irissys/dev/dotnet/bin/Core21/* ${SHARED_DIRECTORY}/DotNet/lib/

# Copy InterSystems IRIS shell script to shared directory.
COPY ./irissession.sh ${SHARED_DIRECTORY}/

# Change permissions on all files in shared directory
RUN chmod -R 777 ${SHARED_DIRECTORY} 

RUN /bin/bash ${SHARED_DIRECTORY}/MakeProject.sh

USER irisowner
WORKDIR /usr/irissys/mgr/
COPY ./UsersExport.xml ./
SHELL ["/home/project/shared/Samples-PEX-Course/irissession.sh"]

RUN \
    set shared = "/home/project/shared/Samples-PEX-Course/" \
    Do $system.OBJ.Load(shared _ "src/Installer.cls","ck",,) \
    Set sc = ##class(App.Installer).setup(, 3) \
    zn "INTEROP" \
    Do ##class(Setup.GatewayMaker).BuildGateways() 
# bringing the standard shell back
SHELL ["/bin/bash", "-c"]

WORKDIR ${SHARED_DIRECTORY}

CMD [ "-l", "/usr/irissys/mgr/messages.log" ]

mvn install:install-file -Dfile="Java/src/main/java/com/intersystems/lib/intersystems-gateway-3.0.0.jar" \
    -DgroupId=com.intersystems -DartifactId=intersystems-gateway -Dversion=3.1.0 -Dpackaging=jar && \
    mvn install:install-file -Dfile="Java/src/main/java/com/intersystems/lib/intersystems-jdbc-3.0.0.jar" \
     -DgroupId=com.intersystems -DartifactId=intersystems-jdbc -Dversion=3.1.0 -Dpackaging=jar && \
     cd Java/ && \
     mvn clean install
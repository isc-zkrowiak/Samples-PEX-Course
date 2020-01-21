# Demos for Polyglot Ensemble Extension (PEX)
This contains several samples for PEX. Each sample is a production that demonstrates how to write a component in Java/.NET.
## How to set up the runtime environment
* Build the Java project under Java directory. It is a Maven project.
* Build the .NET project under DotNet directory. It is a Visual Studio project.
* Run copy-files.bat in the bin directory. This batch file copies the output files from the Java and .NET builds, and all the needed binary files from an IRIS installation. If your IRIS is not installed at C:\InterSystems\IRIS, you can define variable irisroot to point to the correct location before running this batch file. After the copy, it should copy 9 binaries files into the bin directory - 6 jar files, 2 exe files and 1 dll file.
* Copy the entire bin directory to C:\PEXDemo directory. The production settings use c:\PEXDemo as the location for all the needed binaries. Alternatively, you can change all the production settings to use the location of the bin directory.
* Load and compile all the classes in cls directory.
## How to run the demos
* These demos require IRIS 2020.1. Even though PEX itself works in IRIS 2019.4, these demos requires a bug fix in Gateway which is only in IRIS 2020.1. Without this bug fix, the demos don't display the output correctly.
* Using System Management Portal, under Object Gateways, define a Java Gateway definition running on port 44444. Add the 3 jackson jar files into the Class Path.
* Using System Management Portal, under Object Gateways, define a .NET Gateway definition running on port 55555, with 4.5 .NET Version
* Start both Java Gateway Server and .NET Gateway Server
* Under Interoperability -> Configure -> Production, you can open any one of the 14 production definitions under package Demo.PEX.Production.
* You can start running the productions. Most of the productions will open a terminal window for displaying outputs.
* For NonPollingBusinessService, it does nothing until you call it from a terminal window. Run the scripts run-java.bat or run-dotnet.bat to send messages to the running production.

## Understanding the demos
There are 14 Production definitions, each demostrates one aspect of PEX. There are 6 Productions for Java, 6 Productions for .NET, one Production having both Java and .NET components and one Production that is language neutral. Open Java and .NET projects in IDE to read the source code.
* Demo.PEX.Production.Java.RemoteInboundAdapter
* Demo.PEX.Production.DotNet.RemoteInboundAdapter
  > These 2 Productions demostrate how to write Inbound Adapter in Java/.NET 
* Demo.PEX.Production.Java.RemoteOutboundAdapter
* Demo.PEX.Production.DotNet.RemoteOutboundAdapter
  > These 2 Productions demostrate how to write Outbound Adapter in Java/.NET
* Demo.PEX.Production.Java.RemoteBusinessService
* Demo.PEX.Production.DotNet.RemoteBusinessService
  > These 2 Productions demostrate how to write Business Service in Java/.NET
* Demo.PEX.Production.Java.RemoteBusinessProcess
* Demo.PEX.Production.DotNet.RemoteBusinessProcess
  > These 2 Productions demostrate how to write Business Process in Java/.NET
* Demo.PEX.Production.Java.RemoteBusinessOperation
* Demo.PEX.Production.DotNet.RemoteBusinessOperation
  > These 2 Productions demostrate how to write Business Operation in Java/.NET
* Demo.PEX.Production.Java.RemoteServiceAdapter
* Demo.PEX.Production.DotNet.RemoteServiceAdapter
  > These 2 Productions demostrate how to write both Inbound Adapter and Business Service in Java/.NET
* Demo.PEX.Production.Mixed.RemoteServiceOperation
  > This Production demostrates how to have both Java components and .NET components in the same Production
* Demo.PEX.Production.NonPollingBusinessService
  > This production demostrates how to call from Java/.NET into a running Production that otherwise doesn't have any PEX components


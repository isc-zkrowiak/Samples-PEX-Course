# Samples-PEX-Course

This sample code demonstrates the use of PEX in both .NET and Java. 

To run the code

1. Type the following into the terminal:
    * `git clone https://github.com/intersystems/Samples-PEX-Course`
    * `cd Samples-PEX-Course`
    * `docker-compose up -d`

2. Management portal url: [localhost:52773/csp/sys/UtilHome.csp](localhost:52773/csp/sys/UtilHome.csp)

3. Dotnet and Java PEX productions can be found in the INTEROP namespace.

4. Test the production by copying `Samples-PEX-Course/data/sampleRequest.txt` into `Samples-PEX-Course/data/in`

### Compiling:

* Compile dotnet code: In `Samples-PEX-Course/DotNet` type `dotnet build`
* Compile Java code: type `javac -d /datavol/Java/bin /datavol/Java/src/Finance/*.java`

# Note: 
   An alternate version of this production that does not implement inbound or outbound adapters can be found on the NoAdapters branch.
   
   To clone: `git clone -b NoAdapters https://github.com/intersystems/Samples-PEX-Course`

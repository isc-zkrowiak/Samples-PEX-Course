# Samples-PEX-Course
This sample code demonstrates the use of PEX, or the Production EXtension. With PEX, custom components for InterSystems IRIS interoperability productions can be developed in both .NET and Java. 

## Set Up
1. Install and Start [Docker Desktop](https://www.docker.com/products/docker-desktop)
2. In the terminal type the following commands: 
  * `git clone https://github.com/intersystems/Samples-PEX-Course`
  * `cd Samples-PEX-Course`
  * `docker-compose up -d`
 
## Run the Sample
2. Management portal url: [localhost:52773/csp/sys/UtilHome.csp](localhost:52773/csp/sys/UtilHome.csp)

3. Dotnet and Java PEX productions can be found in the INTEROP namespace in the `Finance` package.

4. Test the production by copying `Samples-PEX-Course/data/sampleRequest.txt` into `Samples-PEX-Course/data/in`

## Output
If all works correctly, you will see two new files: one written to the `FromBankOut/` directory and one to the `ToBankOut/` directory. Each of these files represents a communication with a fictional bank. This production is a simplified version of a payment processing application.


## Keep Exploring
To continue learning about PEX, see [PEX: Developing Productions with Java and .NET](https://docs.intersystems.com/irislatest/csp/docbook/DocBook.UI.Page.cls?KEY=EPEX).





Use or operation of this code is subject to acceptance of the license available in the code repository for this code.






To run the code

1. Type the following into the terminal:
    * 
    * 
    * 


### Compiling:

* Start a terminal session inside of the docker container: `docker-compose exec -u root iris bash`
* Compile dotnet code: In `Samples-PEX-Course/DotNet` type `dotnet build`
* Compile Java code: type `javac -d /datavol/Java/bin /datavol/Java/src/Finance/*.java`

# Note: 
   An alternate version of this production that does not implement inbound or outbound adapters can be found on the NoAdapters branch.
   
   To clone: `git clone -b NoAdapters https://github.com/intersystems/Samples-PEX-Course`

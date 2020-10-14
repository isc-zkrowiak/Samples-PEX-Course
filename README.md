# Samples-PEX-Course
This sample code demonstrates the use of the Production EXtension, or PEX. Using PEX, custom components for InterSystems IRIS interoperability productions can be developed in both .NET and Java. 

## Set Up
1. Install and Start [Docker Desktop](https://www.docker.com/products/docker-desktop).
2. Type the following commands in the Terminal: 
  * `git clone https://github.com/intersystems/Samples-PEX-Course`
  * `cd Samples-PEX-Course`
  * `docker-compose up -d`
 
## Run the Sample
2. Management Portal URL: [localhost:52773/csp/sys/UtilHome.csp](localhost:52773/csp/sys/UtilHome.csp)

3. Java and .NET PEX productions can be found in the `INTEROP` namespace in the `Finance` package.

4. Test the production by copying `Samples-PEX-Course/data/sampleRequest.txt` into `Samples-PEX-Course/data/in`.

5. Here are a few other useful commands:
  * Start a Terminal session inside of the Docker container: `docker-compose exec -u root iris bash`
  * Compile .NET code: Type `dotnet build` in `Samples-PEX-Course/DotNet`. 
  * Compile Java code: Type `javac -d /datavol/Java/bin /datavol/Java/src/Finance/*.java`

  
## Output
If all works correctly, you will see two new files: one written to the `FromBankOut/` directory and one to the `ToBankOut/` directory. Each of these files represents a communication with a fictional bank. This production is a simplified version of a payment processing application.

## Note: 
   An alternate version of this production that does not implement inbound or outbound adapters can be found on the NoAdapters branch.
   
   To clone: `git clone -b NoAdapters https://github.com/intersystems/Samples-PEX-Course`

## Keep Exploring
To continue learning about PEX, visit the [PEX: Developing Productions with Java and .NET](https://docs.intersystems.com/irislatest/csp/docbook/DocBook.UI.Page.cls?KEY=EPEX) page on the InterSystems documentation website.


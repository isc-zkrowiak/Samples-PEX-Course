# Samples-PEX-Course
This sample code demonstrates the use of the Production EXtension, or PEX. Using PEX, custom components for InterSystems IRIS interoperability productions can be developed in both .NET and Java. The InterSystems IRIS Interoperability Productions included in this code emulate a peer-to-peer mobile payment application integration solution developed in both .NET and Java. 

The productions regularly check a file path (`data/in`) for an incoming transaction request built in a unique format that can be viewed in `data/sampleRequest.txt`. If a request is written to this `in/` directory, the business service `Finance.FromFileTransaction` processes that request by parsing the text fields and constructing a `Finance.TransactionRequest` message to store the transaction data.  It then sends that message to the business process, `Finance.ProcessPaymentRequest`, the production component that orchestrates the decision logic for this transaction. 

The `ProcessPaymentRequest` class uses a business operation to communicate with the paying bank. It sends a synchronous request to the business operation `Finance.ToPayFromBank`, which simulates communication with an external banking system by writing a message to the `data/FromBankOut` directory. `ToPayFromBank` then responds to the `ProcessPaymentRequest` business process with an approval message defined in `Finance.TransactionResponse`. 

If `ProcessPaymentRequest` receives a `TransactionResponse` message from the paying bank with its `approved` property set to `true`, it then sends an asynchronous request to `Finance.ToPayToBank` to communicate with the bank that will receive the payment. `ToPayToBank` emulates this communication by writing a file to the `data/ToBankOut` directory. This completes the transaction.

To learn how to develop productions in InterSystems IRIS® data platform using PEX, take [Creating Interoperability Productions Using PEX](https://learning.intersystems.com/course/view.php?name=PEXInteroperabilityProductions)

The PEX source code for these productions:
* [.NET Finance namespace](/DotNet/Finance/)
* [Java Finance package](/Java/src/Finance/)
## Set Up
1. Install and Start [Docker Desktop](https://www.docker.com/products/docker-desktop).
2. Type the following commands in the Terminal: 
  * `git clone https://github.com/intersystems/Samples-PEX-Course`
  * `cd Samples-PEX-Course`
  * `docker-compose up -d`
    * While building, the docker log will output some messages that look like warnings and errors. However, these are only alerting you that it is locating and installing missing dependencies. The build has succeeded if you see
     `Creating pex_iris_1 ...done`

  * Note: If your system has already allocated port 52773, the docker build will fail with the following message:

        `Cannot start service iris: Ports are not available: listen tcp 0.0.0.0:52773`
      To resolve this, open [docker-compose.yml](docker-compose.yml) and update the `ports` section to an available port
     
 
## Run the Sample
2. Management Portal URL: [localhost:52773/csp/sys/UtilHome.csp](localhost:52773/csp/sys/UtilHome.csp)
  * UserName/Password: `SuperUser/SYS`
  * Note: if you updated the port in the docker-compose file use that port in place of `52773` in the management portal URL above.
3. Java and .NET PEX productions can be found in the `INTEROP` namespace in the `Finance` package. To select and start one of these productions:
  *  Navigate to **Home** > **Interoperability** > **List**> **Productions**
  *  Select `Finance.Java.Production` or  `Finance.DotNet.Production` and click **Open**
  *  On the Production Configuration page, click **Start**

4. Test the production by copying `Samples-PEX-Course/data/sampleRequest.txt` into `Samples-PEX-Course/data/in`. 

5. Here are a few other useful commands:
  * Start a Terminal session inside of the Docker container: `docker-compose exec -u root iris bash`
  * Compile .NET code: Type `dotnet build` in `/irisdev/app/DotNet`. 
  * Compile Java code: Type `javac -d /irisdev/app/Java/bin /irisdev/app/Java/src/Finance/*.java`

  
## Output
If all works correctly, you will see two new files: one written to the `data/FromBankOut/` directory and one to the `data/ToBankOut/` directory. Each of these files represents a communication with a fictional bank. 

## Note: 
   An alternate version of this production that does not implement inbound or outbound adapters can be found on the NoAdapters branch.
   
   To clone: `git clone -b NoAdapters https://github.com/intersystems/Samples-PEX-Course`

## Keep Exploring
To continue learning about PEX, visit the [PEX: Developing Productions with Java and .NET](https://docs.intersystems.com/irislatest/csp/docbook/DocBook.UI.Page.cls?KEY=EPEX) page on the InterSystems documentation website.


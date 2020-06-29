
package Finance;
import java.io.File;  // Import the File class.
import java.io.FileNotFoundException;  // Import this class to handle errors.
import java.util.Scanner; // Import the Scanner class to read text files.
import Finance.TransactionRequest; // Import the Transaction message to send through production.




public class FromFileTransaction extends com.intersystems.enslib.pex.BusinessService {
    public String TargetComponentNames; // Comma separated list of target production components. Set at runtime.
    public String InboundFilePath; // Path to input directory.

    public void OnTearDown() {} // PEX abstract method. Must override.
    public void OnInit() {} // PEX abstract method. Must override.

    // OnProcessInput is called at an interval specified in the 'call interval' setting in the production.
    public java.lang.Object OnProcessInput(java.lang.Object messageInput) throws java.lang.Exception {

      // Check input directory for files and create enumerable containing file paths.
      File folder = new File(InboundFilePath);
      File[] list = folder.listFiles();

      // Enumerate over files in the directory.
      for (File file : list) {

          // create scanner object to read file lines.
          Scanner reader = new Scanner(file);

          // Instantiate TransactionRequest message object.
          TransactionRequest request = new TransactionRequest();

          // Set fields of message. An actual implementation would need to verify that
          // message structure is valid.
          request.TransactionAmount = Float.parseFloat(reader.nextLine().split(":")[1]);
          String tempString = reader.nextLine();

          // Break apart nested PaymentProfile objects and populate fields.
          String[] tempStringArray = tempString.split(":");
          String[] PaymentProfile = tempStringArray[1].split("\\|");
          request.PayFrom.AccountNumber  = Integer.parseInt(PaymentProfile[0]);
          request.PayFrom.RoutingNumber = Integer.parseInt(PaymentProfile[1]);
          request.PayFrom.UserName = PaymentProfile[2];

          // Repeat for PayTo property.
          tempString = reader.nextLine();
          tempStringArray = tempString.split(":");
          PaymentProfile = tempStringArray[1].split("\\|");
          request.PayTo.AccountNumber  = Integer.parseInt(PaymentProfile[0]);
          request.PayTo.RoutingNumber = Integer.parseInt(PaymentProfile[1]);

          // Set remaining fields.
          request.PayTo.UserName = PaymentProfile[2];
          request.FromCurrency = reader.nextLine().split(":")[1];
          request.ToCurrency = reader.nextLine().split(":")[1];

          reader.close();

          // Delete file after processing.
          file.delete();

          // Split target business component string and send to each component.
          String[] targetNames =  TargetComponentNames.split(",");
          for (String name : targetNames){
            SendRequestAsync(name, request);
          }
        }
      return null;
    }
}
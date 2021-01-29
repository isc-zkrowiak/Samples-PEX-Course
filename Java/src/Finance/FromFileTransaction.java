
package Finance;
import java.io.File;  // Import the File class.
import java.io.FileNotFoundException;  // Import this class to handle errors.
import java.util.Scanner; // Import the Scanner class to read text files.
import Finance.TransactionRequest; // Import the Transaction message to send through production.



// This class is for a PEX business service that reads a transaction request message from a file. It then parses the 
// file format of that message and converts it into a Finance.TransactionRequest message object, before sending it to
// another business component declared at runtime in the property TargetComponentNames
public class FromFileTransaction extends com.intersystems.enslib.pex.BusinessService {
    public String TargetComponentNames; // Comma separated list of target production components. Set at runtime.
    

    public void OnTearDown() {} // Abstract method in PEX superclass. Must override.
    public void OnInit() {} // Abstract method in PEX superclass. Must override.

    // OnProcessInput is called at an interval specified in the 'call interval' setting in the production.
    public java.lang.Object OnProcessInput(java.lang.Object messageInput) throws java.lang.Exception {

      String path = (String)messageInput;
      
      File file = new File(path);

      
      // Create scanner object to read file lines.
      Scanner reader = new Scanner(file);

      // Instantiate TransactionRequest message object using constructor, passing in each line as an argument.
      TransactionRequest request = new TransactionRequest(reader.nextLine(),reader.nextLine(),reader.nextLine(),reader.nextLine(),reader.nextLine());

      reader.close();

      // Delete file after processing.
      file.delete();

      // Split target business component string and send to each component.
      String[] targetNames =  TargetComponentNames.split(",");
      for (String name : targetNames){
        SendRequestAsync(name, request);
      }
    
      return null;
    }
}
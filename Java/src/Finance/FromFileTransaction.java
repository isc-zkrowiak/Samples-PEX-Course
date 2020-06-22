
package Finance;
import java.io.File;  // Import the File class
import java.io.FileNotFoundException;  // Import this class to handle errors
import java.util.Scanner; // Import the Scanner class to read text files
import Finance.TransactionRequest;




public class FromFileTransaction extends com.intersystems.enslib.pex.BusinessService {
    public String TargetComponentNames;
    public String InboundFilePath;

    public void OnTearDown() {}
    public void OnInit() {}


    public java.lang.Object OnProcessInput(java.lang.Object messageInput) throws java.lang.Exception {

        File folder = new File(InboundFilePath);
        File[] list = folder.listFiles();

        for (File file : list) {
            Scanner reader = new Scanner(file);
            TransactionRequest request = new TransactionRequest();
            request.TransactionAmount = Float.parseFloat(reader.nextLine().split(
              ":")[1]);
            String tempString = reader.nextLine();
            String[] tempStringArray = tempString.split(":");
            String[] PaymentProfile = tempStringArray[1].split("\\|");
            request.PayFrom.AccountNumber  = Integer.parseInt(PaymentProfile[0]);
            request.PayFrom.RoutingNumber = Integer.parseInt(PaymentProfile[1]);
            request.PayFrom.UserName = PaymentProfile[2];
            tempString = reader.nextLine();
            tempStringArray = tempString.split(":");
            PaymentProfile = tempStringArray[1].split("\\|");
            request.PayTo.AccountNumber  = Integer.parseInt(PaymentProfile[0]);
            request.PayTo.RoutingNumber = Integer.parseInt(PaymentProfile[1]);
            request.PayTo.UserName = PaymentProfile[2];
            request.FromCurrency = reader.nextLine().split(":")[1];
            request.ToCurrency = reader.nextLine().split(":")[1];

            reader.close();
            if (file.delete()){
              String[] targetNames =  TargetComponentNames.split(",");
              for (String name : targetNames){
                SendRequestAsync(name, request);
              }
            }

        }
        return null;
    }
}
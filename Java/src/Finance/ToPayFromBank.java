package Finance;

import Finance.TransactionRequest;
import Finance.PaymentProfile;
import java.io.FileWriter;
import java.io.File; 
import java.util.Date;
import java.text.SimpleDateFormat;


public class ToPayFromBank extends com.intersystems.enslib.pex.BusinessOperation {

    public String FilePath = "/datavol/data/FromBankOut/";

    public void OnTearDown() {

    }
    public void OnInit(){

    }


    public java.lang.Object OnMessage(java.lang.Object object) throws java.lang.Exception {

        try {
             TransactionRequest request = (TransactionRequest)object;

            Date today = new Date();
            SimpleDateFormat Formatter = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss.SSSZ");
            String DateString = Formatter.format(today);
            String OutputPath = FilePath + DateString;
            File OutputMessage = new File (OutputPath);
            FileWriter writer = new FileWriter(OutputMessage);

            writer.write ("Debit request:" + System.lineSeparator());
            writer.write("Route:" + request.PayFrom.RoutingNumber + System.lineSeparator());
            writer.write("Account: " + request.PayFrom.AccountNumber + System.lineSeparator());
            writer.write("Amount: " + request.TransactionAmount);
            writer.close();

            return null;
        }
       catch (Exception e) {
            
        return null;
        }
       
       

    }

   

        
    
}
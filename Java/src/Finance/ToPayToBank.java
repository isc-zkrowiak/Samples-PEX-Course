
package Finance;

import Finance.TransactionRequest;
import Finance.PaymentProfile;
import java.io.FileWriter;
import java.io.File; 
import java.util.Date;
import java.text.SimpleDateFormat;
import org.apache.commons.lang3.RandomStringUtils;

public class ToPayToBank extends com.intersystems.enslib.pex.BusinessOperation{
    public String FilePath = "/datavol/data/ToBankOut/";

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

            String TransactionID = RandomStringUtils.random(20, true,);

            writer.write ("credit request:" + System.lineSeparator());
            writer.write ("Transaction Code:" + TransactionID + System.lineSeparator());

            writer.write("SourceRouting:" + request.PayFrom.RoutingNumber + System.lineSeparator());
            writer.write("SourceAccount: " + request.PayFrom.AccountNumber + System.lineSeparator());
            writer.write("ToAccount: " + request.PayTo.AccountNumber + System.lineSeparator());
            writer.write("Amount: " + request.TransactionAmount);
            writer.close();
            return true;

            
        }
       catch (Exception e) {
            throw new java.lang.Exception(e);
        }
        

    }
}
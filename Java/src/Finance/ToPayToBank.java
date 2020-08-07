
package Finance;

import Finance.TransactionRequest;
import Finance.PaymentProfile;
import java.lang.StringBuffer;

public class ToPayToBank extends com.intersystems.enslib.pex.BusinessOperation {
    


    public void OnTearDown() {} // PEX abstract method. Must override.
    public void OnInit(){} // PEX abstract method. Must override.

    public java.lang.Object OnMessage(java.lang.Object object) throws java.lang.Exception {

        // Cast input object to expected class.
        TransactionRequest request = (TransactionRequest)object;

         // Instantiate StringBuffer object to construct outgoing file text.
        StringBuffer outputMessage = new StringBuffer();

         // Write data to file.
        outputMessage.append("credit request:" + System.lineSeparator());
        outputMessage.append("SourceRouting:" + request.PayFrom.RoutingNumber + System.lineSeparator());
        outputMessage.append("SourceAccount: " + request.PayFrom.AccountNumber + System.lineSeparator());
        outputMessage.append("ToAccount: " + request.PayTo.AccountNumber + System.lineSeparator());
        outputMessage.append("Amount: " + request.TransactionAmount);
        
        // Invoke the outbound adapter to write message to file
        Adapter.invoke("WriteToFile", outputMessage.toString());
        
        return null;

        
    
        

    }
}
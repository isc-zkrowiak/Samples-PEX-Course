
package Finance;

import Finance.TransactionRequest;
import Finance.PaymentProfile;
import java.lang.StringBuffer;

// This class is for a PEX business operation communicating with the receiving bank.
// It receives a request from the Business Process (Finance.ProcessPaymentRequest)
// and constructs a message to write a file.
public class ToPayToBank extends com.intersystems.enslib.pex.BusinessOperation {
    


    public void OnTearDown() {} // Abstract method in PEX superclass. Must override.
    public void OnInit(){} // Abstract method in PEX superclass. Must override.

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
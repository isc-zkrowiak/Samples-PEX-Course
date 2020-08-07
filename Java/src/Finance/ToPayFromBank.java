package Finance;

import Finance.TransactionRequest;
import Finance.PaymentProfile;
import Finance.TransactionResponse;
import java.lang.StringBuffer;

public class ToPayFromBank extends com.intersystems.enslib.pex.BusinessOperation {



    public void OnTearDown() {} // PEX abstract method. Must override.
    public void OnInit(){} // PEX abstract method. Must override.


    public java.lang.Object OnMessage(java.lang.Object object) throws java.lang.Exception {

        // Cast input object to expected class.
        TransactionRequest request = (TransactionRequest)object;
        
        // Instantiate StringBuffer object to construct outgoing file text.
        StringBuffer outputMessage = new StringBuffer();
 
        // Write data to StringBuffer.
        outputMessage.append ("Debit request:" + System.lineSeparator());
        outputMessage.append("Route:" + request.PayFrom.RoutingNumber + System.lineSeparator());
        outputMessage.append("Account: " + request.PayFrom.AccountNumber + System.lineSeparator());
        outputMessage.append("Amount: " + request.TransactionAmount);
        
        // Instantiate and populate an approval response object to return to requesting business process
        TransactionResponse response = new TransactionResponse();
        response.approved = true;

        // Invoke the outbound adapter to write message to file
        Adapter.invoke("WriteToFile", outputMessage.toString());
        return response;

       
       

    }

   

        
    
}
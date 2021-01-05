package Finance;
import Finance.TransactionRequest;
import Finance.TransactionResponse;

// This class is for a PEX business process that sends a request to the paying bank, then, if 
// it receives an approval response, sends  a request to the receiving bank.
public class ProcessPaymentRequest extends com.intersystems.enslib.pex.BusinessProcess {

    // PEX abstract method. Must override.
    public Object OnComplete(Object object,Object object2) {return null;}

    // PEX abstract method. Must override.
    public java.lang.Object OnResponse(java.lang.Object request, java.lang.Object response, java.lang.Object callRequest, java.lang.Object callResponse, java.lang.String completionKey) throws java.lang.Exception {
        return null;
    }

    // PEX abstract method. Must override.
    public void OnTearDown(){}

    // PEX abstract method. Must override.
    public void OnInit(){}



    public java.lang.Object OnRequest(java.lang.Object object) throws java.lang.Exception {

        
            // Cast input parameter to the expected message type.
            TransactionRequest request = (Finance.TransactionRequest) object;

            // Send payment request to paying financial institution using synchronous request.
            Object response = SendRequestSync("ToPayFromOperation", request);

            // Cast response from bank into appropriate class
            TransactionResponse bankResponse = (TransactionResponse)response;

            // Check response from paying bank for approval before sending message to receiving bank
            if (bankResponse.approved) {
                // Send payment request to receiving financial institution using an asynchronous call.
                SendRequestAsync("ToPayToOperation", request);
            }

            


        
        return null;

    }
    
}
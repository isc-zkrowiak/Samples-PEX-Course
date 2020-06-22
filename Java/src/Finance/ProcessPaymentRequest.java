
package Finance;
import Finance.TransactionRequest;


public class ProcessPaymentRequest extends com.intersystems.enslib.pex.BusinessProcess {


    public Object OnComplete(Object object,Object object2) {return null;}

    public java.lang.Object OnResponse(java.lang.Object request, java.lang.Object response, java.lang.Object callRequest, java.lang.Object callResponse, java.lang.String completionKey) throws java.lang.Exception {
        return null;
    }

    public void OnTearDown(){}

    public void OnInit(){}



    public java.lang.Object OnRequest(java.lang.Object object) throws java.lang.Exception {

        

            TransactionRequest request = (Finance.TransactionRequest) object;

            Object response = SendRequestSync("ToPayFromOperation", request);
            boolean responseValue = true;

            if (responseValue) {

                SendRequestAsync("ToPayToOperation", request);
            }


        
        return null;

    }
    
}
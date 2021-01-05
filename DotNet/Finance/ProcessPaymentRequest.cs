using System;
using Finance;

namespace Finance{


    // This class is for a PEX business process that sends a request to the paying bank, then, if 
    // it receives an approval response, sends  a request to the receiving bank.
    public class ProcessPaymentRequest : InterSystems.EnsLib.PEX.BusinessProcess {

        // PEX abstract method. Must override.
        public override object OnComplete(object input, object input2) {return null;} 

        // PEX abstract method. Must override.
        public override object OnResponse(object request, object response, object callRequest, object callResponse, string completionKey) {
            return null;
        }

        // PEX abstract method. Must override.
        public override void OnTearDown(){}

        // PEX abstract method. Must override.
        public override void OnInit(){}



        public override object OnRequest(object input)  {

            
                // Cast input parameter to the expected message type.
                TransactionRequest request = (Finance.TransactionRequest) input;

                // Send payment request to paying financial institution using synchronous request.
                object response = SendRequestSync("ToPayFromOperation", request);

                 // Cast response from bank into appropriate class
                TransactionResponse bankResponse = (TransactionResponse)response;

                // Check response from paying bank for approval before sending message to receiving bank
                if (bankResponse.approved){

                    // Send payment request to receiving financial institution using an asynchronous call.
                    SendRequestAsync("ToPayToOperation", request);
                }
                

                


            
            return null;

        }
        
    }
}
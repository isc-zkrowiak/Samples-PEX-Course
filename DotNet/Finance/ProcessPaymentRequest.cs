using System;

using Finance;

namespace Finance{



    public class ProcessPaymentRequest : InterSystems.EnsLib.PEX.BusinessProcess {


        public override object OnComplete(object input, object input2) {return null;}

        public override object OnResponse(object request, object response, object callRequest, object callResponse, string completionKey) {
            return null;
        }

        public override void OnTearDown(){}

        public override void OnInit(){}



        public override object OnRequest(object input)  {

            

                TransactionRequest request = (Finance.TransactionRequest) input;

                object response = SendRequestSync("ToPayFromOperation", request);
                bool responseValue = true;

                if (responseValue) {

                    SendRequestAsync("ToPayToOperation", request);
                }


            
            return null;

        }
        
    }
}
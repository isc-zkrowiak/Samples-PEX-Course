using System;
using System.Text; // Import class to deal with enumerators.

namespace Finance{

    // This class is for the PEX business operation communicating with the paying bank.
    // It receives a message from a Business Process, Finance.ProcessPaymentRequest, writes an output 
    // message to a file, then returns an 'approval' response (Finance.TransactionResponse).
    public class ToPayFromBank : InterSystems.EnsLib.PEX.BusinessOperation {


        public override void OnTearDown() {} // Abstract method in PEX superclass. Must override.
        public override void OnInit(){} // Abstract method in PEX superclass. Must override.


        public override object OnMessage(object input) {

            // Cast input object to expected class.
            TransactionRequest request = (TransactionRequest)input;

            // Create a StringBuilder object to store file lines.
            StringBuilder writer = new StringBuilder();
            writer.Append ("Debit request:" + Environment.NewLine);
            writer.Append("Route:" + request.PayFrom.RoutingNumber + Environment.NewLine);
            writer.Append("Account: " + request.PayFrom.AccountNumber + Environment.NewLine);
            writer.Append("Amount: " + request.TransactionAmount);
            
            // Write all lines to file using OutboundAdapter
            Adapter.invoke("WriteToFile", writer.ToString());


            // Instantiate and populate an approval response object to return to requesting business process
            TransactionResponse response = new TransactionResponse();
            response.approved = true;

            return response;
        }
    }    
}






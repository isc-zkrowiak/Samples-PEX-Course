using System;
using System.Text; // Import class to deal with enumerators.

namespace Finance{

    public class ToPayFromBank : InterSystems.EnsLib.PEX.BusinessOperation {


        public override void OnTearDown() {} // PEX abstract method. Must override.
        public override void OnInit(){} // PEX abstract method. Must override.


        public override object OnMessage(object input) {

            // Cast input object to expected class.
            TransactionRequest request = (TransactionRequest)input;

            // Create a string list to store file lines.
            StringBuilder writer = new StringBuilder();
            writer.Append ("Debit request:" + Environment.NewLine);
            writer.Append("Route:" + request.PayFrom.RoutingNumber + Environment.NewLine);
            writer.Append("Account: " + request.PayFrom.AccountNumber + Environment.NewLine);
            writer.Append("Amount: " + request.TransactionAmount);
            
            // Write all lines to file.
            Adapter.invoke("WriteToFile", writer.ToString());

            TransactionResponse response = new TransactionResponse();

            response.approved = true;

            return response;
        }
    }    
}






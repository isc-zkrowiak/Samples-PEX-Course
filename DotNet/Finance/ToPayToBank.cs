
using System;
using System.IO;  // Import the File class
using System.Text; // Import class to deal with enumerators.


namespace Finance{

    // This class is for a PEX business operation communicating with the receiving bank
    public class ToPayToBank : InterSystems.EnsLib.PEX.BusinessOperation {

        // Filepath to output directory. Set at runtime.
        

        public override void OnTearDown() {} // PEX abstract method. Must override.
        public override void OnInit(){} // PEX abstract method. Must override.


        public override object OnMessage(object input) {

       
            // Cast input object to expected class.
            TransactionRequest request = (TransactionRequest)input;

            // Create a stringbuilder object to store file lines.
            StringBuilder writer = new StringBuilder();

            writer.Append("credit request:" + Environment.NewLine);
            writer.Append("SourceRouting:" + request.PayFrom.RoutingNumber + Environment.NewLine);
            writer.Append("SourceAccount: " + request.PayFrom.AccountNumber + Environment.NewLine);
            writer.Append("ToAccount: " + request.PayTo.AccountNumber + Environment.NewLine);
            writer.Append("Amount: " + request.TransactionAmount);
            
            // Write all lines to file using the outbound adapter.
            Adapter.invoke("WriteToFile", writer.ToString());

            return null;
            
            
           


        }
    }
}
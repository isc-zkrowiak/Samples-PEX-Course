
using System;
using System.IO;  // Import the File class
using System.Text; // Import class to deal with enumerators.


namespace Finance{

    public class ToPayToBank : InterSystems.EnsLib.PEX.BusinessOperation {

        // Filepath to output directory. Set at runtime.
        

        public override void OnTearDown() {} // PEX abstract method. Must override.
        public override void OnInit(){} // PEX abstract method. Must override.


        public override object OnMessage(object input) {

       
            // Cast input object to expected class.
            TransactionRequest request = (TransactionRequest)input;


            

           

            // Create a string list to store file lines.
            StringBuilder writer = new StringBuilder();
            string TransactionID =  "HARDCODING_RANDOM_STRING_FOR_NOW";
            writer.Append("credit request:" + Environment.NewLine);
            writer.Append("Transaction Code:" + TransactionID + Environment.NewLine);
            writer.Append("SourceRouting:" + request.PayFrom.RoutingNumber + Environment.NewLine);
            writer.Append("SourceAccount: " + request.PayFrom.AccountNumber + Environment.NewLine);
            writer.Append("ToAccount: " + request.PayTo.AccountNumber + Environment.NewLine);
            writer.Append("Amount: " + request.TransactionAmount);
            
            // Write all lines to file.
            Adapter.invoke("WriteToFile", writer.ToString());

            return null;
            
            
           


        }
    }
}
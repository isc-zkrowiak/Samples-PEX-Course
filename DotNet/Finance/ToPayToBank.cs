
using System;
using System.IO;  // Import the File class
using System.Collections.Generic; // Import class to deal with enumerators.


namespace Finance{

    public class ToPayToBank : InterSystems.EnsLib.PEX.BusinessOperation {

        // Filepath to output directory. Set at runtime.
        public string FilePath;

        public override void OnTearDown() {} // PEX abstract method. Must override.
        public override void OnInit(){} // PEX abstract method. Must override.


        public override object OnMessage(object input) {

       
            // Cast input object to expected class.
            TransactionRequest request = (TransactionRequest)input;

            // Allow users to enter file path with or without trailing path separator.
            if (FilePath[(FilePath.Length -1 )] != Path.DirectorySeparatorChar) {

                FilePath = FilePath + Path.DirectorySeparatorChar;
            }
            

            // Generate file name from current DateTime.
            string today = DateTime.UtcNow.ToString("yyyy-MM-dd'T'HH:mm:ss.SSSZ");
            
            // Append to qualified file path.
            string OutputPath = FilePath + today;


            // Create a string list to store file lines.
            List<string> writer = new List<string>();
            string TransactionID =  "HARDCODING_RANDOM_STRING_FOR_NOW";
            writer.Add ("credit request:" + Environment.NewLine);
            writer.Add ("Transaction Code:" + TransactionID + Environment.NewLine);
            writer.Add("SourceRouting:" + request.PayFrom.RoutingNumber + Environment.NewLine);
            writer.Add("SourceAccount: " + request.PayFrom.AccountNumber + Environment.NewLine);
            writer.Add("ToAccount: " + request.PayTo.AccountNumber + Environment.NewLine);
            writer.Add("Amount: " + request.TransactionAmount);
            
            // Write all lines to file.
            File.WriteAllLines(OutputPath, writer);

            return null;
            
            
           


        }
    }
}
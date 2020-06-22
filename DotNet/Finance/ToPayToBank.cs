
using System;
using System.IO;

namespace Finance{

    public class ToPayToBank : InterSystems.EnsLib.PEX.BusinessOperation {

        public string FilePath = "/datavol/data/ToBankOut/";

        public override void OnTearDown() {

        }
        public override void OnInit(){

        }


        public override object OnMessage(object input) {

        try {

            TransactionRequest request = (TransactionRequest)input;

            string today = DateTime.UtcNow.ToString("yyyy-MM-dd'T'HH:mm:ss.SSSZ");
            string OutputPath = FilePath + today;
            List<string[]> writer = new List<string[]>();

            string TransactionID = "This NEEDS TO BE A RANDOM string";
            writer.append ("credit request:" + Environment.NewLine);
            writer.append ("Transaction Code:" + TransactionID + Environment.NewLine);

            writer.append("SourceRouting:" + request.PayFrom.RoutingNumber + Environment.NewLine);
            writer.append("SourceAccount: " + request.PayFrom.AccountNumber + Environment.NewLine);
            writer.append("ToAccount: " + request.PayTo.AccountNumber + Environment.NewLine);
            writer.append("Amount: " + request.TransactionAmount);
            
            File.WriteAllLines(OutputPath, writer);

            return null;
            
            
            }
       catch (Exception e) {
            throw new java.lang.Exception(e);
            }
        

        }
    }
}

using System;
using System.IO;
using System.Collections.Generic;

namespace Finance{

    public class ToPayToBank : InterSystems.EnsLib.PEX.BusinessOperation {

        public string FilePath = "/datavol/data/ToBankOut/";

        public override void OnTearDown() {

        }
        public override void OnInit(){

        }


        public override object OnMessage(object input) {

       

            TransactionRequest request = (TransactionRequest)input;

            string today = DateTime.UtcNow.ToString("yyyy-MM-dd'T'HH:mm:ss.SSSZ");
            string OutputPath = FilePath + today;
            var writer = new List<string>();

            string TransactionID = "This NEEDS TO BE A RANDOM string";
            writer.Add ("credit request:" + Environment.NewLine);
            writer.Add ("Transaction Code:" + TransactionID + Environment.NewLine);

            writer.Add("SourceRouting:" + request.PayFrom.RoutingNumber + Environment.NewLine);
            writer.Add("SourceAccount: " + request.PayFrom.AccountNumber + Environment.NewLine);
            writer.Add("ToAccount: " + request.PayTo.AccountNumber + Environment.NewLine);
            writer.Add("Amount: " + request.TransactionAmount);
            
            File.WriteAllLines(OutputPath, writer);

            return null;
            
            
           


        }
    }
}
using System;
using System.IO;
using System.Collections.Generic;

namespace Finance{

    public class ToPayFromBank : InterSystems.EnsLib.PEX.BusinessOperation {

        public string FilePath = "/datavol/data/FromBankOut/";

        public override void OnTearDown() {

        }
        public override void OnInit(){

        }


        public override object OnMessage(object input) {

            try {
                TransactionRequest request = (TransactionRequest)input;

                String today = DateTime.UtcNow.ToString("yyyy-MM-dd'T'HH:mm:ss.SSSZ");
                string OutputPath = FilePath + today;
                List<string> writer = new List<string>();


                writer.Add ("Debit request:" + Environment.NewLine);
                writer.Add("Route:" + request.PayFrom.RoutingNumber + Environment.NewLine);
                writer.Add("Account: " + request.PayFrom.AccountNumber + Environment.NewLine);
                writer.Add("Amount: " + request.TransactionAmount);
                
                File.WriteAllLines(OutputPath, writer);

                return null;
            }
            catch (Exception e) {
                
            return null;
            }
       
       

    }

   

        
    
}

}




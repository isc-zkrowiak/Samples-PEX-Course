
using System;  // Import the File class
using System.IO;  // Import this class to handle errors
using System.Collections.Generic;

namespace Finance {

public class FromFileTransaction : InterSystems.EnsLib.PEX.BusinessService {
    public string TargetComponentNames;
    public string InboundFilePath;

    public override void OnTearDown() {}
    public override void OnInit() {}


    public override object OnProcessInput(object messageInput)  {
         LOGINFO(InboundFilePath);

        var folder = Directory.EnumerateFiles(InboundFilePath);
        

        foreach (string file in folder) {
            var FileLines = File.ReadLines(file);
            IEnumerator<string> reader = FileLines.GetEnumerator();
            reader.MoveNext();
           




            TransactionRequest request = new TransactionRequest();
            request.TransactionAmount = decimal.Parse(reader.Current.Split(":")[1]);
            reader.MoveNext();
            string tempString = reader.Current;
            string[] tempStringArray = tempString.Split(":");
            string[] PaymentProfile = tempStringArray[1].Split("\\|");
            request.PayFrom.AccountNumber  = int.Parse(PaymentProfile[0]);
            request.PayFrom.RoutingNumber = int.Parse(PaymentProfile[1]);
            request.PayFrom.UserName = PaymentProfile[2];
            reader.MoveNext();
            tempString = reader.Current;
            tempStringArray = tempString.Split(":");
            PaymentProfile = tempStringArray[1].Split("\\|");
            request.PayTo.AccountNumber  = int.Parse(PaymentProfile[0]);
            request.PayTo.RoutingNumber = int.Parse(PaymentProfile[1]);
            request.PayTo.UserName = PaymentProfile[2];
            reader.MoveNext();
            request.FromCurrency = reader.Current.Split(":")[1];
            reader.MoveNext();
            request.ToCurrency = reader.Current.Split(":")[1];
            File.Delete(file);

            string[] targetNames =  TargetComponentNames.Split(",");
            foreach (string name in targetNames){
              SendRequestAsync(name, request);
              
            }

        }
        return null;
    }
} 

}
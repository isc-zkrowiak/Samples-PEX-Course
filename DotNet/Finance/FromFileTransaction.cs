
using System;  // Import the File class
using System.IO;  // Import this class to handle errors

namespace Finance {

public class FromFileTransaction : InterSystems.EnsLib.PEX.BusinessService {
    public String TargetComponentNames;
    public String InboundFilePath;

    public override void OnTearDown() {}
    public override void OnInit() {}


    public override object OnProcessInput(object messageInput)  {

        IEnumerable folder = File.EnumerateFiles(InboundFilePath);
        

        foreach (String file in folder) {
            IEnumerable<String[]> FileLines = File.ReadLines(file);
            IEnumerator reader = FileLines.GetEnumerator();
            reader.MoveNext();
            TransactionRequest request = new TransactionRequest();
            request.TransactionAmount = Float.parseFloat(reader.Current().split(
              ":")[1]);
              reader.MoveNext();
            String tempString = reader.Current()();
            String[] tempStringArray = tempString.split(":");
            String[] PaymentProfile = tempStringArray[1].split("\\|");
            request.PayFrom.AccountNumber  = Integer.parseInt(PaymentProfile[0]);
            request.PayFrom.RoutingNumber = Integer.parseInt(PaymentProfile[1]);
            request.PayFrom.UserName = PaymentProfile[2];
            reader.MoveNext();
            tempString = reader.Current()();
            tempStringArray = tempString.split(":");
            PaymentProfile = tempStringArray[1].split("\\|");
            request.PayTo.AccountNumber  = Integer.parseInt(PaymentProfile[0]);
            request.PayTo.RoutingNumber = Integer.parseInt(PaymentProfile[1]);
            request.PayTo.UserName = PaymentProfile[2];
            reader.MoveNext();
            request.FromCurrency = reader.Current()().split(":")[1];
            reader.MoveNext();
            request.ToCurrency = reader.Current()().split(":")[1];
            File.Delete(file);

            String[] targetNames =  TargetComponentNames.split(",");
            foreach (String name in targetNames){
              SendRequestAsync(name, request);
              
            }

        }
        return null;
    }
} 

}
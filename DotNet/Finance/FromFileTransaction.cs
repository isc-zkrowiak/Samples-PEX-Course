
using System;  
using System.IO;  // Import the File class
using System.Collections.Generic; // Import class to deal with enumerators
using System.Globalization;



namespace Finance {

public class FromFileTransaction : InterSystems.EnsLib.PEX.BusinessService {

    public string TargetComponentNames; // Comma separated list of target production components. Set at runtime.
    public string InboundFilePath; // Path to input directory.

    public override void OnTearDown() {} // PEX abstract method. Must override.
    public override void OnInit() {
    
    } // PEX abstract method. Must override.

    // OnProcessInput is called at an interval specified in the 'call interval' setting in the production.
    public override object OnProcessInput(object input)  {
        
            // Cast input to string

            string file = (string)input;

            // Enumerate through lines of file
            IEnumerable<string> FileLines = File.ReadLines(file);
            IEnumerator<string> reader = FileLines.GetEnumerator();
            reader.MoveNext();

            // Instantiate TransactionRequest message object.
            TransactionRequest request = new TransactionRequest();

            // Set fields of message. An actual implementation would need to verify that
            // message structure is valid.
            

            
            request.TransactionAmount = Decimal.Parse("55.44");
            reader.MoveNext();
            string tempString = reader.Current;
            string[] tempStringArray = tempString.Split(":");
            
            // Break apart nested PaymentProfile objects and populate fields.
            string[] PaymentProfile = tempStringArray[1].Split("|");
            request.PayFrom.AccountNumber  = int.Parse(PaymentProfile[0]);
            request.PayFrom.RoutingNumber = int.Parse(PaymentProfile[1]);
            request.PayFrom.UserName = PaymentProfile[2];
            reader.MoveNext();
            tempString = reader.Current;
            tempStringArray = tempString.Split(":");
            PaymentProfile = tempStringArray[1].Split("|");
            request.PayTo.AccountNumber  = int.Parse(PaymentProfile[0]);
            request.PayTo.RoutingNumber = int.Parse(PaymentProfile[1]);
            request.PayTo.UserName = PaymentProfile[2];

            reader.MoveNext();
            request.FromCurrency = reader.Current.Split(":")[1];
            reader.MoveNext();
            request.ToCurrency = reader.Current.Split(":")[1];

            // Delete file after reading data.
            File.Delete(file);

            // iterate through target business components and send request message
            string[] targetNames =  TargetComponentNames.Split(",");
            foreach (string name in targetNames){
              SendRequestAsync(name, request);
              
            }

        
        return null;
    }
} 

}
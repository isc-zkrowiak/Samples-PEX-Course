
using System;  
using System.IO;  // Import the File class
using System.Collections.Generic; // Import class to deal with enumerators
using System.Globalization;



namespace Finance {

// This class is for a PEX business service that reads a transaction request message from a file. It then parses the 
// file format of that message and converts it into a Finance.TransactionRequest message object, before sending it to
// another business component declared at runtime in the property TargetComponentNamespublic class FromFileTransaction : InterSystems.EnsLib.PEX.BusinessService {

    public string TargetComponentNames; // Comma separated list of target production components. Set at runtime.


    public override void OnTearDown() {} // Abstract method in PEX superclass. Must override.
    public override void OnInit() { } // Abstract method in PEX superclass. Must override.

    // OnProcessInput is called at an interval specified in the 'call interval' setting in the production.
    public override object OnProcessInput(object input)  {
        
            // Cast input to string representing file path
            string file = (string)input;

            // Enumerate through lines of file
            IEnumerable<string> FileLines = File.ReadLines(file);
            IEnumerator<string> reader = FileLines.GetEnumerator();
            reader.MoveNext();

            // Instantiate TransactionRequest message object.
            TransactionRequest request = new TransactionRequest();

            // Set fields of message. An actual implementation would need to verify that
            // message structure is valid.
            request.TransactionAmount = Decimal.Parse(reader.Current.Split(":")[1]);
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

            // Iterate through target business components and send request message
            string[] targetNames =  TargetComponentNames.Split(",");
            foreach (string name in targetNames){
              SendRequestAsync(name, request);
              
            }

        
        return null;
    }
} 

}
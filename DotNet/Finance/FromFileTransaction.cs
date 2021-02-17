
using System;  
using System.IO;  // Import the File class
using System.Collections.Generic; // Import class to deal with enumerators
using System.Globalization;



namespace Finance {

// This class is for a PEX business service that reads a transaction request message from a file. It then parses the 
// file format of that message and converts it into a Finance.TransactionRequest message object, before sending it to
// another business component declared at runtime in the property TargetComponentNamespublic class FromFileTransaction : InterSystems.EnsLib.PEX.BusinessService {
public class FromFileTransaction : InterSystems.EnsLib.PEX.BusinessService {
    public string TargetComponentNames; // Comma separated list of target production components. Set at runtime.


    public override void OnTearDown() {} // Abstract method in PEX superclass. Must override.
    public override void OnInit() { } // Abstract method in PEX superclass. Must override.

    // OnProcessInput is called at an interval specified in the 'call interval' setting in the production.
    public override object OnProcessInput(object input)  {
        
            // Cast input to string representing file path
            string file = (string)input;
            
            // Create enumerable for lines of file.
            IEnumerable<string> FileLines = File.ReadLines(file);
            IEnumerator<string> reader = FileLines.GetEnumerator();

            // Instantiate TransactionRequest message object, passing the lines of file into a constructor function.
            TransactionRequest request = new TransactionRequest(reader);

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
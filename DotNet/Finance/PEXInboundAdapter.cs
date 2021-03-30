using System;  
using System.IO;  // Import the File class
using System.Collections.Generic; // Import class to deal with enumerators



namespace Finance {


// This class is for a PEX inbound adapter that abstracts the process of checking the input directory path specified in
// the InboundFilePath. If there are files in that directory, it loops through them and passes the path to each file to the
// Business Service (Finance.FromFileTransaction in this case) using ProcessInput().
  public class PEXInboundAdapter :  InterSystems.EnsLib.PEX.InboundAdapter  {

    public String InboundFilePath; // Path to input directory.
    
    public override void OnTearDown() {}
    public override void OnInit() {}
    public override void OnTask() {

        
        // Check input directory for files and create enumerable containing file paths.
        IEnumerable<string> folder = Directory.EnumerateFiles(InboundFilePath);
          
        // Enumerate over files in the directory.
        foreach (string file in folder) {
        
          // Ignore .keep file
            string[] SplitFilePath = file.Split(Path.DirectorySeparatorChar);
            
            // .keep files are used to retain directory structure in git.
            // these need to be skipped over so they are not processed by the production.
            if ( SplitFilePath[(SplitFilePath.Length-1)] == ".keep") {continue;}

            // Call ProcessInput method of connected business service
            BusinessHost.ProcessInput(file);
        }
        return;
    }
  }
}
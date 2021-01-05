using System;  
using System.IO;  // Import the File class
using System.Collections.Generic; // Import class to deal with enumerators



namespace Finance {


  // This class is for a PEX inbound adapter that abstracts the process of checking the input directory.
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
            if ( SplitFilePath[(SplitFilePath.Length-1)] == ".keep") {continue;}

            // Call ProcessInput method of connected business service
            BusinessHost.ProcessInput(file);
        }
        return;
    }
  }
}
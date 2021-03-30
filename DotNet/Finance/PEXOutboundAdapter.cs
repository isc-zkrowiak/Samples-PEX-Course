using System;
using System.IO;  // Import the File class

namespace Finance {

    // This class implements the PEX OutboundAdapter super class. It takes requests from PEX components, usually
    // Business Operations, and abstracts connection logic to external systems. In this case, the two Business Operation
    // Components in the production, Finance.ToPayFromBank and Finance.ToPayToBank, both use the Invoke() method
    // To call the WriteToFile() method implemented here.
    class PEXOutboundAdapter :  InterSystems.EnsLib.PEX.OutboundAdapter {

        public string FilePath; // Path to write output file.
        public override void OnTearDown() {} // Abstract method in PEX superclass. Must override.
        public override void OnInit() {} // Abstract method in PEX superclass. Must override.


        public object WriteToFile(object input) {
            
            // Cast output message to string
            string OutputMessage = (string)input;

            // Allow users to enter file path with or without trailing path separator.
            if (FilePath[(FilePath.Length -1 )] != Path.DirectorySeparatorChar) {

                FilePath = FilePath + Path.DirectorySeparatorChar;
            }
            // Generate file name from current DateTime.
            string today = DateTime.UtcNow.ToString("yyyy-MM-dd'T'HH:mm:ss");
            
            // Append to qualified file path.
            string OutputPath = FilePath + today;

            // Write text in OutputMessage to the file specified in OutputPath
            File.WriteAllText(OutputPath, OutputMessage);
            return null;
        }
    }
}
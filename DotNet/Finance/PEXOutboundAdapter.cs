using System;
using System.IO;  // Import the File class

namespace Finance {

    class PEXOutboundAdapter :  InterSystems.EnsLib.PEX.OutboundAdapter {

        public string FilePath; // Path to write output file.
        public override void OnTearDown() {}
        public override void OnInit() {}

        public object WriteToFile(object input) {
            
            // Cast output message to string
            string OutputMessage = (string)input;

            // Allow users to enter file path with or without trailing path separator.
            if (FilePath[(FilePath.Length -1 )] != Path.DirectorySeparatorChar) {

                FilePath = FilePath + Path.DirectorySeparatorChar;
            }
            // Generate file name from current DateTime.
            string today = DateTime.UtcNow.ToString("yyyy-MM-dd'T'HH:mm:ss.SSSZ");
            
            // Append to qualified file path.
            string OutputPath = FilePath + today;

            // Write text in OutputMessage to the file specified in OutputPath
            File.WriteAllText(OutputPath, OutputMessage);
            return null;
        }
    }
}
package Finance;
import java.io.File;  // Import the File class.
import java.io.FileNotFoundException;  // Import this class to handle errors.
import java.lang.StringBuffer; // Import string buffer class.
import java.io.FileWriter; // Package to write to files.
import java.util.Date; // Package for working with dates.
import java.text.SimpleDateFormat; // Package to format date strings

// This class implements the PEX OutboundAdapter super class. It takes requests from PEX components, usually
// Business Operations, and abstracts connection logic to external systems. In this case, the two Business Operation
// Components in the production, Finance.ToPayFromBank and Finance.ToPayToBank, both use the Invoke() method
// To call the WriteToFile() method implemented here.
public class PEXOutboundAdapter extends  com.intersystems.enslib.pex.OutboundAdapter  {

    public String FilePath; // Path to write output file.
    
    public void OnTearDown() {}
    public void OnInit() {}

    public Object WriteToFile(java.lang.Object input) throws Exception {

        // Cast output message to string
        String OutputMessage = (String)input;

         // Allow users to enter file path with or without trailing path separator.
         if (FilePath.substring(FilePath.length() - 1) != File.separator) {

            FilePath = FilePath + File.separator;
        }
        
        // Generate file name from current DateTime.
        Date today = new Date();
        SimpleDateFormat Formatter = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss.SSSZ");
        String DateString = Formatter.format(today);

        // Append to qualified file path.
        String OutputPath = FilePath + DateString;

        // Create file.
        File OutputFile = new File (OutputPath);

        // Instantiate FileWriter object.
        FileWriter writer = new FileWriter(OutputFile);

        // Write text in OutputMessage to the file specified in OutputPath
        writer.write(OutputMessage);
        writer.close();
        
        return null;
      

    }
}
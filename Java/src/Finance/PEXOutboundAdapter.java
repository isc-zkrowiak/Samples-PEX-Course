package Finance;
import java.io.File;  // Import the File class.
import Finance.Test;
import java.io.FileNotFoundException;  // Import this class to handle errors.
import java.lang.StringBuffer;
import java.io.FileWriter; // Package to write to files.
import java.util.Date; // Package for working with dates.
import java.text.SimpleDateFormat; // Package to format date strings


public class PEXOutboundAdapter extends  com.intersystems.enslib.pex.OutboundAdapter  {

    public String FilePath; // Path to input directory.
    
    public void OnTearDown() {}
    public void OnInit() {}

    public Object WriteToFile(java.lang.Object input) throws Exception {

        
        String OutputMessage = (String)input;
         // Allow users to enter file path with or without trailing path separator.
         if (FilePath.substring(FilePath.length() - 1) != File.separator) {

            FilePath = FilePath + File.separator;
        }

        Date today = new Date();
        SimpleDateFormat Formatter = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss.SSSZ");
        String DateString = Formatter.format(today);

        // Append to qualified file path.
        String OutputPath = FilePath + DateString;
        // Create file.
        File OutputFile = new File (OutputPath);
        FileWriter writer = new FileWriter(OutputFile);

        writer.write(OutputMessage);
        writer.close();
        
        return null;
      

    }
}
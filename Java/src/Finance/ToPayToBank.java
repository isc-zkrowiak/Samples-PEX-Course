
package Finance;

import Finance.TransactionRequest;
import Finance.PaymentProfile;
import java.io.FileWriter; // Package to write to files.
import java.io.File;   // Package to work with files.
import java.util.Date; // Package for working with dates.
import java.text.SimpleDateFormat; // Package to format date strings
import org.apache.commons.lang3.RandomStringUtils; // package to generate random string.

public class ToPayToBank extends com.intersystems.enslib.pex.BusinessOperation{
    
    // Filepath to output directory. Set at runtime.
    public String FilePath;

    public void OnTearDown() {} // PEX abstract method. Must override.
    public void OnInit(){} // PEX abstract method. Must override.

    public java.lang.Object OnMessage(java.lang.Object object) throws java.lang.Exception {

        // Cast input object to expected class.
        TransactionRequest request = (TransactionRequest)object;

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
        File OutputMessage = new File (OutputPath);
        FileWriter writer = new FileWriter(OutputMessage);

        // Create random identifier string to set as the TransactionID.
        String TransactionID = RandomStringUtils.random(20, true,true);

         // Write data to file.
        writer.write ("credit request:" + System.lineSeparator());
        writer.write ("Transaction Code:" + TransactionID + System.lineSeparator());

        writer.write("SourceRouting:" + request.PayFrom.RoutingNumber + System.lineSeparator());
        writer.write("SourceAccount: " + request.PayFrom.AccountNumber + System.lineSeparator());
        writer.write("ToAccount: " + request.PayTo.AccountNumber + System.lineSeparator());
        writer.write("Amount: " + request.TransactionAmount);
        writer.close();

        
        return true;

        
    
        

    }
}
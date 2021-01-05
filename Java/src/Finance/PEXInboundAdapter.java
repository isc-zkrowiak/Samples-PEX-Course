package Finance;
import java.io.File;  // Import the File class.
import java.io.FileNotFoundException;  // Import this class to handle errors.

// This class is for a PEX inbound adapter that abstracts the process of checking the input directory.
public class PEXInboundAdapter extends  com.intersystems.enslib.pex.InboundAdapter  {

    public String InboundFilePath; // Path to input directory.
    
    public void OnTearDown() {}
    public void OnInit() {}
    public void OnTask() throws Exception {

        
    // Check input directory for files and create enumerable containing file paths.
      File folder = new File(InboundFilePath);
      File[] list = folder.listFiles();

      if (list.length > 0) {
        for (File file : list) {
            if (file.getName().equals(".keep")) {continue;}  
            BusinessHost.ProcessInput(file.getAbsolutePath());
        }
          
      }

    }
}
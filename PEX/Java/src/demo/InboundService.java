package demo;
import java.io.File;  // Import the File class
import java.io.FileNotFoundException;  // Import this class to handle errors
import java.util.Scanner; // Import the Scanner class to read text files
import demo.CustomMessage;

public class InboundService extends com.intersystems.enslib.pex.BusinessService {

    public java.lang.Object OnProcessInput(java.lang.Object messageInput) throws java.lang.Exception {
        
        
          File folder = new File( "/datavol/data/in");
          File[] list = folder.listFiles();

          for (File file : list) {
            Scanner reader = new Scanner(file).useDelimiter(",");
            CustomMessage req = new CustomMessage();
            req.name = reader.next();
            req.number = reader.next();
            req.address = reader.next();
            req.city = reader.next();
            reader.close();
            if (file.delete()){
              SendRequestAsync("EnsLib.PEX.BusinessProcess", req);
            };
            
          }
        

        return null;
      }


}


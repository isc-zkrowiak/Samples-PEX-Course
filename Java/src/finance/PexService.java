package finance;

import java.io.File;
import org.apache.pdfbox.pdmodel.PDDocument;
import org.apache.pdfbox.text.PDFTextStripper;
import java.io.File;  // Import the File class
import java.io.FileNotFoundException;  // Import this class to handle errors
import java.util.Scanner; // Import the Scanner class to read text files
import finance.Quote;

public class PexService  extends com.intersystems.enslib.pex.BusinessService {

	public String filePath;
	public String text;
	public String targetConfigNames;
		
	public java.lang.Object OnProcessInput(final java.lang.Object messageInput) throws java.lang.Exception {


		// Load file into memory, save as string, close document
		try {
			final File file = new File(filePath);
			final PDDocument doc = PDDocument.load(file);
			text = new PDFTextStripper().getText(doc);
			doc.close();
			file.delete();

			
			// Split text into array of individual lines and send each as its own message to IRIS
			final String[] lines = text.split(System.lineSeparator());
			
			for (int i = 0; i< lines.length; i++) {
				final String[] reading = lines[i].split("\\s+");
				final Quote req = new Quote();
				req.date = reading[0];
				req.open = new Float(reading[1]);
				req.high = new Float(reading[2]);
				req.low = new Float(reading[3]);
				req.close = new Float(reading[4]);
				req.symbol = reading[5];
				
				final String [] tNames = targetConfigNames.split(",");
				for (int j =0; j < tNames.length; j++){
					SendRequestAsync(tNames[j], req);
				}
				
			}	
			
		}
		catch (final Exception e) {
			e.printStackTrace();
		}
		return null;

	}
	
		
	  
	
	
}

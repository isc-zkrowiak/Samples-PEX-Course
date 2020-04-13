package sample;

import java.io.File;

import org.apache.pdfbox.pdmodel.PDDocument;
import org.apache.pdfbox.text.PDFTextStripper;



public class jbhService implements BusinessService{

	public static final String SETTINGS = "PDF";

	static Thread msgThread = null;
	Production prod = null;
	
	@Override
	public boolean OnInit(Production p) throws Exception {
	    prod = p;

	    if (msgThread == null) {
		      PDFReader reader = new PDFReader();
		      msgThread = new Thread(reader);
		      msgThread.start();
		      prod.LogMessage("Starting in Java file.", Severity.INFO);
		    }
	  
	    return true;
	}

	@Override
	public boolean OnTearDown() throws Exception {
	    if (msgThread != null) {
	        if (msgThread.isAlive()) {
	        		msgThread.interrupt();
	        		msgThread.join();
	        }
	        msgThread = null;
	        prod.LogMessage("Tearing down.", Severity.INFO);
	      }
	      
	      return true;
	}
	
	private class PDFReader implements Runnable {
		Boolean flag = true;
		
		@Override
		public void run() {
		      try {
		    	  	String text = "";
		    	  	
		    	  	String setting = prod.GetSetting("PDF");
		    	  	
		    	  	if (setting.isEmpty()) {
		    	  		text = "No filename in Service setting.";
		    	  		prod.LogMessage(text, Severity.INFO);
		    	  		flag = false;
		    	  	}
		    	  	
				while (flag) {
			  		File file = new File(setting);
	
			  		// Load file into memory, save as string, close document
			  		try {
			  			PDDocument doc = PDDocument.load(file);
			  	  		text = new PDFTextStripper().getText(doc);
				  		doc.close();
				  		
			  		} catch (Throwable t) {
			  			prod.LogMessage("Caught throwable", Severity.ERROR);
			  			prod.LogMessage(t.toString(), Severity.INFO);
			  		}
			  		
			  		// Split text into array of individual lines and send each as its own message to IRIS
			  		String[] lines = text.split(System.getProperty("line.separator"));
			  		
			  		for (int i = 0; i< lines.length; i++) {
				  		prod.LogMessage("Sending message: "+ lines[i], Severity.TRACE);
				  		prod.LogMessage("Sending with: "+ lines[i], Severity.INFO);
				  		prod.SendRequest(lines[i]);
			  		}
			  		
			  		prod.LogMessage("End of file", Severity.INFO);
			  		flag = false;
			  		
		          }
		        } catch (InterruptedException e) {
		          try {
		            prod.LogMessage("Shutting down", Severity.INFO);
		          } catch (Exception e1) {
		            e1.printStackTrace();
		          }
		          return;
		        } catch (Exception e) {
		          try {
		        	  prod.LogMessage("In catch block.", Severity.INFO);
		        	  prod.LogMessage(e.toString(), Severity.ERROR);
		        	  prod.SetStatus(Production.Status.ERROR);
		          } catch (Exception e1) {
		        	  e1.printStackTrace();
		          }
		        }	
		}	
	}
}

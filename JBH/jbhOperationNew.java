package sample;

import com.intersystems.gateway.bh.BusinessOperation;
import com.intersystems.gateway.bh.Production;

import java.io.FileOutputStream;
import java.io.PrintWriter;
import java.sql.Timestamp;

public class jbhOperationNew implements BusinessOperation {

	public static final String SETTINGS = "LogFile";
	private PrintWriter logFile = new PrintWriter(System.out, true);
	
	@Override
	public boolean OnInit(Production arg) throws Exception {
		Production p = arg;

	    logFile = new PrintWriter(new FileOutputStream(p.GetSetting("LogFile"), true), true);
	    
	    Timestamp timestamp = new Timestamp(System.currentTimeMillis());
        System.out.println(timestamp);
	    
	    logFile.println("Starting up log file at " + timestamp + " for class: " + p.GetSetting("Classname") + ".");
	    return true;
	  }

	@Override
	public boolean OnMessage(String message) throws Exception {

		logFile.println("Received message: " + message);
		return true;
	}

	@Override
	public boolean OnTearDown() throws Exception {
		return true;
	}

}

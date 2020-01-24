package com.intersystems.demo.pex;
import java.io.File;  // Import the File class
import java.io.IOException;  // Import the IOException class to handle errors
import java.io.FileWriter;   // Import the FileWriter class
import java.io.IOException;  // Import the IOException class to handle errors

public class ZacksOperation extends com.intersystems.enslib.pex.BusinessOperation {
	
	public void OnInit() throws Exception {
		System.out.print("\r\n[Java] ...demo.pex.BusinessOperation:OnInit() is called");
		return;
	}

	public void OnTearDown() throws Exception {
		System.out.print("\r\n[Java] ...demo.pex.BusinessOperation:OnTearDown() is called");
		return;
	}
	
	public Object OnMessage(Object request) throws Exception {
        FileWriter myWriter = new FileWriter("/datavol/PEX/messageContents.txt");
        myWriter.write("Operation!");
        myWriter.close();
		
		return null;
	}

}
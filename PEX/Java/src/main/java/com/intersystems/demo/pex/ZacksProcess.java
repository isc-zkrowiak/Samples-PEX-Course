package com.intersystems.demo.pex;

import java.io.FileWriter; // Import the FileWriter class
import java.lang.reflect.Field;

import com.intersystems.enslib.pex.Message;
import com.intersystems.jdbc.IRISObject;


public class ZacksProcess extends com.intersystems.enslib.pex.BusinessProcess {
	

	

	
	
	
	public java.lang.Object OnRequest(java.lang.Object request) throws java.lang.Exception  {
			// req.Name = "harry";
			// FileWriter myWriter = new FileWriter("/datavol/PEX/messageContents.txt");
			// Class cls = request.getClass();
			// String output = "";
			// Field[] fields = cls.getFields();
			IRISObject Irequest = (IRISObject)request;


			// Message empty = new Message();
        	// // myWriter.write("Process!");
       		// myWriter.close();
            SendRequestAsync("EnsLib.RecordMap.Operation.FileOperation", Irequest);
            
 
               
              
            
          
		return null;
	}
	public static void main(String[] args) {
		System.out.println("Test");
	}
  

    
    

}

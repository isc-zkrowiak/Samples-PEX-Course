package com.intersystems.demo.pex;


import com.intersystems.demo.pex.csvReq;


public class ZacksProcess extends com.intersystems.enslib.pex.BusinessProcess {
	

	

	
	
	
	public Object OnRequest(com.intersystems.enslib.pex.Message req) throws Exception  {
            // req.Name = "harry";
			csvReq request = (csvReq) req;
            SendRequestAsync("EnsLib.RecordMap.Operation.FileOperation", request, false);
            
 
               
              
            
          
		return null;
	}
	public static void main(String[] args) {
		System.out.println("Test");
	}
  

    
    

}

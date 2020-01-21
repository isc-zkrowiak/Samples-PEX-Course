package com.intersystems.demo.pex;

import com.intersystems.gateway.GatewayContext;
import com.intersystems.jdbc.IRIS;
import com.intersystems.jdbc.IRISObject;

public class MixedBusinessService extends com.intersystems.enslib.pex.BusinessService {
	
	public int Min = 0;
	public int Max = 0;
	int runningCount = 0;

	public void OnInit() throws Exception {
		System.out.print("\r\n[Java] ...demo.pex.MixedBusinessService:OnInit() is called, Min="+Min+", Max="+Max);
		return;
	}

	public void OnTearDown() throws Exception {
		System.out.print("\r\n[Java] ...demo.pex.MixedBusinessService:OnTearDown() is called");
		return;
	}

	public Object OnProcessInput(Object messageInput) throws Exception {
		String message = null;
		if ( messageInput instanceof IRISObject ) {
			message = (String)((IRISObject)messageInput).get("value");			
		}
		if ( messageInput instanceof SimpleObject ) {
			message = ((SimpleObject)messageInput).value;
		}
		String stringMessage = "Message #"+(++runningCount);
		IRIS iris = GatewayContext.getIRIS();
		IRISObject irisObject = (IRISObject)(iris.classMethodObject("Ens.StringContainer","%New",stringMessage));
		SendRequestAsync("InterSystems.Demo.PEX.MixedBusinessOperation",irisObject);
		System.out.print("\r\n[Java] ...demo.pex.BusinessService:OnProcessInput() sent '"+stringMessage+"' to 'InterSystems.Demo.PEX.MixedBusinessOperation'");
		return null;
	}

}
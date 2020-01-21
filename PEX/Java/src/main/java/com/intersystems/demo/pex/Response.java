package com.intersystems.demo.pex;

public class Response extends com.intersystems.enslib.pex.Message {

	public String responseString = null;
	
	public Response() {
	}
	
	public Response(String responseString) {
		this.responseString = responseString;
	}
	
}

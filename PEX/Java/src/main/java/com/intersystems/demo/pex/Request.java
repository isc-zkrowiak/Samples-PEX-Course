package com.intersystems.demo.pex;

public class Request extends com.intersystems.enslib.pex.Message {
	
	public String requestString = null;
	
	public Request() {
	}
	
	public Request(String requestString) {
		this.requestString = requestString;
	}
	
	public static void main(String[] args) {
    
        System.out.println("Hello World");

}
}

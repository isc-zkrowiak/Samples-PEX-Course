package demo;


import demo.InboundService;
import demo.CustomMessage;

public class InboundAdapter extends com.intersystems.enslib.pex.InboundAdapter {


    public void OnTask() throws Exception {

        
        CustomMessage messageInput = new CustomMessage();
        BusinessHost.ProcessInput(messageInput);


    }
}
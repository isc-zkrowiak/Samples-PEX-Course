
package demo;

import demo.CustomMessage;

public class CustomProcess extends com.intersystems.enslib.pex.BusinessProcess  {
    public String tNames;

    public java.lang.Object OnRequest(java.lang.Object request) throws java.lang.Exception {

        // cast request into appropriate type
        CustomMessage message = (CustomMessage)request;

        // arbitrary java code can be executed on the request object

        // send updated message to target hosts
        String[] targetNames =  tNames.split(",");
        for (String name : targetNames){
          SendRequestAsync(name, message);
        }
        return null;
      }
}
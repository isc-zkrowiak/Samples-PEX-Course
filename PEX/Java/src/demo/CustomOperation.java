package demo;

import com.intersystems.enslib.pex.BusinessOperation;
import demo.CustomMessage;
import java.io.FileWriter;
import java.io.File;

public class CustomOperation extends BusinessOperation {
    String fileName = "Output.txt";
    String outPath;

    public java.lang.Object OnMessage(java.lang.Object request) throws java.lang.Exception {
            CustomMessage message = (CustomMessage)request;
            
            File file = new File(outPath + "Output.txt");
            int count = 1;
            while (file.exists()) {
                String[] oldName = fileName.split(".");
                String newName = oldName[0] + count + oldName[1];
                file = new File(newName);
            }

            FileWriter writer = new FileWriter(file);

            writer.write("This customer's name is " + message.name + "\n");
            writer.write("His or her phone number is " + message.number + "\n");
            writer.write("He lives at " + message.address + "in the town or city of " + message.city);
            writer.close();


            return request;


      }
}
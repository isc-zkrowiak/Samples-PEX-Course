
// package finance;

// import org.apache.pdfbox.pdmodel.PDDocument;
// import org.apache.pdfbox.text.PDFTextStripper;


// public class PDFReader {
//     Boolean flag = true;
//     String filePath;
//     // 
//     PDFReader(String filePath) {
//       this.filePath = filePath;
//     }
//     public void run() {

//             String text;
                 
//             while (flag) {
//                   File file = new File(filePath);

//                   // Load file into memory, save as string, close document
//                   try {
//                       PDDocument doc = PDDocument.load(file);
//                         text = new PDFTextStripper().getText(doc);
//                       doc.close();

                  
//                   // Split text into array of individual lines and send each as its own message to IRIS
//                   String[] lines = text.split(System.lineSeparator());
                  
//                   for (int i = 0; i< lines.length; i++) {
//                       prod.LogMessage("Sending message: "+ lines[i], Severity.TRACE);
//                       prod.LogMessage("Sending with: "+ lines[i], Severity.INFO);
//                       prod.SendRequest(lines[i]);
//                   }
                  
//                   prod.LogMessage("End of file", Severity.INFO);
//                   flag = false;
                  
//               }
//             } catch (InterruptedException e) {
//               try {
//                 prod.LogMessage("Shutting down", Severity.INFO);
//               } catch (Exception e1) {
//                 e1.printStackTrace();
//               }
//               return;
//             } catch (Exception e) {
//               try {
//                   prod.LogMessage("In catch block.", Severity.INFO);
//                   prod.LogMessage(e.toString(), Severity.ERROR);
//                   prod.SetStatus(Production.Status.ERROR);
//               } catch (Exception e1) {
//                   e1.printStackTrace();
//               }
//             }	
//     }	
// }
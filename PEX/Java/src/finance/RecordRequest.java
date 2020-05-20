package finance;


public class RecordRequest extends com.intersystems.enslib.pex.Message {
    
    String date;
    String symbol;
    Float open;
    Float low;
    Float high;
    Float close;
    Integer volume;


}
package Finance;

// Property of TransactionRequest message that encapsulates account data.
public class PaymentProfile extends com.intersystems.enslib.pex.Message {

    public int AccountNumber;
    public int RoutingNumber;
    public String UserName;
}
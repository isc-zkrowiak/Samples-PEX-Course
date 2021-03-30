package Finance;

// Property of TransactionRequest message that encapsulates account data.
public class PaymentProfile extends com.intersystems.enslib.pex.Message {

    public int AccountNumber;
    public int RoutingNumber;
    public String UserName;

    // Constructor method for this nested class. Parses a payment profile line 
    // that looks like this:
    // PayTo:24224242|423533453|ERichards55
    public PaymentProfile(String profile) {

        // Break apart nested PaymentProfile objects and populate fields.
        // Create array to separate key from value using colon as splitting character
        String tempStringArray = profile.split(":")[1];

        // Create second array that splits the value by pipe (|) delimiter character
        String[] FPaymentProfile = tempStringArray.split("\\|");

        // Assign fields to the appropriate properties in this object
        this.AccountNumber  = Integer.parseInt(FPaymentProfile[0]);
        this.RoutingNumber = Integer.parseInt(FPaymentProfile[1]);
        this.UserName = FPaymentProfile[2];
    }
}
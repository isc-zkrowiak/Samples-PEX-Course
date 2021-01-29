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
        String[] tempStringArray = profile.split(":");

        // Create second array that splits the value by pipe (|) delimeter character
        String[] PaymentProfile = tempStringArray[1].split("\\|");

        // Assign fields to the appropriate properties in this object
        this.AccountNumber  = Integer.parseInt(PaymentProfile[0]);
        this.RoutingNumber = Integer.parseInt(PaymentProfile[1]);
        this.UserName = PaymentProfile[2];
    }
}
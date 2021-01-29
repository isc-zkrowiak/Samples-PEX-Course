package Finance;

import Finance.PaymentProfile;

// Main PEX message class containing properties representing a request for a peer-to-peer
// transaction.
public class TransactionRequest extends com.intersystems.enslib.pex.Message {



    public double TransactionAmount; // The amount being transferred between accounts
    public PaymentProfile PayFrom; // The bank information for the paying party's account encapsulated in the Finance.PaymentProfile object
    public PaymentProfile PayTo;  // The bank information for the receiving party's account encapsulated in the Finance.PaymentProfile object
    public String CurrencyFrom; // The currency of of the paying party's account
    public String CurrencyTo;  // The currency of the receiving party's account

    // Instantiate subclass objects to make populating them faster. Using 'F' prefix to indicate arguments are read from File
    // and not yet parsed.
    public TransactionRequest(String FTransactionAmount, String FPayFrom, String FPayTo,String FCurrencyFrom,String FCurrencyTo){
        
        // Set fields of message. An actual implementation would need to verify that
        // message structure is valid.
        TransactionAmount = Float.parseFloat(FTransactionAmount.split(":")[1]);

        // construct nested PaymentProfile objects using separate constructor.
        PayFrom = new PaymentProfile(FPayFrom);
        PayTo = new PaymentProfile(FPayTo);

        // Set currency fields.
        CurrencyFrom = FCurrencyFrom.split(":")[1];
        CurrencyTo = FCurrencyTo.split(":")[1];
    }

}
package Finance;

import Finance.PaymentProfile;

// Main PEX message class containing properties representing a request for a peer-to-peer
// transaction.
public class TransactionRequest extends com.intersystems.enslib.pex.Message {



    public double TransactionAmount; // The amount being transferred between accounts
    public PaymentProfile PayFrom; // The bank information for the paying party's account encapsulated in the Finance.PaymentProfile object
    public PaymentProfile PayTo;  // The bank information for the receiving party's account encapsulated in the Finance.PaymentProfile object
    public String FromCurrency; // The currency of of the paying party's account
    public String ToCurrency;  // The currency of the receiving party's account

    // Instantiate subclass objects to make populating them faster.
    public TransactionRequest(){
        PayFrom = new PaymentProfile();
        PayTo = new PaymentProfile();
    }

}
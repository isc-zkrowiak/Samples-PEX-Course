

namespace Finance{

    using Finance;

    // Main PEX message class containing properties representing a request for a peer-to-peer
    // transaction.
    public class  TransactionRequest: InterSystems.EnsLib.PEX.Message {



        public decimal TransactionAmount; // The amount being transferred between accounts
        public PaymentProfile PayFrom; // The bank information for the paying party's account encapsulated in the Finance.PaymentProfile object
        public PaymentProfile PayTo; // The bank information for the receiving party's account encapsulated in the Finance.PaymentProfile object
        public string FromCurrency; // The currency of of the paying party's account
        public string ToCurrency; // The currency of the receiving party's account

        // Instantiate subclass objects to make populating them faster.
        public TransactionRequest(){
            PayFrom = new PaymentProfile();
            PayTo = new PaymentProfile();
        }

    }

}
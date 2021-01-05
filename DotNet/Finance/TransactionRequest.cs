

namespace Finance{

    using Finance;

    // Main PEX message class.
    public class  TransactionRequest: InterSystems.EnsLib.PEX.Message {



        public decimal TransactionAmount;
        public PaymentProfile PayFrom;
        public PaymentProfile PayTo;
        public string FromCurrency;
        public string ToCurrency;

        // Instantiate subclass objects to make populating them faster.
        public TransactionRequest(){
            PayFrom = new PaymentProfile();
            PayTo = new PaymentProfile();
        }

    }

}


namespace Finance{

    using Finance;
    public class TransactionRequest : InterSystems.EnsLib.PEX.Message {



        public decimal TransactionAmount;
        public PaymentProfile PayFrom;
        public PaymentProfile PayTo;
        public string FromCurrency;
        public string ToCurrency;

        public TransactionRequest(){
            PayFrom = new PaymentProfile();
            PayTo = new PaymentProfile();
        }

    }

}
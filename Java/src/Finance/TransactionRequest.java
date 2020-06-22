package Finance;

import Finance.PaymentProfile;

public class TransactionRequest extends com.intersystems.enslib.pex.Message {



    public double TransactionAmount;
    public PaymentProfile PayFrom;
    public PaymentProfile PayTo;
    public String FromCurrency;
    public String ToCurrency;

    public TransactionRequest(){
        PayFrom = new PaymentProfile();
        PayTo = new PaymentProfile();
    }

}
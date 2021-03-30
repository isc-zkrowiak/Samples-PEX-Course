using System; 
using System.Collections.Generic; // Import class to deal with enumerators

namespace Finance{

    using Finance;

    // Main PEX message class containing properties representing a request for a peer-to-peer
    // transaction.
    public class  TransactionRequest: InterSystems.EnsLib.PEX.Message {



        public decimal TransactionAmount; // The amount being transferred between accounts
        public PaymentProfile PayFrom; // The bank information for the paying party's account encapsulated in the Finance.PaymentProfile object
        public PaymentProfile PayTo; // The bank information for the receiving party's account encapsulated in the Finance.PaymentProfile object
        public string CurrencyFrom; // The currency of of the paying party's account
        public string CurrencyTo; // The currency of the receiving party's account

        // Instantiate subclass objects to make populating them faster.
        public TransactionRequest(IEnumerator<string> reader){

                reader.MoveNext();
                // Set fields of message. An actual implementation would need to verify that
                // message structure is valid.
                TransactionAmount = Decimal.Parse(reader.Current.Split(":")[1]);

                // After accessing each item, advance the Enumerable index for the reader object.
                reader.MoveNext();
                // construct nested PaymentProfile objects using separate constructor.

                
                PayFrom = new PaymentProfile(reader.Current);
                reader.MoveNext();
                PayTo = new PaymentProfile(reader.Current);
                reader.MoveNext();

                // Set currency fields.
                CurrencyFrom = reader.Current.Split(":")[1];
                reader.MoveNext();
                CurrencyTo = reader.Current.Split(":")[1];
        }

        // Overload class constructor method so that casting from Object class works correctly
        public TransactionRequest() {
            
        }

    }

}
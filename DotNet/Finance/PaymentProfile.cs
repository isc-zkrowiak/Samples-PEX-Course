using System;
using Finance;


namespace Finance {
    
    // Property of TransactionRequest message that encapsulates account data.
    public class PaymentProfile : InterSystems.EnsLib.PEX.Message {
        
        public int AccountNumber;
        
        public int RoutingNumber;
        
        public string UserName;

        // Constructor method for this nested class. Parses a payment profile line 
        // that looks like this:
        // PayTo:24224242|423533453|ERichards55
        public PaymentProfile(string profile) {


            // Break apart nested PaymentProfile objects and populate fields.
            // Create array to separate key from value using colon as splitting character
            string[] tempStringArray = profile.Split(":");

            // Create second array that splits the value by pipe (|) delimeter character
            string[] FPaymentProfile = tempStringArray[1].Split("|");

            // Assign fields to the appropriate properties in this object
            this.AccountNumber  = int.Parse(FPaymentProfile[0]);
            this.RoutingNumber = int.Parse(FPaymentProfile[1]);
            this.UserName = FPaymentProfile[2];
        
        }
        // Overload class constructor method so that casting from Object class works correctly
        public PaymentProfile(){
            
        }

    }

}
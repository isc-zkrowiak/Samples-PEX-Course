using System;
using InterSystems.EnsLib.PEX;
using InterSystems.Data.IRISClient.ADO;

namespace InterSystems.Demo.PEX
{
    class BusinessProcess : InterSystems.EnsLib.PEX.BusinessProcess
    {
        [Persistent]
        public int runningTotal = 0;

        public override void OnInit()
        {
            Console.Write("\r\n[.NET] ...Demo.PEX.BusinessProcess:OnInit() is called");
            return;
        }

        public override void OnTearDown()
        {
            Console.Write("\r\n[.NET] ...Demo.PEX.BusinessProcess:OnTearDown() is called");
            return;
        }

        public override object OnRequest(object request)
        {
            Console.Write("\r\n[.NET] ...Demo.PEX.BusinessProcess:OnRequest() is called with \"" + ((Request)request).requestString + "\"");
            for (int i = 0; i < 4; i++)
            {
                SendRequestAsync("Demo.PEX.RandomGenerator", (IRISObject)null, true, "request #" + (i + 1));
            }
            SetTimer(7, "myTimer");
            Reply(null);
            return null;
        }

        public override object OnResponse(object request, object response, object callRequest, object callResponse, string pCompletionKey)
        {
            if (pCompletionKey.Equals("myTimer"))
            {
                Console.Write("\r\n[.NET] ...Demo.PEX.BusinessProcess:OnResponse() " + pCompletionKey + " received, remaining cancelled.");
                return null;
            }
            runningTotal = runningTotal + Int32.Parse(((Response)callResponse).responseString);
            Console.Write("\r\n[.NET] ...Demo.PEX.BusinessProcess:OnResponse() " + pCompletionKey + " returns " + ((Response)callResponse).responseString + ",  runningTotal = " + runningTotal);
            return null;
        }

        public override object OnComplete(object request, object response)
        {
            Console.Write("\r\n[.NET] ...Demo.PEX.BusinessProcess:OnComplete() is called, final runningTotal = " + runningTotal);
            return null;
        }

    }
}

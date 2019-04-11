// Install the C# / .NET helper library from twilio.com/docs/csharp/install

using System;
using Twilio;
using Twilio.Rest.Api.V2010.Account;


public class TwilioObj
{
    public TwilioObj(int scholarshipNum, int jobNum)
    {
        // Find your Account Sid and Token at twilio.com/console
        // DANGER! This is insecure. See http://twil.io/secure
        const string accountSid = "AC8037eb8af9379976245f3cf6f232ab66";
        const string authToken = "8bf06472bc5fc06603aa06068e7e252f";

        TwilioClient.Init(accountSid, authToken);

        var message = MessageResource.Create(
            body: "You have " + scholarshipNum + " pending scholarships and " + jobNum + " jobs pending approval.",
            from: new Twilio.Types.PhoneNumber("+15402534874"),
            to: new Twilio.Types.PhoneNumber("+16316268854")
        );

     
    

        Console.WriteLine(message.Sid);
    }
}

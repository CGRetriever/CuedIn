// Install the C# / .NET helper library from twilio.com/docs/csharp/install

using System;
using Twilio;
using Twilio.Rest.Api.V2010.Account;


public class TwilioObj
{
    public TwilioObj()
    {
        // Find your Account Sid and Token at twilio.com/console
        // DANGER! This is insecure. See http://twil.io/secure
        const string accountSid = "AC8037eb8af9379976245f3cf6f232ab66";
        const string authToken = "8bf06472bc5fc06603aa06068e7e252f";

        TwilioClient.Init(accountSid, authToken);

        var message = MessageResource.Create(
            body: "Join Earth's mightiest heroes. Like Kevin Bacon.",
            from: new Twilio.Types.PhoneNumber("+15402534874"),
            to: new Twilio.Types.PhoneNumber("+16316268854")
        );

        Console.WriteLine(message.Sid);
    }
}

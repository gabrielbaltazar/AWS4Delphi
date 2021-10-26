program SampleSNS;

uses
  Vcl.Forms,
  FSampleSNS in 'FSampleSNS.pas' {Form1},
  AWS4D.SNS.Service in '..\..\Source\SNS\AWS4D.SNS.Service.pas',
  AWS4D.SNS.Service.Interfaces in '..\..\Source\SNS\AWS4D.SNS.Service.Interfaces.pas',
  AWS4D.SNS.Model.Interfaces in '..\..\Source\SNS\AWS4D.SNS.Model.Interfaces.pas',
  AWS4D.SNS.Model.ListTopics.Request in '..\..\Source\SNS\AWS4D.SNS.Model.ListTopics.Request.pas',
  AWS4D.SNS.Model.ListTopics.Response in '..\..\Source\SNS\AWS4D.SNS.Model.ListTopics.Response.pas',
  AWS4D.Core.Helper.JSON in '..\..\Source\Core\AWS4D.Core.Helper.JSON.pas',
  AWS4D.Core.Model.Attribute in '..\..\Source\Core\AWS4D.Core.Model.Attribute.pas',
  AWS4D.Core.Model.Classes in '..\..\Source\Core\AWS4D.Core.Model.Classes.pas',
  AWS4D.Core.Model.Iterator in '..\..\Source\Core\AWS4D.Core.Model.Iterator.pas',
  AWS4D.Core.Model.Tag in '..\..\Source\Core\AWS4D.Core.Model.Tag.pas',
  AWS4D.Core.Model.Types in '..\..\Source\Core\AWS4D.Core.Model.Types.pas',
  AWS4D.SNS.Facade.Interfaces in '..\..\Source\SNS\AWS4D.SNS.Facade.Interfaces.pas',
  AWS4D.SNS.Facade.ListTopics in '..\..\Source\SNS\AWS4D.SNS.Facade.ListTopics.pas',
  AWS4D.SNS.Facade in '..\..\Source\SNS\AWS4D.SNS.Facade.pas',
  AWS4D.SNS.Model.ListSubscriptions.Request in '..\..\Source\SNS\AWS4D.SNS.Model.ListSubscriptions.Request.pas',
  AWS4D.SNS.Model.ListSubscriptions.Response in '..\..\Source\SNS\AWS4D.SNS.Model.ListSubscriptions.Response.pas',
  AWS4D.SNS.Facade.ListSubscriptions in '..\..\Source\SNS\AWS4D.SNS.Facade.ListSubscriptions.pas',
  AWS4D.SNS.Model.CreateTopic.Response in '..\..\Source\SNS\AWS4D.SNS.Model.CreateTopic.Response.pas',
  AWS4D.SNS.Model.CreateTopic.Request in '..\..\Source\SNS\AWS4D.SNS.Model.CreateTopic.Request.pas',
  AWS4D.SNS.Facade.CreateTopic in '..\..\Source\SNS\AWS4D.SNS.Facade.CreateTopic.pas',
  AWS4D.SNS.Model.DeleteTopic.Request in '..\..\Source\SNS\AWS4D.SNS.Model.DeleteTopic.Request.pas',
  AWS4D.SNS.Facade.DeleteTopic in '..\..\Source\SNS\AWS4D.SNS.Facade.DeleteTopic.pas',
  AWS4D.SNS.Model.Types in '..\..\Source\SNS\AWS4D.SNS.Model.Types.pas',
  AWS4D.SNS.Model.Subscribe.Request in '..\..\Source\SNS\AWS4D.SNS.Model.Subscribe.Request.pas',
  AWS4D.SNS.Model.Subscribe.Response in '..\..\Source\SNS\AWS4D.SNS.Model.Subscribe.Response.pas',
  AWS4D.SNS.Facade.Subscribe in '..\..\Source\SNS\AWS4D.SNS.Facade.Subscribe.pas',
  AWS4D.SNS.Model.Unsubscribe.Request in '..\..\Source\SNS\AWS4D.SNS.Model.Unsubscribe.Request.pas',
  AWS4D.SNS.Facade.Unsubscribe in '..\..\Source\SNS\AWS4D.SNS.Facade.Unsubscribe.pas',
  AWS4D.SNS.Model.SetTopicAttributes.Request in '..\..\Source\SNS\AWS4D.SNS.Model.SetTopicAttributes.Request.pas',
  AWS4D.SNS.Facade.SetTopicAttributes in '..\..\Source\SNS\AWS4D.SNS.Facade.SetTopicAttributes.pas',
  AWS4D.SNS.Model.SetSubscriptionAttributes.Request in '..\..\Source\SNS\AWS4D.SNS.Model.SetSubscriptionAttributes.Request.pas',
  AWS4D.SNS.Facade.SetSubscriptionAttributes in '..\..\Source\SNS\AWS4D.SNS.Facade.SetSubscriptionAttributes.pas',
  AWS4D.SNS.Model.Publish.Request in '..\..\Source\SNS\AWS4D.SNS.Model.Publish.Request.pas',
  AWS4D.SNS.Model.Publish.Response in '..\..\Source\SNS\AWS4D.SNS.Model.Publish.Response.pas',
  AWS4D.SNS.Facade.Publish in '..\..\Source\SNS\AWS4D.SNS.Facade.Publish.pas',
  AWS4D.SNS.Model.SetPlatformApplicationAttributes.Request in '..\..\Source\SNS\AWS4D.SNS.Model.SetPlatformApplicationAttributes.Request.pas',
  AWS4D.SNS.Facade.SetPlatformApplicationAttributes in '..\..\Source\SNS\AWS4D.SNS.Facade.SetPlatformApplicationAttributes.pas',
  AWS4D.SNS.Model.SetEndpointAttributes.Request in '..\..\Source\SNS\AWS4D.SNS.Model.SetEndpointAttributes.Request.pas',
  AWS4D.SNS.Facade.SetEndpointAttributes in '..\..\Source\SNS\AWS4D.SNS.Facade.SetEndpointAttributes.pas',
  AWS4D.SNS.Model.AddPermission.Request in '..\..\Source\SNS\AWS4D.SNS.Model.AddPermission.Request.pas',
  AWS4D.SNS.Facade.AddPermission in '..\..\Source\SNS\AWS4D.SNS.Facade.AddPermission.pas',
  AWS4D.SNS.Model.CheckIfPhoneNumberIsOptedOut.Request in '..\..\Source\SNS\AWS4D.SNS.Model.CheckIfPhoneNumberIsOptedOut.Request.pas',
  AWS4D.SNS.Model.CheckIfPhoneNumberIsOptedOut.Response in '..\..\Source\SNS\AWS4D.SNS.Model.CheckIfPhoneNumberIsOptedOut.Response.pas',
  AWS4D.SNS.Facade.CheckIfPhoneNumberIsOptedOut in '..\..\Source\SNS\AWS4D.SNS.Facade.CheckIfPhoneNumberIsOptedOut.pas',
  AWS4D.SNS.Model.ConfirmSubscription.Request in '..\..\Source\SNS\AWS4D.SNS.Model.ConfirmSubscription.Request.pas',
  AWS4D.SNS.Model.ConfirmSubscription.Response in '..\..\Source\SNS\AWS4D.SNS.Model.ConfirmSubscription.Response.pas',
  AWS4D.SNS.Facade.ConfirmSubscription in '..\..\Source\SNS\AWS4D.SNS.Facade.ConfirmSubscription.pas',
  AWS4D.SNS.Model.CreateSMSSandboxPhoneNumber.Request in '..\..\Source\SNS\AWS4D.SNS.Model.CreateSMSSandboxPhoneNumber.Request.pas',
  AWS4D.SNS.Facade.CreateSMSSandboxPhoneNumber in '..\..\Source\SNS\AWS4D.SNS.Facade.CreateSMSSandboxPhoneNumber.pas',
  AWS4D.SNS.Model.DeleteSMSSandboxPhoneNumber.Request in '..\..\Source\SNS\AWS4D.SNS.Model.DeleteSMSSandboxPhoneNumber.Request.pas',
  AWS4D.SNS.Facade.DeleteSMSSandboxPhoneNumber in '..\..\Source\SNS\AWS4D.SNS.Facade.DeleteSMSSandboxPhoneNumber.pas',
  AWS4D.SNS.Model.GetSMSSandboxAccountStatus.Response in '..\..\Source\SNS\AWS4D.SNS.Model.GetSMSSandboxAccountStatus.Response.pas',
  AWS4D.SNS.Facade.GetSMSSandboxAccountStatus in '..\..\Source\SNS\AWS4D.SNS.Facade.GetSMSSandboxAccountStatus.pas',
  AWS4D.SNS.Model.GetSubscriptionAttributes.Request in '..\..\Source\SNS\AWS4D.SNS.Model.GetSubscriptionAttributes.Request.pas',
  AWS4D.SNS.Model.GetSubscriptionAttributes.Response in '..\..\Source\SNS\AWS4D.SNS.Model.GetSubscriptionAttributes.Response.pas',
  AWS4D.SNS.Facade.GetSubscriptionAttributes in '..\..\Source\SNS\AWS4D.SNS.Facade.GetSubscriptionAttributes.pas',
  AWS4D.SNS.Model.GetTopicAttributes.Request in '..\..\Source\SNS\AWS4D.SNS.Model.GetTopicAttributes.Request.pas',
  AWS4D.SNS.Model.GetTopicAttributes.Response in '..\..\Source\SNS\AWS4D.SNS.Model.GetTopicAttributes.Response.pas';

{$R *.res}

begin
  Application.Initialize;
  ReportMemoryLeaksOnShutdown := true;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.

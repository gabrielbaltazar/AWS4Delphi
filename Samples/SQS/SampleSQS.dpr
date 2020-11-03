program SampleSQS;

uses
  Vcl.Forms,
  FSampleSQS in 'FSampleSQS.pas' {Form2},
  AWS4D.Service.Interfaces in '..\..\Source\Base\AWS4D.Service.Interfaces.pas',
  AWS4D.SQS.Model.ListQueuesResponse in '..\..\Source\SQS\AWS4D.SQS.Model.ListQueuesResponse.pas',
  AWS4D.SQS.Service.Interfaces in '..\..\Source\SQS\AWS4D.SQS.Service.Interfaces.pas',
  AWS4D.SQS.Model.Interfaces in '..\..\Source\SQS\AWS4D.SQS.Model.Interfaces.pas',
  AWS4D.Model.Interfaces in '..\..\Source\Base\AWS4D.Model.Interfaces.pas',
  AWS4D.Model.ResponseMetadata in '..\..\Source\Base\AWS4D.Model.ResponseMetadata.pas',
  AWS4D.Model.Classes in '..\..\Source\Base\AWS4D.Model.Classes.pas',
  AWS4D.Service.Base in '..\..\Source\Base\AWS4D.Service.Base.pas',
  AWS4D.SQS.Service.Base in '..\..\Source\SQS\AWS4D.SQS.Service.Base.pas',
  AWS4D.Authorization.Interfaces in '..\..\Source\Base\AWS4D.Authorization.Interfaces.pas',
  AWS4D.Authorization.Base in '..\..\Source\Base\AWS4D.Authorization.Base.pas',
  AWS4D.Authorization.Sign2HmacSHA256 in '..\..\Source\Base\AWS4D.Authorization.Sign2HmacSHA256.pas',
  AWS4D.Utils in '..\..\Source\Base\AWS4D.Utils.pas',
  AWS4D.HTTP.Interfaces in '..\..\Source\Base\AWS4D.HTTP.Interfaces.pas',
  AWS4D.HTTP.Base in '..\..\Source\Base\AWS4D.HTTP.Base.pas',
  AWS4D.HTTP.RestClient in '..\..\Source\Base\AWS4D.HTTP.RestClient.pas',
  AWS4D.SQS.Model.Classes in '..\..\Source\SQS\AWS4D.SQS.Model.Classes.pas',
  AWS4D.SQS.Model.Factory in '..\..\Source\SQS\AWS4D.SQS.Model.Factory.pas',
  AWS4D.SQS.Model.ListQueuesRequest in '..\..\Source\SQS\AWS4D.SQS.Model.ListQueuesRequest.pas',
  AWS4D.Model.Exceptions in '..\..\Source\Base\AWS4D.Model.Exceptions.pas',
  AWS4D.SQS.Model.ReceiveMessageRequest in '..\..\Source\SQS\AWS4D.SQS.Model.ReceiveMessageRequest.pas',
  AWS4D.SQS.Model.ReceiveMessage in '..\..\Source\SQS\AWS4D.SQS.Model.ReceiveMessage.pas',
  AWS4D.SQS.Model.ListQueueTagsResponse in '..\..\Source\SQS\AWS4D.SQS.Model.ListQueueTagsResponse.pas',
  AWS4D.SQS.Model.GetQueueUrlResponse in '..\..\Source\SQS\AWS4D.SQS.Model.GetQueueUrlResponse.pas',
  AWS4D.SQS.Model.ReceiveMessageResponse in '..\..\Source\SQS\AWS4D.SQS.Model.ReceiveMessageResponse.pas',
  AWS4D.SQS.Model.SendMessageRequest in '..\..\Source\SQS\AWS4D.SQS.Model.SendMessageRequest.pas',
  AWS4D.SQS.Model.SendMessageResponse in '..\..\Source\SQS\AWS4D.SQS.Model.SendMessageResponse.pas',
  AWS4D.SQS.Model.DeleteMessageRequest in '..\..\Source\SQS\AWS4D.SQS.Model.DeleteMessageRequest.pas',
  AWS4D.SQS.Model.DeleteMessageResponse in '..\..\Source\SQS\AWS4D.SQS.Model.DeleteMessageResponse.pas',
  AWS4D.SQS.Model.CreateQueueResponse in '..\..\Source\SQS\AWS4D.SQS.Model.CreateQueueResponse.pas',
  AWS4D.SQS.Model.CreateQueueRequest in '..\..\Source\SQS\AWS4D.SQS.Model.CreateQueueRequest.pas',
  AWS4D.SQS.Model.DeleteMessageBatchRequest in '..\..\Source\SQS\AWS4D.SQS.Model.DeleteMessageBatchRequest.pas',
  AWS4D.SQS.Model.DeleteMessageBatchResponse in '..\..\Source\SQS\AWS4D.SQS.Model.DeleteMessageBatchResponse.pas',
  AWS4D.SQS.Model.GetQueueAttributesRequest in '..\..\Source\SQS\AWS4D.SQS.Model.GetQueueAttributesRequest.pas',
  AWS4D.SQS.Model.GetQueueAttributesResponse in '..\..\Source\SQS\AWS4D.SQS.Model.GetQueueAttributesResponse.pas',
  AWS4D.SQS.Model.PurgeQueueResponse in '..\..\Source\SQS\AWS4D.SQS.Model.PurgeQueueResponse.pas',
  AWS4D.SQS.Model.TagQueueRequest in '..\..\Source\SQS\AWS4D.SQS.Model.TagQueueRequest.pas',
  AWS4D.SQS.Model.TagQueueResponse in '..\..\Source\SQS\AWS4D.SQS.Model.TagQueueResponse.pas',
  AWS4D.SQS.Model.UntagQueueRequest in '..\..\Source\SQS\AWS4D.SQS.Model.UntagQueueRequest.pas',
  AWS4D.SQS.Model.UntagQueueResponse in '..\..\Source\SQS\AWS4D.SQS.Model.UntagQueueResponse.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.

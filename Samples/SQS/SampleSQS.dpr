program SampleSQS;

uses
  Vcl.Forms,
  FSampleSQS in 'FSampleSQS.pas' {Form2},
  AWS4D.Core.Model.Types in '..\..\Source\Core\AWS4D.Core.Model.Types.pas',
  AWS4D.Core.Model.Iterator in '..\..\Source\Core\AWS4D.Core.Model.Iterator.pas',
  AWS4D.Core.Helper.JSON in '..\..\Source\Core\AWS4D.Core.Helper.JSON.pas',
  AWS4D.Core.Model.Attribute in '..\..\Source\Core\AWS4D.Core.Model.Attribute.pas',
  AWS4D.Core.Model.Classes in '..\..\Source\Core\AWS4D.Core.Model.Classes.pas',
  AWS4D.SQS.Facade.Interfaces in '..\..\Source\SQS\AWS4D.SQS.Facade.Interfaces.pas',
  AWS4D.SQS.Facade.ListQueues in '..\..\Source\SQS\AWS4D.SQS.Facade.ListQueues.pas',
  AWS4D.SQS.Facade.ListQueueTags in '..\..\Source\SQS\AWS4D.SQS.Facade.ListQueueTags.pas',
  AWS4D.SQS.Facade in '..\..\Source\SQS\AWS4D.SQS.Facade.pas',
  AWS4D.SQS.Model.Interfaces in '..\..\Source\SQS\AWS4D.SQS.Model.Interfaces.pas',
  AWS4D.SQS.Model.ListQueues.Request in '..\..\Source\SQS\AWS4D.SQS.Model.ListQueues.Request.pas',
  AWS4D.SQS.Model.ListQueues.Response in '..\..\Source\SQS\AWS4D.SQS.Model.ListQueues.Response.pas',
  AWS4D.SQS.Model.ListQueueTags.Request in '..\..\Source\SQS\AWS4D.SQS.Model.ListQueueTags.Request.pas',
  AWS4D.SQS.Model.ListQueueTags.Response in '..\..\Source\SQS\AWS4D.SQS.Model.ListQueueTags.Response.pas',
  AWS4D.SQS.Service.Interfaces in '..\..\Source\SQS\AWS4D.SQS.Service.Interfaces.pas',
  AWS4D.SQS.Service in '..\..\Source\SQS\AWS4D.SQS.Service.pas',
  AWS4D.SQS.Model.GetQueueUrl.Request in '..\..\Source\SQS\AWS4D.SQS.Model.GetQueueUrl.Request.pas',
  AWS4D.SQS.Model.GetQueueUrl.Response in '..\..\Source\SQS\AWS4D.SQS.Model.GetQueueUrl.Response.pas',
  AWS4D.SQS.Facade.GetQueueUrl in '..\..\Source\SQS\AWS4D.SQS.Facade.GetQueueUrl.pas',
  AWS4D.SQS.Model.SendMessage.Request in '..\..\Source\SQS\AWS4D.SQS.Model.SendMessage.Request.pas',
  AWS4D.SQS.Model.SendMessage.Response in '..\..\Source\SQS\AWS4D.SQS.Model.SendMessage.Response.pas',
  AWS4D.SQS.Facade.SendMessage in '..\..\Source\SQS\AWS4D.SQS.Facade.SendMessage.pas',
  AWS4D.SQS.Model.ReceiveMessage.Request in '..\..\Source\SQS\AWS4D.SQS.Model.ReceiveMessage.Request.pas',
  AWS4D.SQS.Model.ReceiveMessage in '..\..\Source\SQS\AWS4D.SQS.Model.ReceiveMessage.pas',
  AWS4D.SQS.Model.ReceiveMessage.Response in '..\..\Source\SQS\AWS4D.SQS.Model.ReceiveMessage.Response.pas',
  AWS4D.SQS.Facade.ReceiveMessage in '..\..\Source\SQS\AWS4D.SQS.Facade.ReceiveMessage.pas',
  AWS4D.SQS.Model.DeleteMessage.Request in '..\..\Source\SQS\AWS4D.SQS.Model.DeleteMessage.Request.pas',
  AWS4D.SQS.Facade.DeleteMessage in '..\..\Source\SQS\AWS4D.SQS.Facade.DeleteMessage.pas',
  AWS4D.SQS.Model.DeleteQueue.Request in '..\..\Source\SQS\AWS4D.SQS.Model.DeleteQueue.Request.pas',
  AWS4D.SQS.Facade.DeleteQueue in '..\..\Source\SQS\AWS4D.SQS.Facade.DeleteQueue.pas',
  AWS4D.SQS.Model.PurgeQueue.Request in '..\..\Source\SQS\AWS4D.SQS.Model.PurgeQueue.Request.pas',
  AWS4D.SQS.Facade.PurgeQueue in '..\..\Source\SQS\AWS4D.SQS.Facade.PurgeQueue.pas',
  AWS4D.SQS.Model.TagQueue.Request in '..\..\Source\SQS\AWS4D.SQS.Model.TagQueue.Request.pas',
  AWS4D.SQS.Facade.TagQueue in '..\..\Source\SQS\AWS4D.SQS.Facade.TagQueue.pas',
  AWS4D.SQS.Model.UnTagQueue.Request in '..\..\Source\SQS\AWS4D.SQS.Model.UnTagQueue.Request.pas',
  AWS4D.SQS.Facade.UnTagQueue in '..\..\Source\SQS\AWS4D.SQS.Facade.UnTagQueue.pas',
  AWS4D.SQS.Model.GetQueueAttributes.Request in '..\..\Source\SQS\AWS4D.SQS.Model.GetQueueAttributes.Request.pas',
  AWS4D.SQS.Model.GetQueueAttributes.Response in '..\..\Source\SQS\AWS4D.SQS.Model.GetQueueAttributes.Response.pas',
  AWS4D.SQS.Facade.GetQueueAttributes in '..\..\Source\SQS\AWS4D.SQS.Facade.GetQueueAttributes.pas',
  AWS4D.SQS.Model.DeleteMessageBatch.Request in '..\..\Source\SQS\AWS4D.SQS.Model.DeleteMessageBatch.Request.pas',
  AWS4D.SQS.Facade.DeleteMessageBatch in '..\..\Source\SQS\AWS4D.SQS.Facade.DeleteMessageBatch.pas',
  AWS4D.SQS.Model.CreateQueue.Request in '..\..\Source\SQS\AWS4D.SQS.Model.CreateQueue.Request.pas',
  AWS4D.SQS.Model.CreateQueue.Response in '..\..\Source\SQS\AWS4D.SQS.Model.CreateQueue.Response.pas',
  AWS4D.SQS.Facade.CreateQueue in '..\..\Source\SQS\AWS4D.SQS.Facade.CreateQueue.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.

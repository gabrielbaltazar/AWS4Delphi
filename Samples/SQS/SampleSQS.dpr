program SampleSQS;

uses
  Vcl.Forms,
  FSampleSQS in 'FSampleSQS.pas' {Form2},
  AWS4D.Core.Model.Types in '..\..\Source\Core\AWS4D.Core.Model.Types.pas',
  AWS4D.Core.Model.Iterator in '..\..\Source\Core\AWS4D.Core.Model.Iterator.pas',
  AWS4D.Core.Helper.JSON in '..\..\Source\Core\AWS4D.Core.Helper.JSON.pas',
  AWS4D.Core.Model.Tag in '..\..\Source\Core\AWS4D.Core.Model.Tag.pas',
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
  AWS4D.SQS.Facade.SendMessage in '..\..\Source\SQS\AWS4D.SQS.Facade.SendMessage.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.

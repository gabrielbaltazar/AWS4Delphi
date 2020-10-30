program SampleSQS;

uses
  Vcl.Forms,
  FSampleSQS in 'FSampleSQS.pas' {Form2},
  AWS4D.Service.Interfaces in '..\..\Source\Base\AWS4D.Service.Interfaces.pas',
  AWS4D.SQS.Model.ListQueuesResult in '..\..\Source\SQS\AWS4D.SQS.Model.ListQueuesResult.pas',
  AWS4D.SQS.Service.Interfaces in '..\..\Source\SQS\AWS4D.SQS.Service.Interfaces.pas',
  AWS4D.SQS.Model.Interfaces in '..\..\Source\SQS\AWS4D.SQS.Model.Interfaces.pas',
  AWS4D.Model.Interfaces in '..\..\Source\Base\AWS4D.Model.Interfaces.pas',
  AWS4D.Model.ResponseMetadata in '..\..\Source\Base\AWS4D.Model.ResponseMetadata.pas',
  AWS4D.Model.Classes in '..\..\Source\Base\AWS4D.Model.Classes.pas',
  AWS4D.Service.Base in '..\..\Source\Base\AWS4D.Service.Base.pas',
  AWS4D.SQS.Service.Base in '..\..\Source\SQS\AWS4D.SQS.Service.Base.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.

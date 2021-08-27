program SampleSNS;

uses
  Vcl.Forms,
  FSampleSNS in 'FSampleSNS.pas' {Form1},
  AWS4D.SNS.Service in '..\..\Source\SNS\AWS4D.SNS.Service.pas',
  AWS4D.Core.Model.Types in '..\..\Source\Core\AWS4D.Core.Model.Types.pas',
  AWS4D.SNS.Service.Interfaces in '..\..\Source\SNS\AWS4D.SNS.Service.Interfaces.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.

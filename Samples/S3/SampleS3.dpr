program SampleS3;

uses
  Vcl.Forms,
  FSampleS3 in 'FSampleS3.pas' {frmSampleS3};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmSampleS3, frmSampleS3);
  Application.Run;
end.

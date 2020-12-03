program SampleS3;

uses
  Vcl.Forms,
  FSampleS3 in 'FSampleS3.pas' {frmSampleS3},
  AWS4D.Service.Base in '..\..\Source\Base\AWS4D.Service.Base.pas',
  AWS4D.Service.Interfaces in '..\..\Source\Base\AWS4D.Service.Interfaces.pas',
  AWS4D.Utils in '..\..\Source\Base\AWS4D.Utils.pas',
  AWS4D.S3.Service.Interfaces in '..\..\Source\S3\AWS4D.S3.Service.Interfaces.pas',
  AWS4D.S3.Service.CloudAPI in '..\..\Source\S3\AWS4D.S3.Service.CloudAPI.pas',
  AWS4D.S3.Model.Exceptions in '..\..\Source\S3\AWS4D.S3.Model.Exceptions.pas',
  AWS4D.S3.Model.Interfaces in '..\..\Source\S3\AWS4D.S3.Model.Interfaces.pas',
  AWS4D.S3.Model.CreateObject.Request in '..\..\Source\S3\AWS4D.S3.Model.CreateObject.Request.pas',
  AWS4D.Model.Classes in '..\..\Source\Base\AWS4D.Model.Classes.pas',
  AWS4D.Model.Exceptions in '..\..\Source\Base\AWS4D.Model.Exceptions.pas',
  AWS4D.Model.Interfaces in '..\..\Source\Base\AWS4D.Model.Interfaces.pas',
  AWS4D.Model.ResponseMetadata in '..\..\Source\Base\AWS4D.Model.ResponseMetadata.pas',
  AWS4D.S3.Model.Factory in '..\..\Source\S3\AWS4D.S3.Model.Factory.pas',
  AWS4D.S3.Model.ObjectInfo in '..\..\Source\S3\AWS4D.S3.Model.ObjectInfo.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmSampleS3, frmSampleS3);
  Application.Run;
end.

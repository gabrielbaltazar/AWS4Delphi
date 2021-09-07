program SampleS3;

uses
  Vcl.Forms,
  FSampleS3 in 'FSampleS3.pas' {frmSampleS3},
  AWS4D.S3.Model.Interfaces in '..\..\Source\S3\AWS4D.S3.Model.Interfaces.pas',
  AWS4D.Core.Helper.JSON in '..\..\Source\Core\AWS4D.Core.Helper.JSON.pas',
  AWS4D.Core.Model.Attribute in '..\..\Source\Core\AWS4D.Core.Model.Attribute.pas',
  AWS4D.Core.Model.Classes in '..\..\Source\Core\AWS4D.Core.Model.Classes.pas',
  AWS4D.Core.Model.Iterator in '..\..\Source\Core\AWS4D.Core.Model.Iterator.pas',
  AWS4D.Core.Model.Tag in '..\..\Source\Core\AWS4D.Core.Model.Tag.pas',
  AWS4D.Core.Model.Types in '..\..\Source\Core\AWS4D.Core.Model.Types.pas',
  AWS4D.S3.Model.ListBuckets.Response in '..\..\Source\S3\AWS4D.S3.Model.ListBuckets.Response.pas',
  AWS4D.S3.Service.Interfaces in '..\..\Source\S3\AWS4D.S3.Service.Interfaces.pas',
  AWS4D.S3.Service.CloudAPI in '..\..\Source\S3\AWS4D.S3.Service.CloudAPI.pas',
  AWS4D.S3.Facade.Interfaces in '..\..\Source\S3\AWS4D.S3.Facade.Interfaces.pas',
  AWS4D.S3.Facade.ListBuckets in '..\..\Source\S3\AWS4D.S3.Facade.ListBuckets.pas',
  AWS4D.S3.Facade in '..\..\Source\S3\AWS4D.S3.Facade.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmSampleS3, frmSampleS3);
  Application.Run;
end.

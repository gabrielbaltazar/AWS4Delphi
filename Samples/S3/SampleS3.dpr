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
  AWS4D.S3.Facade in '..\..\Source\S3\AWS4D.S3.Facade.pas',
  AWS4D.S3.Model.CreateBucket.Request in '..\..\Source\S3\AWS4D.S3.Model.CreateBucket.Request.pas',
  AWS4D.S3.Facade.CreateBucket in '..\..\Source\S3\AWS4D.S3.Facade.CreateBucket.pas',
  AWS4D.S3.Model.ExistBucket.Request in '..\..\Source\S3\AWS4D.S3.Model.ExistBucket.Request.pas',
  AWS4D.S3.Model.ExistBucket.Response in '..\..\Source\S3\AWS4D.S3.Model.ExistBucket.Response.pas',
  AWS4D.S3.Facade.ExistBucket in '..\..\Source\S3\AWS4D.S3.Facade.ExistBucket.pas',
  AWS4D.S3.Model.DeleteBucket.Request in '..\..\Source\S3\AWS4D.S3.Model.DeleteBucket.Request.pas',
  AWS4D.S3.Facade.DeleteBucket in '..\..\Source\S3\AWS4D.S3.Facade.DeleteBucket.pas',
  AWS4D.S3.Model.ObjectCreate.Request in '..\..\Source\S3\AWS4D.S3.Model.ObjectCreate.Request.pas',
  AWS4D.S3.Facade.ObjectCreate in '..\..\Source\S3\AWS4D.S3.Facade.ObjectCreate.pas',
  AWS4D.S3.Model.ObjectDelete.Request in '..\..\Source\S3\AWS4D.S3.Model.ObjectDelete.Request.pas',
  AWS4D.S3.Facade.ObjectDelete in '..\..\Source\S3\AWS4D.S3.Facade.ObjectDelete.pas',
  AWS4D.S3.Model.DownloadObject.Request in '..\..\Source\S3\AWS4D.S3.Model.DownloadObject.Request.pas',
  AWS4D.S3.Model.DownloadObject.Response in '..\..\Source\S3\AWS4D.S3.Model.DownloadObject.Response.pas',
  AWS4D.S3.Facade.DownloadObject in '..\..\Source\S3\AWS4D.S3.Facade.DownloadObject.pas',
  AWS4D.S3.Model.ExistObject.Request in '..\..\Source\S3\AWS4D.S3.Model.ExistObject.Request.pas',
  AWS4D.S3.Model.ExistObject.Response in '..\..\Source\S3\AWS4D.S3.Model.ExistObject.Response.pas',
  AWS4D.S3.Facade.ExistObject in '..\..\Source\S3\AWS4D.S3.Facade.ExistObject.pas',
  AWS4D.S3.Model.GetObjectProperties.Request in '..\..\Source\S3\AWS4D.S3.Model.GetObjectProperties.Request.pas',
  AWS4D.S3.Model.GetObjectProperties.Response in '..\..\Source\S3\AWS4D.S3.Model.GetObjectProperties.Response.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmSampleS3, frmSampleS3);
  Application.Run;
end.

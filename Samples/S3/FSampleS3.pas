unit FSampleS3;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.ComCtrls, System.IniFiles,
  System.Generics.Collections,

  AWS4D.S3.Facade.Interfaces,
//  AWS4D.S3.Model.Interfaces,
//  AWS4D.S3.Service.Interfaces,
  Vcl.Grids, Vcl.ValEdit;

type
  TS3Config = class
  private
    FaccessKeyId: string;
    FsecretKey: string;
    Fregion: String;
    Fbucket: String;
  public
    property accessKeyId: string read FaccessKeyId write FaccessKeyId;
    property secretKey: string read FsecretKey write FsecretKey;
    property region: String read Fregion write Fregion;
    property bucket: String read Fbucket write Fbucket;
  end;

  TfrmSampleS3 = class(TForm)
    pnlTop: TPanel;
    pnlHeader: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    edtAccessKey: TEdit;
    edtSecretKey: TEdit;
    edtRegion: TEdit;
    pgcS3: TPageControl;
    tsCreateBucket: TTabSheet;
    pnlCreateBucket: TPanel;
    Label7: TLabel;
    edtBucketBucketName: TEdit;
    btnCreateBucket: TButton;
    tsCreateObject: TTabSheet;
    Panel1: TPanel;
    Label4: TLabel;
    edtCreateObjectBucketName: TEdit;
    btnCreateObject: TButton;
    edtCreateObjectFileName: TEdit;
    Label5: TLabel;
    Label6: TLabel;
    edtCreateObjectObjectName: TEdit;
    btnCreateObjectSelectFile: TButton;
    FileDialog: TFileOpenDialog;
    tsListBucket: TTabSheet;
    Panel2: TPanel;
    btnListBuckets: TButton;
    mmoListBuckets: TMemo;
    btnExistBucket: TButton;
    btnDeleteBucket: TButton;
    tsListObjects: TTabSheet;
    Panel3: TPanel;
    Label8: TLabel;
    edtListObjectsBucketName: TEdit;
    btnListObjects: TButton;
    lstObjects: TListBox;
    btnDeleteObject: TButton;
    btnDownloadObject: TButton;
    btnObjectExist: TButton;
    Label9: TLabel;
    edtListObjectObjectName: TEdit;
    tsObjectProperties: TTabSheet;
    pnl1: TPanel;
    Label10: TLabel;
    edtGetObjectPropertiesBucketName: TEdit;
    Label11: TLabel;
    edtGetObjectPropertiesObjectName: TEdit;
    btnGetObjectProperties: TButton;
    pnlMetaData: TPanel;
    pnlMetaDataTitle: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    valueListMetaData: TValueListEditor;
    ValueListProperties: TValueListEditor;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure btnCreateBucketClick(Sender: TObject);
    procedure btnCreateObjectSelectFileClick(Sender: TObject);
    procedure edtCreateObjectFileNameChange(Sender: TObject);
    procedure btnCreateObjectClick(Sender: TObject);
    procedure btnListBucketsClick(Sender: TObject);
    procedure btnExistBucketClick(Sender: TObject);
    procedure btnDeleteBucketClick(Sender: TObject);
    procedure btnListObjectsClick(Sender: TObject);
    procedure btnDeleteObjectClick(Sender: TObject);
    procedure btnDownloadObjectClick(Sender: TObject);
    procedure btnObjectExistClick(Sender: TObject);
    procedure lstObjectsClick(Sender: TObject);
    procedure btnGetObjectPropertiesClick(Sender: TObject);
  private
    FS3: IAWS4DS3Facade;

    function GetIniFile: TIniFile;
    procedure SaveConfig;
    procedure LoadConfig;

    procedure S3Initialize;

    procedure selectFileDialog(AEdit: TEdit);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSampleS3: TfrmSampleS3;

implementation

{$R *.dfm}

{ TfrmSampleS3 }

procedure TfrmSampleS3.btnCreateBucketClick(Sender: TObject);
begin
  S3Initialize;
  FS3.CreateBucket
    .Request
      .BucketName(edtBucketBucketName.Text)
    .&End
    .Send;

  ShowMessage('Bucket created.');
end;

procedure TfrmSampleS3.btnCreateObjectClick(Sender: TObject);
begin
  S3Initialize;
  FS3.ObjectCreate
    .Request
      .BucketName(edtCreateObjectBucketName.Text)
      .ObjectName(edtCreateObjectObjectName.Text)
      .FileName(edtCreateObjectFileName.Text)
      .AddMetaInfo('meta-key', 'meta-value')
    .&End
    .Send;
end;

procedure TfrmSampleS3.btnCreateObjectSelectFileClick(Sender: TObject);
begin
  selectFileDialog(edtCreateObjectFileName);
end;

procedure TfrmSampleS3.btnDeleteBucketClick(Sender: TObject);
begin
  S3Initialize;
  FS3.DeleteBucket
    .Request
      .BucketName(edtBucketBucketName.Text)
    .&End
    .Send;

  ShowMessage('Bucket deleted.');
end;

procedure TfrmSampleS3.btnDeleteObjectClick(Sender: TObject);
begin
  S3Initialize;
  FS3.ObjectDelete
    .Request
      .BucketName(edtListObjectsBucketName.Text)
      .ObjectName(lstObjects.Items[lstObjects.ItemIndex])
    .&End
    .Send;

  btnListObjects.Click;
end;

procedure TfrmSampleS3.btnDownloadObjectClick(Sender: TObject);
begin
  S3Initialize;
  FS3.DownloadObject
    .Request
      .BucketName(edtListObjectsBucketName.Text)
      .ObjectName(edtListObjectObjectName.Text)
    .&End
    .Send
      .SaveToFile('test.txt');
end;

procedure TfrmSampleS3.btnExistBucketClick(Sender: TObject);
begin
  S3Initialize;
  FS3.ExistBucket
    .Request
      .BucketName(edtBucketBucketName.Text)
    .&End
    .Send;

  if FS3.ExistBucket.Response.Exist then
    ShowMessage('Bucket Exist.')
  else
    ShowMessage('Bucket Not Exist.')
end;

procedure TfrmSampleS3.btnGetObjectPropertiesClick(Sender: TObject);
var
  i: Integer;
begin
  for i := valueListMetaData.RowCount - 2 downto 1 do
    valueListMetaData.DeleteRow(i);

  for i := ValueListProperties.RowCount - 2 downto 1 do
    ValueListProperties.DeleteRow(i);

  S3Initialize;
  FS3.GetObjectProperties
    .Request
      .BucketName(edtGetObjectPropertiesBucketName.Text)
      .ObjectName(edtGetObjectPropertiesObjectName.Text)
    .&End
    .Send;

  while FS3.GetObjectProperties.Response.MetaData.HasNext do
    valueListMetaData
      .InsertRow(FS3.GetObjectProperties.Response.MetaData.Current.Key,
                 FS3.GetObjectProperties.Response.MetaData.Current.Value,
                 True);

  while FS3.GetObjectProperties.Response.Properties.HasNext do
    ValueListProperties
      .InsertRow(FS3.GetObjectProperties.Response.Properties.Current.Key,
                 FS3.GetObjectProperties.Response.Properties.Current.Value,
                 True);
end;

procedure TfrmSampleS3.btnListBucketsClick(Sender: TObject);
begin
  mmoListBuckets.Lines.Clear;

  S3Initialize;
  FS3.ListBuckets.Send;

  while FS3.ListBuckets.Response.Buckets.HasNext do
    mmoListBuckets.Lines.Add(FS3.ListBuckets.Response.Buckets.Current);
end;

procedure TfrmSampleS3.btnListObjectsClick(Sender: TObject);
begin
  if not Assigned(FS3) then
    S3Initialize;

  FS3.ListObjects
    .Request
      .BucketName(edtListObjectsBucketName.Text)
      .MaxKeys(10)
      .Prefix('C/Users')
    .&End
    .Send;

  while FS3.ListObjects.Response.Objects.HasNext do
    lstObjects.Items.Add(FS3.ListObjects.Response.Objects.Current.Name);
end;

procedure TfrmSampleS3.btnObjectExistClick(Sender: TObject);
begin
  S3Initialize;
  FS3.ExistObject
    .Request
      .BucketName(edtListObjectsBucketName.Text)
      .ObjectName(edtListObjectObjectName.Text)
    .&End
    .Send;

  if FS3.ExistObject.Response.Exist then
    ShowMessage('Exist')
  else
    ShowMessage('Not Exist');
end;

procedure TfrmSampleS3.S3Initialize;
begin
  FS3 := NewS3Facade;
  FS3.AccessKey(edtAccessKey.Text)
     .SecretKey(edtSecretKey.Text)
     .Region(edtRegion.Text);
end;

procedure TfrmSampleS3.edtCreateObjectFileNameChange(Sender: TObject);
begin
  if ( edtCreateObjectFileName.Text <> '' ) and (edtCreateObjectObjectName.Text = '') then
  begin
    edtCreateObjectObjectName.Text :=
      StringReplace(edtCreateObjectFileName.Text, '\', '/', [rfReplaceAll]).Replace(':', '');
  end;
end;

procedure TfrmSampleS3.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  SaveConfig;
end;

procedure TfrmSampleS3.FormCreate(Sender: TObject);
begin
  ReportMemoryLeaksOnShutdown := True;
  LoadConfig;
end;

function TfrmSampleS3.GetIniFile: TIniFile;
var
  path : String;
begin
  path := ExtractFilePath(GetModuleName(HInstance)) + 'SampleS3.ini';
  result := TIniFile.Create(path);
end;

procedure TfrmSampleS3.LoadConfig;
var
  iniFile: TIniFile;
begin
  iniFile := GetIniFile;
  try
    edtAccessKey.Text := iniFile.ReadString('S3', 'ACCESS_KEY', EmptyStr);
    edtSecretKey.Text := iniFile.ReadString('S3', 'SECRET_KEY', EmptyStr);
    edtRegion.Text    := iniFile.ReadString('S3', 'REGION', EmptyStr);
    edtListObjectsBucketName.Text := iniFile.ReadString('S3', 'BUCKET', EmptyStr);
  finally
    iniFile.Free;
  end;
end;

procedure TfrmSampleS3.lstObjectsClick(Sender: TObject);
begin
  edtListObjectObjectName.Text := lstObjects.Items[lstObjects.ItemIndex];
end;

procedure TfrmSampleS3.SaveConfig;
var
  iniFile: TIniFile;
begin
  iniFile := GetIniFile;
  try
    iniFile.WriteString('S3', 'ACCESS_KEY', edtAccessKey.Text);
    iniFile.WriteString('S3', 'SECRET_KEY', edtSecretKey.Text);
    iniFile.WriteString('S3', 'REGION', edtRegion.Text);
  finally
    iniFile.Free;
  end;
end;

procedure TfrmSampleS3.selectFileDialog(AEdit: TEdit);
begin
  if FileDialog.Execute then
    AEdit.Text := FileDialog.FileName;
end;

end.

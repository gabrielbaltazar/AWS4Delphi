unit FSampleS3;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.ComCtrls, System.IniFiles,
  System.Generics.Collections,

  AWS4D.S3.Model.Interfaces,
  AWS4D.S3.Service.Interfaces, Vcl.Grids, Vcl.ValEdit;

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
    function GetIniFile: TIniFile;
    procedure SaveConfig;
    procedure LoadConfig;

    function CreateS3: IAWS4DServiceS3;

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
  CreateS3.createBucket(edtBucketBucketName.Text);
  ShowMessage('Bucket created.');
end;

procedure TfrmSampleS3.btnCreateObjectClick(Sender: TObject);
var
  request: IAWS4DS3ModelCreateObjectRequest;
begin
  request := S3ModelFactory.CreateObjectRequest;
  request
    .BucketName(edtCreateObjectBucketName.Text)
    .FileName(edtCreateObjectFileName.Text)
    .ObjectName(edtCreateObjectObjectName.Text)
    .AddMetaInfo('meta-key', 'meta-value');

  CreateS3.createObject(request);

end;

procedure TfrmSampleS3.btnCreateObjectSelectFileClick(Sender: TObject);
begin
  selectFileDialog(edtCreateObjectFileName);
end;

procedure TfrmSampleS3.btnDeleteBucketClick(Sender: TObject);
begin
  CreateS3.DeleteBucket(edtBucketBucketName.Text);
  ShowMessage('Bucket deleted.');
end;

procedure TfrmSampleS3.btnDeleteObjectClick(Sender: TObject);
var
  request: IAWS4DS3ModelDeleteObjectRequest;
begin
  request := S3ModelFactory.CreateDeleteObjectRequest;
  request
    .BucketName(edtListObjectsBucketName.Text)
    .ObjectName(lstObjects.Items[lstObjects.ItemIndex]);

  CreateS3.DeleteObject(request);
  btnListObjects.Click;
end;

procedure TfrmSampleS3.btnDownloadObjectClick(Sender: TObject);
var
  request: IAWS4DS3ModelDownloadObjectRequest;
  response: IAWS4DS3ModelDownloadObjectResponse;
  objectName: string;
begin
  objectName := edtListObjectObjectName.Text;
  request := S3ModelFactory.CreateDownloadObjectRequest;
  request
    .BucketName(edtListObjectsBucketName.Text)
    .ObjectName(objectName);

  response := CreateS3.DownloadObject(request);
  response.SaveToFile('testFile.txt');
end;

procedure TfrmSampleS3.btnExistBucketClick(Sender: TObject);
begin
  if CreateS3.ExistBucket(edtBucketBucketName.Text) then
    ShowMessage('Bucket Exist.')
  else
    ShowMessage('Bucket Not Exist.')
end;

procedure TfrmSampleS3.btnGetObjectPropertiesClick(Sender: TObject);
var
  response: IAWS4DS3ModelGetObjectPropertiesResponse;
  i: Integer;
begin
  for i := valueListMetaData.RowCount - 1 downto 0 do
    valueListMetaData.DeleteRow(i);

  for i := ValueListProperties.RowCount - 1 downto 0 do
    ValueListProperties.DeleteRow(i);

  response := CreateS3.GetObjectProperties(edtGetObjectPropertiesBucketName.Text,
                                           edtGetObjectPropertiesObjectName.Text);

  for i := 0 to response.MetaDataCount - 1 do
    valueListMetaData.InsertRow(response.MetaDataKey(i), response.MetaDataValue(i), True);

  for i := 0 to response.PropertyCount - 1 do
    valueListMetaData.InsertRow(response.PropertyKey(i), response.PropertyValue(i), True);
end;

procedure TfrmSampleS3.btnListBucketsClick(Sender: TObject);
var
  buckets : TArray<string>;
  i: Integer;
begin
  buckets := CreateS3.ListBuckets;
  mmoListBuckets.Lines.Clear;

  for i := 0 to Pred(Length(buckets)) do
    mmoListBuckets.Lines.Add(buckets[i]);
end;

procedure TfrmSampleS3.btnListObjectsClick(Sender: TObject);
var
  objects : TList<IAWS4DS3ModelObjectInfo>;
  i: Integer;
begin
  objects := CreateS3.ListObjects(edtListObjectsBucketName.Text, edtListObjectObjectName.Text);
  try
    lstObjects.Items.Clear;
    for i := 0 to Pred(objects.Count) do
      lstObjects.Items.Add(objects[i].Name);
    ShowMessage(objects.Count.ToString);
  finally
    objects.Free;
  end;
end;

procedure TfrmSampleS3.btnObjectExistClick(Sender: TObject);
var
  request: IAWS4DS3ModelObjectExistRequest;
  objectName: string;
begin
  objectName := edtListObjectObjectName.Text;
  request := S3ModelFactory.CreateObjectExistRequest;
  request
    .BucketName(edtListObjectsBucketName.Text)
    .ObjectName(objectName);

  if CreateS3.ExistObject(request) then
    ShowMessage('Exist')
  else
    ShowMessage('Not Exist');
end;

function TfrmSampleS3.CreateS3: IAWS4DServiceS3;
begin
  result := S3Service;
  result
    .AccessKeyID(edtAccessKey.Text)
    .Region(edtRegion.Text)
    .SecretKey(edtSecretKey.Text);
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

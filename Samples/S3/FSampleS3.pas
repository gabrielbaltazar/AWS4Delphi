unit FSampleS3;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.ComCtrls, System.IniFiles,

  AWS4D.S3.Model.Interfaces,
  AWS4D.S3.Service.Interfaces, Data.Cloud.CloudAPI, Data.Cloud.AmazonAPI;

type
  TS3Config = class
  private
    FaccessKeyId: string;
    FsecretKey: string;
    Fregion: String;
  public
    property accessKeyId: string read FaccessKeyId write FaccessKeyId;
    property secretKey: string read FsecretKey write FsecretKey;
    property region: String read Fregion write Fregion;
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
    edtCreateBucketBucketName: TEdit;
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
    AmazonConnectionInfo1: TAmazonConnectionInfo;
    tsListBucket: TTabSheet;
    Panel2: TPanel;
    btnListBuckets: TButton;
    mmoListBuckets: TMemo;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure btnCreateBucketClick(Sender: TObject);
    procedure btnCreateObjectSelectFileClick(Sender: TObject);
    procedure edtCreateObjectFileNameChange(Sender: TObject);
    procedure btnCreateObjectClick(Sender: TObject);
    procedure btnListBucketsClick(Sender: TObject);
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
  CreateS3.createBucket(edtCreateBucketBucketName.Text);
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
    .ObjectName(edtCreateObjectObjectName.Text);

  CreateS3.createObject(request);

end;

procedure TfrmSampleS3.btnCreateObjectSelectFileClick(Sender: TObject);
begin
  selectFileDialog(edtCreateObjectFileName);
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
  finally
    iniFile.Free;
  end;
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

unit FSampleSQS;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.ValEdit,
  Vcl.StdCtrls, Vcl.ComCtrls, Vcl.ExtCtrls,
  System.IniFiles,
  AWS4D.Core.Model.Types,
  AWS4D.SQS.Facade.Interfaces,
  AWS4D.SQS.Facade,
  REST.Json,
  System.JSON;

type
  TSQSConfig = class
  private
    FaccessKeyId: string;
    FsecretKey: string;
    Fregion: String;
  public
    property accessKeyId: string read FaccessKeyId write FaccessKeyId;
    property secretKey: string read FsecretKey write FsecretKey;
    property region: String read Fregion write Fregion;
  end;

  TForm2 = class(TForm)
    pnlTop: TPanel;
    pnlHeader: TPanel;
    Label1: TLabel;
    edtAccessKey: TEdit;
    edtSecretKey: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    edtRegion: TEdit;
    pgcSQS: TPageControl;
    tsListQueues: TTabSheet;
    Panel1: TPanel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    edtListQueuesQueuePrefix: TEdit;
    edtListQueuesMaxResult: TEdit;
    edtListQueuesNextToken: TEdit;
    btnListQueues: TButton;
    mmoListQueues: TMemo;
    tsListQueueTags: TTabSheet;
    Panel2: TPanel;
    btnListQueueTags: TButton;
    mmoListQueueTags: TMemo;
    tsReceiveMessage: TTabSheet;
    Panel3: TPanel;
    btnReceiveMessage: TButton;
    tsGetQueueUrl: TTabSheet;
    Panel4: TPanel;
    Label9: TLabel;
    edtGetQueueUrlQueueName: TEdit;
    btnGetQueueUrl: TButton;
    mmoGetQueueUrl: TMemo;
    Label10: TLabel;
    edtReceiveMessageMaxNumberMessages: TEdit;
    Label11: TLabel;
    edtReceiveMessageVisibilityTimeout: TEdit;
    mmoReceiveMessageResponse: TMemo;
    tsSendMessage: TTabSheet;
    Panel5: TPanel;
    Label13: TLabel;
    btnSendMessage: TButton;
    edtSendMessageMessageBody: TEdit;
    mmoSendMessage: TMemo;
    tsDeleteMessage: TTabSheet;
    Panel6: TPanel;
    Label15: TLabel;
    btnDeleteMessage: TButton;
    edtDeleteMessageReceiptHandle: TEdit;
    mmoDeleteMessage: TMemo;
    tsCreateQueue: TTabSheet;
    Panel7: TPanel;
    Label16: TLabel;
    edtCreateQueueQueueName: TEdit;
    btnCreateQueue: TButton;
    mmoCreateQueue: TMemo;
    tsDeleteMessageBatch: TTabSheet;
    Panel8: TPanel;
    btnDeleteMessageBatch: TButton;
    mmoDeleteMessageBatch: TMemo;
    tsGetQueueAttributes: TTabSheet;
    Panel9: TPanel;
    btnGetQueueAttributes: TButton;
    mmoGetQueueAttributes: TMemo;
    tsPurgeQueue: TTabSheet;
    Panel10: TPanel;
    btnPurgeQueue: TButton;
    mmoPurgeQueue: TMemo;
    tsTagQueue: TTabSheet;
    Panel11: TPanel;
    btnTagQueue: TButton;
    lstTagQueue: TValueListEditor;
    mmoTagQueue: TMemo;
    tsUntagQueue: TTabSheet;
    Panel12: TPanel;
    btnUntagQueue: TButton;
    Label22: TLabel;
    edtUntagQueueTag1: TEdit;
    edtUntagQueueTag2: TEdit;
    Label23: TLabel;
    mmoUntagQueue: TMemo;
    tsDeleteQueue: TTabSheet;
    Panel13: TPanel;
    btnDeleteQueue: TButton;
    mmoDeleteQueue: TMemo;
    edtQueueName: TEdit;
    Label14: TLabel;
    Label7: TLabel;
    edtDeleteBatchMessageID1: TEdit;
    Label8: TLabel;
    edtDeleteBatchReceiptHandle1: TEdit;
    Label12: TLabel;
    edtDeleteBatchMessageID2: TEdit;
    Label17: TLabel;
    edtDeleteBatchReceiptHandle2: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnListQueuesClick(Sender: TObject);
    procedure btnListQueueTagsClick(Sender: TObject);
    procedure btnQueueURLClick(Sender: TObject);
    procedure btnReceiveMessageClick(Sender: TObject);
    procedure btnSendMessageClick(Sender: TObject);
    procedure btnDeleteMessageClick(Sender: TObject);
    procedure btnCreateQueueClick(Sender: TObject);
    procedure btnDeleteMessageBatchClick(Sender: TObject);
    procedure btnGetQueueAttributesClick(Sender: TObject);
    procedure btnPurgeQueueClick(Sender: TObject);
    procedure btnTagQueueClick(Sender: TObject);
    procedure btnUntagQueueClick(Sender: TObject);
    procedure btnDeleteQueueClick(Sender: TObject);
  private
    FSQS: IAWS4DSQSFacade;

    { Private declarations }
    function GetIniFile: TIniFile;
    procedure SaveConfig;
    procedure LoadConfig;

//    function CreateSQS: IAWS4DServiceSQS;

  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

procedure TForm2.btnCreateQueueClick(Sender: TObject);
begin
  FSQS.CreateQueue
    .Request
      .QueueName(edtCreateQueueQueueName.Text)
    .&End
    .Send;

  mmoCreateQueue.Lines.Add(FSQS.CreateQueue.Response.QueueUrl);
end;

procedure TForm2.btnDeleteMessageBatchClick(Sender: TObject);
begin
  FSQS.DeleteMessageBatch
    .Request
      .QueueUrl(edtQueueName.Text)
      .AddMessage(edtDeleteBatchMessageID1.Text, edtDeleteBatchReceiptHandle1.Text)
      .AddMessage(edtDeleteBatchMessageID2.Text, edtDeleteBatchReceiptHandle2.Text)
    .&End
    .Send;
end;

procedure TForm2.btnDeleteMessageClick(Sender: TObject);
begin
  FSQS.DeleteMessage
    .Request
      .QueueName(edtQueueName.Text)
      .ReceiptHandle(edtDeleteMessageReceiptHandle.Text)
    .&End
    .Send;
end;

procedure TForm2.btnDeleteQueueClick(Sender: TObject);
begin
  FSQS.DeleteQueue
    .Request
      .QueueUrl(edtQueueName.Text)
    .&End
    .Send;
end;

procedure TForm2.btnGetQueueAttributesClick(Sender: TObject);
begin
  FSQS.GetQueueAttributes
    .Request
      .QueueUrl(edtQueueName.Text)
    .&End
    .Send;
end;

procedure TForm2.btnListQueuesClick(Sender: TObject);
begin
  FSQS.ListQueues
    .Request
      .MaxResults(5)
    .&End
    .Send;

  FSQS.ListQueues.Response;

  while FSQS.ListQueues.Response.QueueUrls.HasNext do
    mmoListQueues.Lines.Add(FSQS.ListQueues.Response.QueueUrls.Current);
end;

procedure TForm2.btnListQueueTagsClick(Sender: TObject);
begin
  mmoListQueueTags.Lines.Clear;

  FSQS.ListQueueTags
    .Request
      .QueueUrl(edtQueueName.Text)
    .&End
    .Send;

  while FSQS.ListQueueTags.Response.Tags.HasNext do
  begin
    mmoListQueueTags.Lines.Add(FSQS.ListQueueTags.Response.Tags.Current.Key);
    mmoListQueueTags.Lines.Add(FSQS.ListQueueTags.Response.Tags.Current.Value);

    mmoListQueueTags.Lines.Add('');
  end;
end;

procedure TForm2.btnPurgeQueueClick(Sender: TObject);
begin
  FSQS.PurgeQueue
    .Request
      .QueueUrl(edtQueueName.Text)
    .&End
    .Send;
end;

procedure TForm2.btnQueueURLClick(Sender: TObject);
begin
  FSQS.GetQueueUrl
    .Request
      .QueueName(edtGetQueueUrlQueueName.Text)
    .&End
    .Send;

  mmoGetQueueUrl.Lines.Add(FSQS.GetQueueUrl.Response.QueueUrl);
end;

procedure TForm2.btnReceiveMessageClick(Sender: TObject);
begin
  FSQS.ReceiveMessage
    .Request
      .MaxNumberOfMessages(StrToIntDef(edtReceiveMessageMaxNumberMessages.Text, 0))
      .VisibilityTimeout(StrToIntDef(edtReceiveMessageVisibilityTimeout.Text, 0))
      .QueueUrl(edtQueueName.Text)
      .AddMessageAttribute('aaa')
    .&End
    .Send;

  mmoReceiveMessageResponse.Clear;
  while FSQS.ReceiveMessage.Response.Messages.HasNext do
  begin
    mmoReceiveMessageResponse.Lines.Add(
      FSQS.ReceiveMessage.Response.Messages.Current.Body
    );

    mmoReceiveMessageResponse.Lines.Add(
      FSQS.ReceiveMessage.Response.Messages.Current.ReceiptHandle
    );

    mmoReceiveMessageResponse.Lines.Add(
      FSQS.ReceiveMessage.Response.Messages.Current.MessageId
    );

    mmoReceiveMessageResponse.Lines.Add('');

    edtDeleteMessageReceiptHandle.Text := FSQS.ReceiveMessage.Response.Messages.Current.ReceiptHandle;
  end;
end;

procedure TForm2.btnSendMessageClick(Sender: TObject);
begin
  FSQS.SendMessage
    .Request
      .QueueUrl(edtQueueName.Text)
      .MessageBody(edtSendMessageMessageBody.Text)
      .AddAttribute('aaa', 'bbb')
      .AddAttribute('ccc', 'ddd')
    .&End
    .Send;
end;

procedure TForm2.btnTagQueueClick(Sender: TObject);
var
  i: Integer;
begin
  FSQS.TagQueue
    .Request
      .QueueUrl(edtQueueName.Text);

  for i := 0 to Pred(lstTagQueue.Strings.Count) do
    FSQS.TagQueue
      .Request
        .AddTag(lstTagQueue.Strings.Names[i], lstTagQueue.Strings.ValueFromIndex[i]);

  FSQS.TagQueue.Send;
end;

procedure TForm2.btnUntagQueueClick(Sender: TObject);
begin
  FSQS.UnTagQueue
    .Request
      .QueueUrl(edtQueueName.Text)
      .AddTag(edtUntagQueueTag1.Text)
      .AddTag(edtUntagQueueTag2.Text)
    .&End
    .Send;
end;

procedure TForm2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  SaveConfig;
end;

procedure TForm2.FormCreate(Sender: TObject);
begin
  ReportMemoryLeaksOnShutdown := True;
  LoadConfig;

  FSQS := TAWS4DSQSFacade.New;
  FSQS
    .AccessKey(edtAccessKey.Text)
    .SecretKey(edtSecretKey.Text)
    .Region(edtRegion.Text);

  edtSendMessageMessageBody.Text := Format('Message Test %s', [FormatDateTime('dd/MM/yyyy hh:mm:ss', Now)]);
end;

function TForm2.GetIniFile: TIniFile;
var
  path : String;
begin
  path := ExtractFilePath(GetModuleName(HInstance)) + 'SampleSQS.ini';
  result := TIniFile.Create(path);
end;

procedure TForm2.LoadConfig;
var
  iniFile   : TIniFile;
begin
  iniFile := GetIniFile;
  try
    edtAccessKey.Text := iniFile.ReadString('SQS', 'ACCESS_KEY', EmptyStr);
    edtSecretKey.Text := iniFile.ReadString('SQS', 'SECRET_KEY', EmptyStr);
    edtRegion.Text    := iniFile.ReadString('SQS', 'REGION', EmptyStr);
  finally
    iniFile.Free;
  end;
end;

procedure TForm2.SaveConfig;
var
  iniFile: TIniFile;
begin
  iniFile := GetIniFile;
  try
    iniFile.WriteString('SQS', 'ACCESS_KEY', edtAccessKey.Text);
    iniFile.WriteString('SQS', 'SECRET_KEY', edtSecretKey.Text);
    iniFile.WriteString('SQS', 'REGION', edtRegion.Text);
  finally
    iniFile.Free;
  end;
end;

end.

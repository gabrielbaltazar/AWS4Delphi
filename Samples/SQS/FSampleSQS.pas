unit FSampleSQS;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  AWS4D.SQS.Model.Interfaces,
  AWS4D.SQS.Service.Interfaces,
  Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.ComCtrls;

type
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
    Label7: TLabel;
    edtListQueueTagsQueueName: TEdit;
    btnListQueueTags: TButton;
    mmoListQueueTags: TMemo;
    tsReceiveMessage: TTabSheet;
    Panel3: TPanel;
    Label8: TLabel;
    Edit1: TEdit;
    Button1: TButton;
    tsGetQueueUrl: TTabSheet;
    Panel4: TPanel;
    Label9: TLabel;
    edtGetQueueUrlQueueName: TEdit;
    btnGetQueueUrl: TButton;
    mmoGetQueueUrl: TMemo;
    procedure btnListQueuesClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnListQueueTagsClick(Sender: TObject);
    procedure btnQueueURLClick(Sender: TObject);
  private
    { Private declarations }
    function CreateSQS: IAWS4DServiceSQS;

    procedure writeListQueuesResponse(Response: IAWS4DSQSModelListQueuesResponse);
    procedure writeListQueueTagsResponse(Response: IAWS4DSQSModelListQueueTagsResponse);
    procedure writeGetQueueUrlResponse(Response: IAWS4DSQSModelGetQueueUrlResponse);

    procedure writeHTTPException(AException: EAWS4DHTTPException);
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

procedure TForm2.btnListQueuesClick(Sender: TObject);
var
  response : IAWS4DSQSModelListQueuesResponse;
  request  : IAWS4DSQSModelListQueuesRequest;
begin
  request := SQSModelFactory.ListQueuesRequest;
  request
    .QueueNamePrefix(edtListQueuesQueuePrefix.Text)
    .MaxResults(StrToIntDef(edtListQueuesMaxResult.Text, 0))
    .NextToken(edtListQueuesNextToken.Text);

  try
    response := CreateSQS.ListQueues(request);
    writeListQueuesResponse(response);
  except
    on e : EAWS4DHTTPException do
    begin
      writeHTTPException(e);
      raise;
    end;
  end;
end;

procedure TForm2.btnListQueueTagsClick(Sender: TObject);
var
  response: IAWS4DSQSModelListQueueTagsResponse;
begin
  response := CreateSQS.ListQueueTags(edtListQueueTagsQueueName.Text);
  writeListQueueTagsResponse(response);
end;

procedure TForm2.btnQueueURLClick(Sender: TObject);
var
  response : IAWS4DSQSModelGetQueueUrlResponse;
begin
  response := CreateSQS.GetQueueUrl('Send-to-Email-Docfiscal-dev');
  writeGetQueueUrlResponse(response);
end;

function TForm2.CreateSQS: IAWS4DServiceSQS;
begin
  result := SQSService;
  result
    .AccessKeyID(edtAccessKey.Text)
    .Region(edtRegion.Text)
    .SecretKey(edtSecretKey.Text);
end;

procedure TForm2.FormCreate(Sender: TObject);
begin
  ReportMemoryLeaksOnShutdown := True;
end;

procedure TForm2.writeGetQueueUrlResponse(Response: IAWS4DSQSModelGetQueueUrlResponse);
begin
  mmoGetQueueUrl.Lines.Clear;
  mmoGetQueueUrl.Lines.Add('RequestID: ' + Response.RequestId);

  mmoGetQueueUrl.Lines.Add('Url = ' + Response.QueueUrl);
end;

procedure TForm2.writeHTTPException(AException: EAWS4DHTTPException);
begin
  mmoListQueues.Lines.Clear;
  mmoListQueues.Lines.Add('RequestID: ' + AException.RequestId);
  mmoListQueues.Lines.Add('Code: '      + AException.Code);
  mmoListQueues.Lines.Add('Message: '   + AException.Message);
  mmoListQueues.Lines.Add('Type: '      + AException.&Type);
end;

procedure TForm2.writeListQueuesResponse(Response: IAWS4DSQSModelListQueuesResponse);
var
  i : Integer;
begin
  edtListQueuesNextToken.Clear;
  mmoListQueues.Lines.Clear;
  mmoListQueues.Lines.Add('RequestID: ' + Response.RequestId);
  if not Response.NextToken.IsEmpty then
  begin
    edtListQueuesNextToken.Text := Response.NextToken;
    mmoListQueues.Lines.Add('NextToken: ' + Response.NextToken);
  end;

  mmoListQueues.Lines.Add('Queues---------');
  for i := 0 to Pred(Response.QueuesUrls.Count) do
    mmoListQueues.Lines.Add(Response.QueuesUrls[i]);
end;

procedure TForm2.writeListQueueTagsResponse(Response: IAWS4DSQSModelListQueueTagsResponse);
var
  key: string;
begin
  mmoListQueueTags.Lines.Clear;
  mmoListQueueTags.Lines.Add('RequestID: ' + Response.RequestId);

  mmoListQueueTags.Lines.Add('Tags ---------');
  for key in Response.Tags.Keys do
    mmoListQueueTags.Lines.Add(key + '=' + Response.Tags.Items[key]);
end;

end.

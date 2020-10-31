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
    procedure btnListQueuesClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnListQueueTagsClick(Sender: TObject);
  private
    { Private declarations }
    function CreateSQS: IAWS4DServiceSQS;

    procedure writeListQueuesResponse(Response: IAWS4DSQSModelListQueuesResponse);
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
begin
  ShowMessage(CreateSQS.GetQueueUrl(edtListQueueTagsQueueName.Text));
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

end.

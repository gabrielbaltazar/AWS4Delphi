unit FSampleSNS;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,

  System.IniFiles,
  AWS4D.SNS.Model.Interfaces,
  AWS4D.SNS.Facade.Interfaces,
  Vcl.ComCtrls;

type
  TForm1 = class(TForm)
    pnlTop: TPanel;
    pnlHeader: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    edtAccessKey: TEdit;
    edtSecretKey: TEdit;
    edtRegion: TEdit;
    pgcSNS: TPageControl;
    tsListSubscriptions: TTabSheet;
    tsListTopics: TTabSheet;
    Panel2: TPanel;
    Label6: TLabel;
    edtListTopicsNextToken: TEdit;
    btnListTopics: TButton;
    mmoListTopics: TMemo;
    Panel3: TPanel;
    Label4: TLabel;
    edtListSubscriptionsNextToken: TEdit;
    btnListSubscriptions: TButton;
    mmoListSubscriptions: TMemo;
    procedure FormCreate(Sender: TObject);
    procedure btnListTopicsClick(Sender: TObject);
    procedure btnListSubscriptionsClick(Sender: TObject);
  private
    FSNSFacade: IAWS4DSNSFacade;

    procedure InitializeSNS;

    function GetIniFile: TIniFile;
    procedure SaveConfig;
    procedure LoadConfig;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.btnListSubscriptionsClick(Sender: TObject);
var
  subcription: IAWS4DSNSSubscription;
begin
  InitializeSNS;
  FSNSFacade.ListSubscriptions.Send;

  mmoListSubscriptions.Lines.Clear;
  while FSNSFacade.ListSubscriptions.Response.Subscriptions.HasNext do
  begin
    subcription := FSNSFacade.ListSubscriptions.Response.Subscriptions.Current;
    mmoListSubscriptions.Lines.Add(EmptyStr);
    mmoListSubscriptions.Lines.Add('Endpoint: ' + subcription.Endpoint);
    mmoListSubscriptions.Lines.Add('Owner: ' + subcription.Owner);
    mmoListSubscriptions.Lines.Add('Protocol: ' + subcription.Protocol);
    mmoListSubscriptions.Lines.Add('SubscriptionArn: ' + subcription.SubscriptionArn);
    mmoListSubscriptions.Lines.Add('TopicArn: ' + subcription.TopicArn);
  end;

  edtListSubscriptionsNextToken.Text := FSNSFacade.ListSubscriptions.Response.NextToken;
end;

procedure TForm1.btnListTopicsClick(Sender: TObject);
begin
  InitializeSNS;
  FSNSFacade.ListTopics
    .Send;

  mmoListTopics.Lines.Clear;
  while FSNSFacade.ListTopics.Response.Topics.HasNext do
    mmoListTopics.Lines.Add(FSNSFacade.ListTopics.Response.Topics.Current);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  LoadConfig;
end;

function TForm1.GetIniFile: TIniFile;
var
  path : String;
begin
  path := ExtractFilePath(GetModuleName(HInstance)) + 'SampleSNS.ini';
  result := TIniFile.Create(path);
end;

procedure TForm1.InitializeSNS;
begin
  FSNSFacade := NewSNSFacade;
  FSNSFacade
    .AccessKey(edtAccessKey.Text)
    .SecretKey(edtSecretKey.Text)
    .Region(edtRegion.Text);
end;

procedure TForm1.LoadConfig;
var
  iniFile: TIniFile;
begin
  iniFile := GetIniFile;
  try
    edtAccessKey.Text := iniFile.ReadString('SNS', 'ACCESS_KEY', EmptyStr);
    edtSecretKey.Text := iniFile.ReadString('SNS', 'SECRET_KEY', EmptyStr);
    edtRegion.Text := iniFile.ReadString('SNS', 'REGION', EmptyStr);
  finally
    iniFile.Free;
  end;
end;

procedure TForm1.SaveConfig;
var
  iniFile: TIniFile;
begin
  iniFile := GetIniFile;
  try
    iniFile.WriteString('SNS', 'ACCESS_KEY', edtAccessKey.Text);
    iniFile.WriteString('SNS', 'SECRET_KEY', edtSecretKey.Text);
    iniFile.WriteString('SNS', 'REGION', edtRegion.Text);
  finally
    iniFile.Free;
  end;
end;

end.

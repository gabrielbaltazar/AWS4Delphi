unit FSampleSNS;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,

  AWS4D.SNS.Service.Interfaces,
  AWS4D.SNS.Service, Vcl.ComCtrls;

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
    Panel1: TPanel;
    btnListSubscription: TButton;
    procedure FormCreate(Sender: TObject);
    procedure btnListSubscriptionClick(Sender: TObject);
  private
    FService: IAWS4DServiceSNS;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.btnListSubscriptionClick(Sender: TObject);
begin
  FService.ListSubscriptions;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  FService := TAWS4DSNSService.New;
  FService
    .AccessKey('AKIAJFMGZYXJAZPC7B6Q')
    .SecretKey('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')
    .Region('us-east-1');
end;

end.

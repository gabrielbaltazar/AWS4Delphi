object Form1: TForm1
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'SNS'
  ClientHeight = 401
  ClientWidth = 745
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object pnlTop: TPanel
    Left = 0
    Top = 0
    Width = 745
    Height = 35
    Align = alTop
    BevelOuter = bvNone
    Caption = 'SNS'
    TabOrder = 0
    ExplicitWidth = 645
  end
  object pnlHeader: TPanel
    Left = 0
    Top = 35
    Width = 745
    Height = 56
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    ExplicitLeft = -526
    ExplicitTop = 41
    ExplicitWidth = 1171
    object Label1: TLabel
      Left = 11
      Top = 9
      Width = 54
      Height = 13
      Caption = 'Access Key'
    end
    object Label2: TLabel
      Left = 159
      Top = 9
      Width = 52
      Height = 13
      Caption = 'Secret Key'
    end
    object Label3: TLabel
      Left = 431
      Top = 9
      Width = 33
      Height = 13
      Caption = 'Region'
    end
    object edtAccessKey: TEdit
      Left = 11
      Top = 24
      Width = 142
      Height = 21
      TabOrder = 0
    end
    object edtSecretKey: TEdit
      Left = 159
      Top = 24
      Width = 266
      Height = 21
      TabOrder = 1
    end
    object edtRegion: TEdit
      Left = 431
      Top = 24
      Width = 114
      Height = 21
      TabOrder = 2
    end
  end
  object pgcSNS: TPageControl
    Left = 0
    Top = 91
    Width = 745
    Height = 310
    ActivePage = tsListSubscriptions
    Align = alClient
    TabOrder = 2
    ExplicitTop = 97
    ExplicitWidth = 645
    ExplicitHeight = 239
    object tsListSubscriptions: TTabSheet
      Caption = 'List Subscriptions'
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 737
        Height = 49
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
        object btnListSubscription: TButton
          Left = 328
          Top = 16
          Width = 93
          Height = 25
          Caption = 'List Subscription'
          TabOrder = 0
          OnClick = btnListSubscriptionClick
        end
      end
    end
  end
end

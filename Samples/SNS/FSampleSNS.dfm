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
  end
  object pnlHeader: TPanel
    Left = 0
    Top = 35
    Width = 745
    Height = 56
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
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
    ActivePage = tsDeleteTopic
    Align = alClient
    TabOrder = 2
    object tsListSubscriptions: TTabSheet
      Caption = 'List Subscriptions'
      object Panel3: TPanel
        Left = 0
        Top = 0
        Width = 737
        Height = 56
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
        object Label4: TLabel
          Left = 7
          Top = 7
          Width = 55
          Height = 13
          Caption = 'Next Token'
        end
        object Label5: TLabel
          Left = 271
          Top = 7
          Width = 45
          Height = 13
          Caption = 'Topic Arn'
        end
        object edtListSubscriptionsNextToken: TEdit
          Left = 7
          Top = 22
          Width = 258
          Height = 21
          TabOrder = 0
        end
        object btnListSubscriptions: TButton
          Left = 544
          Top = 20
          Width = 94
          Height = 25
          Caption = 'List Subscriptions'
          TabOrder = 1
          OnClick = btnListSubscriptionsClick
        end
        object edtListSubscriptionsTopicArn: TEdit
          Left = 271
          Top = 22
          Width = 258
          Height = 21
          TabOrder = 2
        end
      end
      object mmoListSubscriptions: TMemo
        Left = 0
        Top = 56
        Width = 737
        Height = 226
        Align = alClient
        ScrollBars = ssBoth
        TabOrder = 1
      end
    end
    object tsListTopics: TTabSheet
      Caption = 'List Topics'
      ImageIndex = 1
      object Panel2: TPanel
        Left = 0
        Top = 0
        Width = 737
        Height = 56
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
        object Label6: TLabel
          Left = 7
          Top = 7
          Width = 55
          Height = 13
          Caption = 'Next Token'
        end
        object edtListTopicsNextToken: TEdit
          Left = 7
          Top = 22
          Width = 258
          Height = 21
          TabOrder = 0
        end
        object btnListTopics: TButton
          Left = 272
          Top = 20
          Width = 94
          Height = 25
          Caption = 'List Topics'
          TabOrder = 1
          OnClick = btnListTopicsClick
        end
      end
      object mmoListTopics: TMemo
        Left = 0
        Top = 56
        Width = 737
        Height = 226
        Align = alClient
        ScrollBars = ssBoth
        TabOrder = 1
      end
    end
    object tsCreateTopic: TTabSheet
      Caption = 'Create Topic'
      ImageIndex = 2
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 737
        Height = 56
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
        object Label7: TLabel
          Left = 7
          Top = 7
          Width = 27
          Height = 13
          Caption = 'Name'
        end
        object edtCreateTopicName: TEdit
          Left = 7
          Top = 22
          Width = 258
          Height = 21
          TabOrder = 0
        end
        object btnCreateTopic: TButton
          Left = 271
          Top = 20
          Width = 94
          Height = 25
          Caption = 'Create Topic'
          TabOrder = 1
          OnClick = btnCreateTopicClick
        end
      end
      object mmoCreateTopic: TMemo
        Left = 0
        Top = 56
        Width = 737
        Height = 226
        Align = alClient
        ScrollBars = ssBoth
        TabOrder = 1
      end
    end
    object tsDeleteTopic: TTabSheet
      Caption = 'Delete Topic'
      ImageIndex = 3
      object Panel4: TPanel
        Left = 0
        Top = 0
        Width = 737
        Height = 56
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
        ExplicitTop = 8
        object Label9: TLabel
          Left = 7
          Top = 7
          Width = 45
          Height = 13
          Caption = 'Topic Arn'
        end
        object btnDeleteTopic: TButton
          Left = 280
          Top = 20
          Width = 94
          Height = 25
          Caption = 'Delete Topic'
          TabOrder = 0
          OnClick = btnDeleteTopicClick
        end
        object edtDeleteTopicTopicArn: TEdit
          Left = 7
          Top = 22
          Width = 258
          Height = 21
          TabOrder = 1
        end
      end
    end
  end
end

object Form2: TForm2
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Form2'
  ClientHeight = 347
  ClientWidth = 697
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
    Width = 697
    Height = 41
    Align = alTop
    BevelOuter = bvNone
    Caption = 'SQS'
    TabOrder = 0
  end
  object pnlHeader: TPanel
    Left = 0
    Top = 41
    Width = 697
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
      Text = 'AKIASKJBRLJSB3T37P7Q'
    end
    object edtSecretKey: TEdit
      Left = 159
      Top = 24
      Width = 266
      Height = 21
      TabOrder = 1
      Text = '3WEBD3KUT8vTAgRoBPmyAeIhki/GMrpOJTQB3hwK'
    end
    object edtRegion: TEdit
      Left = 431
      Top = 24
      Width = 114
      Height = 21
      TabOrder = 2
      Text = 'us-east-1'
    end
  end
  object pgcSQS: TPageControl
    Left = 0
    Top = 97
    Width = 697
    Height = 250
    ActivePage = tsListQueueTags
    Align = alClient
    TabOrder = 2
    object tsListQueues: TTabSheet
      Caption = 'List Queues'
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 689
        Height = 56
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
        object Label4: TLabel
          Left = 11
          Top = 9
          Width = 63
          Height = 13
          Caption = 'Queue Prefix'
        end
        object Label5: TLabel
          Left = 159
          Top = 9
          Width = 58
          Height = 13
          Caption = 'Max Results'
        end
        object Label6: TLabel
          Left = 303
          Top = 9
          Width = 55
          Height = 13
          Caption = 'Next Token'
        end
        object edtListQueuesQueuePrefix: TEdit
          Left = 11
          Top = 24
          Width = 142
          Height = 21
          TabOrder = 0
        end
        object edtListQueuesMaxResult: TEdit
          Left = 159
          Top = 24
          Width = 138
          Height = 21
          NumbersOnly = True
          TabOrder = 1
        end
        object edtListQueuesNextToken: TEdit
          Left = 303
          Top = 24
          Width = 258
          Height = 21
          TabOrder = 2
        end
        object btnListQueues: TButton
          Left = 571
          Top = 21
          Width = 94
          Height = 25
          Caption = 'List Queues'
          TabOrder = 3
          OnClick = btnListQueuesClick
        end
      end
      object mmoListQueues: TMemo
        Left = 0
        Top = 56
        Width = 689
        Height = 166
        Align = alClient
        ScrollBars = ssBoth
        TabOrder = 1
      end
    end
    object tsListQueueTags: TTabSheet
      Caption = 'List Queue Tags'
      ImageIndex = 1
      object Panel2: TPanel
        Left = 0
        Top = 0
        Width = 689
        Height = 56
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
        object Label7: TLabel
          Left = 11
          Top = 9
          Width = 62
          Height = 13
          Caption = 'Queue Name'
        end
        object edtListQueueTagsQueueName: TEdit
          Left = 11
          Top = 24
          Width = 222
          Height = 21
          TabOrder = 0
          Text = '159521004132/Send-to-Email-Docfiscal-dev'
        end
        object btnListQueueTags: TButton
          Left = 239
          Top = 22
          Width = 94
          Height = 25
          Caption = 'List Queues Tags'
          TabOrder = 1
          OnClick = btnListQueueTagsClick
        end
      end
      object mmoListQueueTags: TMemo
        Left = 0
        Top = 56
        Width = 689
        Height = 166
        Align = alClient
        ScrollBars = ssBoth
        TabOrder = 1
      end
    end
  end
end

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
    ActivePage = tsCreateQueue
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
    object tsGetQueueUrl: TTabSheet
      Caption = 'Get Queue Url'
      ImageIndex = 2
      object Panel4: TPanel
        Left = 0
        Top = 0
        Width = 689
        Height = 56
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
        object Label9: TLabel
          Left = 11
          Top = 9
          Width = 62
          Height = 13
          Caption = 'Queue Name'
        end
        object edtGetQueueUrlQueueName: TEdit
          Left = 11
          Top = 24
          Width = 222
          Height = 21
          TabOrder = 0
          Text = 'Send-to-Email-Docfiscal-dev'
        end
        object btnGetQueueUrl: TButton
          Left = 239
          Top = 22
          Width = 94
          Height = 25
          Caption = 'Get Queue URL'
          TabOrder = 1
          OnClick = btnQueueURLClick
        end
      end
      object mmoGetQueueUrl: TMemo
        Left = 0
        Top = 56
        Width = 689
        Height = 166
        Align = alClient
        ScrollBars = ssBoth
        TabOrder = 1
      end
    end
    object tsReceiveMessage: TTabSheet
      Caption = 'Receive Message'
      ImageIndex = 2
      object Panel3: TPanel
        Left = 0
        Top = 0
        Width = 689
        Height = 56
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
        object Label8: TLabel
          Left = 11
          Top = 9
          Width = 62
          Height = 13
          Caption = 'Queue Name'
        end
        object Label10: TLabel
          Left = 239
          Top = 9
          Width = 123
          Height = 13
          Caption = 'Max Number of Messages'
        end
        object Label11: TLabel
          Left = 383
          Top = 9
          Width = 78
          Height = 13
          Caption = 'Visibility Timeout'
        end
        object edtReceiveMessageQueueName: TEdit
          Left = 11
          Top = 24
          Width = 222
          Height = 21
          TabOrder = 0
          Text = '159521004132/Send-to-Email-Docfiscal-dev'
        end
        object btnReceiveMessage: TButton
          Left = 562
          Top = 22
          Width = 94
          Height = 25
          Caption = 'Receive Message'
          TabOrder = 1
          OnClick = btnReceiveMessageClick
        end
        object edtReceiveMessageMaxNumberMessages: TEdit
          Left = 239
          Top = 24
          Width = 138
          Height = 21
          NumbersOnly = True
          TabOrder = 2
          Text = '0'
        end
        object edtReceiveMessageVisibilityTimeout: TEdit
          Left = 383
          Top = 24
          Width = 138
          Height = 21
          NumbersOnly = True
          TabOrder = 3
          Text = '0'
        end
      end
      object mmoReceiveMessageResponse: TMemo
        Left = 0
        Top = 56
        Width = 689
        Height = 166
        Align = alClient
        ScrollBars = ssBoth
        TabOrder = 1
      end
    end
    object tsSendMessage: TTabSheet
      Caption = 'Send Message'
      ImageIndex = 4
      object Panel5: TPanel
        Left = 0
        Top = 0
        Width = 689
        Height = 56
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
        object Label12: TLabel
          Left = 11
          Top = 9
          Width = 62
          Height = 13
          Caption = 'Queue Name'
        end
        object Label13: TLabel
          Left = 239
          Top = 9
          Width = 69
          Height = 13
          Caption = 'Message Body'
        end
        object edtSendMessageQueueName: TEdit
          Left = 11
          Top = 24
          Width = 222
          Height = 21
          TabOrder = 0
          Text = '159521004132/Send-to-Email-Docfiscal-dev'
        end
        object btnSendMessage: TButton
          Left = 562
          Top = 22
          Width = 94
          Height = 25
          Caption = 'Send Message'
          TabOrder = 1
          OnClick = btnSendMessageClick
        end
        object edtSendMessageMessageBody: TEdit
          Left = 239
          Top = 24
          Width = 302
          Height = 21
          TabOrder = 2
          Text = '0'
        end
      end
      object mmoSendMessage: TMemo
        Left = 0
        Top = 56
        Width = 689
        Height = 166
        Align = alClient
        ScrollBars = ssBoth
        TabOrder = 1
      end
    end
    object tsDeleteMessage: TTabSheet
      Caption = 'Delete Message'
      ImageIndex = 5
      object Panel6: TPanel
        Left = 0
        Top = 0
        Width = 689
        Height = 56
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
        object Label14: TLabel
          Left = 11
          Top = 9
          Width = 62
          Height = 13
          Caption = 'Queue Name'
        end
        object Label15: TLabel
          Left = 239
          Top = 9
          Width = 72
          Height = 13
          Caption = 'Receipt Handle'
        end
        object edtDeleteMessageQueueName: TEdit
          Left = 11
          Top = 24
          Width = 222
          Height = 21
          TabOrder = 0
          Text = '159521004132/Send-to-Email-Docfiscal-dev'
        end
        object btnDeleteMessage: TButton
          Left = 562
          Top = 22
          Width = 94
          Height = 25
          Caption = 'Delete Message'
          TabOrder = 1
          OnClick = btnDeleteMessageClick
        end
        object edtDeleteMessageReceiptHandle: TEdit
          Left = 239
          Top = 24
          Width = 302
          Height = 21
          TabOrder = 2
        end
      end
      object mmoDeleteMessage: TMemo
        Left = 0
        Top = 56
        Width = 689
        Height = 166
        Align = alClient
        ScrollBars = ssBoth
        TabOrder = 1
      end
    end
    object tsCreateQueue: TTabSheet
      Caption = 'Create Queue'
      ImageIndex = 6
      object Panel7: TPanel
        Left = 0
        Top = 0
        Width = 689
        Height = 56
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
        ExplicitTop = 8
        object Label16: TLabel
          Left = 11
          Top = 9
          Width = 62
          Height = 13
          Caption = 'Queue Name'
        end
        object edtCreateQueueQueueName: TEdit
          Left = 11
          Top = 24
          Width = 222
          Height = 21
          TabOrder = 0
          Text = 'QueueTest'
        end
        object btnCreateQueue: TButton
          Left = 239
          Top = 22
          Width = 94
          Height = 25
          Caption = 'Create Queue'
          TabOrder = 1
          OnClick = btnCreateQueueClick
        end
      end
      object mmoCreateQueue: TMemo
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

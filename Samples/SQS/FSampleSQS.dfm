object Form2: TForm2
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Form2'
  ClientHeight = 438
  ClientWidth = 1171
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object pnlTop: TPanel
    Left = 0
    Top = 0
    Width = 1171
    Height = 41
    Align = alTop
    BevelOuter = bvNone
    Caption = 'SQS'
    TabOrder = 0
  end
  object pnlHeader: TPanel
    Left = 0
    Top = 41
    Width = 1171
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
    object Label14: TLabel
      Left = 551
      Top = 9
      Width = 62
      Height = 13
      Caption = 'Queue Name'
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
    object edtQueueName: TEdit
      Left = 551
      Top = 24
      Width = 222
      Height = 21
      TabOrder = 3
      Text = '451809183281/vendas'
    end
  end
  object pgcSQS: TPageControl
    Left = 0
    Top = 97
    Width = 1171
    Height = 341
    ActivePage = tsReceiveMessage
    Align = alClient
    TabOrder = 2
    object tsListQueues: TTabSheet
      Caption = 'List Queues'
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 1163
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
        Width = 1163
        Height = 257
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
        Width = 1163
        Height = 56
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
        object btnListQueueTags: TButton
          Left = 7
          Top = 14
          Width = 94
          Height = 25
          Caption = 'List Queues Tags'
          TabOrder = 0
          OnClick = btnListQueueTagsClick
        end
      end
      object mmoListQueueTags: TMemo
        Left = 0
        Top = 56
        Width = 1163
        Height = 257
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
        Width = 1163
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
          Text = 'vendas'
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
        Width = 1163
        Height = 257
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
        Width = 1163
        Height = 56
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
        object Label10: TLabel
          Left = 3
          Top = 9
          Width = 123
          Height = 13
          Caption = 'Max Number of Messages'
        end
        object Label11: TLabel
          Left = 147
          Top = 9
          Width = 78
          Height = 13
          Caption = 'Visibility Timeout'
        end
        object btnReceiveMessage: TButton
          Left = 291
          Top = 22
          Width = 94
          Height = 25
          Caption = 'Receive Message'
          TabOrder = 0
          OnClick = btnReceiveMessageClick
        end
        object edtReceiveMessageMaxNumberMessages: TEdit
          Left = 3
          Top = 24
          Width = 138
          Height = 21
          NumbersOnly = True
          TabOrder = 1
          Text = '0'
        end
        object edtReceiveMessageVisibilityTimeout: TEdit
          Left = 147
          Top = 24
          Width = 138
          Height = 21
          NumbersOnly = True
          TabOrder = 2
          Text = '0'
        end
      end
      object mmoReceiveMessageResponse: TMemo
        Left = 0
        Top = 56
        Width = 1163
        Height = 257
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
        Width = 1163
        Height = 56
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
        object Label13: TLabel
          Left = 7
          Top = 10
          Width = 69
          Height = 13
          Caption = 'Message Body'
        end
        object btnSendMessage: TButton
          Left = 330
          Top = 23
          Width = 94
          Height = 25
          Caption = 'Send Message'
          TabOrder = 0
          OnClick = btnSendMessageClick
        end
        object edtSendMessageMessageBody: TEdit
          Left = 7
          Top = 25
          Width = 302
          Height = 21
          TabOrder = 1
          Text = '0'
        end
      end
      object mmoSendMessage: TMemo
        Left = 0
        Top = 56
        Width = 1163
        Height = 257
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
        Width = 1163
        Height = 56
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
        object Label15: TLabel
          Left = 7
          Top = 5
          Width = 72
          Height = 13
          Caption = 'Receipt Handle'
        end
        object btnDeleteMessage: TButton
          Left = 330
          Top = 18
          Width = 94
          Height = 25
          Caption = 'Delete Message'
          TabOrder = 0
          OnClick = btnDeleteMessageClick
        end
        object edtDeleteMessageReceiptHandle: TEdit
          Left = 7
          Top = 20
          Width = 302
          Height = 21
          TabOrder = 1
        end
      end
      object mmoDeleteMessage: TMemo
        Left = 0
        Top = 56
        Width = 1163
        Height = 257
        Align = alClient
        ScrollBars = ssBoth
        TabOrder = 1
      end
    end
    object tsDeleteMessageBatch: TTabSheet
      Caption = 'Delete Message Batch'
      ImageIndex = 7
      object Panel8: TPanel
        Left = 0
        Top = 0
        Width = 1163
        Height = 57
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
        object Label17: TLabel
          Left = 11
          Top = 9
          Width = 62
          Height = 13
          Caption = 'Queue Name'
        end
        object edtDeleteMessageBatchQueueName: TEdit
          Left = 11
          Top = 24
          Width = 222
          Height = 21
          TabOrder = 0
          Text = '159521004132/Send-to-Email-Docfiscal-dev'
        end
        object btnDeleteMessageBatch: TButton
          Left = 239
          Top = 22
          Width = 130
          Height = 25
          Caption = 'Delete Messages Batch'
          TabOrder = 1
          OnClick = btnDeleteMessageBatchClick
        end
      end
      object edtDeleteMessageBatchList: TValueListEditor
        Left = 0
        Top = 57
        Width = 409
        Height = 256
        Align = alLeft
        KeyOptions = [keyEdit, keyAdd, keyUnique]
        Strings.Strings = (
          
            '5d2029d3-164c-4971-a74d-51b029a9e22e=AQEBir7lAsBOQihV7XgXNXz1TLV' +
            'pkMrTIzRG+kRNiEj7lRS707+EgMaykzeErPy6BbACsqj2zR9sfm7UWLTyERAMo1o' +
            'n+r6EMgVVVj3eH8z+v1BSHoFdFVT0v0UBgUj7z/JT3j+EEhjEK+/CAISulmvMQ8r' +
            '9ACzt85P2GVdxZyWpqX29jZ8euX76kiCDSUF1PnyLjzoiIqn1w7F9BOTPS/9ODTW' +
            'BAqeBGAoj+SKkGn5Mn4KZ1FckeGzWaXdtMdbEStkkgGvCPt0ybOdlV3YJxmpb5Qi' +
            'v//Hop6NdtrxSaQvpgcBORMxC66IH+KS14/PC1qygirqqOTLwExZbj1hepK+b1zU' +
            'S+KtmN5V3Ni+Vnops7EG+mMf8P4ZvmUiUJG+FBAPd3r6qlHKyhyOL8ZFLpkhhmQ=' +
            '='
          
            'd2adf7d6-7c77-4c10-b1de-26b083a1464f=AQEBPJySvjo371XCDSAJKLdUUZe' +
            'td6k7l3PKQG5BpQ+IsMdR+4IjaeMt3ZYIp5sb93y1TcjL3jMlJcLLYuzn696nssn' +
            'Y1LeS/b1W4rH/OMVShbaGZlymI7uhdiSL4RGeO0+HlhYdEHobFAz+E2pWHtLmgjw' +
            'XZ1lQXgDhlAZWPoz5F49ZXZS3U33qRDblEKjt+JHBF+Y0pKT1vXAcTmE+Pcp6PaB' +
            '2bbQX1hFt0Ei0WUsDSVP2U2W0Nf1KWaloDeSIQRddClMiE7H3XlTUqbBzqp5rJxY' +
            '8IFZLzn3R6NBl0V+qJhi8SzbCpC5PJx623j4XJpkNyhbjp0uQchyQI4S9L0qAP5B' +
            'g8oQ1ikKtAIuP5rIjH4FmJ3XYY7igExAYWm2u+riw34HjsHwXy2tUeYdPoAos8A=' +
            '=')
        TabOrder = 1
        TitleCaptions.Strings = (
          'Message Id'
          'Receipt Handle')
        ColWidths = (
          162
          241)
      end
      object mmoDeleteMessageBatch: TMemo
        Left = 409
        Top = 57
        Width = 754
        Height = 256
        Align = alClient
        ScrollBars = ssBoth
        TabOrder = 2
      end
    end
    object tsCreateQueue: TTabSheet
      Caption = 'Create Queue'
      ImageIndex = 6
      object Panel7: TPanel
        Left = 0
        Top = 0
        Width = 1163
        Height = 56
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
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
        Width = 1163
        Height = 257
        Align = alClient
        ScrollBars = ssBoth
        TabOrder = 1
      end
    end
    object tsGetQueueAttributes: TTabSheet
      Caption = 'Get Queue Attributes'
      ImageIndex = 8
      object Panel9: TPanel
        Left = 0
        Top = 0
        Width = 1163
        Height = 56
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
        object Label18: TLabel
          Left = 11
          Top = 9
          Width = 48
          Height = 13
          Caption = 'Queue Url'
        end
        object edtGetQueueAttributesQueueName: TEdit
          Left = 11
          Top = 24
          Width = 222
          Height = 21
          TabOrder = 0
          Text = '159521004132/Send-to-Email-Docfiscal-dev'
        end
        object btnGetQueueAttributes: TButton
          Left = 239
          Top = 22
          Width = 130
          Height = 25
          Caption = 'Get Queue Attributes'
          TabOrder = 1
          OnClick = btnGetQueueAttributesClick
        end
      end
      object mmoGetQueueAttributes: TMemo
        Left = 0
        Top = 56
        Width = 1163
        Height = 257
        Align = alClient
        ScrollBars = ssBoth
        TabOrder = 1
      end
    end
    object tsPurgeQueue: TTabSheet
      Caption = 'Purge Queue'
      ImageIndex = 9
      object Panel10: TPanel
        Left = 0
        Top = 0
        Width = 1163
        Height = 56
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
        object Label19: TLabel
          Left = 11
          Top = 9
          Width = 48
          Height = 13
          Caption = 'Queue Url'
        end
        object edtPurgeQueueQueueUrl: TEdit
          Left = 11
          Top = 24
          Width = 222
          Height = 21
          TabOrder = 0
          Text = '159521004132/Send-to-Email-Docfiscal-dev'
        end
        object btnPurgeQueue: TButton
          Left = 239
          Top = 22
          Width = 94
          Height = 25
          Caption = 'Purge Queue'
          TabOrder = 1
          OnClick = btnPurgeQueueClick
        end
      end
      object mmoPurgeQueue: TMemo
        Left = 0
        Top = 56
        Width = 1163
        Height = 257
        Align = alClient
        ScrollBars = ssBoth
        TabOrder = 1
      end
    end
    object tsTagQueue: TTabSheet
      Caption = 'Tag Queue'
      ImageIndex = 10
      object Panel11: TPanel
        Left = 0
        Top = 0
        Width = 1163
        Height = 57
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
        object Label20: TLabel
          Left = 11
          Top = 9
          Width = 48
          Height = 13
          Caption = 'Queue Url'
        end
        object edtTagQueueQueueUrl: TEdit
          Left = 11
          Top = 24
          Width = 222
          Height = 21
          TabOrder = 0
          Text = '159521004132/Send-to-Email-Docfiscal-dev'
        end
        object btnTagQueue: TButton
          Left = 239
          Top = 22
          Width = 90
          Height = 25
          Caption = 'Tag Queue'
          TabOrder = 1
          OnClick = btnTagQueueClick
        end
      end
      object lstTagQueue: TValueListEditor
        Left = 0
        Top = 57
        Width = 361
        Height = 256
        Align = alLeft
        KeyOptions = [keyEdit, keyAdd, keyUnique]
        Strings.Strings = (
          'QueueType=Production'
          'QueueDate=2020-11-03')
        TabOrder = 1
        TitleCaptions.Strings = (
          'Key Tag'
          'Value Tag')
        ColWidths = (
          162
          193)
      end
      object mmoTagQueue: TMemo
        Left = 361
        Top = 57
        Width = 802
        Height = 256
        Align = alClient
        ScrollBars = ssBoth
        TabOrder = 2
      end
    end
    object tsUntagQueue: TTabSheet
      Caption = 'Untag Queue'
      ImageIndex = 11
      object Panel12: TPanel
        Left = 0
        Top = 0
        Width = 1163
        Height = 57
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
        object Label21: TLabel
          Left = 11
          Top = 9
          Width = 48
          Height = 13
          Caption = 'Queue Url'
        end
        object Label22: TLabel
          Left = 239
          Top = 9
          Width = 29
          Height = 13
          Caption = 'TAG 1'
        end
        object Label23: TLabel
          Left = 351
          Top = 9
          Width = 29
          Height = 13
          Caption = 'TAG 2'
        end
        object edtUntagQueueQueueUrl: TEdit
          Left = 11
          Top = 24
          Width = 222
          Height = 21
          TabOrder = 0
          Text = '159521004132/Send-to-Email-Docfiscal-dev'
        end
        object btnUntagQueue: TButton
          Left = 471
          Top = 22
          Width = 90
          Height = 25
          Caption = 'UnTag Queue'
          TabOrder = 1
          OnClick = btnUntagQueueClick
        end
        object edtUntagQueueTag1: TEdit
          Left = 239
          Top = 24
          Width = 106
          Height = 21
          TabOrder = 2
        end
        object edtUntagQueueTag2: TEdit
          Left = 351
          Top = 24
          Width = 106
          Height = 21
          TabOrder = 3
        end
      end
      object mmoUntagQueue: TMemo
        Left = 0
        Top = 57
        Width = 1163
        Height = 256
        Align = alClient
        ScrollBars = ssBoth
        TabOrder = 1
      end
    end
    object tsDeleteQueue: TTabSheet
      Caption = 'Delete Queue'
      ImageIndex = 12
      object Panel13: TPanel
        Left = 0
        Top = 0
        Width = 1163
        Height = 57
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
        object Label24: TLabel
          Left = 11
          Top = 9
          Width = 48
          Height = 13
          Caption = 'Queue Url'
        end
        object edtDeleteQueueQueueUrl: TEdit
          Left = 11
          Top = 24
          Width = 222
          Height = 21
          TabOrder = 0
          Text = '159521004132/Send-to-Email-Docfiscal-dev'
        end
        object btnDeleteQueue: TButton
          Left = 239
          Top = 22
          Width = 90
          Height = 25
          Caption = 'Delete Queue'
          TabOrder = 1
          OnClick = btnDeleteQueueClick
        end
      end
      object mmoDeleteQueue: TMemo
        Left = 0
        Top = 57
        Width = 1163
        Height = 256
        Align = alClient
        ScrollBars = ssBoth
        TabOrder = 1
      end
    end
  end
end

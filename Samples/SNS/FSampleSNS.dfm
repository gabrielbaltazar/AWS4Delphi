object Form1: TForm1
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'SNS'
  ClientHeight = 478
  ClientWidth = 887
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
    Width = 887
    Height = 35
    Align = alTop
    BevelOuter = bvNone
    Caption = 'SNS'
    TabOrder = 0
  end
  object pnlHeader: TPanel
    Left = 0
    Top = 35
    Width = 887
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
    Width = 887
    Height = 387
    ActivePage = tsCreateSMSSandboxPhoneNumber
    Align = alClient
    TabOrder = 2
    object tsListSubscriptions: TTabSheet
      Caption = 'List Subscriptions'
      object Panel3: TPanel
        Left = 0
        Top = 0
        Width = 879
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
        Width = 879
        Height = 303
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
        Width = 879
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
        Width = 879
        Height = 303
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
        Width = 879
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
        Width = 879
        Height = 303
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
        Width = 879
        Height = 56
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
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
    object tsSubscribe: TTabSheet
      Caption = 'Subscribe'
      ImageIndex = 4
      object Panel5: TPanel
        Left = 0
        Top = 0
        Width = 879
        Height = 89
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
        object Label8: TLabel
          Left = 7
          Top = 7
          Width = 45
          Height = 13
          Caption = 'Topic Arn'
        end
        object Label10: TLabel
          Left = 271
          Top = 7
          Width = 42
          Height = 13
          Caption = 'Endpoint'
        end
        object lbl1: TLabel
          Left = 535
          Top = 7
          Width = 39
          Height = 13
          Caption = 'Protocol'
        end
        object btnSubscribe: TButton
          Left = 7
          Top = 49
          Width = 94
          Height = 25
          Caption = 'Subscribe'
          TabOrder = 0
          OnClick = btnSubscribeClick
        end
        object edtSubscribeTopicArn: TEdit
          Left = 7
          Top = 22
          Width = 258
          Height = 21
          TabOrder = 1
        end
        object edtSubscribeEndpoint: TEdit
          Left = 271
          Top = 22
          Width = 258
          Height = 21
          TabOrder = 2
        end
        object edtSubscribeProtocol: TEdit
          Left = 535
          Top = 22
          Width = 149
          Height = 21
          TabOrder = 3
          Text = 'email'
        end
      end
      object mmoSubscribe: TMemo
        Left = 0
        Top = 89
        Width = 879
        Height = 270
        Align = alClient
        ScrollBars = ssBoth
        TabOrder = 1
      end
    end
    object tsUnsubscribe: TTabSheet
      Caption = 'Unsubscribe'
      ImageIndex = 5
      object Panel6: TPanel
        Left = 0
        Top = 0
        Width = 879
        Height = 89
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
        object Label11: TLabel
          Left = 7
          Top = 7
          Width = 78
          Height = 13
          Caption = 'Subscription Arn'
        end
        object btnUnsubscribe: TButton
          Left = 346
          Top = 20
          Width = 94
          Height = 25
          Caption = 'Unsubscribe'
          TabOrder = 0
          OnClick = btnUnsubscribeClick
        end
        object edtUnsubscribeSubscriptionArn: TEdit
          Left = 7
          Top = 22
          Width = 330
          Height = 21
          TabOrder = 1
        end
      end
    end
    object tsPublish: TTabSheet
      Caption = 'Publish'
      ImageIndex = 6
      object Panel7: TPanel
        Left = 0
        Top = 0
        Width = 879
        Height = 359
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 0
        object Label12: TLabel
          Left = 15
          Top = 149
          Width = 80
          Height = 13
          Caption = 'Message Default'
        end
        object Label16: TLabel
          Left = 15
          Top = 189
          Width = 65
          Height = 13
          Caption = 'Message SQS'
        end
        object Label17: TLabel
          Left = 15
          Top = 274
          Width = 65
          Height = 13
          Caption = 'Message SMS'
        end
        object Label18: TLabel
          Left = 15
          Top = 234
          Width = 66
          Height = 13
          Caption = 'Message Http'
        end
        object Label19: TLabel
          Left = 401
          Top = 149
          Width = 69
          Height = 13
          Caption = 'Message Email'
        end
        object Label20: TLabel
          Left = 401
          Top = 189
          Width = 82
          Height = 13
          Caption = 'Message Lambda'
        end
        object Label21: TLabel
          Left = 401
          Top = 234
          Width = 71
          Height = 13
          Caption = 'Message Https'
        end
        object Label22: TLabel
          Left = 401
          Top = 274
          Width = 92
          Height = 13
          Caption = 'Message Firehouse'
        end
        object lbl2: TLabel
          Left = 15
          Top = 109
          Width = 42
          Height = 13
          Caption = 'Message'
        end
        object Label14: TLabel
          Left = 15
          Top = 55
          Width = 49
          Height = 13
          Caption = 'TargetArn'
        end
        object Label15: TLabel
          Left = 15
          Top = 13
          Width = 42
          Height = 13
          Caption = 'TopicArn'
        end
        object Label23: TLabel
          Left = 401
          Top = 13
          Width = 70
          Height = 13
          Caption = 'Phone Number'
        end
        object Label13: TLabel
          Left = 401
          Top = 55
          Width = 36
          Height = 13
          Caption = 'Subject'
        end
        object lbl3: TLabel
          Left = 401
          Top = 319
          Width = 56
          Height = 13
          Caption = 'Message ID'
        end
        object btnPublish: TButton
          Left = 15
          Top = 330
          Width = 94
          Height = 25
          Caption = 'Publish'
          TabOrder = 13
          OnClick = btnPublishClick
        end
        object edtPublishMessageDefault: TEdit
          Left = 15
          Top = 164
          Width = 380
          Height = 21
          TabOrder = 5
        end
        object edtPublishMessageSqs: TEdit
          Left = 15
          Top = 204
          Width = 380
          Height = 21
          TabOrder = 7
        end
        object edtPublishMessageSms: TEdit
          Left = 15
          Top = 289
          Width = 380
          Height = 21
          TabOrder = 11
        end
        object edtPublishMessageHttp: TEdit
          Left = 15
          Top = 249
          Width = 380
          Height = 21
          TabOrder = 9
        end
        object edtPublishMessageEmail: TEdit
          Left = 401
          Top = 164
          Width = 380
          Height = 21
          TabOrder = 6
        end
        object edtPublishMessageLambda: TEdit
          Left = 401
          Top = 204
          Width = 380
          Height = 21
          TabOrder = 8
        end
        object edtPublishMessageHttps: TEdit
          Left = 401
          Top = 249
          Width = 380
          Height = 21
          TabOrder = 10
        end
        object edtPublishMessageFirehouse: TEdit
          Left = 401
          Top = 289
          Width = 380
          Height = 21
          TabOrder = 12
        end
        object edtPublishMessage: TEdit
          Left = 15
          Top = 124
          Width = 380
          Height = 21
          TabOrder = 4
        end
        object edtPublishTargetArn: TEdit
          Left = 15
          Top = 70
          Width = 380
          Height = 21
          TabOrder = 2
        end
        object edtPublishTopicArn: TEdit
          Left = 15
          Top = 28
          Width = 380
          Height = 21
          TabOrder = 0
        end
        object edtPublishPhoneNumber: TEdit
          Left = 401
          Top = 28
          Width = 380
          Height = 21
          TabOrder = 1
        end
        object edtPublishSubject: TEdit
          Left = 401
          Top = 70
          Width = 380
          Height = 21
          TabOrder = 3
        end
        object edtPublishMessageId: TEdit
          Left = 401
          Top = 334
          Width = 380
          Height = 21
          TabOrder = 14
        end
      end
    end
    object tsConfirmSubscription: TTabSheet
      Caption = 'Confirm Subscription'
      ImageIndex = 7
      object Panel8: TPanel
        Left = 0
        Top = 0
        Width = 879
        Height = 97
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
        object Label24: TLabel
          Left = 7
          Top = 7
          Width = 29
          Height = 13
          Caption = 'Token'
        end
        object Label25: TLabel
          Left = 7
          Top = 55
          Width = 45
          Height = 13
          Caption = 'Topic Arn'
        end
        object Label26: TLabel
          Left = 427
          Top = 57
          Width = 78
          Height = 13
          Caption = 'Subscription Arn'
        end
        object edtConfirmSubscriptionToken: TEdit
          Left = 7
          Top = 22
          Width = 858
          Height = 21
          TabOrder = 0
        end
        object btnConfirmSubscription: TButton
          Left = 280
          Top = 68
          Width = 121
          Height = 25
          Caption = 'Confirm Subscription'
          TabOrder = 1
          OnClick = btnConfirmSubscriptionClick
        end
        object edtConfirmSubscriptionTopicArn: TEdit
          Left = 7
          Top = 70
          Width = 258
          Height = 21
          TabOrder = 2
        end
        object edtConfirmSubscriptionSubscriptionArn: TEdit
          Left = 427
          Top = 70
          Width = 258
          Height = 21
          TabOrder = 3
        end
      end
    end
    object tsCreateSMSSandboxPhoneNumber: TTabSheet
      Caption = 'SMS Sandbox PhoneNumber'
      ImageIndex = 8
      object Panel9: TPanel
        Left = 0
        Top = 0
        Width = 879
        Height = 56
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
        object Label27: TLabel
          Left = 7
          Top = 7
          Width = 70
          Height = 13
          Caption = 'Phone Number'
        end
        object edtSMSSandboxPhoneNumber: TEdit
          Left = 7
          Top = 22
          Width = 258
          Height = 21
          TabOrder = 0
        end
        object btnCreateSMSSandboxPhoneNumber: TButton
          Left = 272
          Top = 20
          Width = 201
          Height = 25
          Caption = 'Create SMS Sandbox PhoneNumber'
          TabOrder = 1
          OnClick = btnCreateSMSSandboxPhoneNumberClick
        end
        object btnDeleteSMSSandBoxPhoneNumber: TButton
          Left = 479
          Top = 20
          Width = 201
          Height = 25
          Caption = 'Delete SMS Sandbox PhoneNumber'
          TabOrder = 2
          OnClick = btnDeleteSMSSandBoxPhoneNumberClick
        end
      end
    end
  end
end

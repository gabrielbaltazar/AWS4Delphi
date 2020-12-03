object frmSampleS3: TfrmSampleS3
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'S3 Sample'
  ClientHeight = 309
  ClientWidth = 818
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
    Width = 818
    Height = 41
    Align = alTop
    BevelOuter = bvNone
    Caption = 'S3'
    TabOrder = 0
  end
  object pnlHeader: TPanel
    Left = 0
    Top = 41
    Width = 818
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
      Text = 'us-east-1'
    end
  end
  object pgcS3: TPageControl
    Left = 0
    Top = 97
    Width = 818
    Height = 212
    ActivePage = tsCreateBucket
    Align = alClient
    TabOrder = 2
    object tsListBucket: TTabSheet
      Caption = 'List Buckets'
      object Panel2: TPanel
        Left = 0
        Top = 0
        Width = 810
        Height = 65
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
        object btnListBuckets: TButton
          Left = 15
          Top = 14
          Width = 94
          Height = 25
          Caption = 'List Buckets'
          TabOrder = 0
          OnClick = btnListBucketsClick
        end
      end
      object mmoListBuckets: TMemo
        Left = 0
        Top = 65
        Width = 810
        Height = 119
        Align = alClient
        Lines.Strings = (
          'mmoListBuckets')
        TabOrder = 1
      end
    end
    object tsCreateBucket: TTabSheet
      Caption = 'Bucket'
      object pnlCreateBucket: TPanel
        Left = 0
        Top = 0
        Width = 810
        Height = 65
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
        object Label7: TLabel
          Left = 19
          Top = 9
          Width = 62
          Height = 13
          Caption = 'Bucket Name'
        end
        object edtBucketBucketName: TEdit
          Left = 19
          Top = 24
          Width = 214
          Height = 21
          TabOrder = 0
          Text = 'pw3-central-recebimento'
        end
        object btnCreateBucket: TButton
          Left = 239
          Top = 22
          Width = 94
          Height = 25
          Caption = 'Create Bucket'
          TabOrder = 1
          OnClick = btnCreateBucketClick
        end
        object btnExistBucket: TButton
          Left = 339
          Top = 22
          Width = 94
          Height = 25
          Caption = 'Exist Bucket'
          TabOrder = 2
          OnClick = btnExistBucketClick
        end
        object btnDeleteBucket: TButton
          Left = 439
          Top = 22
          Width = 94
          Height = 25
          Caption = 'Delete Bucket'
          TabOrder = 3
          OnClick = btnDeleteBucketClick
        end
      end
    end
    object tsCreateObject: TTabSheet
      Caption = 'Create Object'
      ImageIndex = 1
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 810
        Height = 65
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
        object Label4: TLabel
          Left = 19
          Top = 9
          Width = 62
          Height = 13
          Caption = 'Bucket Name'
        end
        object Label5: TLabel
          Left = 175
          Top = 9
          Width = 46
          Height = 13
          Caption = 'File Name'
        end
        object Label6: TLabel
          Left = 459
          Top = 9
          Width = 62
          Height = 13
          Caption = 'Object Name'
        end
        object edtCreateObjectBucketName: TEdit
          Left = 19
          Top = 24
          Width = 150
          Height = 21
          TabOrder = 0
          Text = 'pw3-central-recebimento'
        end
        object btnCreateObject: TButton
          Left = 711
          Top = 22
          Width = 94
          Height = 25
          Caption = 'Create Object'
          TabOrder = 1
          OnClick = btnCreateObjectClick
        end
        object edtCreateObjectFileName: TEdit
          Left = 175
          Top = 24
          Width = 246
          Height = 21
          TabOrder = 2
          OnChange = edtCreateObjectFileNameChange
        end
        object edtCreateObjectObjectName: TEdit
          Left = 459
          Top = 24
          Width = 246
          Height = 21
          TabOrder = 3
        end
        object btnCreateObjectSelectFile: TButton
          Left = 422
          Top = 23
          Width = 26
          Height = 23
          Caption = '...'
          TabOrder = 4
          OnClick = btnCreateObjectSelectFileClick
        end
      end
    end
  end
  object FileDialog: TFileOpenDialog
    FavoriteLinks = <>
    FileTypes = <>
    Options = []
    Left = 472
    Top = 1
  end
  object AmazonConnectionInfo1: TAmazonConnectionInfo
    AccountName = 'AKIAJFMGZYXJAZPC7B6Q'
    AccountKey = '6RjaGG19MnWtKQdoSVYlk+FxVCwmL4daymodUqPg'
    Protocol = 'https'
    TableEndpoint = 'sdb.amazonaws.com'
    QueueEndpoint = 'queue.amazonaws.com'
    StorageEndpoint = 's3.amazonaws.com'
    Left = 400
    Top = 192
  end
end

# AWS4Delphi
<p>The <b>AWS4Delphi</b> is a Delphi SDK to integrate with AWS services with delphi quickly and simply.</p>
<p>The available services are:</p>

* [Amazon SNS: Simple Notification Service](https://aws.amazon.com/sns/)
* [Amazon SQS: Simple Queue Service](https://aws.amazon.com/sqs/)
* [Amazon S3: Simple Storage Service](https://aws.amazon.com/s3/)

## ⚙️ Installation 

### For install in your project using [boss](https://github.com/HashLoad/boss): 
``` sh  
 $ boss install github.com/gabrielbaltazar/AWS4Delphi
 ```

*Prerequisites*: [**GBClient**](https://github.com/gabrielbaltazar/GBClient) - This is a SDK to work with rest requests


## ⚡️ Quickstart S3

The available functions are:
* CreateBucket
* CreateObject
* DeleteBucket
* DeleteObject
* DownloadObject
* ExistBucket
* ExistObject
* GetObjectProperties
* ListBuckets
* ListObjects

You need to use AWS4D.S3.Facade.Interfaces

```pascal
uses
  AWS4D.S3.Facade.Interfaces;
```

* **SET Credentials**
```pascal
var
  FS3: IAWS4DS3Facade;
begin
  FS3 := NewS3Facade;
  FS3.AccessKey('')
    .SecretKey('')
    .Region('us-east-1');
end;
``` 

* **CREATE Object**
```pascal
FS3.CreateObject
  .Request
    .BucketName('bucketName')
    .ObjectName('objectName')
    .FileName('FileName') // or .FileStream(Stream)
  .&End
  .Send;
``` 

* **DOWNLOAD Object**
```pascal
FS3.DownloadObject
  .Request
    .BucketName(edtListObjectsBucketName.Text)
    .ObjectName(edtListObjectObjectName.Text)
  .&End
  .Send
    .SaveToFile('test.txt');
``` 

## ⚡️ Quickstart SNS

The available functions are:
* AddPermission
* CheckIfPhoneNumberIsOptedOut
* ConfirmSubscription
* CreateSMSSandboxPhoneNumber
* CreateTopic
* DeleteTopic
* DeleteSMSSandboxPhoneNumber
* GetSMSSandboxAccountStatus
* GetSubscriptionAttributes
* GetTopicAttributes
* ListSMSSandboxPhoneNumbers
* ListSubscriptions
* ListTopics
* OptInPhoneNumber
* Publish
* RemovePersmission
* SetEndpointAttributes
* SetPlatformApplicationAttributes
* SetSubscriptionsAttributes
* SetTopicAttributes
* Subscribe
* Unsubscribe
* VerifySMSSandboxPhoneNumber

You need to use AWS4D.SNS.Facade.Interfaces

```pascal
uses AWS4D.SNS.Facade.Interfaces;
```

* **SET Credentials**
```pascal
var
  FSNS: IAWS4DSNSFacade;
begin
  FSNS := NewSNSFacade;
  FSNS
    .AccessKey('')
    .SecretKey('')
    .Region('us-east-1');
end;

``` 
* **Create Topic**
```pascal
FSNS.CreateTopic
  .Request
    .Name('topicName')
  .&End
  .Send;
  
showMessage(FSNS.CreateTopic.Response.TopicArn)
``` 

## ⚡️ Quickstart SQS

The available functions are:
* CreateQueue
* DeleteMessage
* DeleteMessageBatch
* DeleteQueue
* GetQueueAttributes
* GetQueueUrl
* ListQueues
* ListQueueTags
* PurgeQueue
* ReceiveMessage
* SendMessage
* TagQueue
* UnTagQueue

You need to use AWS4D.SQS.Facade.Interfaces

```pascal
uses AWS4D.SQS.Facade.Interfaces;
```

* **SET Credentials**
```pascal
var
  FSQS: IAWS4DSQSFacade;
begin
  FSQS := NewSQSFacade;
  FSQS
    .AccessKey('')
    .SecretKey('')
    .Region('us-east-1');
end;
``` 

* **SEND Message**
```pascal
FSQS.SendMessage
  .Request
    .QueueUrl('urlSqsQueue')
    .MessageBody('Message Content')    
  .&End
  .Send;
``` 

* **RECEIVE Message**
```pascal
FSQS.ReceiveMessage
  .Request
    .MaxNumberOfMessages(3)
    .QueueUrl('urlSqsQueue')
  .&End
  .Send;
  
while FSQS.ReceiveMessage.Response.Messages.HasNext do
  ShowMessage(FSQS.ReceiveMessage.Response.Messages.Current.Body);
``` 

unit AWS4D.S3.Model.Interfaces;

interface

uses
  AWS4D.Model.Interfaces,
  System.Classes;

type
  IAWS4DS3ModelCreateObjectRequest = interface(IAWS4DModelRequest)
    ['{3CE0EA8E-22CD-4B87-876D-2F0C7564AB24}']
    function BucketName (Value: String): IAWS4DS3ModelCreateObjectRequest; overload;
    function FileName   (Value: String): IAWS4DS3ModelCreateObjectRequest; overload;
    function FileStream (Value: TStream): IAWS4DS3ModelCreateObjectRequest; overload;
    function ObjectName (Value: String): IAWS4DS3ModelCreateObjectRequest; overload;

    function BucketName : string; overload;
    function FileName   : string; overload;
    function ObjectName : String; overload;
    function FileStream : TStream; overload;
  end;

  IAWS4DS3ModelFactory = interface
    ['{3D8D63D1-2147-4F04-8A3F-43113F085A54}']
    function CreateObjectRequest: IAWS4DS3ModelCreateObjectRequest;
  end;

function S3ModelFactory: IAWS4DS3ModelFactory;

implementation

uses
  AWS4D.S3.Model.Factory;

function S3ModelFactory: IAWS4DS3ModelFactory;
begin
  result := TAWS4DS3ModelFactory.GetInstance;
end;

end.

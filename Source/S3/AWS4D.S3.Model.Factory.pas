unit AWS4D.S3.Model.Factory;

interface

uses
  AWS4D.S3.Model.Interfaces,
  AWS4D.S3.Model.ObjectInfo,
  AWS4D.S3.Model.DeleteObject.Request,
  AWS4D.S3.Model.CreateObject.Request,
  AWS4D.S3.Model.ObjectExist.Request,
  AWS4D.S3.Model.DownloadObject.Request,
  System.SysUtils;

type TAWS4DS3ModelFactory = class(TInterfacedObject, IAWS4DS3ModelFactory)

  private
    class var FInstance: IAWS4DS3ModelFactory;

    constructor createPrivate;

  protected
    function CreateDeleteObjectRequest: IAWS4DS3ModelDeleteObjectRequest;
    function CreateObjectInfo: IAWS4DS3ModelObjectInfo;
    function CreateObjectRequest: IAWS4DS3ModelCreateObjectRequest;
    function CreateObjectExistRequest: IAWS4DS3ModelObjectExistRequest;
    function CreateDownloadObjectRequest: IAWS4DS3ModelDownloadObjectRequest;

  public
    constructor create;
    class function GetInstance: IAWS4DS3ModelFactory;
end;

implementation

{ TAWS4DS3ModelFactory }

constructor TAWS4DS3ModelFactory.create;
begin
  raise Exception.CreateFmt('Use the class function GetInstance.', []);
end;

function TAWS4DS3ModelFactory.CreateDeleteObjectRequest: IAWS4DS3ModelDeleteObjectRequest;
begin
  result := TAWS4DS3ModelDeleteObjectRequest.New;
end;

function TAWS4DS3ModelFactory.CreateDownloadObjectRequest: IAWS4DS3ModelDownloadObjectRequest;
begin
  result := TAWS4DS3ModelDownloadObjectRequest.New;
end;

function TAWS4DS3ModelFactory.CreateObjectExistRequest: IAWS4DS3ModelObjectExistRequest;
begin
  result := TAWS4DS3ModelObjectExistRequest.New;
end;

function TAWS4DS3ModelFactory.CreateObjectInfo: IAWS4DS3ModelObjectInfo;
begin
  result := TAWS4DS3ModelObjectInfo.New;
end;

function TAWS4DS3ModelFactory.CreateObjectRequest: IAWS4DS3ModelCreateObjectRequest;
begin
  result := TAWS4DS3ModelCreateObjectRequest.New;
end;

constructor TAWS4DS3ModelFactory.createPrivate;
begin

end;

class function TAWS4DS3ModelFactory.GetInstance: IAWS4DS3ModelFactory;
begin
  if not Assigned(FInstance) then
    FInstance := TAWS4DS3ModelFactory.createPrivate;
  result := FInstance;
end;

end.

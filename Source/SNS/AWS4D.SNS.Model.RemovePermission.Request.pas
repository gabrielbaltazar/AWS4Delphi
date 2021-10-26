unit AWS4D.SNS.Model.RemovePermission.Request;

interface

uses
  AWS4D.SNS.Model.Interfaces;

type TAWS4DSNSModelRemovePermissionRequest<I: IInterface> = class(TInterfacedObject, IAWS4DSNSRemovePermissionRequest<I>)

  private
    [Weak]
    FParent: I;
    FLabel: String;
    FTopicArn: string;

  protected
    function &Label(Value: String): IAWS4DSNSRemovePermissionRequest<I>; overload;
    function &Label: String; overload;

    function TopicArn(Value: String): IAWS4DSNSRemovePermissionRequest<I>; overload;
    function TopicArn: String; overload;

    function &End: I;

  public
    constructor create(Parent: I);
    class function New(Parent: I): IAWS4DSNSRemovePermissionRequest<I>;
    destructor Destroy; override;
end;

implementation

{ TAWS4DSNSModelRemovePermissionRequest<I> }

constructor TAWS4DSNSModelRemovePermissionRequest<I>.create(Parent: I);
begin
  FParent := Parent;
end;

destructor TAWS4DSNSModelRemovePermissionRequest<I>.Destroy;
begin

  inherited;
end;

function TAWS4DSNSModelRemovePermissionRequest<I>.&End: I;
begin
  result := FParent;
end;

function TAWS4DSNSModelRemovePermissionRequest<I>.&Label(Value: String): IAWS4DSNSRemovePermissionRequest<I>;
begin
  result := Self;
  FLabel := Value;
end;

function TAWS4DSNSModelRemovePermissionRequest<I>.&Label: String;
begin
  result := FLabel;
end;

class function TAWS4DSNSModelRemovePermissionRequest<I>.New(Parent: I): IAWS4DSNSRemovePermissionRequest<I>;
begin
  result := Self.create(Parent);
end;

function TAWS4DSNSModelRemovePermissionRequest<I>.TopicArn(Value: String): IAWS4DSNSRemovePermissionRequest<I>;
begin
  result := Self;
  FTopicArn := Value;
end;

function TAWS4DSNSModelRemovePermissionRequest<I>.TopicArn: String;
begin
  result := FTopicArn;
end;

end.

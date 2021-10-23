unit AWS4D.SNS.Model.AddPermission.Request;

interface

uses
  AWS4D.SNS.Model.Interfaces,
  AWS4D.Core.Model.Types,
  AWS4D.Core.Model.Iterator,
  System.Generics.Collections;

type TAWS4DSNSModelAddPermissionRequest<I: IInterface> = class(TInterfacedObject, IAWS4DSNSAddPermissionRequest<I>)

  private
    [Weak]
    FParent: I;
    FLabel: string;
    FTopicArn: String;
    FActions: TList<String>;
    FAWSAccounts: TList<String>;
    FIteratorActions: IAWS4DIterator<String>;
    FIteratorAWSAccounts: IAWS4DIterator<String>;

  protected
    function AddActionName(Value: String): IAWS4DSNSAddPermissionRequest<I>;
    function AWSAccountId(Value: String): IAWS4DSNSAddPermissionRequest<I>;

    function &Label(Value: String): IAWS4DSNSAddPermissionRequest<I>; overload;
    function &Label: String; overload;

    function TopicArn(Value: String): IAWS4DSNSAddPermissionRequest<I>; overload;
    function TopicArn: String; overload;

    function ActionsName: IAWS4DIterator<String>;
    function AWSAccountsId: IAWS4DIterator<String>;

    function &End: I;

  public
    constructor create(Parent: I);
    class function New(Parent: I): IAWS4DSNSAddPermissionRequest<I>;
    destructor Destroy; override;
end;

implementation

{ TAWS4DSNSModelAddPermissionRequest<I> }

function TAWS4DSNSModelAddPermissionRequest<I>.ActionsName: IAWS4DIterator<String>;
begin
  Result := FIteratorActions;
end;

function TAWS4DSNSModelAddPermissionRequest<I>.AddActionName(Value: String): IAWS4DSNSAddPermissionRequest<I>;
begin
  result := Self;
  if not FActions.Contains(Value) then
    FActions.Add(Value);
end;

function TAWS4DSNSModelAddPermissionRequest<I>.AWSAccountId(Value: String): IAWS4DSNSAddPermissionRequest<I>;
begin
  result := Self;
  if not FAWSAccounts.Contains(Value) then
    FAWSAccounts.Add(Value);
end;

function TAWS4DSNSModelAddPermissionRequest<I>.AWSAccountsId: IAWS4DIterator<String>;
begin
  result := FIteratorAWSAccounts;
end;

constructor TAWS4DSNSModelAddPermissionRequest<I>.create(Parent: I);
begin
  FParent := Parent;
  FActions := TList<String>.create;
  FAWSAccounts := TList<String>.create;

  FIteratorActions := TAWS4DCoreModelIterator<String>.New(FActions);
  FIteratorAWSAccounts := TAWS4DCoreModelIterator<String>.New(FAWSAccounts);
end;

destructor TAWS4DSNSModelAddPermissionRequest<I>.Destroy;
begin

  inherited;
end;

function TAWS4DSNSModelAddPermissionRequest<I>.&End: I;
begin
  result := FParent;
end;

function TAWS4DSNSModelAddPermissionRequest<I>.&Label: String;
begin
  result := FLabel;
end;

function TAWS4DSNSModelAddPermissionRequest<I>.&Label(Value: String): IAWS4DSNSAddPermissionRequest<I>;
begin
  result := Self;
  FLabel := Value;
end;

class function TAWS4DSNSModelAddPermissionRequest<I>.New(Parent: I): IAWS4DSNSAddPermissionRequest<I>;
begin
  result := Self.create(Parent);
end;

function TAWS4DSNSModelAddPermissionRequest<I>.TopicArn: String;
begin
  result := FTopicArn;
end;

function TAWS4DSNSModelAddPermissionRequest<I>.TopicArn(Value: String): IAWS4DSNSAddPermissionRequest<I>;
begin
  result := Self;
  FTopicArn := Value;
end;

end.

unit AWS4D.SNS.Model.SetEndpointAttributes.Request;

interface

uses
  AWS4D.SNS.Model.Interfaces;

type TAWS4DSNSModelSetEndpointAttributesRequest<I: IInterface> = class(TInterfacedObject, IAWS4DSNSSetEndpointAttributesRequest<I>)

  private
    [Weak]
    FParent: I;
    FCustomUserData: String;
    FEnabled: Boolean;
    FToken: String;
    FEndpointArn: String;

  protected
    function CustomUserData(Value: string): IAWS4DSNSSetEndpointAttributesRequest<I>; overload;
    function CustomUserData: string; overload;

    function Enabled(Value: Boolean): IAWS4DSNSSetEndpointAttributesRequest<I>; overload;
    function Enabled: Boolean; overload;

    function Token(Value: string): IAWS4DSNSSetEndpointAttributesRequest<I>; overload;
    function Token: string; overload;

    function EndpointArn(Value: string): IAWS4DSNSSetEndpointAttributesRequest<I>; overload;
    function EndpointArn: string; overload;

    function &End: I;

  public
    constructor create(Parent: I);
    class function New(Parent: I): IAWS4DSNSSetEndpointAttributesRequest<I>;
    destructor Destroy; override;
end;

implementation

{ TAWS4DSNSModelSetEndpointAttributesRequest<I> }

constructor TAWS4DSNSModelSetEndpointAttributesRequest<I>.create(Parent: I);
begin
  FParent := Parent;
  FEnabled := False;
end;

function TAWS4DSNSModelSetEndpointAttributesRequest<I>.CustomUserData(Value: string): IAWS4DSNSSetEndpointAttributesRequest<I>;
begin
  result := Self;
  FCustomUserData := Value;
end;

function TAWS4DSNSModelSetEndpointAttributesRequest<I>.CustomUserData: string;
begin
  result := FCustomUserData;
end;

destructor TAWS4DSNSModelSetEndpointAttributesRequest<I>.Destroy;
begin

  inherited;
end;

function TAWS4DSNSModelSetEndpointAttributesRequest<I>.Enabled(Value: Boolean): IAWS4DSNSSetEndpointAttributesRequest<I>;
begin
  result := Self;
  FEnabled := Value;
end;

function TAWS4DSNSModelSetEndpointAttributesRequest<I>.Enabled: Boolean;
begin
  result := FEnabled;
end;

function TAWS4DSNSModelSetEndpointAttributesRequest<I>.&End: I;
begin
  result := FParent;
end;

function TAWS4DSNSModelSetEndpointAttributesRequest<I>.EndpointArn: string;
begin
  result := EndpointArn;
end;

function TAWS4DSNSModelSetEndpointAttributesRequest<I>.EndpointArn(Value: string): IAWS4DSNSSetEndpointAttributesRequest<I>;
begin
  result := Self;
  FEndpointArn := Value;
end;

class function TAWS4DSNSModelSetEndpointAttributesRequest<I>.New(Parent: I): IAWS4DSNSSetEndpointAttributesRequest<I>;
begin
  result := Self.create(Parent);
end;

function TAWS4DSNSModelSetEndpointAttributesRequest<I>.Token(Value: string): IAWS4DSNSSetEndpointAttributesRequest<I>;
begin
  result := Self;
  FToken := Value;
end;

function TAWS4DSNSModelSetEndpointAttributesRequest<I>.Token: string;
begin
  result := FToken;
end;

end.

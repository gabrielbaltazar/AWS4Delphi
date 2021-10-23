unit AWS4D.SNS.Model.SetPlatformApplicationAttributes.Request;

interface

uses
  AWS4D.SNS.Model.Interfaces;

type TAWS4DSNSModelSetPlatformApplicationAttributesRequest<I: IInterface> = class(TInterfacedObject, IAWS4DSNSSetPlatformApplicationAttributesRequest<I>)

  private
    [Weak]
    FParent: I;
    FPlatformCredential: String;
    FPlatformPrincipal: string;
    FEventEndpointCreated: string;
    FEventEndpointDeleted: String;
    FEventEndpointUpdated: string;
    FEventDeliveryFailure: string;
    FSuccessFeedbackRoleArn: String;
    FFailureFeedbackRoleArn: string;
    FSuccessFeedbackSampleRate: Integer;
    FPlatformApplicationArn: string;

  protected
    function PlatformCredential(Value: String): IAWS4DSNSSetPlatformApplicationAttributesRequest<I>; overload;
    function PlatformCredential: String; overload;

    function PlatformPrincipal(Value: String): IAWS4DSNSSetPlatformApplicationAttributesRequest<I>; overload;
    function PlatformPrincipal: String; overload;

    function EventEndpointCreated(Value: String): IAWS4DSNSSetPlatformApplicationAttributesRequest<I>; overload;
    function EventEndpointCreated: String; overload;

    function EventEndpointDeleted(Value: String): IAWS4DSNSSetPlatformApplicationAttributesRequest<I>; overload;
    function EventEndpointDeleted: String; overload;

    function EventEndpointUpdated(Value: String): IAWS4DSNSSetPlatformApplicationAttributesRequest<I>; overload;
    function EventEndpointUpdated: String; overload;

    function EventDeliveryFailure(Value: String): IAWS4DSNSSetPlatformApplicationAttributesRequest<I>; overload;
    function EventDeliveryFailure: String; overload;

    function SuccessFeedbackRoleArn(Value: String): IAWS4DSNSSetPlatformApplicationAttributesRequest<I>; overload;
    function SuccessFeedbackRoleArn: String; overload;

    function FailureFeedbackRoleArn(Value: String): IAWS4DSNSSetPlatformApplicationAttributesRequest<I>; overload;
    function FailureFeedbackRoleArn: String; overload;

    function SuccessFeedbackSampleRate(Value: Integer): IAWS4DSNSSetPlatformApplicationAttributesRequest<I>; overload;
    function SuccessFeedbackSampleRate: Integer; overload;

    function PlatformApplicationArn(Value: String): IAWS4DSNSSetPlatformApplicationAttributesRequest<I>; overload;
    function PlatformApplicationArn: String; overload;

    function &End: I;

  public
    constructor create(Parent: I);
    class function New(Parent: I): IAWS4DSNSSetPlatformApplicationAttributesRequest<I>;
    destructor Destroy; override;
end;

implementation

{ TAWS4DSNSModelSetPlatformApplicationAttributesRequest<I> }

constructor TAWS4DSNSModelSetPlatformApplicationAttributesRequest<I>.create(Parent: I);
begin
  FParent := Parent;
end;

destructor TAWS4DSNSModelSetPlatformApplicationAttributesRequest<I>.Destroy;
begin

  inherited;
end;

function TAWS4DSNSModelSetPlatformApplicationAttributesRequest<I>.&End: I;
begin
  result := FParent;
end;

function TAWS4DSNSModelSetPlatformApplicationAttributesRequest<I>.EventDeliveryFailure(Value: String): IAWS4DSNSSetPlatformApplicationAttributesRequest<I>;
begin
  result := Self;
  FEventDeliveryFailure := Value;
end;

function TAWS4DSNSModelSetPlatformApplicationAttributesRequest<I>.EventDeliveryFailure: String;
begin
  result := FEventDeliveryFailure;
end;

function TAWS4DSNSModelSetPlatformApplicationAttributesRequest<I>.EventEndpointCreated: String;
begin
  result := FEventEndpointCreated;
end;

function TAWS4DSNSModelSetPlatformApplicationAttributesRequest<I>.EventEndpointCreated(Value: String): IAWS4DSNSSetPlatformApplicationAttributesRequest<I>;
begin
  result := Self;
  FEventEndpointCreated := Value;
end;

function TAWS4DSNSModelSetPlatformApplicationAttributesRequest<I>.EventEndpointDeleted: String;
begin
  result := FEventEndpointDeleted;
end;

function TAWS4DSNSModelSetPlatformApplicationAttributesRequest<I>.EventEndpointDeleted(Value: String): IAWS4DSNSSetPlatformApplicationAttributesRequest<I>;
begin
  Result := Self;
  FEventEndpointDeleted := Value;
end;

function TAWS4DSNSModelSetPlatformApplicationAttributesRequest<I>.EventEndpointUpdated: String;
begin
  result := FEventEndpointUpdated;
end;

function TAWS4DSNSModelSetPlatformApplicationAttributesRequest<I>.EventEndpointUpdated(Value: String): IAWS4DSNSSetPlatformApplicationAttributesRequest<I>;
begin
  Result := Self;
  FEventEndpointUpdated := Value;
end;

function TAWS4DSNSModelSetPlatformApplicationAttributesRequest<I>.FailureFeedbackRoleArn(Value: String): IAWS4DSNSSetPlatformApplicationAttributesRequest<I>;
begin
  result := Self;
  FFailureFeedbackRoleArn := Value;
end;

function TAWS4DSNSModelSetPlatformApplicationAttributesRequest<I>.FailureFeedbackRoleArn: String;
begin
  result := FFailureFeedbackRoleArn;
end;

class function TAWS4DSNSModelSetPlatformApplicationAttributesRequest<I>.New(Parent: I): IAWS4DSNSSetPlatformApplicationAttributesRequest<I>;
begin
  result := Self.create(Parent);
end;

function TAWS4DSNSModelSetPlatformApplicationAttributesRequest<I>.PlatformApplicationArn: String;
begin
  result := FPlatformApplicationArn;
end;

function TAWS4DSNSModelSetPlatformApplicationAttributesRequest<I>.PlatformApplicationArn(Value: String): IAWS4DSNSSetPlatformApplicationAttributesRequest<I>;
begin
  result := Self;
  FPlatformApplicationArn := Value;
end;

function TAWS4DSNSModelSetPlatformApplicationAttributesRequest<I>.PlatformCredential(Value: String): IAWS4DSNSSetPlatformApplicationAttributesRequest<I>;
begin
  result := Self;
  FPlatformCredential := Value;
end;

function TAWS4DSNSModelSetPlatformApplicationAttributesRequest<I>.PlatformCredential: String;
begin
  result := FPlatformCredential;
end;

function TAWS4DSNSModelSetPlatformApplicationAttributesRequest<I>.PlatformPrincipal: String;
begin
  Result := FPlatformPrincipal;
end;

function TAWS4DSNSModelSetPlatformApplicationAttributesRequest<I>.PlatformPrincipal(Value: String): IAWS4DSNSSetPlatformApplicationAttributesRequest<I>;
begin
  result := Self;
  FPlatformPrincipal := Value;
end;

function TAWS4DSNSModelSetPlatformApplicationAttributesRequest<I>.SuccessFeedbackRoleArn(Value: String): IAWS4DSNSSetPlatformApplicationAttributesRequest<I>;
begin
  result := Self;
  FSuccessFeedbackRoleArn := Value;
end;

function TAWS4DSNSModelSetPlatformApplicationAttributesRequest<I>.SuccessFeedbackRoleArn: String;
begin
  result := FSuccessFeedbackRoleArn;
end;

function TAWS4DSNSModelSetPlatformApplicationAttributesRequest<I>.SuccessFeedbackSampleRate(Value: Integer): IAWS4DSNSSetPlatformApplicationAttributesRequest<I>;
begin
  result := Self;
  FSuccessFeedbackSampleRate := Value;
end;

function TAWS4DSNSModelSetPlatformApplicationAttributesRequest<I>.SuccessFeedbackSampleRate: Integer;
begin
  result := FSuccessFeedbackSampleRate;
end;

end.

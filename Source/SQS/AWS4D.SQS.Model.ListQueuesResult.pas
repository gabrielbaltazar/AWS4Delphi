unit AWS4D.SQS.Model.ListQueuesResult;

interface

uses
  AWS4D.Model.Classes,
  AWS4D.SQS.Model.Interfaces,
  System.Generics.Collections;

type TAWS4DSQSModelListQueuesResult = class(TAWS4DModelResponseMetadata, IAWS4DSQSModelListQueuesResult)

  private
    FQueuesUrls: TList<String>;
    FNextToken: string;

  protected
    function QueuesUrls: TList<String>; overload;
    function NextToken: string; overload;

  public
    function QueuesUrls(Value: TList<String>): TAWS4DSQSModelListQueuesResult; overload;
    function NextToken(Value: String): TAWS4DSQSModelListQueuesResult; overload;

    class function New: IAWS4DSQSModelListQueuesResult;
    destructor Destroy; override;
end;


implementation

{ TAWS4DSQSModelListQueuesResult }

function TAWS4DSQSModelListQueuesResult.NextToken: string;
begin
  result := FNextToken;
end;

function TAWS4DSQSModelListQueuesResult.QueuesUrls: TList<String>;
begin
  result := FQueuesUrls;
end;

destructor TAWS4DSQSModelListQueuesResult.Destroy;
begin
  FQueuesUrls.Free;
  inherited;
end;

class function TAWS4DSQSModelListQueuesResult.New: IAWS4DSQSModelListQueuesResult;
begin
  result := Self.Create;
end;

function TAWS4DSQSModelListQueuesResult.NextToken(Value: String): TAWS4DSQSModelListQueuesResult;
begin
  result := Self;
  FNextToken := Value;
end;

function TAWS4DSQSModelListQueuesResult.QueuesUrls(Value: TList<String>): TAWS4DSQSModelListQueuesResult;
begin
  result := Self;
  FQueuesUrls := Value;
end;

end.

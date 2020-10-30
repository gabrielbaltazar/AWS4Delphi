unit AWS4D.SQS.Model.Queue;

interface

uses
  AWS4D.SQS.Model.Interfaces,
  System.Generics.Collections;

type TAWS4DSQSModelListQueuesResult = class(TInterfacedObject, IAWS4DSQSModelListQueuesResult)

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

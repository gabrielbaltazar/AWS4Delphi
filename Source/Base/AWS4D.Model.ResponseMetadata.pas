unit AWS4D.Model.ResponseMetadata;

interface

uses
  AWS4D.Model.Interfaces;

type TAWS4DModelResponseMetadata = class(TInterfacedObject, IAWS4DModelResponseMetadata)

  private
    FRequestId: String;

  protected
    function RequestId: string; overload;

  public
    function RequestId(Value: String): TAWS4DModelResponseMetadata; overload;

end;

implementation

{ TAWS4DModelResponseMetadata }

function TAWS4DModelResponseMetadata.RequestId(Value: String): TAWS4DModelResponseMetadata;
begin
  result := Self;
  FRequestId := Value;
end;

function TAWS4DModelResponseMetadata.RequestId: string;
begin
  result := FRequestId;
end;

end.

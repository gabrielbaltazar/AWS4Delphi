unit AWS4D.Core.Model.Iterator;

interface

uses
  System.Generics.Collections,
  System.SysUtils,
  AWS4D.Core.Model.Types;

type
  TAWS4DCoreModelIterator<T> = class(TInterfacedObject, IAWS4DIterator<T>)
  private
    FIndex: Integer;
    FList: TList<T>;
  protected
    function First: IAWS4DIterator<T>;
    function HasNext: Boolean;
    function Index: Integer; overload;
    function Current: T;
    function Last: T;
    function Index(AValue: Integer): IAWS4DIterator<T>; overload;
    function Count: Integer;
  public
    constructor Create(AList: TList<T>);
    class function New(AList: TList<T>): IAWS4DIterator<T>;
    destructor Destroy; override;
  end;

implementation

{ TAWS4DCoreModelIterator<T> }

function TAWS4DCoreModelIterator<T>.Count: Integer;
begin
  Result := FList.Count;
end;

constructor TAWS4DCoreModelIterator<T>.Create(AList: TList<T>);
begin
  FList := AList;
  FIndex := -1;
end;

function TAWS4DCoreModelIterator<T>.Current: T;
begin
  if FIndex < 0 then
    FIndex := 0;         
  if FList.Count > FIndex then
    Result := FList.Items[FIndex];
end;

destructor TAWS4DCoreModelIterator<T>.Destroy;
begin
  FList.Free;
  inherited;
end;

function TAWS4DCoreModelIterator<T>.First: IAWS4DIterator<T>;
begin
  Result := Self;
  FIndex := 0;
end;

function TAWS4DCoreModelIterator<T>.HasNext: Boolean;
begin
  Inc(FIndex);
  Result := FList.Count > FIndex;
end;

function TAWS4DCoreModelIterator<T>.Index(AValue: Integer): IAWS4DIterator<T>;
begin
  Result := Self;
  FIndex := AValue;
end;

function TAWS4DCoreModelIterator<T>.Index: Integer;
begin
  Result := FIndex;
end;

function TAWS4DCoreModelIterator<T>.Last: T;
begin
  Result := FList.Last;
  FIndex := FList.Count - 1;
end;

class function TAWS4DCoreModelIterator<T>.New(AList: TList<T>): IAWS4DIterator<T>;
begin
  Result := Self.Create(AList);
end;

end.

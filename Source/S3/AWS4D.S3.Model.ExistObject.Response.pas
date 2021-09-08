unit AWS4D.S3.Model.ExistObject.Response;

interface

uses
  AWS4D.S3.Model.Interfaces,
  AWS4D.Core.Model.Types,
  AWS4D.Core.Model.Iterator,
  AWS4D.Core.Helper.JSON,
  System.Generics.Collections,
  System.JSON;

type TAWS4S3ExistObjectResponse<I: IInterface> = class(TInterfacedObject, IAWS4DS3ExistObjectResponse<I>)

  private
    [Weak]
    FParent: I;
    FExist: Boolean;

  protected
    function Exist: Boolean;

    function &End: I;

  public
    constructor create(Parent: I; bExist: Boolean);
    class function New(Parent: I; bExist: Boolean): IAWS4DS3ExistObjectResponse<I>;
    destructor Destroy; override;

end;

implementation

constructor TAWS4S3ExistObjectResponse<I>.create(Parent: I; bExist: Boolean);
begin
  FParent := Parent;
  FExist := bExist;
end;

destructor TAWS4S3ExistObjectResponse<I>.Destroy;
begin

  inherited;
end;

function TAWS4S3ExistObjectResponse<I>.&End: I;
begin
  result := FParent;
end;

function TAWS4S3ExistObjectResponse<I>.Exist: Boolean;
begin
  result := FExist;
end;

class function TAWS4S3ExistObjectResponse<I>.New(Parent: I; bExist: Boolean): IAWS4DS3ExistObjectResponse<I>;
begin
  result := Self.create(Parent, bExist);
end;

end.

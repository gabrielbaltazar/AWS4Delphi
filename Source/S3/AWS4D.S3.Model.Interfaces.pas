unit AWS4D.S3.Model.Interfaces;

interface

uses
  AWS4D.Core.Model.Types;

type
  IAWS4DS3ExistBucketRequest<I: IInterface> = interface
    ['{46D157EB-75BD-426E-A7D1-68B31F9632A8}']
    function BucketName(Value: String): IAWS4DS3ExistBucketRequest<I>; overload;
    function BucketName: String; overload;

    function &End: I;
  end;

  IAWS4DS3ExistBucketResponse<I: IInterface> = interface
    ['{5661C319-A357-4FD7-AC24-3F5FB7700F12}']
    function Exist: Boolean;
  end;

  IAWS4DS3CreateBucketRequest<I: IInterface> = interface
    ['{904D2523-5D22-4B94-AB44-86662FB680A6}']
    function BucketName(Value: String): IAWS4DS3CreateBucketRequest<I>; overload;
    function BucketName: String; overload;

    function &End: I;
  end;

  IAWS4DS3DeleteBucketRequest<I: IInterface> = interface
    ['{B8FB6B27-E75F-4DE6-A229-FB35723E39D7}']
    function BucketName(Value: String): IAWS4DS3DeleteBucketRequest<I>; overload;
    function BucketName: String; overload;

    function &End: I;
  end;

  IAWS4DS3ListBucketsResponse<I: IInterface> = interface
    ['{4EE25118-D4CB-419D-A238-E19C9818EF6F}']
    function Buckets: IAWS4DIterator<String>;
  end;

implementation

end.

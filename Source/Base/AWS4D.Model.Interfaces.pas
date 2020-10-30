unit AWS4D.Model.Interfaces;

interface

type
  IAWS4DModelRequest = interface
    ['{20FB4501-172E-42EE-8A10-CD953ECA9F4B}']
  end;

  IAWS4DModelResponseMetadata = interface
    ['{89DECCAA-DA41-46C6-8660-F85E27728E08}']
    function RequestId: string;
  end;

implementation

end.

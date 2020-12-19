unit AWS4D.Utils;

interface

uses
  System.SysUtils;

function URLEncodeValue(const Value: String): string;
function URLEncode(const Str: string; const EncodeChars: array of Char): string;

implementation

// Based on AmazonConnect Component

function URLEncode(const Str: string; const EncodeChars: array of Char): string;

  function IsHexChar(C: Byte): Boolean;
  begin
    case Char(C) of
      '0'..'9', 'a'..'f', 'A'..'F':  Result := True;
    else
      Result := False;
    end;
  end;

const
  // Safe characters from on TIdURL.ParamsEncode
  // '*<>#%"{}|\^[]`'
  DefaultUnsafeChars: array[0..13] of Byte = (Ord('*'), Ord('<'), Ord('>'), Ord('#'),
    Ord('%'), Ord('"'), Ord('{'), Ord('}'), Ord('|'), Ord('\'), Ord('^'), Ord('['), Ord(']'), Ord('`'));
  XD: array[0..15] of char = ('0', '1', '2', '3', '4', '5', '6', '7',
                              '8', '9', 'A', 'B', 'C', 'D', 'E', 'F');

var
  Buff: TBytes;
  I, J: Integer;
  IsUnsafe: Boolean;
begin

  Result := '';
  if Str <> '' then
  begin
    Buff := TEncoding.UTF8.GetBytes(Str);
    I := 0;
    while I < Length(Buff) do
    begin
      if (Buff[I] < 33) or (Buff[I] > 127) then
        IsUnsafe := True
      else
      begin
        IsUnsafe := False;
        for J := 0 to Length(DefaultUnsafeChars) - 1 do
          if Buff[I] = DefaultUnsafeChars[J] then
          begin
            IsUnsafe := True;
            break;
          end;
        if not IsUnsafe then
          for J := 0 to Length(EncodeChars) - 1 do
            if Char(Buff[I]) = EncodeChars[J] then
            begin
              IsUnsafe := True;
              break;
            end;
      end;
      if IsUnsafe then
        Result := Result + '%' + XD[(Buff[I] shr 4) and $0F] + XD[Buff[I] and $0F]
      else
        Result := Result + Char(Buff[I]);
      Inc(I);
    end;
  end;
end;

function URLEncodeValue(const Value: String): string;
begin
  Result := URLEncode(Value, ['=', ':', '/', '+', '(', ')', '/', '!', '"', '$', '@', '&', ',',
                              '''', '?', ';']);
end;

end.

unit U_Num;
{
Unit: U_Num.pas
By: H@PPyZERØ5
E-mail: happy05@programmer.net
}
interface

Function BinToDec (Bin : String) : Word;
Function DecToBin (n : Word) : String;

implementation

{ ----------------------------------------------------------------
BinToDec:
 ---------------------------------------------------------------- }
Function BinToDec (Bin : String) : Word;
Var
  i, L : Integer;
Begin
  Result := 0;
  L := Length(Bin);
  for i := 1 to L do
    if Bin[i] = '1' then Result := Result + (1 shl (L - i));
  BinToDec := Result;
End;

{ ----------------------------------------------------------------
DecToBin:
 ---------------------------------------------------------------- }
Function DecToBin (n : Word) : String;
Var
  i : Integer;
Begin
  Result := '';
  for i := 0 to 15 do
    if n and (1 shl i) <> 0 then Result := '1' + Result
                                  else Result := '0' + Result;
  DecToBin := Result;
End;

end.

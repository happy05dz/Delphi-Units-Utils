unit U_String;
{
Unit: U_String.pas
By: H@PPyZERØ5
E-mail: happy05@programmer.net
}
interface

uses
   Winapi.Windows, System.SysUtils, Vcl.Dialogs;

procedure ShowInt(Int: Integer);
function DosStrToWinStr(Const StrDos: String): String;
function DosStrToWinStrWide(Const StrDos: String): WideString;

implementation

{ ----------------------------------------------------------------
ShowInt:
 ---------------------------------------------------------------- }
procedure ShowInt(Int: Integer);
begin
   ShowMessage(IntToStr(Int));
end;

{ ----------------------------------------------------------------
DosStrToWinStr:
 ---------------------------------------------------------------- }
function DosStrToWinStr(Const StrDos: String): String;
begin
  SetLength(Result, Length(StrDos));
  OemToCharBuff(PAnsiChar(StrDos),@Result[1],Length(StrDos));
end;

{ ----------------------------------------------------------------
DosStrToWinStrWide:
 ---------------------------------------------------------------- }
function DosStrToWinStrWide(Const StrDos: String): WideString;
begin
  SetLength(Result,Length(StrDos));
  OemToCharBuffW(PAnsiChar(StrDos),@Result[1],Length(StrDos));
end;

end.

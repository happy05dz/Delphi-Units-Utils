unit U_CSS;
{
Unit: U_CSS.pas
By: H@PPyZERØ5
E-mail: happy05@programmer.net
}
interface
uses
   Winapi.windows, System.UITypes, System.SysUtils;


Function HexToColor(s: String): TColor;

implementation

Function HexToColor(s: String): TColor;
Begin
  if Pos('#', s) <> 0 Then Delete(s, Pos('#', s), 1);
  if Pos('$', s) <> 0 Then Delete(s, Pos('$', s), 1);
  Result := RGB(StrToInt('$' + Copy(s, 1, 2)),StrToInt('$' + Copy(s, 3, 2)),
                StrToInt('$' + Copy(s, 5, 2)));
End;


end.

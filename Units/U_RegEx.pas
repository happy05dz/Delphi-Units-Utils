unit U_RegEx;
{
Unit: U_RegEx.pas
By: H@PPyZERØ5
E-mail: happy05@programmer.net
}
interface
uses
   System.RegularExpressions;

function ansi_remove_cursor_ms(SubjectString: string): string;
function regex_dz_mobile_phone(Phonenumber: string): Boolean;

implementation

{ ----------------------------------------------------------------
ansi_remove_cursor_ms:
 ---------------------------------------------------------------- }
function ansi_remove_cursor_ms(SubjectString: string): string;
var
   ResultString: string;
begin
try
	ResultString := TRegEx.Replace(SubjectString, '\e\[(K|s|u|2J|2K|\p{Nd}+(A|B|C|D|E|F|G|J|K|S|T)|\p{Nd}+;\p{Nd}+(H|f))', '', [roMultiLine]);
  Result := ResultString;
  except
   Result := 'Syntax error in the regular expression';
	end;
end;

{ ----------------------------------------------------------------
regex_dz_mobile_phone:
 ---------------------------------------------------------------- }
{Example :
regex_dz_mobile_phone("021******"); // false
regex_dz_mobile_phone("0770******"); // true
regex_dz_mobile_phone("0550******"); // true
regex_dz_mobile_phone("0440******"); // false
regex_dz_mobile_phone("0660******"); // true
regex_dz_mobile_phone("00213660******"); // true
regex_dz_mobile_phone("+213660******"); // true
...}
function regex_dz_mobile_phone(Phonenumber: string): Boolean;
var
   ResultString: string;
begin
try
	if TRegEx.IsMatch(Phonenumber, '(00213|\+213|0)(5|6|7)[0-9]{8}') then
  Result := true
  else
   Result := false;
  except
   Result := false;
	end;
end;

end.

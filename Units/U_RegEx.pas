unit U_RegEx;
{
Unit: U_RegEx.pas
By: H@PPyZERØ5
E-mail: happy05@programmer.net
}
interface
uses
   System.RegularExpressions;

//const
//	DatePattern           = '(?i)(?:[0-3]?\d(?:st|nd|rd|th)?\s+(?:of\s+)?(?:jan\.?|january|feb\.?|february|mar\.?|march|apr\.?|april|may|jun\.?|june|jul\.?|july|aug\.?|august|sep\.?|september|oct\.?|october|nov\.?|november|dec\.?|december)|(?:jan\.?|january|feb\.?|february|mar\.?|march|apr\.?|april|may|jun\.?|june|jul\.?|july|aug\.?|august|sep\.?|september|oct\.?|october|nov\.?|november|dec\.?|december)\s+[0-3]?\d(?:st|nd|rd|th)?)(?:\,)?\s*(?:\d{4})?|[0-3]?\d[-\./][0-3]?\d[-\./]\d{2,4}';
//	TimePattern           = '(?i)\d{1,2}:\d{2} ?(?:[ap]\.?m\.?)?|\d[ap]\.?m\.?';
//	PhonePattern          = '(?:(?:\+?\d{1,3}[-.\s*]?)?(?:\(?\d{3}\)?[-.\s*]?)?\d{3}[-.\s*]?\d{4,6})|(?:(?:(?:\(\+?\d{2}\))|(?:\+?\d{2}))\s*\d{2}\s*\d{3}\s*\d{4})';
//	PhonesWithExtsPattern = '(?i)(?:(?:\+?1\s*(?:[.-]\s*)?)?(?:\(\s*(?:[2-9]1[02-9]|[2-9][02-8]1|[2-9][02-8][02-9])\s*\)|(?:[2-9]1[02-9]|[2-9][02-8]1|[2-9][02-8][02-9]))\s*(?:[.-]\s*)?)?(?:[2-9]1[02-9]|[2-9][02-9]1|[2-9][02-9]{2})\s*(?:[.-]\s*)?(?:[0-9]{4})(?:\s*(?:#|x\.?|ext\.?|extension)\s*(?:\d+)?)';
//	LinkPattern           = '(?:(?:https?:\/\/)?(?:[a-z0-9.\-]+|www|[a-z0-9.\-])[.](?:[^\s()<>]+|\((?:[^\s()<>]+|(?:\([^\s()<>]+\)))*\))+(?:\((?:[^\s()<>]+|(?:\([^\s()<>]+\)))*\)|[^\s!()\[\]{};:\".,<>?]))';
//	EmailPattern          = '(?i)([A-Za-z0-9!#$%&*+\/=?^_{|.}~-]+@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?)';
//	IPPattern             = '(?:(?:[0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])\.){3}(?:25[0-5]|2[0-4][0-9]|1[0-9]{2}|[1-9][0-9]|[0-9])';
//	IPv6Pattern           = '\s*(?:(?:(?:[0-9A-Fa-f]{1,4}:){7}(?:[0-9A-Fa-f]{1,4}|:))|(?:(?:[0-9A-Fa-f]{1,4}:){6}(?::[0-9A-Fa-f]{1,4}|(?:(?:25[0-5]|2[0-4]\d|1\d\d|[1-9]?\d)(?:\.(?:25[0-5]|2[0-4]\d|1\d\d|[1-9]?\d)){3})|:))|(?:(?:[0-9A-Fa-f]{1,4}:){5}(?:(?:(?::[0-9A-Fa-f]{1,4}){1,2})|:(?:(?:25[0-5]|2[0-4]\d|1\d\d|[1-9]?\d)(?:\.(?:25[0-5]|2[0-4]\d|1\d\d|[1-9]?\d)){3})|:))|(?:(?:[0-9A-Fa-f]{1,4}:){4}(?:(?:(?::[0-9A-Fa-f]{1,4}){1,3})|(?:(?::[0-9A-Fa-f]{1,4})?:(?:(?:25[0-5]|2[0-4]\d|1\d\d|[1-9]?\d)(?:\.(?:25[0-5]|2[0-4]\d|1\d\d|[1-9]?\d)){3}))|:))|(?:(?:[0-9A-Fa-f]{1,4}:){3}(?:(?:(?::[0-9A-Fa-f]{1,4}){1,4})|(?:(?::[0-9A-Fa-f]{1,4}){0,2}:(?:(?:25[0-5]|2[0-4]\d|1\d\d|[1-9]?\d)(?:\.(?:25[0-5]|2[0-4]\d|1\d\d|[1-9]?\d)){3}))|:))|(?:(?:[0-9A-Fa-f]{1,4}:){2}(?:(?:(?::[0-9A-Fa-f]{1,4}){1,5})|(?:(?::[0-9A-Fa-f]{1,4}){0,3}:(?:(?:25[0-5]|2[0-4]\d|1\d\d|[1-9]?\d)(?:\.(?:25[0-5]|2[0-4]\d|1\d\d|[1-9]?\d)){3}))|:))|(?:(?:[0-9A-Fa-f]{1,4}:){1}(?:(?:(?::[0-9A-Fa-f]{1,4}){1,6})|(?:(?::[0-9A-Fa-f]{1,4}){0,4}:(?:(?:25[0-5]|2[0-4]\d|1\d\d|[1-9]?\d)(?:\.(?:25[0-5]|2[0-4]\d|1\d\d|[1-9]?\d)){3}))|:))|(?::(?:(?:(?::[0-9A-Fa-f]{1,4}){1,7})|(?:(?::[0-9A-Fa-f]{1,4}){0,5}:(?:(?:25[0-5]|2[0-4]\d|1\d\d|[1-9]?\d)(?:\.(?:25[0-5]|2[0-4]\d|1\d\d|[1-9]?\d)){3}))|:)))(?:%.+)?\s*';
//	PricePattern          = '[$]\s?[+-]?[0-9]{1,3}(?:(?:,?[0-9]{3}))*(?:\.[0-9]{1,2})?';
//	HexColorPattern       = '(?:#?([0-9a-fA-F]{6}|[0-9a-fA-F]{3}))';
//	CreditCardPattern     = '(?:(?:(?:\d{4}[- ]?){3}\d{4}|\d{15,16}))';
//	VISACreditCardPattern = '4\d{3}[\s-]?\d{4}[\s-]?\d{4}[\s-]?\d{4}';
//	MCCreditCardPattern   = '5[1-5]\d{2}[\s-]?\d{4}[\s-]?\d{4}[\s-]?\d{4}';
//	BtcAddressPattern     = '[13][a-km-zA-HJ-NP-Z1-9]{25,34}';
//	StreetAddressPattern  = '\d{1,4} [\w\s]{1,20}(?:street|st|avenue|ave|road|rd|highway|hwy|square|sq|trail|trl|drive|dr|court|ct|park|parkway|pkwy|circle|cir|boulevard|blvd)\W?';
//	ZipCodePattern        = '\b\d{5}(?:[-\s]\d{4})?\b';
//	PoBoxPattern          = '(?i)P\.? ?O\.? Box \d+';
//	SSNPattern            = '(?:\d{3}-\d{2}-\d{4})';
//	MD5HexPattern         = '[0-9a-fA-F]{32}';
//	SHA1HexPattern        = '[0-9a-fA-F]{40}';
//	SHA256HexPattern      = '[0-9a-fA-F]{64}';
//	GUIDPattern           = '[0-9a-fA-F]{8}-?[a-fA-F0-9]{4}-?[a-fA-F0-9]{4}-?[a-fA-F0-9]{4}-?[a-fA-F0-9]{12}';
//	ISBN13Pattern         = '(?:[\d]-?){12}[\dxX]';
//	ISBN10Pattern         = '(?:[\d]-?){9}[\dxX]';
//	MACAddressPattern     = '(([a-fA-F0-9]{2}[:-]){5}([a-fA-F0-9]{2}))';
//	IBANPattern           = '[A-Z]{2}\d{2}[A-Z0-9]{4}\d{7}([A-Z\d]?){0,16}';
	
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
	if TRegEx.IsMatch(Phonenumber, '^(00213|\+213|0)(5|6|7)[0-9]{8}') then
  Result := true
  else
   Result := false;
  except
   Result := false;
	end;
end;

end.

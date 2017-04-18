unit U_HTML;
{
Unit: U_HTML.pas
By: H@PPyZERØ5
E-mail: happy05@programmer.net
}
interface
uses
   System.SysUtils;

type
  HTMLstr = string[8];

const HTML_length = 94;

   HTML_character: array[0..html_length] of char = (
     //ASCII Characters:
     ' ','!','"','#','$','%','&','''','(',')','*','+',',','-','.','/','0','1','2',
     '3','4','5','6','7','8','9',':',';','<','=','>','?','@','A','B','C','D','E',
     'F','G','H','I','G','K','L','M','N','O','P','Q','R','S','T','U','V','W',
     'X','Y','Z','[','\',']','^','_','`','a','b','c','d','e','f','g','h','i','g',
     'k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z','{','|','}',
     '~',
     //ISO-8859-1 Characters:
     'À','Á','Â','Ã','Ä','Å','Æ','Ç','È','É','Ê','Ë','Ì','Í','Î','Ï','Ð','Ñ','Ò',
     'Ó','Ô','Õ','Ö','Ø','Ù','Ú','Û','Ü','Ý','Þ','ß','à','á','â','ã','ä','å','æ',
     'ç','è','é','ê','ë','ì','í','î','ï','ð','ñ','ò','ó','ô','õ','ö','ø','ù','ú',
     'û','ü','ý','þ','ÿ',
     //ISO-8859-1 Symbols:
     '¡','¢','£','¤','¥','¦','§','¨','©','ª','«','¬','®','¯','°','±','²','³','´',
     'µ','¶','¸','¹','º','»','¼','½','¾','¿','×','÷',
     //Math Symbols:
     '','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','',
     //Greek Letters:
     '','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','',
     //Miscellaneous HTML entities:
     '','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','');

   HTML_entityname: array[0..html_length] of HTMLstr = (
     '&nbsp;','!','"','#','$','%','&amp;','''','(',')','*','+',',','-','.','/','0','1','2',
     '3','4','5','6','7','8','9',':',';','&lt;','=','&gt;','?','@','A','B','C','D','E',
     'F','G','H','I','G','K','L','M','N','O','P','Q','R','S','T','U','V','W',
     'X','Y','Z','[','\',']','^','_','`','a','b','c','d','e','f','g','h','i','g',
     'k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z','{','|','}',
     '~');

   HTML_entitynumber: array[0..html_length] of HTMLstr = (
     '&#160;','&#33;','&#34;','&#35;','&#36;','&#37;','&#38;','&#39;','&#40;','&#41;',
     '&#42;','&#43;','&#44;','&#45;','&#46;','&#47;','&#48;','&#49;','&#50;','&#51;',
     '&#52;','&#53;','&#54;','&#55;','&#56;','&#57;','&#58;','&#59;','&#60;','&#61;',
     '&#62;','&#63;','&#64;','&#65;','&#66;','&#67;','&#68;','&#69;','&#70;','&#71;',
     '&#72;','&#73;','&#74;','&#75;','&#76;','&#77;','&#78;','&#79;','&#80;','&#81;',
     '&#82;','&#83;','&#84;','&#85;','&#86;','&#87;','&#88;','&#89;','&#90;','&#91;',
     '&#92;','&#93;','&#94;','&#95;','&#96;','&#97;','&#98;','&#99;','&#100;','&#101;',
     '&#102;','&#103;','&#104;','&#105;','&#106;','&#107;','&#108;','&#109;','&#110;',
     '&#111;','&#112;','&#113;','&#114;','&#115;','&#116;','&#117;','&#118;','&#119;',
     '&#120;','&#121;','&#122;','&#123;','&#124;','&#125;','&#126;');



function CharToHTMLentityname(Chr: Char): string;
function StringToHTMLentityname(Str: String): String;
function CharToHTMLentitynumber(Chr: Char): string;
function StringToHTMLentitynumber(Str: String): String;

implementation

function CharToHTMLentityname(Chr: Char): string;
var i: integer;
begin
  Result := Chr;
  for i := 0 to High(HTML_character) do
    if HTML_character[i] = Chr then Result := HTML_entityname[i];
end;

function StringToHTMLentityname(Str: String): String;
var
   I: Integer;
   Chr: Char;
   ReplStr: String;
begin
   for I:= 1 to Length(Str) do begin
      Chr:= Str[I];
      ReplStr:= CharToHTMLentityname(Chr);
      result:= result + ReplStr;
   end;
end;

function CharToHTMLentitynumber(Chr: Char): string;
var i: integer;
begin
  Result := Chr;
  for i := 0 to High(HTML_character) do
    if HTML_character[i] = Chr then Result := HTML_entitynumber[i];
end;

function StringToHTMLentitynumber(Str: String): String;
var
   I: Integer;
   Chr: Char;
   ReplStr: String;
begin
   for I:= 1 to Length(Str) do begin
      Chr:= Str[I];
      ReplStr:= CharToHTMLentitynumber(Chr);
      result:= result + ReplStr;
   end;
end;

end.

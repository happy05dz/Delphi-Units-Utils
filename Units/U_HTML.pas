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

const HTML_length = 187;

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
     'µ','¶','¸','¹','º','»','¼','½','¾','¿','×','÷');

   HTML_entityname: array[0..html_length] of HTMLstr = (
     '&nbsp;','!','"','#','$','%','&amp;','''','(',')','*','+',',','-','.','/','0','1','2',
     '3','4','5','6','7','8','9',':',';','&lt;','=','&gt;','?','@','A','B','C','D','E',
     'F','G','H','I','G','K','L','M','N','O','P','Q','R','S','T','U','V','W',
     'X','Y','Z','[','\',']','^','_','`','a','b','c','d','e','f','g','h','i','g',
     'k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z','{','|','}',
     '~','&Agrave;','&Aacute;','&Acirc;','&Atilde;','&Auml;','&Aring;','&AElig;',
     '&Ccedil;','&Egrave;','&Eacute;','&Ecirc;','&Euml;','&Igrave;','&Iacute;','&Icirc;',
     '&Iuml;','&ETH;','&Ntilde;','&Ograve;','&Oacute;','&Ocirc;','&Otilde;','&Ouml;',
     '&Oslash;','&Ugrave;','&Uacute;','&Ucirc;','&Uuml;','&Yacute;','&THORN;','&szlig;',
     '&agrave;','&aacute;','&acirc;','&atilde;','&auml;','&aring;','&aelig;','&ccedil;',
     '&egrave;','&eacute;','&ecirc;','&euml;','&igrave;','&iacute;','&icirc;','&iuml;',
     '&eth;','&ntilde;','&ograve;','&oacute;','&ocirc;','&otilde;','&ouml;','&oslash;',
     '&ugrave;','&uacute;','&ucirc;','&uuml;','&yacute;','&thorn;','&yuml;','&iexcl;',
     '&cent;','&pound;','&curren;','&yen;','&brvbar;','&sect;','&uml;','&copy;','&ordf;',
     '&laquo;','&not;','&reg;','&macr;','&deg;','&plusmn;','&sup2;','&sup3;',
     '&acute;','&micro;','&para;','&cedil;','&sup1;','&ordm;','&raquo;','&frac14;',
     '&frac12;','&frac34;','&iquest;','&times;','&divide;');

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
     '&#120;','&#121;','&#122;','&#123;','&#124;','&#125;','&#126;','&#192;','&#193;',
     '&#194;','&#195;','&#196;','&#197;','&#198;','&#199;','&#200;','&#201;','&#202;',
     '&#203;','&#204;','&#205;','&#206;','&#207;','&#208;','&#209;','&#210;','&#211;',
     '&#212;','&#213;','&#214;','&#216;','&#217;','&#218;','&#219;','&#220;','&#221;',
     '&#222;','&#223;','&#224;','&#225;','&#226;','&#227;','&#228;','&#229;','&#230;',
     '&#231;','&#232;','&#233;','&#234;','&#235;','&#236;','&#237;','&#238;','&#239;',
     '&#240;','&#241;','&#242;','&#243;','&#244;','&#245;','&#246;','&#248;','&#249;',
     '&#250;','&#251;','&#252;','&#253;','&#254;','&#255;','&#161;','&#162;','&#163;',
     '&#164;','&#165;','&#166;','&#167;','&#168;','&#169;','&#170;','&#171;','&#172;',
     '&#174;','&#175;','&#176;','&#177;','&#178;','&#179;','&#180;','&#181;','&#182;',
     '&#184;','&#185;','&#186;','&#187;','&#188;','&#189;','&#190;','&#191;','&#215;',
     '&#247;');



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

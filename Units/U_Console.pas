unit U_Console;
{
Unit: U_Console.pas
By: H@PPyZERØ5
E-mail: happy05@programmer.net
}
interface
uses
   Winapi.windows, System.UITypes, System.SysUtils;

const
 CONSOLE_FULLSCREEN_MODE = 1;
 CONSOLE_WINDOWED_MODE   = 2;

Function SetConsoleDisplayMode(ConsoleOutput : THandle;
          Flags : DWORD;
 		  NewScreenBufferDimensions : PCoord):BOOL; stdcall; external 'kernel32.dll';

Function SetConsoleScreen(Mode:Byte):Boolean;

Function SetFullScreen:Boolean;

implementation

Function SetConsoleScreen(Mode:Byte):Boolean;
var
  ConsoleHandle: THandle;
begin
  Result:=False;
  ConsoleHandle :=GetStdHandle(STD_OUTPUT_HANDLE);
  if ConsoleHandle <> INVALID_HANDLE_VALUE
   then Result:=SetConsoleDisplayMode(ConsoleHandle,Mode,Nil)=False
end;

Function SetFullScreen:Boolean;
begin
 Result:=SetConsoleScreen(CONSOLE_FULLSCREEN_MODE);
end;


end.

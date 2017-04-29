unit U_WINapi;
{
Unit: U_WINapi.pas
By: H@PPyZERØ5
E-mail: happy05@programmer.net
}
interface
uses
   Windows, System.SysUtils, Vcl.Controls, Vcl.StdCtrls;

type
  HTMLstr = string[8];

const
    GENERIC_READ = $80000000;
    GENERIC_WRITE = $40000000;
    OPEN_EXISTING = 3;
    INVALID_HANDLE_VALUE = -1;
    IOCTL_STORAGE_EJECT_MEDIA = 2967560;

const
    SHERB_NOCONFIRMATION = $00000001;
    SHERB_NOPROGRESSUI   = $00000002;
    SHERB_NOSOUND        = $00000004;


Function CreateFileA(
  lpFileName: string; dwDesiredAccess: integer; dwShareMode: integer;
  lpSecurityAttributes: PSecurityAttributes; dwCreationDisposition: integer;
  dwFlagsAndAttributes: integer; hTemplateFile: Integer): Integer;
  stdcall; external 'KERNEL32.DLL';

Function DeviceIoControl(
  hDevice: Integer; dwIoControlCode: DWORD; lpInBuffer: Pointer;
  nInBufferSize: DWORD; lpOutBuffer: Pointer; nOutBufferSize: DWORD;
  var lpBytesReturned: DWORD; lpOverlapped: POverlapped): Boolean;
  stdcall; external 'KERNEL32.DLL';

Function CloseHandle(hObject: Integer): integer;
  stdcall; external 'KERNEL32.DLL';

function SHEmptyRecycleBin (Wnd:HWnd; LPCTSTR:PChar;
  DWORD:Word):Integer; stdcall;

procedure EjectCD(Drive: String);

Function GetHandleType(Handle:THandle): String;

procedure EmptyRecycleBin(Wnd:HWnd);

implementation

function SHEmptyRecycleBin; external  'SHELL32.DLL' name 'SHEmptyRecycleBinA';

procedure EmptyRecycleBin(Wnd:HWnd);
begin
   SHEmptyRecycleBin(Wnd,'', SHERB_NOCONFIRMATION);
end;

procedure EjectCD(Drive: String);
var
  Path: String;
  HWNDDrive: Integer;
  BytesReturned: DWORD;
  Longueur: Integer;
begin
Longueur := Length(Drive);

   if (Drive[Longueur]) <> ':' then
   Drive :=  Drive + ':';

Path := '\\.\' + Drive;

HWNDDrive := CreateFile(PChar(path), GENERIC_READ OR GENERIC_WRITE, 0, nil,
  OPEN_EXISTING, 0, 0);

   if HWNDDrive = INVALID_HANDLE_VALUE then
   Exit;

   try
   BytesReturned := 0;
   if not
   DeviceIoControl(HWNDDrive, IOCTL_STORAGE_EJECT_MEDIA, 0, 0, 0, 0, BytesReturned,
      0) then
   Exit;
   finally
   CloseHandle(HWNDDrive);
   end;
end;

Function GetHandleType(Handle:THandle): String;
begin
  case GetFileType(Handle)of
   FILE_TYPE_UNKNOWN : Result:='UNKNOWN';
   FILE_TYPE_DISK    : Result:='DISK';
   FILE_TYPE_CHAR    : Result:='CHAR';
   FILE_TYPE_PIPE    : Result:='PIPE';
  end;
end;

end.

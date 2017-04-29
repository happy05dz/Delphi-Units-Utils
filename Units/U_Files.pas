unit U_Files;
{
Unit: U_Files.pas
By: H@PPyZERØ5
E-mail: happy05@programmer.net
}
interface
uses
   Winapi.windows, System.UITypes, System.SysUtils, Winapi.ShellAPI;

function GetFileSize(const APath: string): int64;

function CopyFile(Source, Destination: String ) : boolean;

implementation

function GetFileSize(const APath: string): int64;
var
  Sr : TSearchRec;
begin
  if FindFirst(APath,faAnyFile,Sr)=0 then
  try
    Result := Int64(Sr.FindData.nFileSizeHigh) shl 32 + Sr.FindData.nFileSizeLow;
  finally
    FindClose(Sr);
  end
  else
    Result := 0;
end;

function CopyFile(Source, Destination: String ) : boolean;
var
  fos : TSHFileOpStruct;
begin
  FillChar(fos, SizeOf(fos),0);
  with fos do
  begin
    wFunc := FO_COPY;
    pFrom := PChar(Source+#0);
    pTo   := PChar(Destination+#0);
    fFlags := FOF_ALLOWUNDO or FOF_NOCONFIRMATION or FOF_SILENT;
  end;
  result := (0 = ShFileOperation(fos));
end;


end.

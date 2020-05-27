unit mylib;

interface
uses
  WinSock,SysUtils,Windows,StdCtrls,Classes,Graphics,Messages,ComCtrls;

  type
  TApp = Record

         PrintPreview : Word;
  end;

Var
  SvrApproval : string;
  LclApproval : string;
  Password : string;
  DatabaseName : string;
  ServerAddress : String;
  UserName : String;
  WorkStation : String;
  ServerTime : TDatetime;
  ServerDate : TDatetime;
  sClientVersion : String;
  sServerVersion : String;
  sCompanyID : String;

  App : TApp;

  function GetIPFromHost (HostName: string): String;
  function RightTrim(const s:String):String;
  function LeftTrim(const s:String):String;
  function InStr(Start: integer; Source: string; SourceToFind: string): integer;
  function Mid(Source: string; Start: integer; Length: integer): string;
  function strLeft(Source: string; Length: integer): string;
  function strRight(Source: string; Lengths: integer): string;
  function Replace(sData: String; sSubstring: String; sNewsubstring: string): String;
  function Split(Source, Deli: string; StringList: TStringList): TStringList;
  function Reverse(Line: string): string;
  function IIF(const ACondition: Boolean; const ATrueResult, AFalseResult: Integer): Integer; overload;
  function IIF(const ACondition: Boolean; const ATrueResult, AFalseResult: Double): Double; overload;
  function IIF(const ACondition: Boolean; const ATrueResult, AFalseResult: string): string; overload;
  function IIF(const ACondition: Boolean; const ATrueResult, AFalseResult: variant): variant; overload;
  Function GF_Encript(sWord : String):string;
  Function GF_Decript(sWord : String):String;
  function count(node:TTreeNode):Integer;
  function FindRootNode(ACaption: String; ATreeView: TTreeView): TTreeNode;
  procedure ExpandTreeNodes(Nodes: TTreeNodes; Level: Integer);

implementation
function IIF(const ACondition: Boolean; const ATrueResult, AFalseResult: Integer): Integer;
begin
  if ACondition then
    Result := ATrueResult
  else
    Result := AFalseResult;
end;
function IIF(const ACondition: Boolean; const ATrueResult, AFalseResult: Double): Double;
begin
  if ACondition then
    Result := ATrueResult
  else
    Result := AFalseResult;
end;
function IIF(const ACondition: Boolean; const ATrueResult, AFalseResult: string): string;
begin
  if ACondition then
    Result := ATrueResult
  else
    Result := AFalseResult;
end;
function IIF(const ACondition: Boolean; const ATrueResult, AFalseResult: variant): variant;
begin
  if ACondition then
    Result := ATrueResult
  else
    Result := AFalseResult;
end;
function Reverse(Line: string): string;
	var i: integer;
	var a: string;
begin
	For i := 1 To Length(Line) do
	begin
	a := strRight(Line, i);
	Result := Result + strLeft(a, 1);
	end;
end;
function Split(Source, Deli: string; StringList: TStringList): TStringList;
var
 EndOfCurrentString: byte;
begin
 repeat
EndOfCurrentString := Pos(Deli, Source);
if EndOfCurrentString = 0 then
 StringList.add(Source)
else
 StringList.add(Copy(Source, 1, EndOfCurrentString - 1));
Source := Copy(Source, EndOfCurrentString + length(Deli), length(Source) - EndOfCurrentString);
 until EndOfCurrentString = 0;
 result := StringList;
end;
function Replace(sData: String; sSubstring: String; sNewsubstring: string): String;
var
i: integer;
lSub: Longint;
lData: Longint;
begin
i := 1;
lSub := Length(sSubstring);
lData := Length(sData);
repeat
begin
i := InStr(i, sData, sSubstring);
If i = 0 Then
begin
sNewSubString := sData;
Exit
end
Else
sData := Copy(sData, 1, i - 1) + sNewsubstring + Copy(sData, i + lSub, lData);
i := i + lSub;
End;
 Until i > lData;
Replace := sData;
end;
function strLeft(Source: string; Length: integer): string;
begin
	Result := copy(Source,1,Length);
end;
function strRight(Source: string; Lengths: integer): string;
begin
Result := copy(source,Length(Source) - Lengths+1,Lengths);
end;
function Mid(Source: string; Start: integer; Length: integer): string;
begin
	Result := copy(Source,Start,Length);
end;
function InStr(Start: integer; Source: string; SourceToFind: string): integer;
begin
	Result := pos(SourceToFind,copy(Source,Start,Length(Source) - (Start - 1)));
end;
function RightTrim(const s:String):String;
var
i:integer;
begin
 i:=length(s);
 while (i>0) and (s[i]<=#32) do
Dec(i);
 result:=Copy(s,1,i);
end;
function LeftTrim(const s:String):String;
var
i, L:integer;
begin
 L:=length(s);
 i:=1;
 while (i<=L) and (s[i]<=#32) do
Inc(i);
 result:=Copy(s,i, MaxInt);
end;
function GetIPFromHost( HostName : String): String;
type
  Name = array[0..100] of Char;
  PName = ^Name;
var
  HEnt: pHostEnt;
  HName: PName;
  WSAData: TWSAData;
  i: Integer;
  IPaddr, WSAErr: string;
begin 
  Result := 'None';

  if trim(HostName) = '' then HostName:='Default';
  
  if WSAStartup($0101, WSAData) <> 0 then begin
    WSAErr := 'Winsock is not responding."'; 
    Exit; 
  end; 
  IPaddr := ''; 
  New(HName); 
  if GetHostName(HName^, SizeOf(Name)) = 0 then
  begin 
    HostName := StrPas(HName^); 
    HEnt := GetHostByName(HName^); 
    for i := 0 to HEnt^.h_length - 1 do 
     IPaddr :=
      Concat(IPaddr,
      IntToStr(Ord(HEnt^.h_addr_list^[i])) + '.'); 
    SetLength(IPaddr, Length(IPaddr) - 1);
     
    Result := IPaddr;
  end
  else begin 
   case WSAGetLastError of
    WSANOTINITIALISED:WSAErr:='WSANotInitialised'; 
    WSAENETDOWN      :WSAErr:='WSAENetDown'; 
    WSAEINPROGRESS   :WSAErr:='WSAEInProgress'; 
   end; 
  end; 
  Dispose(HName); 
  WSACleanup; 
end;
function FirstOfCurrentMonth: TDateTime;
var Year, Month, Day : word; 
begin 
  DecodeDate(Date,Year,Month,Day); 
  FirstOfCurrentMonth := EncodeDate(Year,Month,1); 
end;
function LastOfCurrentMonth: TDateTime;
var Year, Month, Day : word;
    DerivedFirstNextMonth : TDateTime; 
begin 
  DecodeDate(Date,Year,Month,Day); 
  if Month = 12 
  then 
    LastOfCurrentMonth := EncodeDate(Year,12,31) 
  else 
   begin 
    DerivedFirstNextMonth := EncodeDate(Year,Month+1,1); 
    LastOfCurrentMonth := DerivedFirstNextMonth - 1; 
   end; 
end;
Function GF_Encript(sWord : String):string;
var
    cEncrypt : String;
    nAscValue, nCnt,iI :Integer;

Begin
    cEncrypt := '';
    If Length(Trim(sWord)) = 0 Then
    begin
        GF_Encript := '';
        Exit;
    end;
    nCnt := 2;
    For iI := 1 To Length(sWord) do
    begin
        nAscValue := Ord(sWord[iI]) + nCnt  ;
        If nCnt > 4 Then nCnt := 1  ;
        nCnt := nCnt + 1 ;
        If (Chr(IIf(nAscValue > 255, 255, nAscValue))) = '''' Then cEncrypt := cEncrypt + '''';
        cEncrypt := cEncrypt + Chr(IIf(nAscValue > 255, 255, nAscValue));
    end;
    GF_Encript := cEncrypt;
End ;
Function GF_Decript(sWord : String):String;
var
    cDEncrypt : String;
    nAscValue ,nCnt,iI : Integer;
begin
    cDEncrypt := '';
    If Length(Trim(sWord)) = 0 Then
    begin
        GF_Decript := '';
        Exit;
    End;
    nCnt := 2;
    For iI := 1 To Length(sWord) do
    begin
        nAscValue := Ord(sWord[iI] ) - nCnt;
        If nCnt > 4 Then nCnt := 1;
        nCnt := nCnt + 1;
        cDEncrypt := cDEncrypt + Chr(IIf(nAscValue > 255, 255, nAscValue));
    End;
    GF_Decript := cDEncrypt ;
End ;

function FindRootNode(ACaption: String; ATreeView: TTreeView): TTreeNode;
var LCount: Integer;
begin
  result := nil;
  LCount := 0;
  while (LCount < ATreeView.Items.Count) and (result = nil) do
  begin
    if (ATreeView.Items.Item[LCount].Text = ACaption) then          //and (ATreeView.Items.Item[LCount].Parent = nil
      result := ATreeView.Items.Item[LCount];
    inc(LCount);
  end;
end;

function count(node:TTreeNode):integer;
var i,s:integer;
begin
  s:=0;
  for i:=1 to node.Count do
  inc(s);
  result:=s;
end;

procedure ExpandTreeNodes(Nodes: TTreeNodes; Level: Integer);
var
  Node: TTreeNode;
  Next: TTreeNode;
begin
  if Level < 1 then
    Exit;
  Nodes.BeginUpdate;
  try
    Node := Nodes.GetFirstNode;
      while Node <> nil do
      begin
        Node.Expand(False);
        if (Node.Level < Level - 1) and Node.HasChildren then
          Node := Node.GetFirstChild
        else
        begin
          Next := Node.GetNextSibling;
          if Next <> nil then
            Node := Next
          else
            if Node.Level > 0 then
              Node := Node.Parent.GetNextSibling
            else
              Node := Node.GetNextSibling;
        end;
      end;
  finally
    Nodes.EndUpdate;
  end;
end;


end.

unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ComCtrls,
  Db, ADODB, Grids, DBGrids, SMDBGrid,
  SUITabControl, SUIPageControl, StdCtrls, RXCtrls, Shader,ShellApi,
  SUIImagePanel, TFlatPanelUnit, Series, TeEngine, TeeProcs, Chart, RunText,
  GradPnl;

type
  TfrmMain = class(TForm)
    Body: TPanel;
    statusBar: TStatusBar;
    dsList: TDataSource;
    qryList: TADOQuery;
    ADOCon: TADOConnection;
    Timer1: TTimer;
    Qry_GetServerTime: TADOQuery;
    Qry_GetServerTimeServerTime: TDateTimeField;
    Qry_GetServerTimeServerDate: TDateTimeField;
    Qry_GetServerTimeApproval: TStringField;
    Qry_GetServerTimeStartOfThisWeek: TDateTimeField;
    Qry_GetServerTimeEndOfThisWeek: TDateTimeField;
    Qry_GetServerTimeStartOfLastMonth: TDateTimeField;
    Qry_GetServerTimeEndOfLastMonth: TDateTimeField;
    Qry_GetServerTimeStartOfThisMonth: TDateTimeField;
    Qry_GetServerTimeEndOfThisMonth: TDateTimeField;
    Qry_GetServerTimeStartOfNextMonth: TDateTimeField;
    Qry_GetServerTimeEndOfNextMonth: TDateTimeField;
    Qry_GetServerTimeStartOfYear: TDateTimeField;
    Qry_GetServerTimeEndOfYear: TDateTimeField;
    Qry_GetServerTimeNameOfThisMonth: TWideStringField;
    Qry_GetServerTimeThisYear: TStringField;
    Qry_GetServerTimeVersion: TWideStringField;
    Timer2: TTimer;
    Timer3: TTimer;
    qryListMon_Line: TStringField;
    qryListMon_Date: TDateTimeField;
    qryListMon_Model: TStringField;
    qryListMon_Plan: TIntegerField;
    qryListMon_Target: TIntegerField;
    qryListMon_Prod: TIntegerField;
    qryListMon_Gap: TIntegerField;
    spMonitor: TsuiPageControl;
    stJtin3: TsuiTabSheet;
    stPbx: TsuiTabSheet;
    stIr: TsuiTabSheet;
    stRf: TsuiTabSheet;
    stVdp: TsuiTabSheet;
    shdHeader: TShader;
    shdFooterJtin: TShader;
    lblDate: TLabel;
    lblTitle: TLabel;
    Timer4: TTimer;
    btnRoll: TButton;
    FlatPanel1: TFlatPanel;
    FlatPanel2: TFlatPanel;
    FlatPanel3: TFlatPanel;
    FlatPanel4: TFlatPanel;
    FlatPanel5: TFlatPanel;
    FlatPanel6: TFlatPanel;
    FlatPanel7: TFlatPanel;
    FlatPanel8: TFlatPanel;
    fpModelLine1: TFlatPanel;
    FlatPanel16: TFlatPanel;
    fpDefectLine1: TFlatPanel;
    fpGapLine1: TFlatPanel;
    fpProdLine1: TFlatPanel;
    fpTargetLine1: TFlatPanel;
    fpPlanLine1: TFlatPanel;
    Shader3: TShader;
    Chart1: TChart;
    crtLine1: TBarSeries;
    stJtin: TsuiTabSheet;
    Shader5: TShader;
    Shader8: TShader;
    Shader9: TShader;
    GradientPanel1: TGradientPanel;
    Label3: TLabel;
    Shader6: TShader;
    GradientPanel2: TGradientPanel;
    Label4: TLabel;
    GradientPanel4: TGradientPanel;
    Label6: TLabel;
    GradientPanel5: TGradientPanel;
    Label7: TLabel;
    Shader10: TShader;
    GradientPanel6: TGradientPanel;
    lblLine1: TLabel;
    Shader11: TShader;
    GradientPanel7: TGradientPanel;
    lblPlan1: TLabel;
    Shader13: TShader;
    GradientPanel9: TGradientPanel;
    lblProd1: TLabel;
    Shader14: TShader;
    GradientPanel10: TGradientPanel;
    lblGap1: TLabel;
    Shader15: TShader;
    GradientPanel11: TGradientPanel;
    lblLine2: TLabel;
    Shader16: TShader;
    GradientPanel12: TGradientPanel;
    lblPlan2: TLabel;
    Shader18: TShader;
    GradientPanel14: TGradientPanel;
    lblProd2: TLabel;
    Shader19: TShader;
    GradientPanel15: TGradientPanel;
    lblGap2: TLabel;
    Shader20: TShader;
    GradientPanel16: TGradientPanel;
    lblLine3: TLabel;
    Shader21: TShader;
    GradientPanel17: TGradientPanel;
    lblPlan3: TLabel;
    Shader23: TShader;
    GradientPanel19: TGradientPanel;
    lblProd3: TLabel;
    Shader24: TShader;
    GradientPanel20: TGradientPanel;
    lblGap3: TLabel;
    Shader25: TShader;
    GradientPanel21: TGradientPanel;
    lblLine4: TLabel;
    Shader26: TShader;
    GradientPanel22: TGradientPanel;
    lblPlan4: TLabel;
    Shader28: TShader;
    GradientPanel24: TGradientPanel;
    lblProd4: TLabel;
    Shader29: TShader;
    GradientPanel25: TGradientPanel;
    lblGap4: TLabel;
    Shader30: TShader;
    GradientPanel26: TGradientPanel;
    Label28: TLabel;
    Shader31: TShader;
    GradientPanel27: TGradientPanel;
    lblPlanT: TLabel;
    Shader33: TShader;
    GradientPanel29: TGradientPanel;
    lblProdT: TLabel;
    Shader34: TShader;
    GradientPanel30: TGradientPanel;
    lblGapT: TLabel;
    Shader35: TShader;
    gpLine1: TGradientPanel;
    lblStatusLine1: TLabel;
    FlatPanel9: TFlatPanel;
    FlatPanel10: TFlatPanel;
    FlatPanel11: TFlatPanel;
    FlatPanel12: TFlatPanel;
    FlatPanel13: TFlatPanel;
    FlatPanel14: TFlatPanel;
    FlatPanel15: TFlatPanel;
    FlatPanel17: TFlatPanel;
    fpPlanLine2: TFlatPanel;
    fpTargetLine2: TFlatPanel;
    fpProdLine2: TFlatPanel;
    fpGapLine2: TFlatPanel;
    fpDefectLine2: TFlatPanel;
    FlatPanel23: TFlatPanel;
    gpLine2: TGradientPanel;
    lblStatusLine2: TLabel;
    fpModelLine2: TFlatPanel;
    Shader2: TShader;
    Chart2: TChart;
    crtLine2: TBarSeries;
    FlatPanel18: TFlatPanel;
    FlatPanel19: TFlatPanel;
    FlatPanel20: TFlatPanel;
    FlatPanel21: TFlatPanel;
    FlatPanel22: TFlatPanel;
    FlatPanel24: TFlatPanel;
    FlatPanel25: TFlatPanel;
    FlatPanel26: TFlatPanel;
    fpPlanLine3: TFlatPanel;
    fpTargetLine3: TFlatPanel;
    fpProdLine3: TFlatPanel;
    fpGapLine3: TFlatPanel;
    fpDefectLine3: TFlatPanel;
    FlatPanel32: TFlatPanel;
    gpLine3: TGradientPanel;
    lblStatusLine3: TLabel;
    fpModelLine3: TFlatPanel;
    Shader38: TShader;
    Chart3: TChart;
    crtLine3: TBarSeries;
    FlatPanel27: TFlatPanel;
    FlatPanel28: TFlatPanel;
    FlatPanel29: TFlatPanel;
    FlatPanel30: TFlatPanel;
    FlatPanel31: TFlatPanel;
    FlatPanel33: TFlatPanel;
    FlatPanel34: TFlatPanel;
    FlatPanel35: TFlatPanel;
    fpPlanLine4: TFlatPanel;
    fpTargetLine4: TFlatPanel;
    fpProdLine4: TFlatPanel;
    fpGapLine4: TFlatPanel;
    fpDefectLine4: TFlatPanel;
    FlatPanel41: TFlatPanel;
    gpLine4: TGradientPanel;
    lblStatusLine4: TLabel;
    fpModelLine4: TFlatPanel;
    Shader41: TShader;
    Chart4: TChart;
    crtLine4: TBarSeries;
    QryInit: TADOQuery;
    QryModel: TADOQuery;
    QryModelMon_Line: TStringField;
    QryModelMon_Date: TDateTimeField;
    QryModelMon_Po: TStringField;
    QryModelMon_Model: TStringField;
    QryModelMon_Plan: TIntegerField;
    QryModelMon_Target: TIntegerField;
    QryModelMon_Prod: TIntegerField;
    QryModelMon_Gap: TIntegerField;
    QryModelMon_TranDate: TDateTimeField;
    QryResult: TADOQuery;
    btnRefresh: TButton;
    SP_Init: TADOStoredProc;
    SP_Result: TADOStoredProc;
    procedure FormShow(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure ADOConAfterConnect(Sender: TObject);
    procedure ADOConDisconnect(Connection: TADOConnection;
      var EventStatus: TEventStatus);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ADOConBeforeConnect(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Timer3Timer(Sender: TObject);
    procedure qryListBeforeOpen(DataSet: TDataSet);
    procedure Timer2Timer(Sender: TObject);
    procedure Result();
    procedure Qry_GetServerTimeBeforeOpen(DataSet: TDataSet);
    procedure Timer4Timer(Sender: TObject);
    procedure btnRollClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure stPbxShow(Sender: TObject);
    procedure stJtinShow(Sender: TObject);
    procedure stRfShow(Sender: TObject);
    procedure stIrShow(Sender: TObject);
    procedure stVdpShow(Sender: TObject);
    procedure QryModelBeforeOpen(DataSet: TDataSet);
    procedure btnRefreshClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;
  bClose : Boolean ;
  gAppPath:String;
  sDate:String;
  iTab:Integer;

implementation
USES IniFiles,mylib,VersionInfo,ApplicationVersionHelper;
{$R *.dfm}
Var
  MyInI:TiniFile;

procedure TfrmMain.ADOConAfterConnect(Sender: TObject);
begin
  Timer1.Enabled := False;
  Timer2.Enabled := True;
  if btnRoll.Caption = 'Freez' then
  begin
    Timer4.Enabled := True;
  end
  else
  begin
    Timer4.Enabled := False;
  end;


  bClose := False;

  statusBar.Font.Color := clBlack;

  with Qry_GetServerTime do
  begin
    close;
    Open;
  end;

  ServerTime:= Qry_GetServerTimeServerTime.Value;
  ServerDate:= Qry_GetServerTimeServerDate.Value;
  sServerVersion:= Qry_GetServerTimeVersion.Value;

  if sClientVersion <> sServerVersion then
  begin
    //ShowMessage('Update...');
    ShellExecute(Handle, 'open',  PAnsiChar(gAppPath+'Update.exe'), PAnsiChar(sServerVersion+' '+ExtractFileName(Application.ExeName)), nil, SW_SHOWNORMAL) ;
    //Application.Terminate;
  end;

  sDate := FormatDateTime('YYYYMMDD',ServerTime);
  lblDate.Caption := FormatDateTime('dddd, dd mmmm yyyy',ServerTime) + ', '+FormatDateTime('HH:MM:SS',ServerTime) + ' ';
  WorkStation :=GetIPFromHost('');
  statusBar.Panels[1].Text := 'SERVER IP :' +ServerAddress+' | DB : '+DatabaseName+' | Local IP : '+WorkStation;
end;

procedure TfrmMain.ADOConBeforeConnect(Sender: TObject);
var Conn : string;
begin
  Conn:= 'Provider=SQLOLEDB.1;'+
         'Password='+Password+';'+
         'Persist Security Info=True;'+
         'User ID='+UserName+';'+
         'Initial Catalog='+DatabaseName+';'+
         'Data Source='+ServerAddress+';'+
         'Use Procedure for Prepare=0;'+
         'Auto Translate=True;'+
         'Packet Size=4096;'+
         'Workstation ID='+WorkStation+';'+
         'Use Encryption for Data=False;'+
         'Tag with column collation when possible=False';

  ADOCon.ConnectionString := Conn;
end;

procedure TfrmMain.ADOConDisconnect(Connection: TADOConnection;
  var EventStatus: TEventStatus);
begin
  Timer2.Enabled := False;

  if btnRoll.Caption = 'Freez' then
  begin
    Timer4.Enabled := True;
  end
  else
  begin
    Timer4.Enabled := False;
  end;

  if not bClose then
  begin
    Timer1.Enabled := True;
  end;
  
end;

procedure TfrmMain.btnRefreshClick(Sender: TObject);
begin
  try
//    QryResult.Close;
//    QryResult.Open;
    with SP_Result do
    begin
      Close;
      ExecProc;
    end;
  except on E: exception do
      begin
        ADOCon.Close;
        statusBar.Panels[1].Text := 'Disconnect.!!';
        Timer1.Enabled := True;
        Exit;
      end
    end;
  Timer1.Enabled := False;
end;

procedure TfrmMain.btnRollClick(Sender: TObject);
begin
  if btnRoll.Caption = 'Freez' then
  begin
    Timer4.Enabled := False;
    btnRoll.Caption := 'Rolling'
  end
  else
  begin
    Timer4.Enabled := True;
    btnRoll.Caption := 'Freez'
  end;
end;

procedure TfrmMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  bClose := True;
end;

procedure TfrmMain.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if messagedlg('Do you want to close program?',mtinformation,[mbYes,mbno],0)= mryes then begin

        CanClose := True;

  end else begin
        CanClose := False;
  end;
end;

procedure TfrmMain.FormCreate(Sender: TObject);
Var  sCompanyID : String;
begin
  frmMain.Caption := frmMain.Caption + ' - v' + TVersionInfo.VersionToString(Application.Version.FileVersion);

  gAppPath := ExtractFilePath(Application.ExeName);

  statusBar.Panels[2].Text := 'JTIN IT Dept. Copyright 2019';


  MyIni := nil;
  try
    MyIni := TIniFile.Create(gAppPath+'Config.ini');
    DatabaseName   := MyIni.ReadString('SETTING','DATABASE','dbErp');
    ServerAddress  := MyIni.ReadString('SETTING','SERVER','192.168.5.3');
    UserName       := MyIni.ReadString('SETTING','USER','erp');
    Password       := MyIni.ReadString('SETTING','SERVERPWD','erp');
    sClientVersion := MyIni.ReadString('SETTING','MonitorJtin.exe','0');
    sCompanyID     := MyIni.ReadString('SETTING','Company','0');

    {WRITE to Config.ini}
    MyIni.WriteString('SETTING','DATABASE',DatabaseName);
    MyIni.WriteString('SETTING','SERVER',ServerAddress);
    MyIni.WriteString('SETTING','USER',UserName);
    MyIni.WriteString('SETTING','SERVERPWD',Password);
    MyIni.WriteString('SETTING','MonitorJtin.exe',sClientVersion);
    MyIni.WriteString('SETTING','Company',sCompanyID);

  finally
    MyIni.Free;
  end;

  WorkStation :=GetIPFromHost('');
  statusBar.Panels[1].Text := 'SERVER IP :' +ServerAddress+' | DB : '+DatabaseName+' | Local IP : '+WorkStation;

end;

procedure TfrmMain.FormShow(Sender: TObject);
begin

  try
    //ADOCon.Connected := True;
    //QryInit.Close;
    //QryInit.Open;
    with SP_Init do
    begin
      Close;
      ExecProc;
    end;

  except on E: exception do
      begin
        ADOCon.Close;
        statusBar.Panels[1].Text := 'Disconnect.!!';
        Timer1.Enabled := True;
        Exit;
      end
    end;


  iTab := 1;
  stJtin3.TabVisible := False;

end;

procedure TfrmMain.qryListBeforeOpen(DataSet: TDataSet);
begin
  with qryList do
  begin
    Parameters.ParamByName('Tgl').Value := FormatDateTime('yyyyMMdd',Qry_GetServerTimeServerTime.Value); ;
    if not Prepared then Prepared;
  end;
end;

procedure TfrmMain.QryModelBeforeOpen(DataSet: TDataSet);
begin
  with QryModel do
  begin
    Parameters.ParamByName('Tgl').Value := FormatDateTime('yyyyMMdd',Qry_GetServerTimeServerTime.Value); ;
    if not Prepared then Prepared;
  end;
end;

procedure TfrmMain.Qry_GetServerTimeBeforeOpen(DataSet: TDataSet);
begin
  with Qry_GetServerTime do
  begin
    Parameters.ParamByName('App').Value := ExtractFileName(Application.ExeName);
    if not Prepared then Prepared;
  end;
end;

procedure TfrmMain.Timer1Timer(Sender: TObject);
begin
  try
    statusBar.Font.Color := clRed;
    statusBar.Panels[1].Text := 'Re Connecting.!!';
    ADOCon.Connected := True;
  except on E: exception do
      begin
        ADOCon.Close;
        Exit;
      end
    end;
  Timer1.Enabled := False;
end;

procedure TfrmMain.Timer2Timer(Sender: TObject);
begin
  Result;
end;

procedure TfrmMain.Timer3Timer(Sender: TObject);
begin
 lblDate.Caption := FormatDateTime('dddd, dd mmmm yyyy',ServerTime) + ', '+FormatDateTime('HH:MM:SS',Now) + ' ';
end;

procedure TfrmMain.Timer4Timer(Sender: TObject);
begin
  if iTab = 1 then
  begin
    spMonitor.ActivePageIndex:=1;
    iTab := 2;
    Exit;
  end;

  if iTab = 2 then
  begin
    spMonitor.ActivePageIndex:=2;
    iTab := 3;
    Exit;
  end;

  if iTab = 3 then
  begin
    spMonitor.ActivePageIndex:=3;
    iTab := 4;
    Exit;
  end;

  if iTab = 4 then
  begin
    spMonitor.ActivePageIndex:=4;
    iTab := 5;
    Exit;
  end;

  if iTab = 5 then
  begin
    spMonitor.ActivePageIndex:=0;
    iTab := 1;
    Exit;
  end;

end;

procedure TfrmMain.Result();
var I,J,iPlan1,iPlan2,iPlan3,iPlan4,iPlanT:Integer;
    iTarget1,iTarget2,iTarget3,iTarget4,iTargetT:Integer;
    iProd1,iProd2,iProd3,iProd4,iProdT:Integer;
    iGap1,iGap2,iGap3,iGap4,iGapT:Integer;
    iDefect1,iDefect2,iDefect3,iDefect4: Integer;
    sStatus1,sStatus2,sStatus3,sStatus4: String;

begin
  Screen.Cursor := crSQLWait;
  try
    qryList.Close;
    qryList.Open;
    qryModel.Close;
    qryModel.Open;
  except on E: exception do
      begin
        ADOCon.Close;
        statusBar.Panels[1].Text := 'Disconnect.!!';
        Timer1.Enabled := True;
        Exit;
      end
    end;
  Timer1.Enabled := False;
  iPlan1:= 0;

  crtLine1.Clear;
  crtLine2.Clear;
  crtLine3.Clear;
  crtLine4.Clear;

  sStatus1 := 'Normal';
  sStatus2 := 'Normal';
  sStatus3 := 'Normal';
  sStatus4 := 'Normal';

  with qryList do
  begin
    First;
    I:= 1;
    while I <= RecordCount do
    begin
      if (FieldByName('Mon_Line').AsString = 'PBX') then
      begin
        iPlan1 :=FieldByName('Mon_Plan').AsInteger;
        iTarget1 :=FieldByName('Mon_Target').AsInteger;
        iProd1 :=FieldByName('Mon_Prod').AsInteger;
        iGap1 :=FieldByName('Mon_Gap').AsInteger;
        lblPlan1.Caption := FormatFloat('#,##0',iPlan1);
        //lblTarget1.Caption := FormatFloat('#,##0',iTarget1);
        lblProd1.Caption := FormatFloat('#,##0',iProd1);
        lblGap1.Caption := FormatFloat('#,##0',iGap1);
        fpPlanLine1.Caption := FormatFloat('#,##0',iPlan1);
        fpTargetLine1.Caption := FormatFloat('#,##0',iTarget1);
        fpProdLine1.Caption := FormatFloat('#,##0',iProd1);
        fpGapLine1.Caption := FormatFloat('#,##0',iGap1);
        fpDefectLine1.Caption := FormatFloat('#,##0%',iDefect1);
        lblStatusLine1.Caption := sStatus1;
        crtLine1.Add(iPlan1,'Plan', $00408000);
        crtLine1.Add( iTarget1,'Target', $004080FF);
        crtLine1.Add( iProd1,'Actual', clBlue);
      end;
      if (FieldByName('Mon_Line').AsString = 'IR') then
      begin
        iPlan2 :=FieldByName('Mon_Plan').AsInteger;
        iTarget2 :=FieldByName('Mon_Target').AsInteger;
        iProd2 :=FieldByName('Mon_Prod').AsInteger;
        iGap2 :=FieldByName('Mon_Gap').AsInteger;
        lblPlan2.Caption := FormatFloat('#,##0',iPlan2);
        //lblTarget2.Caption := FormatFloat('#,##0',iTarget2);
        lblProd2.Caption := FormatFloat('#,##0',iProd2);
        lblGap2.Caption := FormatFloat('#,##0',iGap2);
        fpPlanLine2.Caption := FormatFloat('#,##0',iPlan2);
        fpTargetLine2.Caption := FormatFloat('#,##0',iTarget2);
        fpProdLine2.Caption := FormatFloat('#,##0',iProd2);
        fpGapLine2.Caption := FormatFloat('#,##0',iGap2);
        fpDefectLine2.Caption := FormatFloat('#,##0%',iDefect2);
        lblStatusLine2.Caption := sStatus2;
        crtLine2.Add(iPlan2,'Plan', $00408000);
        crtLine2.Add( iTarget2,'Target', $004080FF);
        crtLine2.Add( iProd2,'Actual', clBlue);
      end;
      if (FieldByName('Mon_Line').AsString = 'RF') then
      begin
        iPlan3 :=FieldByName('Mon_Plan').AsInteger;
        iTarget3 :=FieldByName('Mon_Target').AsInteger;
        iProd3 :=FieldByName('Mon_Prod').AsInteger;
        iGap3 :=FieldByName('Mon_Gap').AsInteger;
        lblPlan3.Caption := FormatFloat('#,##0',iPlan3);
        //lblTarget3.Caption := FormatFloat('#,##0',iTarget3);
        lblProd3.Caption := FormatFloat('#,##0',iProd3);
        lblGap3.Caption := FormatFloat('#,##0',iGap3);
        fpPlanLine3.Caption := FormatFloat('#,##0',iPlan3);
        fpTargetLine3.Caption := FormatFloat('#,##0',iTarget3);
        fpProdLine3.Caption := FormatFloat('#,##0',iProd3);
        fpGapLine3.Caption := FormatFloat('#,##0',iGap3);
        fpDefectLine3.Caption := FormatFloat('#,##0%',iDefect3);
        lblStatusLine3.Caption := sStatus3;
        crtLine3.Add(iPlan3,'Plan', $00408000);
        crtLine3.Add( iTarget3,'Target', $004080FF);
        crtLine3.Add( iProd3,'Actual', clBlue);

      end;
      if (FieldByName('Mon_Line').AsString = 'VDP') then
      begin
        iPlan4 :=FieldByName('Mon_Plan').AsInteger;
        iTarget4 :=FieldByName('Mon_Target').AsInteger;
        iProd4 :=FieldByName('Mon_Prod').AsInteger;
        iGap4 :=FieldByName('Mon_Gap').AsInteger;
        lblPlan4.Caption := FormatFloat('#,##0',iPlan4);
        //lblTarget4.Caption := FormatFloat('#,##0',iTarget4);
        lblProd4.Caption := FormatFloat('#,##0',iProd4);
        lblGap4.Caption := FormatFloat('#,##0',iGap4);
        fpPlanLine4.Caption := FormatFloat('#,##0',iPlan4);
        fpTargetLine4.Caption := FormatFloat('#,##0',iTarget4);
        fpProdLine4.Caption := FormatFloat('#,##0',iProd4);
        fpGapLine4.Caption := FormatFloat('#,##0',iGap4);
        fpDefectLine4.Caption := FormatFloat('#,##0%',iDefect4);
        lblStatusLine4.Caption := sStatus4;
        crtLine4.Add(iPlan4,'Plan', $00408000);
        crtLine4.Add( iTarget4,'Target', $004080FF);
        crtLine4.Add( iProd4,'Actual', clBlue);
      end;
      iPlanT :=iPlan1+iPlan2+iPlan3+iPlan4;
      iTargetT :=iTarget1+iTarget2+iTarget3+iTarget4;
      iProdT :=iProd1+iProd2+iProd3+iProd4;
      iGapT :=iGap1+iGap2+iGap3+iGap4;
      lblPlanT.Caption := FormatFloat('#,##0',iPlanT);
      //lblTargetT.Caption := FormatFloat('#,##0',iTargetT);
      lblProdT.Caption := FormatFloat('#,##0',iProdT);
      lblGapT.Caption := FormatFloat('#,##0',iGapT);
      I:= I + 1;
      Next;
    end;
  end;

  with QryModel do
  begin
    First;
    J:= 1;
    while J <= RecordCount do
    begin
      if (FieldByName('Mon_Line').AsString = 'PBX') then
      begin
        fpModelLine1.Caption := FieldByName('Mon_Model').AsString;
      end;
      if (FieldByName('Mon_Line').AsString = 'IR') then
      begin
        fpModelLine2.Caption := FieldByName('Mon_Model').AsString;
      end;
      if (FieldByName('Mon_Line').AsString = 'RF') then
      begin
        fpModelLine3.Caption := FieldByName('Mon_Model').AsString;
      end;
      if (FieldByName('Mon_Line').AsString = 'VDP') then
      begin
        fpModelLine4.Caption := FieldByName('Mon_Model').AsString;
      end;
      J:= J + 1;
      Next;
    end;
  end;

  if iPlan1 <=0 then
  begin
     gpLine1.ColorFrom := $00E6E6E6;
     gpLine1.ColorTo := $00E6E6E6;
     lblStatusLine1.Caption := 'No Plan'
  end
  else
  begin
     gpLine1.ColorFrom := clGreen;
     gpLine1.ColorTo := $00E6E6E6;
     lblStatusLine1.Caption := 'Normal'
  end;

  if iPlan2 <=0 then
  begin
     gpLine2.ColorFrom := $00E6E6E6;
     gpLine2.ColorTo := $00E6E6E6;
     lblStatusLine2.Caption := 'No Plan'
  end
  else
  begin
     gpLine2.ColorFrom := clGreen;
     gpLine2.ColorTo := $00E6E6E6;
     lblStatusLine2.Caption := 'Normal'
  end;

  if iPlan3 <=0 then
  begin
     gpLine3.ColorFrom := $00E6E6E6;
     gpLine3.ColorTo := $00E6E6E6;
     lblStatusLine3.Caption := 'No Plan'
  end
  else
  begin
     gpLine3.ColorFrom := clGreen;
     gpLine3.ColorTo := $00E6E6E6;
     lblStatusLine3.Caption := 'Normal'
  end;

  if iPlan4 <=0 then
  begin
     gpLine4.ColorFrom := $00E6E6E6;
     gpLine4.ColorTo := $00E6E6E6;
     lblStatusLine4.Caption := 'No Plan'
  end
  else
  begin
     gpLine4.ColorFrom := clGreen;
     gpLine4.ColorTo := $00E6E6E6;
     lblStatusLine4.Caption := 'Normal'
  end;

  Screen.Cursor := crDefault;

end;

procedure TfrmMain.stIrShow(Sender: TObject);
begin
  lblTitle.Caption := 'Production Progress(IR)';
end;

procedure TfrmMain.stJtinShow(Sender: TObject);
begin
  lblTitle.Caption := 'Production Progress';
end;

procedure TfrmMain.stPbxShow(Sender: TObject);
begin
  lblTitle.Caption := 'Production Progress(PBX)';
end;

procedure TfrmMain.stRfShow(Sender: TObject);
begin
  lblTitle.Caption := 'Production Progress(RF)';
end;

procedure TfrmMain.stVdpShow(Sender: TObject);
begin
  lblTitle.Caption := 'Production Progress(VDP)';
end;

end.

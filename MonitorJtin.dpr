program MonitorJtin;

uses
  Forms,
  Main in 'Main.pas' {frmMain},
  ApplicationVersionHelper in 'ApplicationVersionHelper.pas',
  mylib in 'mylib.pas',
  VersionInfo in 'VersionInfo.pas';

{$R *.res}


begin

  Application.Initialize;
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.

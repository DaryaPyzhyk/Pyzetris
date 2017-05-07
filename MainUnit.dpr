program MainUnit;

uses
  Forms,
  PlayUnit in 'PlayUnit.pas' {PlayForm},
  MenuUnit in 'MenuUnit.pas' {Menu},
  Unit1 in 'Unit1.pas' {RulesForm};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TMenu, Menu);
  Application.CreateForm(TPlayForm, PlayForm);
  Application.CreateForm(TRulesForm, RulesForm);
  Application.Run;
end.

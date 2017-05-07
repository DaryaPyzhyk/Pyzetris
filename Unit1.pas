unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, StdCtrls;

type
  TRulesForm = class(TForm)
    AllRules: TMemo;
    procedure FormShow(Sender: TObject);
   //procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  RulesForm: TRulesForm;
  RulesText:TextFile;
   i:integer;
  buf: string;
  OutputFile: TextFile;

implementation

uses MenuUnit;

{$R *.dfm}

procedure TRulesForm.FormShow(Sender: TObject);
begin
  AssignFile (RulesText,'Rules.txt');
   Reset(RulesText);
   AllRules.Lines.Delete(0);
   i:=1;
   while not Eof(RulesText) do
  begin
    ReadLn(RulesText,buf);
    AllRules.Lines.Add(buf);
    inc(i);
  end;
   CloseFile(RulesText);
end;

{procedure TRulesForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  TMenu.Showmodal;
end;}

end.

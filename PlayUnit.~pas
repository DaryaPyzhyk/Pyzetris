unit PlayUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TPlayForm = class(TForm)
    Image1: TImage;
    Timer1: TTimer;
    GameOver: TLabel;
    Label2: TLabel;
    procedure Refresh;
    procedure FormShow(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

type
  OneArray =  array [1..4,1..4] of boolean;

const
  n = 16;

var
  PlayForm: TPlayForm;
  x,y,i,j,k,p,m:integer;
  StaticLocation: array [0..23,0..23] of integer;
  ZArray,LineArray,SquareArray,LArray,TowerArray: OneArray;
  //AllFigures: array[1..5] of OneArray = (ZArray,LineArray,SquareArray,LArray,TowerArray);
  figure:integer;
  reverse:boolean;
  Downspace: boolean = true;
  RightSpace: boolean = true;
  LeftSpace: boolean = true;
  Coord: string = 'Figures.txt';
  FiguresFromFile:TextFile;

implementation

{$R *.dfm}

procedure TPlayForm.Refresh;
var
full:boolean;
x,y:integer;
begin
  Image1.Canvas.Brush.Color := clWhite;
  Image1.Canvas.FillRect(Rect(0,0,384,384));
  for y:=0 to 22 do
  begin
    full:=true;
    x:=1;
    while (x<=22) and (full = true) do
    begin
      if StaticLocation[y,x]<>1 then
        full:=false;
      inc(x);
    end;
    if full=true then
    begin
      for x:=0 to 22 do
        StaticLocation[y,x]:=0;
      for x:=22 downto 1 do
        for k:=1 to 22 do
          if x=1 then
            StaticLocation[x,k]:=0
          else
            StaticLocation[x,k]:=StaticLocation[x-1,k];
    end;
  end;
  for k:=1 to 22 do
     for x:=1 to 22 do
       if StaticLocation[k,x]=1 then
       begin
         Image1.Canvas.Brush.Color := clGreen;
         PlayForm.Image1.Canvas.FillRect(Rect(x*n,k*n,(x+1)*n,k*n+1));
         PlayForm.Image1.Canvas.FillRect(Rect(x*n,(k+1)*n-1,(x+1)*n,(k+1)*n));
         PlayForm.Image1.Canvas.FillRect(Rect(x*n,k*n,x*n+1,(k+1)*n));
         PlayForm.Image1.Canvas.FillRect(Rect((x+1)*n-1,k*n,(x+1)*n,(k+1)*n));
       end;
end;

procedure ReadFromFile(Coord:string);
var
  buf:string;
  i,j,k,fig:integer;
begin
   AssignFile (FiguresFromFile,Coord);
   Reset(FiguresFromFile);
   fig:=0;
   while not Eof(FiguresFromFile) do
  begin
    ReadLn(FiguresFromFile, buf);
    k:=1;
    while k<=length(buf)  do
    begin
      i:=StrToInt(buf[k]);
      j:=StrToInt(buf[k+1]);
      case fig of
      0:SquareArray[i,j]:=true;
      1:ZArray[i,j]:=true;
      2:LineArray[i,j]:=true;
      3:LArray[i,j]:=true;
      4:TowerArray[i,j]:=true;
      end;
      k:=k+3;
    end;
    inc(fig);
  end;
   CloseFile(FiguresFromFile);
end;


procedure DrawOneBlock(x,y:integer);
var
  color:integer;
begin
  color:=random(5);
  case color of
    0:PlayForm.Image1.Canvas.Brush.Color := clNavy;
    1:PlayForm.Image1.Canvas.Brush.Color := clRed;
    2:PlayForm.Image1.Canvas.Brush.Color := clGreen;
    3:PlayForm.Image1.Canvas.Brush.Color := clYellow;
    4:PlayForm.Image1.Canvas.Brush.Color := clFuchsia;
  end;
  PlayForm.Image1.Canvas.FillRect(Rect(x*n,y*n,(x+1)*n,(y+1)*n));
  PlayForm.Image1.Canvas.Brush.Color:=clBlack;
  PlayForm.Image1.Canvas.FillRect(Rect(x*n,y*n,(x+1)*n,y*n+1));
  PlayForm.Image1.Canvas.FillRect(Rect(x*n,(y+1)*n-1,(x+1)*n,(y+1)*n));
  PlayForm.Image1.Canvas.FillRect(Rect(x*n,y*n,x*n+1,(y+1)*n));
  PlayForm.Image1.Canvas.FillRect(Rect((x+1)*n-1,y*n,(x+1)*n,(y+1)*n));
  if (StaticLocation[y+1,x] = 1) then
    DownSpace:=false;
  if (StaticLocation[y,x+1] = 1) then
    RightSpace:=false;
  if (StaticLocation[y,x-1] = 1) then
    LeftSpace:=false;

end;

procedure DrawZ(x,y:integer);
var
  i,j:integer;
begin
  for i:=1 to 3 do
    for j:=1 to 3 do
      if ZArray[i,j] = true then
        DrawOneBlock(x+j-1,y+i-1);
end;

procedure DrawSquare(x,y:integer);
var
  i,j:integer;
begin
  for i:=1 to 4 do
      for j:=1 to 4 do
      if SquareArray[i,j] = true then
        DrawOneBlock(x+j-1,y+i-1);
end;

procedure DrawLine (x,y:integer);
var
  i,j:integer;
begin
  for i:=1 to 4 do
    for j:=1 to 4 do
      if LineArray[i,j] = true then
        DrawOneBlock(x+j-1,y+i-1);
end;

procedure DrawL (x,y:integer);
var
  i,j:integer;
begin
  for i:=1 to 3 do
    for j:=1 to 3 do
      if LArray[i,j] = true then
        DrawOneBlock(x+j-1,y+i-1);
end;

procedure DrawTower (x,y:integer);
var
  i,j:integer;
begin
  for i:=1 to 3 do
    for j:=1 to 3 do
      if TowerArray[i,j] = true then
        DrawOneBlock(x+j-1,y+i-1);
end;

procedure StartNewFigure;
begin
  randomize;
  j:= random(20)+1;
  i:=0;
  figure:=random(5);
  case figure of
    0: DrawSquare(j,i);
    1: DrawZ(j,i);
    2: DrawLine(j,i);
    3: DrawL (j,i);
    4: DrawTower(j,i);
  end;
end;

procedure TPlayForm.FormShow(Sender: TObject);
var i:integer;
begin
  randomize;
  reverse:=false;
  Timer1.Enabled:=True;
end;

procedure CheckGameOver(y:integer);
begin
   if y = 1 then
   begin
     PlayForm.GameOver.Caption:='GAME OVER,DUDE';
     PlayForm.Close;
   end;
end;

procedure ReserveFigure(figure,x,y:integer);
var
  A:OneArray;
begin
  case figure of
  //A:=
  0:begin
    for i:=1 to 4 do
      for j:=1 to 4 do
        if SquareArray[i,j] = true then
        begin
          StaticLocation[y+i-1,x+j-1]:=1;
          CheckGameOver(y+i-1);
        end;
    end;
  1:begin
    for i:=1 to 3 do
      for j:=1 to 3 do
        if ZArray[i,j] = true then
        begin
          StaticLocation[y+i-1,x+j-1]:=1;
          CheckGameOver(y+i-1);
        end;
    end;
  2:begin
    for i:=1 to 4 do
      for j:=1 to 4 do
        if LineArray[i,j] = true then
        begin
          StaticLocation[y+i-1,x+j-1]:=1;
          CheckGameOver(y+i-1);
        end;
    end;
  3:begin
    for i:=1 to 3 do
      for j:=1 to 3 do
        if LArray[i,j] = true then
        begin
          StaticLocation[y+i-1,x+j-1]:=1;
          CheckGameOver(y+i-1);
        end;
    end;
  4:begin
    for i:=1 to 3 do
      for j:=1 to 3 do
        if TowerArray[i,j] = true then
        begin
          StaticLocation[y+i-1,x+j-1]:=1;
          CheckGameOver(y+i-1);
        end;
    end;
  end;
  DownSpace:=true;
  RightSpace:=true;
  LeftSpace:=true;
end;

procedure TPlayForm.Timer1Timer(Sender: TObject);
begin
  Refresh;
  case figure of
    0: DrawSquare(j,i);
    1: DrawZ(j,i);
    2: DrawLine(j,i);
    3: DrawL (j,i);
    4: DrawTower(j,i);
  end;
  if (i=24) or (DownSpace = false)  then
  begin
    ReserveFigure(figure,j,i);
    StartNewFigure;
  end;
    inc(i);
end;

{procedure Rotation(n:integer; var a:OneArray);
var
  i,j,p:integer;
  temp:boolean;
begin
p := n div 2;
SetLength(a,n,n);
for i:=1 to p do
  for j:=i to n-i do
  begin
    temp := a[i,j];
    a[i,j] := a[n-j+1,i];
    a[n-j+1,i] := a[n-i+1,n-j+1];
    a[n-i+1,n-j+1] := a[j,n-i+1];
    a[j,n-i+1] := temp;
  end;
end;}


procedure TPlayForm.FormCreate(Sender: TObject);
var i:integer;
begin
  randomize;
  reverse:=false;
  for i:=0 to 23 do
  begin
    StaticLocation[i,0]:=1;
    StaticLocation[i,23]:=1;
    StaticLocation[23,i]:=1;
  end;
  ReadFromFile(Coord);
end;

procedure TPlayForm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  p,n,m,k:integer;
  temp:boolean;
begin
  case Key of
  37:
    begin
       if LeftSpace = true then
       begin
         dec(j);
         dec(i);
         RightSpace:=true;
       end;
    end;
  39:
    begin
      If RightSpace = true then
      begin
        inc(j);
        dec(i);
        LeftSpace:=true;
      end;
    end;
  40:
    begin
      if DownSpace = true then
      inc(i);
    end;
  38:
    begin
    case figure of
 1:begin
   p:=1;
   n:=3;
   for m:=1 to p do
    for k:=m to n-m do
    begin
    temp := ZArray[m,k];
    ZArray[m,k] := ZArray[n-k+1,m];
    ZArray[n-k+1,m] := ZArray[n-m+1,n-k+1];
    ZArray[n-m+1,n-k+1] := ZArray[k,n-m+1];
    ZArray[k,n-m+1] := temp;
    end;
   end;
 2:begin
 p:=2;
   n:=4;
   for m:=1 to p do
    for k:=m to n-m do
    begin
    temp := LineArray[m,k];
    LineArray[m,k] := LineArray[n-k+1,m];
    LineArray[n-k+1,m] := LineArray[n-m+1,n-k+1];
    LineArray[n-m+1,n-k+1] := LineArray[k,n-m+1];
    LineArray[k,n-m+1] := temp;
    end;
    end;
 3:begin
 p:=1;
   n:=3;
   for m:=1 to p do
    for k:=m to n-m do
    begin
    temp := LArray[m,k];
    LArray[m,k] := LArray[n-k+1,m];
    LArray[n-k+1,m] := LArray[n-m+1,n-k+1];
    LArray[n-m+1,n-k+1] := LArray[k,n-m+1];
    LArray[k,n-m+1] := temp;
    end;
    end;
 4:begin
 p:=1;
   n:=3;
   for m:=1 to p do
    for k:=m to n-m do
    begin
    temp := TowerArray[m,k];
    TowerArray[m,k] := TowerArray[n-k+1,m];
    TowerArray[n-k+1,m] := TowerArray[n-m+1,n-k+1];
    TowerArray[n-m+1,n-k+1] := TowerArray[k,n-m+1];
    TowerArray[k,n-m+1] := temp;
    end;
    end;
 end;
    end;
end;
end;

end.














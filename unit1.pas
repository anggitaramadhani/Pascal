unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Buttons,
  Spin, ExtCtrls;

type
    Elemen=record
      x,y: Integer;
      end;

  { TForm1 }

  TForm1 = class(TForm)
    ColorButton1: TColorButton;
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    GroupBox1: TGroupBox;
    GroupBox10: TGroupBox;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    GroupBox4: TGroupBox;
    GroupBox5: TGroupBox;
    GroupBox6: TGroupBox;
    GroupBox7: TGroupBox;
    GroupBox8: TGroupBox;
    GroupBox9: TGroupBox;
    Image1: TImage;
    OpenDialog1: TOpenDialog;
    persegi: TSpeedButton;
    persegipjg: TSpeedButton;
    SaveDialog1: TSaveDialog;
    segitiga: TSpeedButton;
    kiriatas: TSpeedButton;
    atas: TSpeedButton;
    kananatas: TSpeedButton;
    kiri: TSpeedButton;
    kanan: TSpeedButton;
    kiribawah: TSpeedButton;
    bawah: TSpeedButton;
    kananbawah: TSpeedButton;
    lingkaran: TSpeedButton;
    save: TSpeedButton;
    kubus: TSpeedButton;
    balok: TSpeedButton;
    limas: TSpeedButton;
    prisma: TSpeedButton;
    open: TSpeedButton;
    baru: TSpeedButton;
    mirrorsamping: TSpeedButton;
    mirrorbawah: TSpeedButton;
    horizontal: TSpeedButton;
    zoomin: TSpeedButton;
    vertical: TSpeedButton;
    zoomout: TSpeedButton;
    rotate: TSpeedButton;
    pen: TSpeedButton;
    eraser: TSpeedButton;
    isi: TSpeedButton;
    SpinEdit1: TSpinEdit;
    SpinEdit2: TSpinEdit;
    SpinEdit3: TSpinEdit;
    SpinEdit4: TSpinEdit;
    SpinEdit5: TSpinEdit;
    procedure atasClick(Sender: TObject);
    procedure balokClick(Sender: TObject);
    procedure baruClick(Sender: TObject);
    procedure bawahClick(Sender: TObject);
    procedure ComboBox2Change(Sender: TObject);
    procedure eraserClick(Sender: TObject);
    procedure FormMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure FormMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure horizontalClick(Sender: TObject);
    procedure Image1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Image1MouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer
      );
    procedure Image1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure isiClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure kananatasClick(Sender: TObject);
    procedure kananbawahClick(Sender: TObject);
    procedure kananClick(Sender: TObject);
    procedure kiriatasClick(Sender: TObject);
    procedure kiribawahClick(Sender: TObject);
    procedure kiriClick(Sender: TObject);
    procedure kotakdragClick(Sender: TObject);
    procedure kubusClick(Sender: TObject);
    procedure limasClick(Sender: TObject);
    procedure lingkaranClick(Sender: TObject);
    procedure mirrorbawahClick(Sender: TObject);
    procedure mirrorsampingClick(Sender: TObject);
    procedure openClick(Sender: TObject);
    procedure penClick(Sender: TObject);
    procedure persegiClick(Sender: TObject);
    procedure persegipjgClick(Sender: TObject);
    procedure rotateClick(Sender: TObject);
    procedure saveClick(Sender: TObject);
    procedure hapus();
    procedure FloodFill(x,y,fill,current:integer);
    procedure midpoint(Sender: TObject);
    procedure edit();
    procedure gambar();
    procedure segitigaClick(Sender: TObject);
    procedure segitigadragClick(Sender: TObject);
    procedure prismaClick(Sender: TObject);
    procedure verticalClick(Sender: TObject);
    procedure zoominClick(Sender: TObject);
    procedure zoomoutClick(Sender: TObject);

  private

  public

  end;

var
  Form1 : TForm1;
  mid : Elemen;
  banyak, i, x1, y1, m, n : integer;
  style, nama : String;
  colour, klik : Boolean;
  objek :  array[1..20] of elemen;
  warna : TColor;
  TempObjek: array[1..6] of elemen;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.FormActivate(Sender: TObject);
begin
  Image1.Canvas.FillRect(0,0,Image1.Width,Image1.Height);
end;

procedure TForm1.kananatasClick(Sender: TObject);
begin
  for i := 1 to banyak do
  begin
       Objek[i].x := Objek[i].x + SpinEdit1.Value;
       Objek[i].y := Objek[i].y - SpinEdit1.Value;
  end;
  hapus();
  midpoint(Sender);
  gambar();
  if colour=true then
  FloodFill(mid.x,mid.y,ColorButton1.ButtonColor,Image1.Canvas.Pixels[mid.x,mid.y]);
end;

procedure TForm1.kananbawahClick(Sender: TObject);
begin
   for i := 1 to banyak do
  begin
       Objek[i].x := Objek[i].x + SpinEdit1.Value;
       Objek[i].y := Objek[i].y + SpinEdit1.Value;
  end;
  hapus();
  midpoint(Sender);
  gambar();
  if colour=true then
  FloodFill(mid.x,mid.y,ColorButton1.ButtonColor,Image1.Canvas.Pixels[mid.x,mid.y]);
end;

procedure TForm1.kananClick(Sender: TObject);
begin
  for i := 1 to banyak do
  begin
       Objek[i].x := Objek[i].x + SpinEdit1.Value;
  end;
  hapus();
  midpoint(Sender);
  gambar();
  if colour=true then
  FloodFill(mid.x,mid.y,ColorButton1.ButtonColor,Image1.Canvas.Pixels[mid.x,mid.y]);
end;

procedure TForm1.kiriatasClick(Sender: TObject);
begin
   for i := 1 to banyak do
  begin
       Objek[i].x := Objek[i].x - SpinEdit1.Value;
       Objek[i].y := Objek[i].y - SpinEdit1.Value;
  end;
  hapus();
  midpoint(Sender);
  gambar();
  if colour=true then
  FloodFill(mid.x,mid.y,ColorButton1.ButtonColor,Image1.Canvas.Pixels[mid.x,mid.y]);
end;

procedure TForm1.kiribawahClick(Sender: TObject);
begin
  for i := 1 to banyak do
  begin
       Objek[i].x := Objek[i].x - SpinEdit1.Value;
       Objek[i].y := Objek[i].y + SpinEdit1.Value;
  end;
  hapus();
  midpoint(Sender);
  gambar();
  if colour=true then
  FloodFill(mid.x,mid.y,ColorButton1.ButtonColor,Image1.Canvas.Pixels[mid.x,mid.y]);
end;

procedure TForm1.kiriClick(Sender: TObject);
begin
   for i := 1 to banyak do
   begin
       Objek[i].x := Objek[i].x - SpinEdit1.Value;
   end;
  hapus();
  midpoint(Sender);
  gambar();
  if colour=true then
  FloodFill(mid.x,mid.y,ColorButton1.ButtonColor,Image1.Canvas.Pixels[mid.x,mid.y]);
end;

procedure TForm1.kotakdragClick(Sender: TObject);
begin
  nama := 'kotak drag';
end;

procedure TForm1.kubusClick(Sender: TObject);
begin
   nama := 'kubus';
   banyak := 8;
   objek[1].x:=100;        objek[1].y:=50;
   objek[2].x:=50;        objek[2].y:=50;
   objek[3].x:=50;        objek[3].y:=100;
   objek[4].x:=100;       objek[4].y:=100;
   objek[5].x:=110;       objek[5].y:=80;
   objek[6].x:=60;         objek[6].y:=80;
   objek[7].x:=60;         objek[7].y:=130;
   objek[8].x:=110;        objek[8].y:=130;
   hapus();
  midpoint(Sender);
  edit();
  gambar();
  if colour=true then
  FloodFill(mid.x,mid.y,ColorButton1.ButtonColor,Image1.Canvas.Pixels[mid.x,mid.y]);
end;

procedure TForm1.limasClick(Sender: TObject);
begin
  banyak:=5;
  nama := 'limas';
    objek[1].x:=88;   objek[1].y:=30;
    objek[2].x:=100;  objek[2].y:=100;
    objek[3].x:=50;   objek[3].y:=100;
    objek[4].x:=75;  objek[4].y:=75;
    objek[5].x:=125;   objek[5].y:=75;
  hapus();
  midpoint(Sender);
  edit();
  gambar();
  if colour=true then
  FloodFill(mid.x,mid.y,ColorButton1.ButtonColor,Image1.Canvas.Pixels[mid.x,mid.y]);
end;

procedure TForm1.lingkaranClick(Sender: TObject);
begin
     nama := 'lingkaran';
     banyak := 2;
     Objek[1].x := 250;                 Objek[1].y := 50;
     Objek[2].x := 100;                 Objek[2].y := 200;
     hapus();
  midpoint(Sender);
  edit();
  gambar();
  if colour=true then
  FloodFill(mid.x,mid.y,ColorButton1.ButtonColor,Image1.Canvas.Pixels[mid.x,mid.y]);
end;

procedure TForm1.mirrorbawahClick(Sender: TObject);
begin
     m:=Image1.Width ;
     n:=Image1.Height div 2;
     Image1.Canvas.MoveTo(m,0);
     Image1.Canvas.LineTo(m,n);
     for i:=1 to banyak do
     begin
     Objek[i].y:=(Objek[i].y-(2*(Objek[i].y-n)));
     Objek[i].x:=Objek[i].x;
     end;
     gambar();
end;

procedure TForm1.mirrorsampingClick(Sender: TObject);
begin
     m:=Image1.Width div 2;
     n:=Image1.Height ;
     Image1.Canvas.MoveTo(m,0);
     Image1.Canvas.LineTo(m,n);
     for i:=1 to banyak do
     begin
     Objek[i].x:=(Objek[i].x-(2*(Objek[i].x-m)));
     Objek[i].y:=Objek[i].y;
  end;
    gambar();
    //if colour=true then
   //FloodFill(mid.x,mid.y,ColorButton1.ButtonColor,Image1.Canvas.Pixels[mid.x,mid.y]);
end;

procedure TForm1.hapus();
begin
  Image1.Canvas.Brush.Color:=clWhite;
  Image1.Canvas.FillRect(0,0,Image1.Width,Image1.Height);
end;

procedure TForm1.FloodFill(x,y,fill,current:integer);
begin
  if Image1.Canvas.Pixels[x,y]=current then
  begin
    Image1.Canvas.Pixels[x,y]:=fill;
    floodFill(x+1,y,fill,current);
    floodFill(x-1,y,fill,current);
    floodFill(x,y+1,fill,current);
    floodFill(x,y-1,fill,current);
  end;
end;

procedure TForm1.midpoint(Sender: TObject);
begin
   mid.x:=0;
   mid.y:=0;
   for i:=1 to banyak do
   begin
       mid.x:=mid.x+objek[i].x;
       mid.y:=mid.y+objek[i].y;
   end;
   mid.x:=mid.x div banyak;
   mid.y:=mid.y div banyak;
end;

procedure TForm1.baruClick(Sender: TObject);
begin
   Image1.Canvas.Clear();
   Image1.Canvas.Brush.Color:=clWhite;
   Image1.Canvas.Pen.Style:=psSolid;
   Image1.Canvas.FillRect(0,0,Image1.Width,Image1.Height);
end;

procedure TForm1.bawahClick(Sender: TObject);
begin
   for i := 1 to banyak do
  begin
       Objek[i].y := Objek[i].y + SpinEdit1.Value;
  end;
  hapus();
  midpoint(Sender);
  gambar();
  if colour=true then
  FloodFill(mid.x,mid.y,ColorButton1.ButtonColor,Image1.Canvas.Pixels[mid.x,mid.y]);
end;

procedure TForm1.atasClick(Sender: TObject);
begin
      for i := 1 to banyak do
  begin
       Objek[i].y := Objek[i].y - SpinEdit1.Value;
  end;
  hapus();
  midpoint(Sender);
  gambar();
  if colour=true then
  FloodFill(mid.x,mid.y,ColorButton1.ButtonColor,Image1.Canvas.Pixels[mid.x,mid.y]);
end;

procedure TForm1.balokClick(Sender: TObject);
begin
  nama := 'balok';
  banyak := 8;
   objek[1].x:=100;       objek[1].y:=50;
   objek[2].x:=50;         objek[2].y:=50;
   objek[3].x:=50;         objek[3].y:=100;
   objek[4].x:=100;        objek[4].y:=100;
   objek[5].x:=125;        objek[5].y:=125;
   objek[6].x:=75;         objek[6].y:=125;
   objek[7].x:=75;         objek[7].y:=175;
   objek[8].x:=125;        objek[8].y:=175;
   hapus();
  midpoint(Sender);
  edit();
  gambar();
  if colour=true then
  FloodFill(mid.x,mid.y,ColorButton1.ButtonColor,Image1.Canvas.Pixels[mid.x,mid.y]);
end;

procedure TForm1.ComboBox2Change(Sender: TObject);
begin
  case ComboBox2.ItemIndex of
  0 : style := 'solid';
  1 : style := 'dot';
  2 : style := 'dash';
  3 : style := 'dashdot';
  4 : style := 'dashdotdot';
  end;
end;

procedure TForm1.eraserClick(Sender: TObject);
begin
  nama := 'eraser';
end;

procedure TForm1.FormMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin

end;

procedure TForm1.FormMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin

end;

procedure TForm1.FormMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin

end;

procedure TForm1.horizontalClick(Sender: TObject);
begin
  if nama='persegi' then begin
    Objek[1].x:=Objek[1].x+SpinEdit5.Value;
    Objek[2].x:=Objek[2].x+SpinEdit5.Value;
    Objek[3].x:=Objek[3].x-SpinEdit5.Value;
    Objek[4].x:=Objek[4].x-SpinEdit5.Value;
    Objek[5].x:=Objek[5].x+SpinEdit5.Value;
    FormActivate(Sender);
    gambar();
  end;
  if nama='persegi panjang' then begin
    Objek[1].x:=Objek[1].x+SpinEdit5.Value;
    Objek[2].x:=Objek[2].x+SpinEdit5.Value;
    Objek[3].x:=Objek[3].x-SpinEdit5.Value;
    Objek[4].x:=Objek[4].x-SpinEdit5.Value;
    Objek[5].x:=Objek[5].x+SpinEdit5.Value;
    FormActivate(Sender);
    gambar();
  end;
  if nama='prisma' then begin
    Objek[1].x:=Objek[1].x+SpinEdit5.Value;
    Objek[2].x:=Objek[2].x-SpinEdit5.Value;
    Objek[3].x:=Objek[3].x-SpinEdit5.Value;
    Objek[4].x:=Objek[4].x-SpinEdit5.Value;
    Objek[5].x:=Objek[5].x+SpinEdit5.Value;
    Objek[6].x:=Objek[6].x+SpinEdit5.Value;
    Objek[7].x:=Objek[7].x+SpinEdit5.Value;
    Objek[8].x:=Objek[8].x-SpinEdit5.Value;
    Objek[9].x:=Objek[9].x-SpinEdit5.Value;
    Objek[10].x:=Objek[10].x-SpinEdit5.Value;
    Objek[11].x:=Objek[11].x+SpinEdit5.Value;
    Objek[12].x:=Objek[12].x+SpinEdit5.Value;
    FormActivate(Sender);
    gambar();
  end;
  if nama='limas' then begin
    Objek[1].x:=Objek[1].x+SpinEdit5.Value;
    Objek[2].x:=Objek[2].x+SpinEdit5.Value;
    Objek[3].x:=Objek[3].x-SpinEdit5.Value;
    Objek[4].x:=Objek[4].x-SpinEdit5.Value;
    Objek[5].x:=Objek[5].x+SpinEdit5.Value;
    FormActivate(Sender);
    gambar();
  end;
  if nama='segitiga' then begin
     Objek[1].x:=Objek[1].x+SpinEdit5.Value;
     Objek[2].x:=Objek[2].x-SpinEdit5.Value;
     Objek[3].x:=Objek[3].x-SpinEdit5.Value;
     Objek[4].x:=Objek[4].x+SpinEdit5.Value;
     FormActivate(Sender);
     gambar();
  end;
  if nama='kubus' then begin
    Objek[1].x:=Objek[1].x+SpinEdit5.Value;
    Objek[2].x:=Objek[2].x+SpinEdit5.Value;
    Objek[3].x:=Objek[3].x-SpinEdit5.Value;
    Objek[4].x:=Objek[4].x-SpinEdit5.Value;
    Objek[5].x:=Objek[5].x+SpinEdit5.Value;
    Objek[6].x:=Objek[6].x+SpinEdit5.Value;
    Objek[7].x:=Objek[7].x-SpinEdit5.Value;
    Objek[8].x:=Objek[8].x-SpinEdit5.Value;
    Objek[9].x:=Objek[9].x+SpinEdit5.Value;
    Objek[10].x:=Objek[10].x+SpinEdit5.Value;
    Objek[11].x:=Objek[11].x+SpinEdit5.Value;
    Objek[12].x:=Objek[12].x+SpinEdit5.Value;
    Objek[13].x:=Objek[13].x-SpinEdit5.Value;
    Objek[14].x:=Objek[14].x-SpinEdit5.Value;
    Objek[15].x:=Objek[15].x-SpinEdit5.Value;
    Objek[16].x:=Objek[16].x-SpinEdit5.Value;
    FormActivate(Sender);
    gambar();
end;
  if nama='balok' then begin
    Objek[1].x:=Objek[1].x+SpinEdit5.Value;
    Objek[2].x:=Objek[2].x+SpinEdit5.Value;
    Objek[3].x:=Objek[3].x-SpinEdit5.Value;
    Objek[4].x:=Objek[4].x-SpinEdit5.Value;
    Objek[5].x:=Objek[5].x+SpinEdit5.Value;
    Objek[6].x:=Objek[6].x+SpinEdit5.Value;
    Objek[7].x:=Objek[7].x-SpinEdit5.Value;
    Objek[8].x:=Objek[8].x-SpinEdit5.Value;
    Objek[9].x:=Objek[9].x+SpinEdit5.Value;
    Objek[10].x:=Objek[10].x+SpinEdit5.Value;
    Objek[11].x:=Objek[11].x+SpinEdit5.Value;
    Objek[12].x:=Objek[12].x+SpinEdit5.Value;
    Objek[13].x:=Objek[13].x-SpinEdit5.Value;
    Objek[14].x:=Objek[14].x-SpinEdit5.Value;
    Objek[15].x:=Objek[15].x-SpinEdit5.Value;
    Objek[16].x:=Objek[16].x-SpinEdit5.Value;
    FormActivate(Sender);
    gambar();
end;
end;

procedure TForm1.Image1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  //x1:=X;
  //y1:=Y;
  if (nama='pencil') OR (nama='eraser') then
  begin
      Image1.Canvas.MoveTo(objek[i].x,objek[i].y);
      klik:=true;
      end;
  if nama='warna' then
  begin
     Image1.Canvas.Brush.Color:=ColorButton1.ButtonColor;
     Image1.Canvas.FloodFill(X,Y,Image1.Canvas.Pixels[X,Y],fsSurface);
     warna:=ColorButton1.ButtonColor;
  end;
end;

procedure TForm1.Image1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
    if klik then
  begin
      if nama='pencil' then
      begin
          edit();
          Image1.Canvas.Pen.Width:=SpinEdit3.value;
          Image1.Canvas.LineTo(X,Y);
      end;
      if nama='eraser' then
      begin
          Image1.Canvas.Pen.Color:=clWhite;
          Image1.Canvas.Pen.Width:=SpinEdit3.Value;
          Image1.Canvas.LineTo(X,Y);
      end;
  end;
end;

procedure TForm1.Image1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
   klik := false;
    if nama='kotak drag' then
  begin
    objek[1].x:=x1;  objek[1].y:=y1;
    objek[2].x:=X;   objek[2].y:=y1;
    objek[3].x:=X;   objek[3].y:=Y;
    objek[4].x:=X1;  objek[4].y:=Y;
    objek[5].x:=X;   objek [5].y :=Y;
    banyak:= 5;
    edit();
    gambar();
  end;
    if nama='segitiga drag' then
  begin
    objek[1].x:=x1;            objek[1].y:=Y;
    objek[2].x:=(X+x1)div 2;   objek[2].y:=y1;
    objek[3].x:=X;             objek[3].y:=Y;
    banyak:=3;
    edit();
    gambar();
  end;
end;

procedure TForm1.isiClick(Sender: TObject);
begin
  nama:='warna';
  colour:=true;
end;

procedure TForm1.edit();
begin
  Image1.Canvas.Pen.Color:=ColorButton1.ButtonColor;
    case style of
    'dot': Image1.Canvas.Pen.Style:=psDot;
    'dash': Image1.Canvas.Pen.Style:=psDash;
    'dashdot': Image1.Canvas.Pen.Style:=psDashDot;
    'solid': Image1.Canvas.Pen.Style:=psSolid;
    'dashdotdot': Image1.Canvas.Pen.Style:=psDashDot;
    end;
    Image1.Canvas.Pen.Width:=SpinEdit4.Value;
end;

procedure TForm1.openClick(Sender: TObject);
begin
  If OpenDialog1.Execute then
        Image1.Picture.LoadFromFile(OpenDialog1.FileName);
end;

procedure TForm1.penClick(Sender: TObject);
begin
   nama := 'pencil';
end;

procedure TForm1.gambar();
begin
  if nama='lingkaran' then
  begin
    Image1.Canvas.Ellipse(objek[1].x,objek[1].y,objek[2].x,objek[2].y);
  end
  else if (nama = 'kubus') or (nama = 'balok') then
         begin
         image1.canvas.MoveTo(objek[4].x,objek[4].y);
         for i:=1 to 4 do
       begin
         image1.canvas.lineto(objek[i].x,objek[i].y);
       end;
       image1.canvas.MoveTo(objek[8].x,objek[8].y);
       for i:=5 to 8 do
           begin
         image1.canvas.lineto(objek[i].x,objek[i].y);
         end;
      image1.canvas.moveto(objek[1].x,objek[1].y);
      image1.canvas.lineto(objek[5].x,objek[5].y);
      image1.canvas.moveto(objek[2].x,objek[2].y);
      image1.canvas.lineto(objek[6].x,objek[6].y);
      image1.canvas.moveto(objek[3].x,objek[3].y);
      image1.canvas.lineto(objek[7].x,objek[7].y);
      image1.canvas.moveto(objek[4].x,objek[4].y);
      image1.canvas.lineto(objek[8].x,objek[8].y);
      end
  else if (nama = 'prisma') then
     begin
     Image1.Canvas.MoveTo(objek[6].x,objek[6].y);
  for i:=1 to 6 do
      Image1.Canvas.LineTo(objek[i].x,objek[i].y);
  Image1.Canvas.MoveTo(objek[12].x,objek[12].y);
  for i:=7 to 12 do
      Image1.Canvas.LineTo(objek[i].x,objek[i].y);
  Image1.Canvas.MoveTo(objek[1].x,objek[1].y);
  Image1.Canvas.LineTo(objek[7].x,objek[7].y);
  Image1.Canvas.MoveTo(objek[2].x,objek[2].y);
  Image1.Canvas.LineTo(objek[8].x,objek[8].y);
  Image1.Canvas.MoveTo(objek[3].x,objek[3].y);
  Image1.Canvas.LineTo(objek[9].x,objek[9].y);
  Image1.Canvas.MoveTo(objek[4].x,objek[4].y);
  Image1.Canvas.LineTo(objek[10].x,objek[10].y);
  Image1.Canvas.MoveTo(objek[5].x,objek[5].y);
  Image1.Canvas.LineTo(objek[11].x,objek[11].y);
  Image1.Canvas.MoveTo(objek[6].x,objek[6].y);
  Image1.Canvas.LineTo(objek[12].x,objek[12].y);
  end
  else if (nama = 'limas') then
       begin
       Image1.Canvas.MoveTo(objek[5].x,objek[5].y);
       for i:=2 to 5 do
       Image1.Canvas.LineTo(objek[i].x,objek[i].y);
    Image1.Canvas.MoveTo(objek[1].x,objek[1].y);
    Image1.Canvas.LineTo(objek[2].x,objek[2].y);
    Image1.Canvas.MoveTo(objek[1].x,objek[1].y);
    Image1.Canvas.LineTo(objek[3].x,objek[3].y);
    Image1.Canvas.MoveTo(objek[1].x,objek[1].y);
    Image1.Canvas.LineTo(objek[4].x,objek[4].y);
    Image1.Canvas.MoveTo(objek[1].x,objek[1].y);
    Image1.Canvas.LineTo(objek[5].x,objek[5].y);
       end
  else
    begin
    Image1.Canvas.MoveTo(objek[1].x,objek[1].y);
    for i:=1 to banyak do
    begin
           Image1.Canvas.LineTo(objek[i].x,objek[i].y);
    end;
    end;
end;

procedure TForm1.segitigaClick(Sender: TObject);
begin
    nama := 'segitiga';
     banyak := 4;
     Objek[1].x := 170;                 Objek[1].y := 70;
     Objek[2].x := 320;                 Objek[2].y := 170;
     Objek[3].x := 20;                 Objek[3].y := 170;
     Objek[4].x := 170;                 Objek[4].y := 70;
    hapus();
       midpoint(Sender);
       edit();
       gambar();
   if colour=true then
   FloodFill(mid.x,mid.y,ColorButton1.ButtonColor,Image1.Canvas.Pixels[mid.x,mid.y]);
end;

procedure TForm1.segitigadragClick(Sender: TObject);
begin
  nama := 'segitiga drag';
end;


procedure TForm1.verticalClick(Sender: TObject);
begin
   if nama='persegi' then begin
    Objek[1].y:=Objek[1].y+SpinEdit5.Value;
    Objek[2].y:=Objek[2].y-SpinEdit5.Value;
    Objek[3].y:=Objek[3].y-SpinEdit5.Value;
    Objek[4].y:=Objek[4].y+SpinEdit5.Value;
    Objek[5].y:=Objek[5].y+SpinEdit5.Value;
    FormActivate(Sender);
    gambar();
  end
  else if nama='persegi panjang' then begin
    Objek[1].y:=Objek[1].y+SpinEdit5.Value;
    Objek[2].y:=Objek[2].y-SpinEdit5.Value;
    Objek[3].y:=Objek[3].y-SpinEdit5.Value;
    Objek[4].y:=Objek[4].y+SpinEdit5.Value;
    Objek[5].y:=Objek[5].y+SpinEdit5.Value;
    FormActivate(Sender);
    gambar();
  end
  else if nama='limas' then begin
    Objek[1].y:=Objek[1].y+SpinEdit5.Value;
    Objek[2].y:=Objek[2].y-SpinEdit5.Value;
    Objek[3].y:=Objek[3].y-SpinEdit5.Value;
    Objek[4].y:=Objek[4].y+SpinEdit5.Value;
    Objek[5].y:=Objek[5].y+SpinEdit5.Value;
    FormActivate(Sender);
    gambar();
  end
  else if nama='segitiga' then begin
     Objek[1].y:=Objek[1].y+SpinEdit5.Value;
     Objek[2].y:=Objek[2].y-SpinEdit5.Value;
     Objek[3].y:=Objek[3].y+SpinEdit5.Value;
     Objek[4].y:=Objek[4].y+SpinEdit5.Value;
     FormActivate(Sender);
     gambar();
  end
  else if nama='kubus' then begin
    Objek[1].y:=Objek[1].y+SpinEdit5.Value;
    Objek[2].y:=Objek[2].y-SpinEdit5.Value;
    Objek[3].y:=Objek[3].y-SpinEdit5.Value;
    Objek[4].y:=Objek[4].y+SpinEdit5.Value;
    Objek[5].y:=Objek[5].y+SpinEdit5.Value;
    Objek[6].y:=Objek[6].y-SpinEdit5.Value;
    Objek[7].y:=Objek[7].y-SpinEdit5.Value;
    Objek[8].y:=Objek[8].y+SpinEdit5.Value;
    Objek[9].y:=Objek[9].y+SpinEdit5.Value;
    Objek[10].y:=Objek[10].y+SpinEdit5.Value;
    Objek[11].y:=Objek[11].y-SpinEdit5.Value;
    Objek[12].y:=Objek[12].y-SpinEdit5.Value;
    Objek[13].y:=Objek[13].y-SpinEdit5.Value;
    Objek[14].y:=Objek[14].y-SpinEdit5.Value;
    Objek[15].y:=Objek[15].y+SpinEdit5.Value;
    Objek[16].y:=Objek[16].y+SpinEdit5.Value;
    FormActivate(Sender);
     gambar();
  end
  else if nama='prisma' then begin
    Objek[1].y:=Objek[1].y+SpinEdit5.Value;
    Objek[2].y:=Objek[2].y+SpinEdit5.Value;
    Objek[3].y:=Objek[3].y+SpinEdit5.Value;
    Objek[4].y:=Objek[4].y+SpinEdit5.Value;
    Objek[5].y:=Objek[5].y+SpinEdit5.Value;
    Objek[6].y:=Objek[6].y+SpinEdit5.Value;
    Objek[7].y:=Objek[7].y-SpinEdit5.Value;
    Objek[8].y:=Objek[8].y-SpinEdit5.Value;
    Objek[9].y:=Objek[9].y-SpinEdit5.Value;
    Objek[10].y:=Objek[10].y-SpinEdit5.Value;
    Objek[11].y:=Objek[11].y-SpinEdit5.Value;
    Objek[12].y:=Objek[12].y-SpinEdit5.Value;
    FormActivate(Sender);
    gambar();
  end
  else if nama='balok' then begin
    Objek[1].y:=Objek[1].y+SpinEdit5.Value;
    Objek[2].y:=Objek[2].y-SpinEdit5.Value;
    Objek[3].y:=Objek[3].y-SpinEdit5.Value;
    Objek[4].y:=Objek[4].y+SpinEdit5.Value;
    Objek[5].y:=Objek[5].y+SpinEdit5.Value;
    Objek[6].y:=Objek[6].y-SpinEdit5.Value;
    Objek[7].y:=Objek[7].y-SpinEdit5.Value;
    Objek[8].y:=Objek[8].y+SpinEdit5.Value;
    Objek[9].y:=Objek[9].y+SpinEdit5.Value;
    Objek[10].y:=Objek[10].y+SpinEdit5.Value;
    Objek[11].y:=Objek[11].y-SpinEdit5.Value;
    Objek[12].y:=Objek[12].y-SpinEdit5.Value;
    Objek[13].y:=Objek[13].y-SpinEdit5.Value;
    Objek[14].y:=Objek[14].y-SpinEdit5.Value;
    Objek[15].y:=Objek[15].y+SpinEdit5.Value;
    Objek[16].y:=Objek[16].y+SpinEdit5.Value;
    FormActivate(Sender);
     gambar();
  end
end;

procedure TForm1.zoominClick(Sender: TObject);
begin
   hapus();
  midpoint(Sender);
  for i:=1 to banyak do
  begin
      //translasi fix point ke pusat
      Objek[i].x:=Objek[i].x-m;
      Objek[i].y:=Objek[i].y-n;
      //zoom in
      Objek[i].x:=Objek[i].x * SpinEdit2.value;
      Objek[i].y:=Objek[i].y * SpinEdit2.value;
      //translasi ketitik semula
      Objek[i].x:=Objek[i].x+m;
      Objek[i].y:=Objek[i].y+n;
  end;
  gambar();
  if nama='lingkaran' then
  begin
    hapus();
  for i:=1 to 2 do
  begin
  //translasi fix point ke pusat
      Objek[i].x:=Objek[i].x-m;
      Objek[i].y:=Objek[i].y-n;
      //zoom in
      Objek[i].x:=round(Objek[i].x * SpinEdit2.value);
      Objek[i].y:=round(Objek[i].y * SpinEdit2.value);
      //translasi ketitik semula
      Objek[i].x:=Objek[i].x+m;
      Objek[i].y:=Objek[i].y+n;
  end;
gambar();
end;
end;

procedure TForm1.zoomoutClick(Sender: TObject);
begin
     hapus();
  midpoint(Sender);
  for i:=1 to banyak do
  begin
      //translasi fix point ke pusat
      Objek[i].x:=Objek[i].x-m;
      Objek[i].y:=Objek[i].y-n;
      //zoom out
      Objek[i].x:=Objek[i].x div SpinEdit2.value;
      Objek[i].y:=Objek[i].y div SpinEdit2.value;
      //translasi ketitik semula
      Objek[i].x:=Objek[i].x+m;
      Objek[i].y:=Objek[i].y+n;
  end;
  gambar();
  if nama='lingkaran' then
  begin
  hapus();
  for i:=1 to 2 do
  begin
  //translasi fix point ke pusat
      Objek[i].x:=Objek[i].x-m;
      Objek[i].y:=Objek[i].y-n;
      //zoom out
      Objek[i].x:=round(Objek[i].x div SpinEdit2.value);
      Objek[i].y:=round(Objek[i].y div SpinEdit2.value);
      //translasi ketitik semula
      Objek[i].x:=Objek[i].x+m;
      Objek[i].y:=Objek[i].y+n;
  end;
gambar();
end;
end;

procedure TForm1.persegiClick(Sender: TObject);
begin
       nama := 'persegi';
       banyak := 5;
       colour := false;
       Objek[1].x := 100;           Objek[1].y := 50;
       Objek[2].x := 200;           Objek[2].y := 50;
       Objek[3].x := 200;           Objek[3].y := 150;
       Objek[4].x := 100;           Objek[4].y := 150;
       Objek[5].x := 100;           Objek[5].y := 50;
       hapus();
       midpoint(Sender);
       edit();
       gambar();
   if colour=true then
   FloodFill(mid.x,mid.y,ColorButton1.ButtonColor,Image1.Canvas.Pixels[mid.x,mid.y]);
end;

procedure TForm1.persegipjgClick(Sender: TObject);
begin
  banyak := 5;
  nama := 'persegi panjang';
  colour := false;
  Objek[1].x := 100;    Objek[1].y := 50;
  Objek[2].x := 250;    Objek[2].y := 50;
  Objek[3].x := 250;    Objek[3].y := 150;
  Objek[4].x := 100;    Objek[4].y := 150;
  Objek[5].x := 100;    Objek[5].y := 50;
  hapus();
  midpoint(Sender);
  edit();
  gambar();
   if colour=true then
   FloodFill(mid.x,mid.y,ColorButton1.ButtonColor,Image1.Canvas.Pixels[mid.x,mid.y]);
end;

procedure TForm1.prismaClick(Sender: TObject);
begin
nama := 'prisma';
  banyak := 12;
  objek[1].x:=100; objek[1].y:=50;
  objek[2].x:=150; objek[2].y:=50;
  objek[3].x:=170; objek[3].y:=75;
  objek[4].x:=150; objek[4].y:=100;
  objek[5].x:=100; objek[5].y:=100;
  objek[6].x:=80; objek[6].y:=75;
  objek[7].x:=100; objek[7].y:=150;
  objek[8].x:=150; objek[8].y:=150;
  objek[9].x:=170; objek[9].y:=175;
  objek[10].x:=150; objek[10].y:=200;
  objek[11].x:=100; objek[11].y:=200;
  objek[12].x:=80; objek[12].y:=175;
  hapus();
  midpoint(Sender);
  edit();
  gambar();
   if colour=true then
   FloodFill(mid.x,mid.y,ColorButton1.ButtonColor,Image1.Canvas.Pixels[mid.x,mid.y]);
end;

procedure TForm1.rotateClick(Sender: TObject);
  var
  n,m,j,i : integer;
  Sdt: real;
  begin
  if ComboBox1.Text<>''then begin
    Case ComboBox1.ItemIndex of
       0 : Sdt:= 30*pi/180;
       1 : Sdt:= -30*pi/180;
       2 : Sdt:= 45*pi/180;
       3 : Sdt:= -45*pi/180;
       4 : Sdt:= 90*pi/180;
       5 : Sdt:= -90*pi/180;
       6 : Sdt:= 180*pi/180;
    end;
 n := 0; m := 0;
 for j:=1 to banyak do
   begin
      n := n+objek[j].x;
      m := m+objek[j].y;
   end;
   n := n div banyak;
   m := m div banyak;
 for i:=1 to banyak do
 begin
   objek[i].x:=objek[i].x-n;
   objek[i].y:=objek[i].y-m;
   TempObjek[i].x:=round(Objek[i].x*cos(Sdt)-Objek[i].y*sin(Sdt));
   TempObjek[i].y:=round(Objek[i].x*sin(Sdt)+Objek[i].y*cos(Sdt));
   objek[i]:=TempObjek[i];
   objek[i].x:=objek[i].x+n;
   objek[i].y:=objek[i].y+m;
 end;
 FormActivate(Sender);
 gambar();
  end;
  end;

procedure TForm1.saveClick(Sender: TObject);
begin
  If SaveDialog1.Execute then
     Image1.Picture.SaveToFile(SaveDialog1.FileName);
end;

end.


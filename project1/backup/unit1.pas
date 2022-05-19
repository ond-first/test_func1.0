unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, LResources, Forms, Controls, Graphics, Dialogs, StdCtrls,
  ExtCtrls, Menus;
const
  step = 5;
  shag = 1;
   per=3;


type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button4: TButton;
    Timer1: TTimer;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);

    procedure Timer1StartTimer(Sender: TObject);

  private

  public

  end;

var
  Form1: TForm1;

  angle,i,j,k,n : integer;
  deltaX, deltaY, deltaEll : integer;

  flagreverse, flagRevEll: boolean;
  a : array[1..5,1..3] of integer ;


implementation




procedure ClearCanvas(canva: TCanvas);
begin
   canva.Brush.Color := clWhite;
   canva.Clear;
end;

procedure rotate(var x: integer; var y : integer; angle : integer);
var
   xbuf, degangle : real;
begin
   degangle := pi/180 * angle;
   xbuf := x*cos(degangle)+y*sin(degangle);
   y := Trunc(-x*sin(degangle)+y*cos(degangle));
   x := Trunc(xbuf);
end;

procedure DrawPic(canvas: TCanvas);
var
  x, y, x2, y2,deltaX, deltaY, deltaEll : integer;
  angle : integer;
  flagreverse, flagRevEll: boolean;
begin
   ClearCanvas(canvas);
   Canvas.Pen.Color := clgreen;
   Canvas.Pen.Width:= 4;
   Canvas.Pen.Style := psSolid;

   x := 100;
   y := 0;
   rotate(x, y, angle);
   Canvas.Brush.Color :=clred ;
   Canvas.Line (150,100, 200,100);
   //Небо
   Canvas.Brush.Color := rgbtocolor(i,j,k);
   canvas.FloodFill(10,490,rgbtocolor(i,j,k),fsborder);}
   //Земля
   Canvas.Brush.Color :=clgreen ;
   Canvas.Line (-1,500, 2001,500);
   canvas.FloodFill(10,510,clgreen,fsborder);
 //Заливка
   //Дом
   Canvas.Pen.Color := rgbtocolor(128,64,0);
   canvas.brush.color := rgbtocolor(128,64,0);
   Canvas.Line (750,500, 850,500);
   Canvas.Line (750,500, 750,400);
   Canvas.Line (750,400, 850,400);
   Canvas.Line (850,400, 850,500);
   //окно
   Canvas.Line (780,470, 780,430);
   Canvas.Line (780,430, 820,430);
   Canvas.Line (820,430, 820,470);
   Canvas.Line (820,470, 780,470);
   canvas.FloodFill(760,490,rgbtocolor(128,64,0),fsborder);
   //ставни
   Canvas.Line (800,470, 800,430);
   Canvas.Line (780,450, 820,450);

   Canvas.Pen.Color :=rgbtocolor(128,64,64);
   canvas.brush.color := rgbtocolor(128,64,64);
   //крыша
   canvas.line(750,400, 800,350);
   canvas.line(800,350, 820,350);
   canvas.line(820,350, 850,400);
   Canvas.Pen.Color :=cldark;
   canvas.brush.color := cldark;
   //труба
   canvas.line(800,350, 800, 330);
   canvas.line(800,330, 820,330);
   canvas.line(820,330, 820,350);

   //Контур
   Canvas.Pen.Color := clBlack;
   canvas.brush.color := clBlack;
   Canvas.Line (750,500, 850,500);
   Canvas.Line (750,500, 750,400);
   Canvas.Line (750,400, 850,400);
   Canvas.Line (850,400, 850,500);
   //окно
   Canvas.Line (780,470, 780,430);
   Canvas.Line (780,430, 820,430);
   Canvas.Line (820,430, 820,470);
   Canvas.Line (820,470, 780,470);
   //ставни
   Canvas.Line (800,470, 800,430);
   Canvas.Line (780,450, 820,450);
   //крыша
   canvas.line(750,400, 800,350);
   canvas.line(800,350, 820,350);
   canvas.line(820,350, 850,400);
   //труба
   canvas.line(800,350, 800, 330);
   canvas.line(800,330, 820,330);
   canvas.line(820,330, 820,350);



   {canvas.Ellipse(150 + x - 50 + deltax, 150+y-50+ deltay , 150+x+50+deltax, 150 + y + 50 +deltay); }
end;                                   //graphtype.fsborder

procedure TForm1.Button1Click(Sender: TObject);
begin
  timer1.Enabled:= True;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  deltaY := deltaY + step;
  DrawPic(canvas);
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  deltaX := deltaX - step;
  DrawPic(canvas);
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  deltaX := deltaX + step;
  DrawPic(canvas);
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
  deltaY := deltaY - step;
  DrawPic(canvas);
end;



procedure TForm1.Button6Click(Sender: TObject);
begin
   angle := angle - 2;
   DrawPic(canvas);
end;

procedure TForm1.Button7Click(Sender: TObject);

begin
   angle := angle + 2;
   DrawPic(canvas);
end;

procedure TForm1.Button8Click(Sender: TObject);
begin
  Timer1.Enabled:=False;
  DrawPic(Canvas);
end;




procedure TForm1.FormCreate(Sender: TObject);
begin
  deltaX := 0;
  deltaY := 0;
  angle := 0;
end;



procedure TForm1.Timer1StartTimer(Sender: TObject);
begin
//День
//1
a[1,1]:=0;
a[1,2]:=128;
a[1,3]:=255;
//2
a[2,1]:=0;
a[2,2]:=128;
a[2,3]:=192;
//3
a[3,1]:=128;
a[3,2]:=128;
a[3,3]:=255;
//4
a[4,1]:=0;
a[4,2]:=0;
a[4,3]:=160;
//Ночь
//5
a[5,1]:=0;
a[5,2]:=0;
a[5,3]:=128;
angle:=90;
for n:=1 to 10 do begin
  angle:=angle+18;
  if angle = 108 then begin
   i:=a[1,1];
   j:=a[1,2];
   k:=a[1,3];
   DrawPic(Canvas);
   end
  else if angle =126 then begin
   i:=a[2,1];
   j:=a[2,2];
   k:=a[2,3];
   DrawPic(Canvas);
  end
  else if angle =144 then begin
   i:=a[3,1];
   j:=a[3,2];
   k:=a[3,3];
   DrawPic(Canvas);
  end
  else if angle =162 then begin
   i:=a[4,1];
   j:=a[4,2];
   k:=a[4,3];
   DrawPic(Canvas);
  end
  else if angle =180 then begin
   i:=a[5,1];
   j:=a[5,2];
   k:=a[5,3];
   DrawPic(Canvas);
  end;
  end;




end;







initialization
  {$I unit1.lrs}

end.


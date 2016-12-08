program project1;
uses
  Classes, SysUtils, Graphics, IntfGraphics, Interfaces;
{$mode objfpc}{$H+}

var
  sPNGfname,sBMPfname:ansiString;
  myPNG:Tportablenetworkgraphic;
  outBMP:Tbitmap;
  w,h:integer;
procedure output;
begin
    outBMp.savetofile(sBMPfname);
    outBMP.Free;
    myPNG.free;
    write('Convert successful, the BMP file is ' + sBMPfname);
end;
procedure process;
var
  i,j:integer;//I mean Index of the rows,j mean index of the collumns.
begin
   for i:=0 to w-1 do
       for j:=0 to h-1 do
           outBMp.Canvas.Pixels[i,j]:=mypng.canvas.Pixels[i,j];
   output;
end;
procedure errormsg;
begin
   writeln('Please put the name of PNG file and BMP file into the argument');
   exit;
end;
procedure init;
begin
  sPNGfname:=paramstr(1);
  sBMPfname:=paramstr(2);

  myPNG:=Tportablenetworkgraphic.create;
  myPNG.loadfromfile(sPNGfname);
  outBMP:=Tbitmap.create;
  mypng.getsize(w,h);
  outBMP.SetSize(w,h);
  process;
end;



begin
  if paramcount <> 2 then errormsg
  else init;
end.

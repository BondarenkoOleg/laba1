unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type
  { TForm1 }

  TForm1 = class(TForm)
    SeasonButton: TButton;
    RandomButton: TButton;
    AddButton: TButton;
    Edit1: TEdit;
    procedure AddButtonClick(Sender: TObject);
    procedure RandomButtonClick(Sender: TObject);
    procedure SeasonButtonClick(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;


implementation

function getSeason() : String;
var
  YY,MM,DD : Word;
begin
DeCodeDate(Date,YY,MM,DD);
case MM of
  1,2,12: getSeason := 'Зима';
  3,4,5: getSeason := 'Весна';
  6,7,8: getSeason := 'Лiто';
  9,10,11: getSeason := 'Осiнь';
end;
end;

function myRandom() : Double;
begin
  Randomize;
  myRandom:=(Random(1-999)+999)/1000
end;

function validator(str: String) : String;
var
  YY,MM,DD : Word;
begin
     if((Pos('!', str)<>0) or (Pos(',', str)<>0) or (Pos('.', str)<>0) or (Pos('?', str)<>0) or (Pos('-', str)<>0)) then
     begin
     DeCodeDate(Date,YY,MM,DD);
     validator:=str+'/ '+IntToStr(YY)+' /';
     end
     else
     begin
     validator:=StringReplace(str,' ','#',[rfReplaceAll]);
     end;
end;

{$R *.lfm}

{ TForm1 }
procedure TForm1.SeasonButtonClick(Sender: TObject);
begin
  Form1.Edit1.Text:=getSeason(); //ShowMessage('Lazarus makes my day');
end;

procedure TForm1.RandomButtonClick(Sender: TObject);
begin
Form1.Edit1.Text := FloatToStr(myRandom())
end;

procedure TForm1.AddButtonClick(Sender: TObject);
begin
Form1.Edit1.Text := validator(Form1.Edit1.Text)
end;

end.


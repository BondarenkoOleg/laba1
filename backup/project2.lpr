program project2;
uses
  math;
var
  x,y,z,Q: Extended;
begin
  Write('Введiть x,y,z:');
  Read (x,y,z);
  Q:=Power(z+y,z)-sqrt(Sign((2*PI*sqrt(0.5*z))/y))+Power(Cos(x),Sign(y+z));
  Write(Q :1:4);
end.


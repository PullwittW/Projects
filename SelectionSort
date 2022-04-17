program Array_Projekt;

{$APPTYPE CONSOLE}
{$R *.res}

uses
  System.SysUtils;

var
  zahlen: array [0 .. 50] of integer;
  i, minPos: integer;

  // DREIECKSTAUSCH
procedure tauschen(aktPos, minPos: integer);
var
  speicher: integer;
begin
  speicher := zahlen[aktPos];
  zahlen[aktPos] := zahlen[minPos];
  zahlen[minPos] := speicher;
end;

// Kleinste Zahl suchen
function sucheMin(startPos: integer): integer;
var
  j: integer;
begin
  minPos := startPos;
  for j := startPos to (Length(zahlen)-1) do
  begin
    if zahlen[j] < zahlen[minPos] then
    begin
      minPos := j;
    end;
  end;
  result := minPos;
end;

begin
  Randomize;

  // Zufallszahlen generieren und ausgeben
  for i := 0 to (Length(zahlen) - 1) do
  begin
    zahlen[i] := Random(200) + 1;
    writeln('Zahl an Position ', i, ' = ', zahlen[i]);
  end;
  writeln;

  // Aufrufen der Tauschen-Funktion unter Einbezug der SucheMin-Funktion
  for i := 0 to (Length(zahlen) - 2) do
  begin
    tauschen(i, sucheMin(i));
  end;

  // Array neu ausgeben
  for i := 0 to (Length(zahlen)-1) do
  begin
    writeln('NeueZahl an Position ', i, ' = ', zahlen[i]);
  end;

  readln;
end.

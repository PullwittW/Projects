// name:  Selection Sort in einer Formularanwendung
// discr: Einlesen eines Zahlenbereichs.
//        Zufallszahlen erzeugen.
//        Nach SelectionSort-Verfahren sortieren.
//        Ausgeben der sortierten Zahlen.
// date:  29.04.2022
// auth:  Wangu Pullwitt
// class: BGY-21-3b
// hallo 123

unit frmSelSort;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm2 = class(TForm)
    Header: TLabel;
    LabelRange: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    submitButton: TButton;
    BoxUnsorted: TListBox;
    BoxSorted: TListBox;
    VonBis: TEdit;
    sortierenButton: TButton;
    clearButton: TButton;
    procedure submitButtonClick(Sender: TObject);
    procedure clearButtonClick(Sender: TObject);
    procedure sortierenButtonClick(Sender: TObject);

  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  Form2: TForm2;
  bereich: Integer;
  minPos: Integer;
  zahlen: array of Integer;

implementation

{$R *.dfm}

// function sucheMin
function sucheMin(startPos: Integer): Integer;
var
  j: Integer;
begin
  minPos := startPos;
  for j := startPos to Length(zahlen) do
  begin
    if zahlen[j] < zahlen[minPos] then
    begin
      minPos := j;
    end;
  end;
  result := minPos;
end;

// function Dreieckstausch
procedure tauschen(aktPos, minPos: Integer);
var
  speicher: Integer;
begin
  speicher := zahlen[aktPos];
  zahlen[aktPos] := zahlen[minPos];
  zahlen[minPos] := speicher;
end;

// erzeugen und ausgeben der Zufallszahlen unsortiert
procedure TForm2.submitButtonClick(Sender: TObject);
var
  i: Integer;
  bereich: Integer;
begin
  randomize;
  bereich := StrToInt(VonBis.Text);

  for i := 0 to bereich do
  begin
    BoxUnsorted.Items.Add(IntToStr(Random(bereich) + 1));
  end;

  // array fuellen
  SetLength(zahlen, BoxUnsorted.Items.Count);
  for i := 0 to bereich do
  begin
    zahlen[i] := StrToInt(BoxUnsorted.Items[i]);
  end;

  submitButton.Enabled := false;
end;

// sortierte liste ausgeben
procedure TForm2.sortierenButtonClick(Sender: TObject);
var
  i: Integer;
begin
  // Aufrufen der Tauschen-Funktion unter Einbezug der SucheMin-Funktion
  for i := 0 to (Length(zahlen) - 1) do
  begin
    tauschen(i, sucheMin(i));
    BoxSorted.Items.Add('Zahl' + IntToStr(i) + ': ' + IntToStr(zahlen[i]));
  end;
  sortierenButton.Enabled := false;
end;

procedure TForm2.clearButtonClick(Sender: TObject);
begin
  BoxUnsorted.Items.Clear;
  BoxSorted.Items.Clear;
  VonBis.Text := ' ';
  submitButton.Enabled := true;
  sortierenButton.Enabled := true;
end;

end.

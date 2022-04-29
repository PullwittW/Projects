unit Zahlenraten;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TffmMain = class(TForm)
    Label?berschrift: TLabel;
    LabelZufallszahl: TLabel;
    LabelVersuch: TLabel;
    BtnPr?fen: TButton;
    LabelVersuchAuswertung: TLabel;
    LabelAuswertung: TLabel;
    LabelErrechneteZufallszahl: TLabel;
    EingabeZufallszahl: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure BtnPr?fenClick(Sender: TObject);
    // procedure LabelAuswertungClick(Sender: TObject);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  ffmMain: TffmMain;
  zufall: integer;
  versuche: integer;

implementation

{$R *.dfm}
 procedure TffmMain.FormCreate(Sender: TObject);
begin
  // Zufallszahl zwischen 1 und 10 erzeugen
  Randomize;
  zufall := Random(999) +1;
  // Zufallszahl im Label 'LabelErrechneteZufallszahl' anzeigen
  LabelErrechneteZufallszahl.Caption := IntToStr(zufall);
  EingabeZufallszahl.Text := '?';
  LabelAuswertung.Caption := '';
end;

procedure TffmMain.BtnPr?fenClick(Sender: TObject);
begin
// Anzahl der Versuche
versuche := versuche +1;

// Vergleich mit eingegebener Zahl und Text anpassen
  if StrToInt(EingabeZufallszahl.Text) < zufall then
    begin
    // kleiner
      LabelAuswertung.Caption := 'zu klein';
      LabelVersuchAuswertung.Caption := IntToStr(versuche);
    end
  else if StrToInt(EingabeZufallszahl.Text) > zufall then
    begin
    // gr??er
      LabelAuswertung.Caption := 'zu gro?';
      LabelVersuchAuswertung.Caption := IntToStr(versuche);
    end
  else
    begin
    // richtig
       LabelAuswertung.Caption := 'richtig';
       LabelVersuchAuswertung.Caption := IntToStr(versuche);
    end;
end;
end.

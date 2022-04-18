unit Spiel;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    Header: TLabel;
    ll: TButton;
    lm: TButton;
    lr: TButton;
    ml: TButton;
    mm: TButton;
    mr: TButton;
    ul: TButton;
    um: TButton;
    ur: TButton;
    reset: TButton;
    lWinner: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    count_player1: TLabel;
    count_player2: TLabel;
    Game_reset: TButton;

    procedure count();
    procedure getWinner2();
    procedure getWinner();
    procedure ulClick(Sender: TObject);
    procedure umClick(Sender: TObject);
    procedure urClick(Sender: TObject);
    procedure mlClick(Sender: TObject);
    procedure mmClick(Sender: TObject);
    procedure mrClick(Sender: TObject);
    procedure llClick(Sender: TObject);
    procedure lmClick(Sender: TObject);
    procedure lrClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure resetClick(Sender: TObject);
    procedure Game_resetClick(Sender: TObject);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  Form1: TForm1;
  player: integer;
  count1 : integer;
  count2 : integer;

implementation

{$R *.dfm}
 // Reset
procedure TForm1.resetClick(Sender: TObject);
begin
  // Spieler festlegen
  randomize;
  player := random(2)+1;
  ShowMessage('Beginnender Spieler ist ' + IntToStr(player));

  // Gewinner anzeigen
  count();

    ll.Caption := '';
    lm.Caption := '';
    lr.Caption := '';
    ml.Caption := '';
    mm.Caption := '';
    mr.Caption := '';
    ul.Caption := '';
    um.Caption := '';
    ur.Caption := '';
    lWinner.Caption := '';

end;
 // Initialisierung des Formulars
procedure TForm1.FormCreate(Sender: TObject);
begin
  // Spieler festlegen
  count1 := 0;
  count2 := 0;
  randomize;
  player := random(2)+1;
  ShowMessage('Beginnender Spieler ist ' + IntToStr(player));
  // Button leeren
    ll.Caption := '';
    lm.Caption := '';
    lr.Caption := '';
    ml.Caption := '';
    mm.Caption := '';
    mr.Caption := '';
    ul.Caption := '';
    um.Caption := '';
    ur.Caption := '';
    count_player1.Caption := '0';
    count_player2.Caption := '0';
end;

procedure TForm1.Game_resetClick(Sender: TObject);
begin
     // Button leeren
    ll.Caption := '';
    lm.Caption := '';
    lr.Caption := '';
    ml.Caption := '';
    mm.Caption := '';
    mr.Caption := '';
    ul.Caption := '';
    um.Caption := '';
    ur.Caption := '';
    lWinner.Caption := '';
    count_player1.Caption := '0';
    count_player2.Caption := '0';
end;

// Untere Reihe
procedure TForm1.llClick(Sender: TObject);
begin
  if (player = 1) AND (ll.Caption = '') then
  begin
    ll.Caption := 'X';
    player := 2;
  end
  else if (player = 2) AND (ll.Caption = '') then
  begin
     ll.Caption := 'O';
     player := 1;
  end;
  getWinner2();
end;
procedure TForm1.lmClick(Sender: TObject);
begin
    if (player = 1) AND (lm.Caption = '') then
  begin
    lm.Caption := 'X';
    player := 2;
  end
  else  if (player = 2) AND (ll.Caption = '') then
  begin
     lm.Caption := 'O';
     player := 1;
  end;
  getWinner2();
end;
procedure TForm1.lrClick(Sender: TObject);
begin
    if (player = 1) AND (lr.Caption = '') then
  begin
    lr.Caption := 'X';
    player := 2;
  end
  else  if (player = 2) AND (lr.Caption = '') then
  begin
     lr.Caption := 'O';
     player := 1;
  end;
  getWinner2();
end;


// Mittlere Reihe
procedure TForm1.mlClick(Sender: TObject);
begin
if (player = 1) AND (ml.Caption = '') then
  begin
    ml.Caption := 'X';
    player := 2;
  end
  else  if (player = 2) AND (ml.Caption = '') then
  begin
     ml.Caption := 'O';
     player := 1;
  end;
  getWinner2();

end;
procedure TForm1.mrClick(Sender: TObject);
begin
    if (player = 1) AND (mr.Caption = '') then
  begin
    mr.Caption := 'X';
    player := 2;
  end
  else  if (player = 2) AND (mr.Caption = '') then
  begin
     mr.Caption := 'O';
     player := 1;
  end;
  getWinner2();
end;
procedure TForm1.mmClick(Sender: TObject);
begin
    if (player = 1) AND (mm.Caption = '') then
  begin
    mm.Caption := 'X';
    player := 2;
  end
  else  if (player = 2) AND (mm.Caption = '') then
  begin
     mm.Caption := 'O';
     player := 1;
  end;
  getWinner2();
end;


// Obere Reihe
procedure TForm1.ulClick(Sender: TObject);
begin
    if (player = 1) AND (ul.Caption = '') then
  begin
    ul.Caption := 'X';
    player := 2;
  end
  else  if (player = 2) AND (ul.Caption = '') then
  begin
     ul.Caption := 'O';
     player := 1;
  end;
  getWinner2();
end;
procedure TForm1.umClick(Sender: TObject);
begin
  if (player = 1) AND (um.Caption = '') then
  begin
    um.Caption := 'X';
    player := 2;
  end
  else  if (player = 2) AND (um.Caption = '') then
  begin
     um.Caption := 'O';
     player := 1;
  end;
  getWinner2();
end;
procedure TForm1.urClick(Sender: TObject);
begin
  if (player = 1) AND (ur.Caption = '') then
  begin
    ur.Caption := 'X';
    player := 2;
  end
  else  if (player = 2) AND (ur.Caption = '') then
  begin
     ur.Caption := 'O';
     player := 1;
  end;
  getWinner2();
end;

procedure TForm1.getWinner();

begin
 // Gewinner für O
 if True then
 begin
 if (ll.Caption = 'O') AND (lm.Caption = 'O') AND (lr.Caption = 'O') then
  begin
    lWinner.Caption:='Spieler 1 gewinnt.';
  end
  else if (ll.Caption = 'X') AND (lm.Caption = 'X') AND (lr.Caption = 'X') then
  begin
    lWinner.Caption:='Spieler 2 gewinnt.';
  end;

  if (ll.Caption = 'O') AND (mm.Caption = 'O') AND (ur.Caption = 'O') then
  begin
    lWinner.Caption:='Spieler 1 gewinnt.';
  end
  else if (ll.Caption = 'X') AND (mm.Caption = 'X') AND (ur.Caption = 'X') then
  begin
    lWinner.Caption:='Spieler 2 gewinnt.';
  end;

    if (ll.Caption = 'O') AND (ml.Caption = 'O') AND (ul.Caption = 'O') then
  begin
    lWinner.Caption:='Spieler 1 gewinnt.';
  end
  else if (ll.Caption = 'X') AND (ml.Caption = 'X') AND (ul.Caption = 'X') then
  begin
    lWinner.Caption:='Spieler 2 gewinnt.';
  end;

    if (ml.Caption = 'O') AND (mm.Caption = 'O') AND (mr.Caption = 'O') then
  begin
    lWinner.Caption:='Spieler 1 gewinnt.';
  end
  else if (ml.Caption = 'X') AND (mm.Caption = 'X') AND (mr.Caption = 'X') then
  begin
    lWinner.Caption:='Spieler 2 gewinnt.';
  end;

    if (ul.Caption = 'O') AND (um.Caption = 'O') AND (ur.Caption = 'O') then
  begin
    lWinner.Caption:='Spieler 1 gewinnt.';
  end
  else if (ul.Caption = 'X') AND (um.Caption = 'X') AND (ur.Caption = 'X') then
  begin
    lWinner.Caption:='Spieler 2 gewinnt.';
  end;

      if (um.Caption = 'O') AND (mm.Caption = 'O') AND (um.Caption = 'O') then
  begin
    lWinner.Caption:='Spieler 1 gewinnt.';
  end
  else if (um.Caption = 'X') AND (mm.Caption = 'X') AND (um.Caption = 'X') then
  begin
    lWinner.Caption:='Spieler 2 gewinnt.';
  end;

      if (ur.Caption = 'O') AND (mr.Caption = 'O') AND (lr.Caption = 'O') then
  begin
    lWinner.Caption:='Spieler 1 gewinnt.';
  end
  else if (ur.Caption = 'X') AND (mr.Caption = 'X') AND (lr.Caption = 'X') then
  begin
    lWinner.Caption:='Spieler 2 gewinnt.';
  end;

      if (lr.Caption = 'O') AND (mm.Caption = 'O') AND (ul.Caption = 'O') then
  begin
    lWinner.Caption:='Spieler 1 gewinnt.';
  end
  else if (lr.Caption = 'X') AND (mm.Caption = 'X') AND (ul.Caption = 'X') then
  begin
    lWinner.Caption:='Spieler 2 gewinnt.';
  end;
 end
 else
 begin
   lWinner.Caption := 'Tie';
 end;
end;

// get winner
procedure TForm1.getWinner2();
begin
// Oben
  if (ul.Caption = um.Caption) AND (ur.Caption = um.Caption) then
  begin
    if ul.Caption = 'X' then
    begin
      lWinner.Caption := 'Player 1 winns';
    end
    else if ul.Caption = 'O' then
    begin
      lWinner.Caption := 'Player 2 winns';
    end;
  end;

  // Mitte-nach-links
    if (ml.Caption = mm.Caption) AND (mr.Caption = mm.Caption) then
  begin
    if ml.Caption = 'X' then
    begin
      lWinner.Caption := 'Player 1 winns';
    end
    else if ml.Caption = 'O' then
    begin
      lWinner.Caption := 'Player 2 winns';
    end;
  end;

  // Unten
    if (ll.Caption = lm.Caption) AND (lr.Caption = lm.Caption) then
  begin
    if ll.Caption = 'X' then
    begin
      lWinner.Caption := 'Player 1 winns';
    end
    else if ll.Caption = 'O' then
    begin
      lWinner.Caption := 'Player 2 winns';
    end;
  end;

  // diagonal von links unten
    if (ll.Caption = mm.Caption) AND (ll.Caption= ur.Caption) then
  begin
    if ll.Caption = 'X' then
    begin
      lWinner.Caption := 'Player 1 winns';
    end
    else if ll.Caption = 'O' then
    begin
      lWinner.Caption := 'Player 2 winns';
    end;
  end;

  // diagonal von rechts unten
    if (lr.Caption = mm.Caption) AND (lr.Caption = ul.Caption) then
  begin
    if lr.Caption = 'X' then
    begin
      lWinner.Caption := 'Player 1 winns';
    end
    else if lr.Caption = 'O' then
    begin
      lWinner.Caption := 'Player 2 winns';
    end;
  end;

  // links
    if (ul.Caption = ml.Caption) ANd (ul.Caption = ll.Caption) then
  begin
    if ul.Caption = 'X' then
    begin
      lWinner.Caption := 'Player 1 winns';
    end
    else if ul.Caption = 'O' then
    begin
      lWinner.Caption := 'Player 2 winns';
    end;
  end;

  // mitte-nach-unten
    if (um.Caption = mm.Caption) AND (um.Caption = lm.Caption) then
  begin
    if um.Caption = 'X' then
    begin
      lWinner.Caption := 'Player 1 winns';
    end
    else if um.Caption = 'O' then
    begin
      lWinner.Caption := 'Player 2 winns';
    end;
  end;

  // rechts
    if (ur.Caption = mr.Caption) AND (ur.Caption = lr.Caption) then
  begin
    if ur.Caption = 'X' then
    begin
      lWinner.Caption := 'Player 1 winns';
    end
    else if ur.Caption = 'O' then
    begin
      lWinner.Caption := 'Player 2 winns';
    end;
  end;
end;

// count
procedure TForm1.count();
begin

  if lWinner.Caption = 'Player 1 winns' then
  begin
    count1 := count1 +1;
    count_player1.Caption := IntToStr(count1);
  end
  else if lWinner.Caption = 'Player 2 winns' then
  begin
    count2 := count2 +1;
    count_player2.Caption := IntToStr(count2);
  end;

end;
end.

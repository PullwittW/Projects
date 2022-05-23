# Project-name: Hangman
# Author: Wangu Pullwitt
# Date-built: 12/05/2022
# Functionality: A word given by the computer, wich have to be guessed from the user. But the user has to guess the word in a limited number of tries.
# Last update: 15/05/2022
# Next step:

# Einführungstext
print("Willkommen zum Hangman-Spiel! \n" "Das Spiel besteht darin, ein Wort welches von einem Computer generiert wird in einer bestimmten Anzahl von Versuchen zu erraten. \n" "Wenn du das Wort erraten hast, dann hast du gewonnen! \n" "Wenn du das Wort nicht erraten hast, dann hast du verloren! \n" "Viel Glück! \n")
print("Die Schwierigkeitsstufe, sprich die Anzahl der Versuche, errechnet sich aus der länge des Wortes bei 'schwer', der länge des Wortes + 3 bei 'mittel' und der länge des Wortes + 6 bei 'leicht'")
import random
randomWordInput = []
counter = 0
file = open("woerter.txt", "r")
for line in file:
    line = line.rstrip()
    line = line.lower()
    if len(line) > 5 :
        randomWordInput.append(line)
    else : continue
    #print(randomWordInput)
    definedWord = random.choice(randomWordInput)
#VAR
#definedWord = 'python'
listOfInput = []
listOfWrongInput = []
anfrageRundenzahl = 1
wählenDerSchwierigkeit = ""


# erstellt eine Liste, der Wörter (und zeigt diese an, nur für den Test) | FERTIG
def splitLetters():
    list_of_letters = list(definedWord)


# erstellt die erste Linie des Wortes | FERTIG
def createLines():
    print("Dein neues Wort: ", end="")
    for char in definedWord:
        print("_ ", end="")
    print("\n")

# checkt, ob der eingegebene Buchstabe in der Liste der Buchstaben vorkommt und gibt ein feedback zurück | FERTIG
def check():
    if inputChar in definedWord:
        listOfInput.append(inputChar)
        print('Der eingegebene Buchstabe ', inputChar, ' ist richtig\n')
    else:
        listOfWrongInput.append(inputChar)
        print('Der eingegebene Buchstabe ', inputChar, ' ist falsch\n')

# soll die neue Linie des Wortes erstellen, wenn ein Buchstabe richtig gewählt wurde soll er in der Liste erscheinen
def newLine():
    print("Dein Wort: ", end="")
    for char in definedWord:
        if char in listOfInput:
            print(char, end=" ")
        else:
            print("_ ", end="")
    print("\n")

# schwierigkeit auswählen
schwierigkeit = input("Wähle eine Schwierigkeit: (1) Leicht, (2) Mittel, (3) Schwer: ")
#print(schwierigkeit)
if schwierigkeit == "1":
    schwierigkeit = len(definedWord) + 6    # leicht
elif schwierigkeit == "2":
    schwierigkeit = len(definedWord) + 3    # medium
elif schwierigkeit == "3":
    schwierigkeit = len(definedWord)        # hart

# Liste des Wortes erstellen
splitLetters()

# Linien ersellen
createLines()

while anfrageRundenzahl <= schwierigkeit or len(listOfInput) == len(definedWord):
    # Schleife für die Eingabe durch den Nutzer
    inputChar = input("Buchstabe: ")

    # checken, ob der Buchstabe im Wort ist
    check()
    
    # Liste der falschen
    if len(listOfWrongInput) != 0:
        print('Liste der falschen Buchstaben:' , listOfWrongInput[:])

    # neue Linie erstellen
    newLine()

    print('Versuche: ', anfrageRundenzahl, 'von', schwierigkeit)
    anfrageRundenzahl += 1
    #print('Liste der richtig eingegebenen Buchstaben: ',listOfInput[:])

if listOfInput == definedWord:
    print('Gewonnen!')
else:
    print('Verloren! ')
    print("Das Wort war: ", definedWord)


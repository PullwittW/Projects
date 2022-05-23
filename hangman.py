# Project-name: Hangman
# Author: Wangu Pullwitt
# Date-built: 12/05/2022
# Functionality: A word given by the computer, wich have to be guessed from the user. But the user has to guess the word in a limited number of tries.
# Last update: 15/05/2022
# Next step:

# Einführungstext
print("\n")
print("Willkommen zum Hangman-Spiel! \n" "Das Spiel besteht darin, ein Wort welches von einem Computer generiert wird in einer bestimmten Anzahl von Versuchen zu erraten. \n" "Wenn du das Wort erraten hast, dann hast du gewonnen! \n" "Wenn du das Wort nicht erraten hast, dann hast du verloren! \n" "Viel Glück! \n")
print("Die Schwierigkeitsstufe, sprich die Anzahl der Versuche, errechnet sich aus der länge des Wortes bei 'schwer', \nder länge des Wortes + 3 bei 'mittel' und der länge des Wortes + 6 bei 'leicht'")
print("\n")
# Wörterbuch 'woerter.txt' lesen und ein Wort mit mindestens 5 Buchstaben zufällig auswählen
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
    definedWord = random.choice(randomWordInput)

#Variablen
listOfInput = []
listOfWrongInput = []
anfrageRundenzahl = 1
wählenDerSchwierigkeit = ""

# Schwierigkeit auswählen
schwierigkeit = input("Wähle eine Schwierigkeit: (1) Leicht, (2) Mittel, (3) Schwer: ")
if schwierigkeit == "1":
    schwierigkeit = len(definedWord) + 6    # leicht
elif schwierigkeit == "2":
    schwierigkeit = len(definedWord) + 3    # medium
elif schwierigkeit == "3":
    schwierigkeit = len(definedWord)        # hart
print("\n")       

# erstellt die erste Linie mit '_' des Wortes
def createLines():
    print("Dein neues Wort: ", end="")
    for char in definedWord:
        print("_ ", end="")
    print("\n")

# checkt, ob der eingegebene Buchstabe in der Liste der Buchstaben vorkommt und gibt ein feedback zurück
def check():
    if inputChar in definedWord:
        listOfInput.append(inputChar)
        print('Der eingegebene Buchstabe ', inputChar, ' ist richtig\n')
    else:
        listOfWrongInput.append(inputChar)
        print('Der eingegebene Buchstabe ', inputChar, ' ist falsch\n')

# erstellt die neue Linie von '_' des Wortes, unter Einbezug der richtig eingegebenen Buchstaben
def newLine():
    print("Dein Wort: ", end="")
    for char in definedWord:
        if char in listOfInput:
            print(char, end=" ")
        else:
            print("_ ", end="")
    print("\n")

# Aufruf der Funktion für die Ausgabe der ersten Linie
createLines()

# Schleife, welche die Schwierigkeit berücksichtigt und ob das Wort schon vollständig erraten wurde
while anfrageRundenzahl  <= schwierigkeit  or len(listOfInput) == len(definedWord):
    
    # Eingabe des Buchstabens
    inputChar = input("Buchstabe eingeben: ")
    # checken, ob der Buchstabe im Wort ist
    check()
    # Liste der falschen Buchstaben ausgeben (Hilfestellung zum erinnern an die bereits eingegebenen Buchstaben)
    if len(listOfWrongInput) != 0:
        print('Liste der falschen Buchstaben:' , listOfWrongInput[:], "\n")
    # Aufruf der Funktion zum Erstellen einer neuen Linie
    newLine()

    # Ausgabe der Anzahl der Versuche und der noch zu verfügungstehenden
    print('Versuche: ', anfrageRundenzahl, 'von', schwierigkeit)
    anfrageRundenzahl += 1
    print("--------------------------------------------------------------------------------")
    if anfrageRundenzahl == schwierigkeit :
        print("\n")
        print("Du hast die letzte Chance!\n")

# Ausgabe des Wortes, wenn das Wort nicht erraten wurde
if listOfInput == definedWord:
    print('Gewonnen!')
else:
    print('Verloren! ')
    print("Das Wort war: ", definedWord)


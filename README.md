# HFT Stuttgart: Poster mit LaTeX

An der Hochschule für Technik Stuttgart wird für die Erstellung eines Posters (z.B. im Rahmen einer Thesis) lediglich eine PowerPoint-Vorlage bereitgestellt.
Mit der Dokumentenklasse `hftpostr` ist es nun möglich, ein Poster mit einfachen Mitteln in LaTeX zu erstellen.


## Installation:

Zwingend notwendig:

* `hftpostr.cls`
* `hftpostrbackground.pdf`

Weitere Themes:

* `beamerthemePosterHFT1.sty`
* `beamerthemePosterHFT2.sty`

Die Dateien müssen sich im Haupt-Verzeichnis des LaTeX-Projekts befinden.


## Dokumentenklasse `hftpostr`

Die Dokumentenklasse wird wie jede andere Klasse geladen:
```
\documentclass{hftpostr}
```


## Befehle

Folgende Befehle stehen zur Verfügung:

`\studyProgramme{<studyProgramme>}`:
Studiengang. Default: `{Bachelor-Studiengang Mathematik}`

`\advisor{<advisor>}`:
Name des Betreuers. Default: `{Prof. Dr. XY}`

`\authorLabel{<authorLabel>}`:
Text, der hinter dem Namen Autors steht. Default: ` (Autor)`

`\advisorLabel{<advisorLabel>}`:
Text, der hinter dem Namen des Betreuers steht. Default: ` (Betreuer)`


### Optionen

Die folgenden Optionen können per `\documentclass[option1, option2, ...]{hftpostr}` gesetzt werden.

`scale=<scale>`:
Skalierungsfaktor für Schriftgrößen und relative Abstände. Default: `1.5`

`marginLeftRight=<marginLeftRight>`:
Abstand des Textbereichs zu den optischen Seitenrändern. Default: `37mm`

`marginTop=<marginTop>`:
Abstand von oberer Seitenkante zu Überschrift. Default: `23mm`

`marginBelowHeadline=<marginBelowHeadline>`:
Zusätzlicher Abstand zwischen Überschrift und erstem Inhalt. Default: `5mm`

`blockDistance=<blockDistance>`:
Zusätzlicher Abstand zwischen einzelnen Blöcken. Default: `7ex`


## Auswahl des Themes

Die folgenden Themes stehen zur Verfügung und können mit `\usetheme{<Theme-Name>}` genutzt werden:

* `default`
* `PosterHFT1`
* `PosterHFT2`

Wenn nicht explizit ein Theme gesetzt wird, wird `default` verwendet.

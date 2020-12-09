# QR-script
<img src="https://img.shields.io/badge/platform-win--64-informational"> <img src="https://img.shields.io/github/last-commit/Sionkerk-Houten/QR-script"> <img src="https://img.shields.io/github/issues-raw/Sionkerk-Houten/QR-script">

### Omschrijving
Verwerkt ING QR-code screenshots met [ImageMagick](https://imagemagick.org/), door ze bij te snijden en te converteren naar een 1-bit indexed PNG afbeelding. Werkt alleen met screenshots waarin de QR-code 400x400 pixels groot is met een horizontale offset van 824 en een verticale offset van 544 pixels. Voor andere posities moet het <code>-crop</code> argument worden aangepast op regel 25 van <code>converteer-QR.ps1</code>.

### Gebruik
Start het script door <code>converteer-start.bat</code> uit te voeren. Er opent een scherm waarin de screenshot van de QR-code geselecteerd kan worden. Het verwerkte bestand kan gevonden worden als <code>QR-bewerkt.png</code> in de folder van het script.

### Installatie
Er hoeft niets geïnstalleerd te worden voor dit script. Na downloaden hoeft enkel het zip-bestand uitgepakt te worden in een willekeurige folder. Het script verandert geen instellingen. Een 64-bit versie van Windows is vereist.

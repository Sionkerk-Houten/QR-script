Add-Type -AssemblyName System.Windows.Forms

Write-Host 'Selecteer een afbeelding om te bewerken'

# Open een FileBrowser die in de Downloads folder begint en alleen png, jpg en jpeg afbeeldingen laat openen
$FileBrowser = New-Object System.Windows.Forms.OpenFileDialog
$FileBrowser.InitialDirectory = [Environment]::GetFolderPath("UserProfile") | Join-Path -ChildPath "Downloads"
$FileBrowser.Filter = 'Afbeelding (*.png;*.jpg;*.jpeg)|*.png;*.jpg;*.jpeg|PNG (*.png)|*.png|JPG (*.jpg)|*.jpg|JPEG (*.jpeg)|*.jpeg|Overig (*.*)|*.*'
$FileBrowser.Title = 'Selecteer een afbeelding om te bewerken'
$DialogResult = $FileBrowser.ShowDialog()

# Check of er een bestand is gekozen, zo niet dan wordt dit script gestopt
if ($DialogResult -ne 1) {
    Write-Host "Er is een fout opgetreden bij het kiezen van het bestand`r`n"
    Pause
    Exit 1
}

# Bijsnijden, zwart-wit maken en opslaan als indexed 1-bit QR-bewerkt.png bestand met ImageMagick (overschrijft al bestaande QR-converted.png bestanden)
# Verander de parameters van -crop als ING QR-codes op een andere plek op het scherm laat zien
$Options = @(
    'convert',                     # Gebruik de convert optie omdat -regard-warnings anders niet werkt
    $FileBrowser.FileName,         # Het geselecteerde bestand is de input
    '-regard-warnings'             # Een ongeldige crop is vreemd genoeg geen error maar een waarschuwing
    '-crop', '400x400+824+544',    # Crop, breedte x hoogte + offsethorizontaal + offsetverticaal (vanaf linkerbovenhoek in pixels)
    '-threshold', '60%',           # Converteer naar zwart-wit: een pixel is wit als de waarde van een channel >= 50% is, anders is de pixel zwart
    '-define', 'png:color-type=3', # Sla op als indexed
    '-define', 'png:bit-depth=1'   # Sla op als zwart-wit indexed
    'QR-bewerkt.png'               # Sla resulaat op als QR-bewerkt.png (output)
)

# Voer het command uit met bovenstaande opties
& '.\ImageMagick-portable-custom\magick.exe' $Options

# Exit dit script, en laat zien of het vorige command voor problemen zorgde of niet ($? is true als het vorige command niet voor errors zorgde)
if ($?) {
    Write-Host "Het bestand is opgeslagen als QR-bewerkt.png in de folder van dit script`r`n"
    Pause
    Exit 0
}
else {
    Write-Host "Er is een probleem opgetreden tijdens het bewerken van de afbeelding. Is de afbeelding groot genoeg om bij te kunnen snijden?`r`n"
    Pause
    Exit 1
}
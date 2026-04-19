# Shell-Skripte für CachyOS

Hier findest du einige nützliche Shell-Skripte für Linux. Auch wenn viele der Skripte unter anderen Distributionen funktionieren dürften, sind sie grundsätzlich speziell für CachyOS geschrieben.

> Switch to [english version](/README.md).

> [!NOTE]
> Wenn du nicht weißt, wie man Shell-Skripte im Allgemeinen einrichtet und verwendet, lies dazu die kurze [Anleitung](#💡-so-richtest-du-shell-skripte-ein-und-verwendest-sie) am Ende dieser Seite.

---

## shader-cache-auto-refresh.sh

**Was dieses Skript macht** 

Dieses Skript bereinigt den generierten Shader-Cache für alle lokalen Benutzerkonten unter /home/. Es sucht nach den verschiedenen Verzeichnispfaden, in denen Shader-Caches für NVIDIA, Steam/Proton, Mesa, Vulkan und Wine normalerweise gespeichert sind. Anschließend wird dem Benutzer eine Zusammenfassung angezeigt.

Bitte beachte, dass dieses Skript nicht alle Shader-Cache-Verzeichnisse für jede Anwendung bereinigen kann. Viele Programme verwenden ihr eigenes Shader-Cache-Verzeichnis. Spiele sollten jedoch gut abgedeckt sein.

**Was ist der Shader-Cache?** 

Wenn du ein Spiel oder ein kompatibles Programm startest, wie z.B. eine 3D-Rendering-Software oder einen modernen Webbrowser, muss deine Grafikkarte kleine Berechnungsprogramme (sogenannte Shader) erstellen, die bestimmen, wie Bilder auf dem Bildschirm angezeigt werden – z. B. Licht, Schatten oder Reflexionen. Da das Erstellen Zeit braucht, werden die fertigen Ergebnisse in einem temporären Speicher – dem Shader-Cache – gespeichert. Wenn du das Spiel oder Programm das nächste Mal startest, kann die Grafikkarte auf diese gespeicherten Ergebnisse zugreifen, anstatt alles neu zu berechnen. Das sorgt für schnellere Ladezeiten und weniger Ruckeln.

**Warum und wann sollte man den Shader-Cache löschen?** 

Ein neuer Grafikkartentreiber "kommuniziert" oft etwas anders mit der Hardware als der alte. Die im Cache gespeicherten Shader sind dann nicht mehr vollständig kompatibel mit dem neuen Treiber – ähnlich wie Anweisungen, die für eine ältere Version eines Geräts geschrieben wurden. Dies kann zu Grafikfehlern, Abstürzen oder einer schlechteren Leistung führen. Dies ist besonders unter Linux relevant, da das System alte Shader-Caches oft nicht automatisch als veraltet erkennt und verwirft, wie es Windows-Treiber häufiger tun. Es wird daher empfohlen, den Shader-Cache nach einer Aktualisierung des Grafikkartentreibers sowie nach Kernel-Updates, die die NVIDIA-Module betreffen, zu bereinigen.

Das Löschen des Shader-Caches ist natürlich keine garantierte Lösung für Grafik- oder Leistungsprobleme. Es hat aber auch keine negativen Auswirkungen auf das System. Beachte jedoch, dass der Cache beim nächsten Start des Spiels oder Programms neu aufgebaut und angepasst wird. Während dieses Vorgangs kann es zu kurzen Rucklern oder Leistungseinbußen kommen.

---

## 💡 So richtest du Shell-Skripte ein und verwendest sie

1. Es ist ratsam, einen Ordner für deine Skripte in deinem Home-Verzeichnis anzulegen, z. B. /home/*DEINBENUTZERNAME*/.local/bin/
```shell
mkdir -p ~/.local/bin/
```
2. Lade die Skriptdatei aus dem [GitHub Repository](https://github.com/LoopSkyworker/cachyos-toolbox/tree/main/shell-scripts) über einen Webbrowser herunter, oder direkt über die Konsole (ersetze den Skriptnamen im folgenden Befehl durch den tatsächlichen Dateinamen des Skripts): 
```shell
curl -fsSL -O --output-dir "$HOME/.local/bin" https://raw.githubusercontent.com/LoopSkyworker/cachyos-toolbox/main/shell-scripts/SCRIPTNAME.sh
```
3. Mach das Skript ausführbar: 
```shell
chmod +x ~/.local/bin/SCRIPTNAME.sh
```
4. Jetzt kannst du das Skript ausführen: 
```shell
sh ~/.local/bin/SCRIPTNAME.sh
```

> [!NOTE]
> Grundsätzlich kannst du die Skripte in deinem Benutzerverzeichnis (z. B.  ```/home/BENUTZERNAME/.local/bin/```) speichern, wenn du sie nur in deinem Benutzerkontext ausführst. Wenn du die Ausführung eines Skripts automatisieren möchtest und es mehrere Benutzerkonten auf diesem System gibt, ist es besser, das Skript unter ```/usr/local/bin``` abzulegen.

---

## ⚖️ Lizenz

Die Lizenzrechte und -beschränkungen (MIT) findest du in der Datei [LICENSE](/LICENSE.md).

---

## ✋ Haftungsausschluss

Diese Software wird ohne jegliche Gewährleistung bereitgestellt. Die Nutzung erfolgt auf eigene Verantwortung.
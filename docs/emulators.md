# Console Emulation

Raven ships with various emulators.

**Nintendo Consoles**

- zsnes: SNES.
- mupen64plus: Nintendo 64.
- dolphin-emu: Best-in-class GameCube / Wii emulator.
- yuzu: Great Nintendo Switch emulator.

**Nintendo Handhelds**

- vbam: VisualBoyAdvance. GameBoy, GameBoy Color, and Gameboy Advance.
- desmume: Nintendo DS.
- azahar: Nintendo 3DS.

**Sony**

- pcsxr:   Sony's PlayStation.
- pcsx2:   Sony's PlayStation 2.
- rpcs3:   Sony's PlayStation 3.
- shadps4: Sony's PlayStation 4.

## Super NES Emulator: zsnes

`zsnes` is a great SNES emulator. It's configured at `~/.zsnes`

If the user prefers `higan`, then saves can be migrated by
renaming their extensions from `*.srm` (zsnes) to `*.ram` (higan).

`zsnes` should suffice. Use it until it meets a game it can't run.

## Nintendo 64 Emulator: Mupen64plus

Mupen64plus is configured at ` ~/.config/mupen64plus`

Launch it with something like

```
mupen64plus ~/Roms/n64/star-fox-64.z64
```

Check the following variables.

```
ScreenshotPath = "~/Roms/emu/mupen64plus/screen-shots"
SaveStatePath = "~/Roms/emu/mupen64plus/sstates
SaveSRAMPath = "~/Roms/emu/mupen64plus/save"
```

Emulator Controls
-----------------
```
Escape      Quit the emulator
0-9         Select virtual 'slot' for save/load state (F5 and F7) commands
F5          Save emulator state
F7          Load emulator state
F9          Reset emulator
F10         slow down emulator by 5%
F11         speed up emulator by 5%
F12         take screenshot
Alt-Enter   Toggle between windowed and fullscreen
p or P      Pause on/off
m or M      Mute/unmute sound
g or G      Press "Game Shark" button (only if cheats are enabled)
/ or ?      single frame advance while paused
F           Fast Forward (playback at 250% normal speed while F key is pressed)
[           Decrease volume
]           Increase volume
```

Default N64 Key-Mapping
-----------------------
```
Analog Stick                Arrow Keys (left, right, down, up)
C Up/Left/Down/Right        "I", "J", "K", "L"
DPad Up/Left/Down/Right     "W", "A", "S", "D"
Z trigger                   "z"
Left trigger                "x"
Right trigger               "c"
Start                       "Enter" ("Return")
A button                    "left shift"
B button                    "left control"
Select Mempack              ","
Select Rumblepack           "."
```

## GC / Wii Emulator: Dolphin

Dolphin is a best-in-class emulator for the Gamecube and Wii systems.
So much so that if a game has multiple versions then the gamecube
is probably the best emulation experience via Dolphin.

Run `dolphin-emu -u ~/dolphin`. This treats a folder as a user-profile.
Nails everything; cache, config, saves, controller profiles...

Put that folder wherever you want.

### Saves

The GC memory card is located at `./GC/MemoryCard*.raw`

Wii saves are a bit weirder; they're not in the sd.raw like one might expect.
Rather, each Wii title has a unique ID. Wii saves are locted in
Wii/title/00010000/* . For example, Super Mario Galaxy has ID 524d4745 . One
can "import" Wii saves by just copying this dir.

## Nintendo Switch Emulator: Yuzu

Yuzu is a great Nintendo Switch emulator.

It's been removed from nixpkgs, but the following commands
will fetch and launch it..

```
[master@main-system:~/]$ raven-yuzu
[nix-shell:~/]$ yuzu
```

Yuzu requires Switch keys in order to run. Keys may be ripped from a
Switch, or often included with pirated Switch games. Nintendo's already
been for the Switch and the game, [right](./piracy.md)?

Install keys with `File -> Open yuzu folder` and place `prod.keys` into `keys`.

### Save States

Save states are managed with the function keys.
- eg. shift+F1 to save a state, then press F1 to load it back.

The "Cache" dir in dolphin can get a bit large. Feel free to delete it from
time to time.

## Gameboys: VisualBoyAdvance

Gameboy, Gameboy Color, and Gameboy Advance emulator.

VBA is configured at `~/.config/visualboyadvance-m/vbam.ini`

Launch is easy. Save files are formatted as `rom-name.sav` and
are loaded / created from the same directory as the rom.

```
# Launch examples
vbam ~/Roms/gb/tpp-red.gb         # Gameboy
vbam ~/Roms/gbc/pokemon-yello.gbc # Gameboy Color
vbam ~/Roms/gba/tpp-emerald.gba   # Gameboy Advance
```

Emulator Controls
-----------------
```
Exit            Escape
Save-states     Function keys. eg. SHIFT+F1 to save, F1 to load back.
Speed-up        Space
```

Default Gameboy Key-Mapping
---------------------------
```
D-Pad:  Arrow keys
A:      Z
B:      X
L:      Q
R:      W
Start:  Enter
Select: ??
```

## Nintendo DS: Desmume

Desmume is very easy with a graphical front-end. Launch with `desmume`
and configure from there. Point it at a `<rom-name>.nds` file and play.

Saves are stored in `~/.config/desmume/`. 

```
<rom-name>.dsv is the regular save
<rom-name>.ds1 is the save state for slot1
<rom-name>.ds2 is the save state for slot2 and so on...
```

## Nintendo 3DS Emulator: Azahar

Azahar is a simple 3DS emulator and configured via GUI.
Launch with `azahar`.

## PS1 Emulator: pcsxr

PCSXR is the PS1 emulator and is configured at `~/.pcsxr`

`pcsxr` was removed from nixpkgs, but Raven can still get it.

```
[master@main-system:~/]$ raven-pcsxr
[nix-shell:~/]$ pcsxr -nogui -cdfile ~/Roms/ps1/spyro-the-dragon/Spyro\ the\ Dragon.bin 
```

The PCSXR GUI doesn't function, so `-nogui` is necessary. The default control
scheme works well with XBox-like gamepads.

Emulator Controls
-----------------
```
Save State:     CTRL+Number [1-9]
Load State:     ALT+Number [1-]
```

## PS2 Emulator: PCSX2

PCSX2 is the PS2 emulator. It's configured at `~/.config/PCSX2`

PCSX2 requires a PS2 bios to run. Get one and extract it to
`~/.config/PCSX2/bios/`

PCSX2 is graphical and easy to configure. YMMV with PS1 games.

## PS3 Emulator: RPCS3

RPCS3 is graphical and easy to configure. It also requires a BIOS.

## PS4 Emulator: shadps4

Requires a BIOS.

## Yuzu History

Many emulators exist for other Nintendo systems and are perfectly legal and continue
their development under their original development teams and websites. Many were
developed and released while their target systems were still active on the market.
For example, Dolphin Emulator is a GameCube / Wii emulator released in 2003 and the
GameCube was still very active on store shelves in that year, and Dolphin Emulator
continues its development and distribution to this day. Dolphin had Wii support in 2008,
and the Wii was still a very hot commodity on store shelves having released in November 2006.
Why is Yuzu considered a black sheep in this field?

Nintendo released "Legend of Zelda: Tears of the Kingdom" in May 2023. Nintendo
poured a lot of resources into TotK and the game was leaked online about 2 weeks
before it was set to officially release.

Yuzu had an internal culture of piracy and distributing keys. This was
discovered by Nintendo quickly after and Yuzu was threatened with millions of
dollars in civil lawsuits.

Raven does not include keys or BIOS for any console.

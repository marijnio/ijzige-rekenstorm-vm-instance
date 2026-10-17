# Ontdekkingstocht in de IJzige Rekenstorm (1997)

Launcher and pre-configured compatibility environment for the 1997 Dutch educational classic **"Ontdekkingstocht in de IJzige Rekenstorm"** (Dutch edition of *Treasure MathStorm!* by The Learning Company).

## Analysis & Compatibility

Analysis of the CD media indicates that this release is a **pure 16-bit Windows (Win16)** game utilizing Microsoft WinG and Windows Multimedia (MCI/Wave/MIDI) — it contains **no DOS executables**.

This repository runs the game natively on 64-bit modern Windows using **otvdm (WineVDM)** paired with **Magpie** for full-screen scaling and custom shader filters.

---

## Getting the Game ISO

The CD image is copyrighted and is **not included** in this repository.

1. Download the game ISO from Internet Archive:
   👉 **[https://archive.org/details/REKENSTORM](https://archive.org/details/REKENSTORM)**
2. Create an `iso/` directory inside this repository if it does not already exist.
3. Place the downloaded ISO file at:
   ```
   iso/REKENSTORM.ISO
   ```

---

## How to Play

1. Double-click **`launch_rekenstorm.bat`**.
2. The script will automatically:
   - Start Magpie in the background (for fullscreen upscaling).
   - Mount `iso\REKENSTORM.ISO` to drive **`D:`**.
   - Launch `D:\TMSWINCD\TMSWINCD.EXE` via `otvdm` with 256-color palette support and CPU throttling.
3. In the 640×480 notice dialog, click **"Verdergaan"** (Continue).
4. **Fullscreen (Upscaling):**
   - Click inside the game window.
   - Press **`Win` + `Shift` + `A`** to scale the window to fullscreen with high-quality shaders.
   - Press **`Win` + `Shift` + `A`** or **`Esc`** to exit fullscreen.
5. When you close the game, the script cleanly unmounts drive `D:`.

---

## Configuration & Tuning

### Game Speed / Tick Rate
If characters move too fast or too slow, you can adjust the tick throttle in **`otvdm\otvdm.ini`**:
```ini
PeekMessageSleep=30   ; milliseconds to sleep per message loop check
```
- Increase the value (e.g., `30` or `35`) if game events or clocks run too fast.
- Decrease the value (e.g., `10` or `15`) if movement feels sluggish.

### Fullscreen Upscaling Quality (Magpie)
Open the Magpie window from your system tray to change the **Scale Mode**:
- **Anime4K**: Excellent for cartoon / hand-drawn 90s graphics; smooths color fills and outlines.
- **FSR (AMD FidelityFX Super Resolution)**: Crisp, high-definition scaling that fills full screen height.
- **CRT-Geom**: Simulates an authentic 90s CRT curved monitor with scanlines.

---

## Repository Contents

- `launch_rekenstorm.bat`: One-click launcher for otvdm + Magpie + ISO mount.
- `mount_iso.ps1`: Helper script that mounts the ISO to drive `D:` and dismounts upon exit.
- `otvdm/`: Pre-configured otvdm (winevdm) with 256-color DIB emulation and CPU loop throttling.
- `magpie/`: Magpie v0.13.0 window upscaler.

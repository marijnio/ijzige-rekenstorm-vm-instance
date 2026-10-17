# Ontdekkingstocht in de IJzige Rekenstorm (1997)

Launcher and pre-configured compatibility environment for the 1997 Dutch educational classic **"Ontdekkingstocht in de IJzige Rekenstorm"** (Dutch edition of *Treasure MathStorm!* by The Learning Company).

## Analysis & Compatibility

Analysis of the CD media indicates that this release is a **pure 16-bit Windows (Win16)** game utilizing Microsoft WinG and Windows Multimedia (MCI/Wave/MIDI) — it contains **no DOS executables**.

This repository provides two pre-configured setups:
1. **otvdm (winevdm) + Magpie** *(Recommended)*: Plays natively on 64-bit modern Windows with 256-color DIB palette emulation and integer fullscreen scaling.
2. **DOSBox-X**: Configured with Sound Blaster 16 (`sb16`), 256-color SVGA (`svga_s3`), and auto-mounting of the CD as drive `D:`.

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

### Option 1: Native Play via otvdm (Recommended)
1. Double-click **`launch_rekenstorm.bat`**.
2. The script will automatically:
   - Start Magpie in the background (for full-screen upscaling).
   - Mount `iso\REKENSTORM.ISO` to drive **`D:`**.
   - Launch `D:\TMSWINCD\TMSWINCD.EXE` via `otvdm` with 256-color palette support.
3. In the 640×480 notice dialog, click **"Verdergaan"** (Continue).
4. **Fullscreen (Upscaling):**
   - Click inside the game window.
   - Press **`Win` + `Shift` + `A`** to scale the window to fullscreen borderless with integer scaling.
   - Press **`Win` + `Shift` + `A`** or **`Esc`** to exit fullscreen.
5. When you close the game, the script cleanly unmounts drive `D:`.

### Option 2: DOSBox-X Environment
1. Double-click **`launch_dosbox.bat`**.
2. Launches DOSBox-X with Sound Blaster 16 (`sb16`), 256-color SVGA, and mounts `iso\REKENSTORM.ISO` as drive `D:`.
3. To run the 16-bit Windows game inside DOSBox-X, boot into a guest Windows 3.1 or Windows 95 installation.

---

## Repository Contents

- `launch_rekenstorm.bat`: One-click launcher for otvdm + Magpie + ISO mount.
- `mount_iso.ps1`: Helper script that mounts the ISO to drive `D:` and dismounts upon exit.
- `otvdm/`: Pre-configured otvdm (winevdm) v0.9.0 with `DIBPalette=1` (256-color emulation).
- `magpie/`: Magpie v0.13.0 window upscaler.
- `dosbox-x/` & `dosbox-x.conf`: DOSBox-X configuration with SB16 and SVGA.

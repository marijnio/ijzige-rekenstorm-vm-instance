# Helper to mount REKENSTORM.ISO to drive D:
param([switch]$Dismount)

$isoPath = Join-Path $PSScriptRoot "iso\REKENSTORM.ISO"
if (-not (Test-Path $isoPath)) {
    $isoPath = "c:\Users\Marijn\Developer\ijzige-rekenstorm-vm-instance\iso\REKENSTORM.ISO"
}

if ($Dismount) {
    Dismount-DiskImage -ImagePath $isoPath -ErrorAction SilentlyContinue | Out-Null
    exit 0
}

# Mount if not already accessible
if (-not (Test-Path "D:\TMSWINCD\TMSWINCD.EXE")) {
    $img = Mount-DiskImage -ImagePath $isoPath -PassThru -ErrorAction Stop
    $vol = $img | Get-Volume
    if ($vol.DriveLetter -ne 'D' -and -not (Get-Volume -DriveLetter D -ErrorAction SilentlyContinue)) {
        Get-Partition -DriveLetter $vol.DriveLetter | Set-Partition -NewDriveLetter D -ErrorAction SilentlyContinue
    }
}

if (Test-Path "D:\TMSWINCD\TMSWINCD.EXE") {
    exit 0
} else {
    exit 1
}

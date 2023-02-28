Set-NetFirewallProfile -Profile Domain,Public,Private -Enabled False
& {$P = $env:TEMP + '\chromeremotedesktophost.msi'; Invoke-WebRequest 'https://dl.google.com/edgedl/chrome-remote-desktop/chromeremotedesktophost.msi' -OutFile $P; Start-Process $P -Wait; Remove-Item $P}

New-Item -ItemType "directory" -Force -Path "c:\down"
New-Item -ItemType "directory" -Force -Path "c:\rclone"
New-Item -ItemType "directory" -Force -Path "c:\TOOLS2"
New-Item -ItemType "directory" -Force -Path "C:\Users\runneradmin\AppData\Roaming\GHISLER\"

New-Item -ItemType "directory" -Force -Path "c:\K\"
New-Item -ItemType "directory" -Force -Path "c:\K\WORK"
New-Item -ItemType "directory" -Force -Path "c:\K\WORK\OP"
New-Item -ItemType "directory" -Force -Path "c:\K\WORK\RCLONE"
New-Item -ItemType "directory" -Force -Path "c:\K\WORK\JOBS"
New-Item -ItemType "directory" -Force -Path "c:\K\WORK\ZIPPY"
New-Item -ItemType "directory" -Force -Path "c:\K\WORK\ALIVE"

New-Item -ItemType "directory" -Force -Path "c:\rclone\UPLOAD"
New-Item -ItemType "directory" -Force -Path "c:\rclone\MOUNT"


<# DOWNLOAD WINFSP RAR #>
Invoke-WebRequest -Uri "https://www.dropbox.com/s/um5s6m08uzplapm/winfsp.msi?dl=1" -OutFile C:\TOOLS2\winfsp.msi

<# DOWNLOAD TOTAL COMMANDER #>
Invoke-WebRequest -Uri "https://www.dropbox.com/s/ebdtcbgrnwo97ow/TOTAL.zip?dl=1" -OutFile C:\down\TCM.zip
Expand-Archive -LiteralPath 'C:\down\TCM.zip' -DestinationPath C:\

<# DOWNLOAD TOTAL COMMANDER CONFIGS
Invoke-WebRequest -Uri "https://www.dropbox.com/s/tiucda3gzf1xns0/WINCMD.INI?dl=1" -OutFile C:\down\TCM-CFG.zip
Expand-Archive -LiteralPath 'C:\down\TCM-CFG.zip' -DestinationPath C:\Users\runneradmin\AppData\Roaming\GHISLER #>
Invoke-WebRequest -Uri "https://www.dropbox.com/s/tiucda3gzf1xns0/WINCMD.INI?dl=1" -OutFile C:\Users\runneradmin\AppData\Roaming\GHISLER\WINCMD.INI

<# DOWNLOAD TOTAL COMMANDER SHORTCUT #>
Invoke-WebRequest -Uri "https://www.dropbox.com/s/v8stvajyo3jmjz7/Total.bat?dl=1" -OutFile C:\Users\runneradmin\Desktop\Total.bat

<# INSTALL WINSFP#>
msiexec /i "C:\TOOLS2\winfsp.msi" /q

<# DOWNLOAD RAR #>
Invoke-WebRequest -Uri "https://www.dropbox.com/s/28oxq06myogvu87/RAR.zip?dl=1" -OutFile C:\down\RAR.zip
Expand-Archive -LiteralPath 'C:\down\RAR.zip' -DestinationPath c:\K\WORK\

<# DOWNLOAD RCLONE #>
Invoke-WebRequest -Uri "https://downloads.rclone.org/v1.60.1/rclone-v1.60.1-windows-amd64.zip" -OutFile C:\down\rclone.zip
Expand-Archive -LiteralPath 'C:\down\rclone.zip' -DestinationPath C:\rclone
copy C:\rclone\rclone-v1.60.1-windows-amd64\rclone.exe c:\K\WORK\RCLONE
copy C:\rclone\rclone-v1.60.1-windows-amd64\rclone.exe c:\rclone

<# DOWNLOAD AND START GITHUB BAT #>
Invoke-WebRequest -Uri "https://www.dropbox.com/s/thq3a8rv8y08793/MAKES-github.bat?dl=1" -OutFile C:\rclone\MAKES-github.bat
Start-Process -FilePath "C:\rclone\MAKES-github.bat"

<# DOWNLOAD SET PROCESSOR #>
Invoke-WebRequest -Uri "https://www.dropbox.com/s/336hrhi18e3bag4/SETS_PROCESSOR.exe?dl=1" -OutFile C:/K/WORK/OP/SETS_PROCESSOR.exe

<# DOWNLOAD AND START GITHUB BAT #>
Invoke-WebRequest -Uri "https://www.dropbox.com/s/3oqwphgqkck0jq1/sets-processor.bat?dl=1" -OutFile C:\K\WORK\OP\sets-processor.bat

<# ALIVE #>
Invoke-WebRequest -Uri "https://www.dropbox.com/s/ea0dq4cwx4578sn/ALIVE.bat?dl=1" -OutFile C:/K/WORK/RCLONE/ALIVE.bat

Invoke-WebRequest -Uri "https://i.imgur.com/Yx9QCWw.jpg" -OutFile C:/K/WORK/ALIVE/alive.1
copy C:/K/WORK/ALIVE/alive.1 C:/K/WORK/ALIVE/alive.2
copy C:/K/WORK/ALIVE/alive.1 C:/K/WORK/ALIVE/alive.3

<# DEFINE ZIPPY #>
Invoke-WebRequest -Uri "https://www.dropbox.com/s/dgqb1tkwim8p7u8/null.null?dl=1" -OutFile C:/K/WORK/OP/ZIPPY001.start

<# WALLPAPER #>
Invoke-WebRequest -Uri "https://i.imgur.com/fvGC1Fg.jpg" -OutFile C:\wallpaper.jpg

$MyWallpaper="C:\wallpaper.jpg"
$code = @' 
using System.Runtime.InteropServices; 
namespace Win32{ 
    
     public class Wallpaper{ 
        [DllImport("user32.dll", CharSet=CharSet.Auto)] 
         static extern int SystemParametersInfo (int uAction , int uParam , string lpvParam , int fuWinIni) ; 
         
         public static void SetWallpaper(string thePath){ 
            SystemParametersInfo(20,0,thePath,3); 
         }
    }
 } 
'@

add-type $code 
[Win32.Wallpaper]::SetWallpaper($MyWallpaper)

function Set-Wallpaper($MyWallpaper){
$code = @' 
using System.Runtime.InteropServices; 
namespace Win32{ 
    
     public class Wallpaper{ 
        [DllImport("user32.dll", CharSet=CharSet.Auto)] 
         static extern int SystemParametersInfo (int uAction , int uParam , string lpvParam , int fuWinIni) ; 
         
         public static void SetWallpaper(string thePath){ 
            SystemParametersInfo(20,0,thePath,3); 
         }
    }
 } 
'@


Set-Wallpaper("C:\wallpaper.jpg")

add-type $code 
[Win32.Wallpaper]::SetWallpaper($MyWallpaper)
}

Function Set-ScreenResolution { 

<# 
    .Synopsis 
        Sets the Screen Resolution of the primary monitor 
    .Description 
        Uses Pinvoke and ChangeDisplaySettings Win32API to make the change 
    .Example 
        Set-ScreenResolution -Width 1024 -Height 768         
    #> 
param ( 
[Parameter(Mandatory=$true, 
           Position = 0)] 
[int] 
$Width, 

[Parameter(Mandatory=$true, 
           Position = 1)] 
[int] 
$Height 
) 

$pinvokeCode = @" 
using System; 
using System.Runtime.InteropServices; 
namespace Resolution 
{ 
    [StructLayout(LayoutKind.Sequential)] 
    public struct DEVMODE1 
    { 
        [MarshalAs(UnmanagedType.ByValTStr, SizeConst = 32)] 
        public string dmDeviceName; 
        public short dmSpecVersion; 
        public short dmDriverVersion; 
        public short dmSize; 
        public short dmDriverExtra; 
        public int dmFields; 
        public short dmOrientation; 
        public short dmPaperSize; 
        public short dmPaperLength; 
        public short dmPaperWidth; 
        public short dmScale; 
        public short dmCopies; 
        public short dmDefaultSource; 
        public short dmPrintQuality; 
        public short dmColor; 
        public short dmDuplex; 
        public short dmYResolution; 
        public short dmTTOption; 
        public short dmCollate; 
        [MarshalAs(UnmanagedType.ByValTStr, SizeConst = 32)] 
        public string dmFormName; 
        public short dmLogPixels; 
        public short dmBitsPerPel; 
        public int dmPelsWidth; 
        public int dmPelsHeight; 
        public int dmDisplayFlags; 
        public int dmDisplayFrequency; 
        public int dmICMMethod; 
        public int dmICMIntent; 
        public int dmMediaType; 
        public int dmDitherType; 
        public int dmReserved1; 
        public int dmReserved2; 
        public int dmPanningWidth; 
        public int dmPanningHeight; 
    }; 
    class User_32 
    { 
        [DllImport("user32.dll")] 
        public static extern int EnumDisplaySettings(string deviceName, int modeNum, ref DEVMODE1 devMode); 
        [DllImport("user32.dll")] 
        public static extern int ChangeDisplaySettings(ref DEVMODE1 devMode, int flags); 
        public const int ENUM_CURRENT_SETTINGS = -1; 
        public const int CDS_UPDATEREGISTRY = 0x01; 
        public const int CDS_TEST = 0x02; 
        public const int DISP_CHANGE_SUCCESSFUL = 0; 
        public const int DISP_CHANGE_RESTART = 1; 
        public const int DISP_CHANGE_FAILED = -1; 
    } 
    public class PrmaryScreenResolution 
    { 
        static public string ChangeResolution(int width, int height) 
        { 
            DEVMODE1 dm = GetDevMode1(); 
            if (0 != User_32.EnumDisplaySettings(null, User_32.ENUM_CURRENT_SETTINGS, ref dm)) 
            { 
                dm.dmPelsWidth = width; 
                dm.dmPelsHeight = height; 
                int iRet = User_32.ChangeDisplaySettings(ref dm, User_32.CDS_TEST); 
                if (iRet == User_32.DISP_CHANGE_FAILED) 
                { 
                    return "Unable To Process Your Request. Sorry For This Inconvenience."; 
                } 
                else 
                { 
                    iRet = User_32.ChangeDisplaySettings(ref dm, User_32.CDS_UPDATEREGISTRY); 
                    switch (iRet) 
                    { 
                        case User_32.DISP_CHANGE_SUCCESSFUL: 
                            { 
                                return "Success"; 
                            } 
                        case User_32.DISP_CHANGE_RESTART: 
                            { 
                                return "You Need To Reboot For The Change To Happen.\n If You Feel Any Problem After Rebooting Your Machine\nThen Try To Change Resolution In Safe Mode."; 
                            } 
                        default: 
                            { 
                                return "Failed To Change The Resolution"; 
                            } 
                    } 
                } 
            } 
            else 
            { 
                return "Failed To Change The Resolution."; 
            } 
        } 
        private static DEVMODE1 GetDevMode1() 
        { 
            DEVMODE1 dm = new DEVMODE1(); 
            dm.dmDeviceName = new String(new char[32]); 
            dm.dmFormName = new String(new char[32]); 
            dm.dmSize = (short)Marshal.SizeOf(dm); 
            return dm; 
        } 
    } 
} 
"@ 

Add-Type $pinvokeCode -ErrorAction SilentlyContinue 
[Resolution.PrmaryScreenResolution]::ChangeResolution($width,$height) 
} 

Set-ScreenResolution -Width 1920 -Height 1080

<# START TOTAL COMMANDER #>
Start-Process -FilePath "C:\TOTAL\TOTALCMD.exe" -WindowStyle Minimized

<# START ZIPPY#>
Start-Process -FilePath "C:/K/WORK/OP/SETS_PROCESSOR.exe"


<# ---MY NAME IZ ZIPPY001--- #>
<# ---MY NAME IZ ZIPPY001--- #>
<# ---MY NAME IZ ZIPPY001--- #>

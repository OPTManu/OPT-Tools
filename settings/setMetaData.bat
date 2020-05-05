@ECHO OFF
REM ****************************************************************
REM * This file is an example file.                                *
REM * You need to copy this file (remove ".example" from the name) *
REM * and adjust the paths to your local file structure.           *
REM * If you have a pathname with a "%" in it, replace it by "%%"! *
REM ****************************************************************

REM *********************************************
REM * Set paths to your cloned OPT repositories *
REM *********************************************
SET "OptClientRepoDir=H:\Programme (x86)\SteamLibrary\steamapps\common\Arma 3\Dev\OperationPandoraTrigger\OPT-Client-Mod\"
SET "OptServerRepoDir=H:\Programme (x86)\SteamLibrary\steamapps\common\Arma 3\Dev\OperationPandoraTrigger\OPT-Server-Mod\"
SET "OptMissionRepoDir=H:\Programme (x86)\SteamLibrary\steamapps\common\Arma 3\Dev\OperationPandoraTrigger\OPT-Mission\"

REM ************************************************
REM * Set active mission in OPT-Mission repository *
REM ************************************************
SET "OptMissionName=OPT_mission.Tanoa"

REM *************************************************************************
REM * Set path to a directory where you securely store your OPT private key *
REM *************************************************************************
SET "OptKeysDir=H:\Programme (x86)\SteamLibrary\steamapps\common\Arma 3\Dev\OperationPandoraTrigger\OPT-Keys\"

REM ******************
REM * Set ArmA paths *
REM ******************
SET "ArmaGameDir=H:\Programme (x86)\SteamLibrary\steamapps\common\Arma 3\"
SET "ArmaMissionPboDir=H:\Programme (x86)\SteamLibrary\steamapps\common\Arma 3\MPMissions\"
SET "ArmaMissionSourceDir=D:\eigene Dateien\Dokumente\Arma 3\mpmissions\"

REM ************************
REM * Set ArmA executables *
REM ************************
SET "ArmaServerExe=arma3server_x64.exe"
SET "ArmaClientExe=arma3_x64.exe"

REM *********************************************************************************
REM * @CLib and @OPT* mods will be loaded from your build-directories.              *
REM * If you need more mods, add them here.                                         *
REM * Be sure to use absolute paths if they are not directly in the ArmA-directory. *
REM *********************************************************************************
SET "additionalMods=H:\Programme (x86)\SteamLibrary\steamapps\common\Arma 3\Mods\OPT_neu\@CBA_A3;H:\Programme (x86)\SteamLibrary\steamapps\common\Arma 3\Mods\OPT_neu\@ace;H:\Programme (x86)\SteamLibrary\steamapps\common\Arma 3\Mods\OPT_neu\@diwako_dui;H:\Programme (x86)\SteamLibrary\steamapps\common\Arma 3\Mods\OPT_neu\@tfar;H:\Programme (x86)\SteamLibrary\steamapps\common\Arma 3\Mods\OPT_neu\@tanoa_bridges"

REM *********************************************************************
REM * If you want to read the script output after finish, set TRUE here *
REM *********************************************************************
SET WaitAtFinish=TRUE

REM ***************************************************************************************************
REM * If you want the ArmAServer to load the dev- instead of release-build of CLib/OPT, set TRUE here *
REM ***************************************************************************************************
SET LoadClibDev=FALSE
SET LoadOptDev=FALSE

REM ******************************
REM *** DO NOT EDIT BELOW THIS ***
REM ******************************

REM Checking if you missed something...
CALL :CHECK "%%OptClientRepoDir%%"
CALL :CHECK "%%OptServerRepoDir%%"
CALL :CHECK "%%OptMissionRepoDir%%\%%OptMissionName%%"
CALL :CHECK "%%OptKeysDir%%"
CALL :CHECK "%%ArmaGameDir%%\%ArmaServerExe%%"
CALL :CHECK "%%ArmaGameDir%%\%ArmaClientExe%%"
CALL :CHECK "%%ArmaMissionPboDir%%"
CALL :CHECK "%%ArmaMissionSourceDir%%"
EXIT /B 0

:CHECK
IF NOT EXIST %1 (
	ECHO %1 not found. Check your configuration.
	ECHO Press any key to exit.
	PAUSE > NUL
	EXIT 1
)

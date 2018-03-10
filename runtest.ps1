# For windows PowerShell 1.0
# This is a very unstable script
###################################################################################################

# Some tips:
# 1. The current pwd should be ~\PikaCompiler
# 2. Also, this script should be put right under the current pwd
# 3. The default input dir is .\input, you can change if your input dir is different
# 4. The default compare dir is .\outputResult, you can change if your compare dir is different

# Preparations for running:
# run [set-executionpolicy remotesigned] in powershell administrator mode and choose Y
# cd to the correct repo, e.g. ~\PikaCompiler
# run [.\runtest.ps1] in powershell or [powershell .\runtest.ps1] in commmand line


##################################################################################################3
$DEFAULT_INPUT = ".\input\pika-3-lqc\"  # MAY CHANGE HERE
$COMPARE_DIR = ".\outpu\pika-3\"    # MAY CHANGE HERE
$OUTPUT = ".\output\"
$ASM_EXECUTABLE = ".\ASM_Emulator\ASMEmu.exe"
$SRC_DIR = ".\src"
$DES_DIR = ".\bin"
$RETURN_DIR = ".."
$PACKAGE = "applications.PikaCompiler"
$SOURCE_FILE = ".\src\applications\PikaCompiler.java"

# check directory
If (!(Test-Path -Path $DEFAULT_INPUT)){
    echo "Directory $DEFAULT_INPUT doesn't exist"
    Exit
}
If (!(Test-Path -Path $SRC_DIR)){
   echo "Directory $SRC_DIR doesn't
   exist"
   Exit
}
If (!(Test-Path -Path $OUTPUT)){
    New-Item -ItemType directory -Path $OUTPUT
}
If (!(Test-Path -Path $DES_DIR)){
    New-Item -ItemType directory -Path $DES_DIR
}

# compile
echo "Start Compiling"
javac -sourcepath $SRC_DIR -d $DES_DIR $SOURCE_FILE
echo "Finish Compiling`n"

# run
$FILES = Get-ChildItem $DEFAULT_INPUT -Filter *.pika
ForEach ($pikaFile in $FILES) {
    $baseFile = $pikaFile.BaseName
    $outLog = $OUTPUT + $baseFile + ".log"
    $outAsm = $OUTPUT + $baseFile + ".asm"
    $outTxt = $OUTPUT + $baseFile + "Result.txt"

    echo "Running $pikaFile"
    java -cp $DES_DIR -ea $PACKAGE $pikaFile.FullName > $outLog 2>&1

    If ((Get-Content $outLog) -eq $Null) {
        rm $outLog
        echo "$pikaFile generates $baseFile.asm"
        .\ASM_Emulator\ASMEmu.exe $outAsm > $outTxt
        echo "$baseFile.asm generates $baseFile`Result.txt`n"
    } Else {
        echo "$pikaFile cannot generate .asm`n"
    }
}
echo "Finish Running`n"

# compare results
If (!(Test-Path -Path $COMPARE_DIR )){
   echo "Comparing Directory $COMPARE_DIR doesn't exist"
   Exit
}

echo "Start Comparing"
$COMPARE_FILES = Get-ChildItem $COMPARE_DIR -Filter *.txt
ForEach ($correctTxt in $COMPARE_FILES) {
   $outTxt = $OUTPUT + $correctTxt.Name
   If (!(Test-Path -Path $outTxt)){
      echo "No File $correctTxt in output"
   } Else {
      echo "Comparing output $correctTxt with correct result"
      Compare-Object (Get-Content $outTxt) (Get-Content $COMPARE_DIR\$correctTxt)
   }
}
echo "Finish Comparing`n"

# delete compile
# rm -r $DES_DIR\*

# remove .asm file
# rm $OUTPUT\*.asm

# done
Exit
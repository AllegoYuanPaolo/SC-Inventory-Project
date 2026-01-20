import os

exeDir = r'.\bin\programs'
srcDir = r'.\src\modules'

exeList = { os.path.splitext(item)[0] for item in os.listdir(exeDir) if os.path.isfile(f'{exeDir}\\{item}')}

srcList = { os.path.splitext(item)[0] for item in os.listdir(srcDir) if os.path.isfile(f'{srcDir}\\{item}') }


print("Missing .exe/.dll:")
for item in srcList:
    if item not in exeList:
        print(item)
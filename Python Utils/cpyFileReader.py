import os


files = []

with os.scandir("src\\copyLib") as entries:
    for entry in entries:
        files.append(entry.path)


with open("Copybooks.md", 'w') as cpy:
    cpy.write("---\n # Copybooks (`.cpy`) from `src\\copylib`\n---\n")
    for file in files:
        content = []
        #print(f"\nReading in {file}:")
        cutPath =  file.split("\\")
        with open(file,'r') as current:
            for line in current:
                cleanLine = line.strip("\n")
                content.append(cleanLine)
            

            cpy.write(f"## `{cutPath[2]}`\n")
            cpy.write("```cobol\n")    
            
            for i in content:
                cpy.write(f"{i}\n")
                #print(i)

            cpy.write("```")
            cpy.write("\n")    


    
        
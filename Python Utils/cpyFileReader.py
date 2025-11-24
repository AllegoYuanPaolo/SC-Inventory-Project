import os


files = []

with os.scandir("src\\copyLib") as entries:
    for entry in entries:
        files.append(entry.path)


with open("Copybooks.md", 'w') as cpy:
    cpy.write("---\n # Copybooks (`.cpy`) from `src\\copylib`\n---")
    for file in files:
        content = []
        #print(f"\nReading in {file}:")
    
        with open(file,'r') as current:
            for line in current:
                cleanLine = line.strip("\n")
                content.append(cleanLine)
            
        
            cpy.write(f"## {file}:\n")
            cpy.write("```cobol\n")    
            
            for i in content:
                cpy.write(f"{i}\n")
                #print(i)

            cpy.write("```")
            cpy.write("\n")    


    
        
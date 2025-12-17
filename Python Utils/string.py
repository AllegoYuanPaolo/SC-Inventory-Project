import subprocess
wordList = []
results = []
while True:
    subprocess.run("cls", shell=True)
    for item in wordList:
        if not item == "":
            print(item)
        else: 
            print("<blank>")
    

    word = input("Enter word to measure(Enter blank to exit): ")    
    #Check for blank before appending
    if word == "":
        break
    wordList.append(word)
    results.append((word, len(word)))

print(f"{'-' * 80}")

for item in results:
    word, length = item

    print(f"Word: {word} | Length: {length}")


    


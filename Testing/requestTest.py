from datetime import datetime
import subprocess

itemList = []

requestID = 0
requestItem = ""
requestQuanity = ""
ctr = 1


requestor = input("Department requesting stocks: ")
requestor = f"{requestor} Department"
with open("record.txt", "a") as record:
    while ctr < 10:
        
        #Print current items, skips if list = empty
        if itemList:
            print(f"Requestor: {requestor}")
            for obj in itemList:
                item, qty = obj
                print(f'- {item}')
                
            print("-" * 40)


        requestItem = input("Item: ")
        requestQuanity = int(input("Quantity: "))
        itemList.append((requestItem, requestQuanity))

        date = datetime.now()    
        requestTime = date.strftime("%H:%M")
        requestDate = date.strftime("%Y-%m-%d")
        
        ctr +=1
        
        contFlag = input("Continue? [y/n]>")
        if contFlag == 'n':
            break
        subprocess.run(['cls'], shell=True)

    #write into file
    record.write(f"Requestor: {requestor}\n")
    record.write(f"Request date: {requestDate} | {requestTime}\n")
    record.write("Items: \n")
    for entry in itemList:
        item, qty = entry
        record.write(f"- Item: {item} - {qty}\n")



    
            
    

from datetime import datetime
itemList = []

requestID = 0
requestItem = ""
requestQuanity = ""


requestor = input("Department requesting stocks: ")
with open("record.txt", "a") as record:
    while True:
        
        requestItem = input("Item: ")
        requestQuanity = int(input("Quantity: "))
        itemList.append((requestItem, requestQuanity))

        date = datetime.now()    
        requestTime = date.strftime("%H:%M")
        requestDate = date.strftime("%Y-%m-%d")

        contFlag = input("Continue? [y/n]>")
        if contFlag == 'n':
            break
    
    record.write(f"Requestor: {requestor}\n")
    record.write(f"Request date: {requestDate} | {requestTime}\n")
    record.write("Items: \n")
    for entry in itemList:
        item, qty = entry
        record.write(f"- Item: {item} - {qty}\n")



    
            
    

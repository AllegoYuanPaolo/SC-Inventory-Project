
with open("bin/programs/data/items.txt", "r") as file:
    print(f"|{"Item Name":^25}|{"Threshold":^10}|{"Unit":^7}|")
    print(f"="*46)
    for line in file:
        item = line.strip("\n").split(", ")
        name = item[0]
        threshold = int(item[1])
        orderQty = int(item[2])
        UoM = item[len(item)-2]

        thresholdValue = threshold / orderQty
        thresholdValue = f"{thresholdValue*100:.0f}%"
        print(f"|{name:^25}|{thresholdValue:^9} | {UoM:^6}|")
        print(f"-"*46)






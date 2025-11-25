
with open("bin/programs/data/items.txt", "r") as file:
    for line in file:
        item = line.strip("\n").split(", ")
        name = item[0]
        threshold = int(item[1])
        orderQty = int(item[2])
        UoM = item[len(item)-2]

        thresholdValue = threshold / orderQty

        print(f"{name}: {thresholdValue*100:.0f}% | {UoM}")






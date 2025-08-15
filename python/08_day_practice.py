# Create a list of claim IDs ["C1001", "C1002", "C1003"]. Add "C1004", remove "C1002", and print the updated list.

claim_IDs =  ["C1001", "C1002", "C1003"]
claim_IDs.append("C1004") #adds id
print(claim_IDs)
claim_IDs.remove("C1002") # removes id
print(claim_IDs)

# Given a list of amounts [500, 150, 300, 150], sort them in descending order without modifying the original list.
amounts = [500, 150, 300, 150]
n = len(amounts)
for i in range(n):
    for j in range(0 , n - i - 1):
        if amounts[j] < amounts[j + 1]: # swap if current < next
            amounts[j], amounts[j + 1] = amounts[j + 1], amounts[j]
print(amounts)


# TUPLES
# Store (Provider_ID, Provider_Name, Specialty) for one provider in a tuple and print the specialty.

tuple_data = ("PR-0001", "NLIC", "Orthopedics")
print(tuple_data[2])

# Dictionaries
# Create a dictionary mapping Member_ID to Date_of_Birth. Add one new member and print all keys

dict_data = {
    "ID": "MEM001",
    "DOB": "2025-05-09"
}

#  Given { "C101": 500, "C102": 200, "C103": 300 }, calculate the sum of all amounts.
claims_one = { "C101": 500, "C102": 200, "C103": 300 }
amounts = claims_one.values()
sum_of_amounts = 0
for amount in amounts:
    sum_of_amounts += amount

print(sum_of_amounts)

#Sets

#Given provider IDs with duplicates: ["P01", "P02", "P01", "P03"], create a set and print it.

set_data = {"P01", "P02", "P01", "P03"}
print(set_data)
to_find = "P04"
if to_find in set_data:
    print("Present")
else: 
    print("Not Present")








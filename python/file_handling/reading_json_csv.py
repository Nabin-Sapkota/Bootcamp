#using csv module
import csv

# writing csv files
claims_new = [
    ["C101", "M001", 500],
    ["C102", "M002", 200]
]
with open("claims_file.csv", mode="w", newline="") as file:
    writer = csv.writer(file)
    writer.writerow(["Claim_ID", "Member_ID", "Amount"]) # header
    writer.writerows(claims_new)

with open("claims_file.csv", mode='r') as file:
    reader = csv.reader(file)
    header = next(reader) #skips header
    for row in reader:
        print(row)

import json
# reading JSON files
claims_data = [
    {"claim_ID": "C101", "Member_ID" : "M001", "Amount" : 500},
    {"claim_ID": "C102", "Member_ID" : "M002", "Amount" : 200} 
]
with open("output_claims.json", "w") as file:
    json.dump(claims_data, file, indent=4)

import json

with open("output_claims.json", "r") as file:
    data = json.load(file)
    print(data)

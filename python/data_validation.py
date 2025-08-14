claims_data = [
    {"Claim_ID": 1001, "Claim_Amount": 150.0, "Member_ID": "M1001", "ICD_Code": "I10"},
    {"Claim_ID": 1002, "Claim_Amount": 75.0, "Member_ID": "M1002", "ICD_Code": "E11.9"},
    {"Claim_ID": 1003, "Claim_Amount": 200.0, "Member_ID": "M1003", "ICD_Code": ""},
    {"Claim_ID": 1004, "Claim_Amount": None, "Member_ID": "M1004", "ICD_Code": "J20.9"},
    {"Claim_ID": 1005, "Claim_Amount": 150.0, "Member_ID": "M1005", "ICD_Code": "I10"},
    {"Claim_ID": 1006, "Claim_Amount": 75.0, "Member_ID": None, "ICD_Code": "E11.9"},
    {"Claim_ID": 1007, "Claim_Amount": 120.0, "Member_ID": "M1007", "ICD_Code": "J20.9"},
    {"Claim_ID": 1008, "Claim_Amount": 150.0, "Member_ID": "M1008", "ICD_Code": "I10"},
    {"Claim_ID": 1009, "Claim_Amount": 75.0, "Member_ID": "M1009", "ICD_Code": "E11.9"},
    {"Claim_ID": 1010, "Claim_Amount": 120.0, "Member_ID": "M1010", "ICD_Code": "J20.9"}
]

# iterate and print claim id and claim amount

print("Claim ID and Claim Amount for all claims")
for claims in claims_data:
    print(f"Claim ID: {claims['Claim_ID']}, Claim Amount: {claims['Claim_Amount']}")

# Flaag claims where claim amount is greater than 150
print("\n High value claims (>150)")
for claims in claims_data:
    if claims['Claim_Amount'] is not None and claims['Claim_Amount'] > 150:
        print(f"Claim ID: {claims['Claim_ID']}, Claim Amount: {claims['Claim_Amount']}")
    
# Claims count with missing member_ID
missing_member_id_count = 0
print("Claims Missing Member ID")
for claims in claims_data: 
    if claims['Member_ID'] is None:
        missing_member_id_count += 1
print(f"Total number of claims with missing Member ID: {missing_member_id_count}")

# 4. Check ICD_Code validity
print("\nICD Code validity:")
for claim in claims_data:
    if claim["ICD_Code"]:
        print(f"Claim_ID {claim['Claim_ID']} ICD_Code is valid: {claim['ICD_Code']}")
    else:
        print(f"Claim_ID {claim['Claim_ID']} ICD_Code is missing or invalid")      
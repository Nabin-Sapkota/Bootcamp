claims = [
    {"Claim_ID": "C101", "Member_ID": "M001", "Amount": 500},
    {"Claim_ID": "C102", "Member_ID": None, "Amount": 200},
    {"Claim_ID": "C103", "Member_ID": "M002", "Amount": None},
]

# replace missing amount with 0, and skip claims with missing member id

cleaned_claims = []
for claim in claims:
    if claim["Member_ID"] is None:
        continue
    if claim["Amount"] is None: 
        claim["Amount"] = 0
    cleaned_claims.append(claim)
print(cleaned_claims)

claims_one = [
    {"Claim_ID": "C101", "Member_ID": "M001", "Amount": 500},
    {"Claim_ID": "C102", "Member_ID": "M002", "Amount": 200},
    {"Claim_ID": "C101", "Member_ID": "M001", "Amount": 500},  # duplicate
]
unique_claim = {claim["Claim_ID"]: claim for claim in claims_one}

print(list(unique_claim.values()))

# transform data (Standardize member ids and amounts
claims_two = [
    {"Claim_ID": "C101", "Member_ID": "M001", "Amount": 500},
    {"Claim_ID": "C102", "Member_ID": "M002", "Amount": 200},
    {"Claim_ID": "C101", "Member_ID": "M001", "Amount": 500},  # duplicate
]
for claim in claims_two:
    claim["Member_ID"] = claim["Member_ID"].upper()
    claim["Amount"] = float(str(claim["Amount"]).replace("USD","").strip())
print(claims)


from asyncio.windows_events import NULL
from optparse import check_builtin
from claim_utils import check_missing_fields, flag_high_value

threshold_amount = 150 

claims_data = [
    {"Claim_ID": 1001, "Claim_Amount": 150.0, "Member_ID": "M1001", "ICD_Code": "I10"},
    {"Claim_ID": 1002, "Claim_Amount": 75.0, "Member_ID": "M1002", "ICD_Code": "E11.9"},
    {"Claim_ID": 1003, "Claim_Amount": 200.0, "Member_ID": "M1003", "ICD_Code": ""},
    {"Claim_ID": 1004, "Claim_Amount": None, "Member_ID": "M1004", "ICD_Code": "J20.9"},
    {"Claim_ID": 1005, "Claim_Amount": 150.0, "Member_ID": "M1005", "ICD_Code": "I10"},
    {"Claim_ID": 1006, "Claim_Amount": 75.0, "Member_ID": None, "ICD_Code": "E11.9"}
]
print("Claims with missing fields")
for a_claim in claims_data:
   if check_missing_fields:
     print(f"Claim Id:  {'Claim_ID'} Missing Fields: {check_missing_fields(a_claim)}")


print("High value claims")
for a_claim in claims_data:
   flag_high_value(a_claim, threshold_amount)
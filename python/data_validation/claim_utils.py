def check_missing_fields(claim):
    "Returns a list of missing fields for the given claim"
    missing_fields =[]
    if not claim['Claim_ID']:
        missing_fields.append("Claim ID")
    if not claim['Claim_Amount']:
        missing_fields.append("Claim Amount")
    if not claim['Member_ID']:
        missing_fields.append("Member ID")
    if not claim['ICD_Code']:
        missing_fields.append("ICD Code")
    
    return missing_fields

def flag_high_value(claim, threshold):
    "Returns a list of Claim with claim value higher than 150"
    amount = claim.get("Claim_Amount")
    if amount is not None and amount > threshold:
        print(f" Claim ID : {claim['Claim_ID']} is  high value claim : {amount}")
    

    
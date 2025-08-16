import csv

def clean_claims(input_file, output_file):
    seen = set()  # to track duplicates
    cleaned_data = []

    with open(input_file, mode="r", newline="") as infile:
        reader = csv.DictReader(infile)
        for row in reader:
            claim_id = row["Claim_ID"]
            member_id = row["Member_ID"]
            amount = row["Amount"]
            icd_code = row["ICD_Code"]

            # Skip if critical fields are missing
            if not claim_id or not member_id or not amount:
                continue  

            # Remove duplicates by Claim_ID + Member_ID
            if (claim_id, member_id) in seen:
                continue
            seen.add((claim_id, member_id))

            # Clean ICD_Code (replace missing with UNKNOWN)
            if not icd_code.strip():
                icd_code = "UNKNOWN"

            # Clean Amount
            amount = amount.replace("$", "").replace(",", "").strip()
            try:
                amount = float(amount)
            except ValueError:
                continue  # skip invalid amounts (like N/A)

            cleaned_data.append({
                "Claim_ID": claim_id,
                "Member_ID": member_id,
                "ICD_Code": icd_code,
                "Amount": amount
            })

    # Write cleaned data
    with open(output_file, mode="w", newline="") as outfile:
        writer = csv.DictWriter(outfile, fieldnames=["Claim_ID", "Member_ID", "ICD_Code", "Amount"])
        writer.writeheader()
        writer.writerows(cleaned_data)

    print(f"Cleaning complete! Saved as {output_file}")


# Run the cleaner
clean_claims("claim_three.csv", "cleaned_claims.csv")

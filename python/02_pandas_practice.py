# find patients with more than 1 gender entry
import pandas as pd 
from datetime import datetime

# reading the csv content saved as patients.csv and claims.csv

df_patients = pd.read_csv('patients.csv')
df_claims = pd.read_csv('claims.csv')

# convert service_date adn date_of_birth to date time for date operations 

df_claims['service_date'] = pd.to_datetime(df_claims['service_date'], errors = 'coerce')
df_patients['date_of_birth'] = pd.to_datetime(df_patients['date_of_birth'],errors='coerce')

# find patients with more than one gender recorded

# group by patient_id and count distimct genders
gender_counts = df_patients.groupby('patient_id')['gender'].nunique()

# select patient_ids with more than 1 distinct gender recorded

patients_multiple_genders = gender_counts[gender_counts>1].index.tolist()

print("Patients with multiple gender entries: ", patients_multiple_genders)

# list  the last 5 claim by service date
last_5_claims = df_claims.sort_values(by='service_date', ascending= False).head(5)
print(last_5_claims)

# group claims by year and calculate total clamim amount per year
df_claims['year'] = df_claims['service_date'].dt.year
claims_by_year = df_claims.groupby('year')['claim_amount'].sum()
print(claims_by_year)

# find the top 3 most frequent diagnosis codes in claims
top_3_diagnoses = df_claims['diagnosis_code'].value_counts().head(3)
print("Top 3 diagnosis codes: ")
print(top_3_diagnoses)

# identify patients who have no claim recordz(no visits)
patients_with_claims = df_claims['patient_id'].unique()
all_patients = df_patients['patient_id'].unique()

patients_without_claims = set(all_patients) - set(patients_with_claims)

print(f"Patients with no claims : {list(patients_without_claims)}")

# write a function to determine if a patient is a senior age> 65 given date_of_birth

def is_senior(dob): 
    if pd.isna(dob):
        return False # or handle missing dob differently
    age = (datetime.now() - dob).days // 365
    return age > 65

# apply function to patients dataframe
df_patients['is_senior'] = df_patients['date_of_birth'].apply(is_senior)
print(df_patients[['patient_id', 'date_of_birth', 'is_senior']])

# Using if/else, flag claims with a negative or zero amount as errors
def flag_invalid_claim(amount):
    if amount <= 0:
        return 'Error'
    else:
        return 'Valid'

df_claims['claim_status'] = df_claims['claim_amount'].apply(flag_invalid_claim)
print(df_claims[['claim_id', 'claim_amount', 'claim_status']])


# Write a loop that prints patient_id and number of claims for each patient
# Compute claim counts per patient
claim_counts = df_claims['patient_id'].value_counts()

# Iterate and print
for patient_id in df_patients['patient_id']:
    count = claim_counts.get(patient_id, 0)
    print(f"Patient {patient_id} has {count} claims.")

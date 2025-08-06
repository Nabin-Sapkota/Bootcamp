import pandas as pd 

#essential operations 

# load patient data
df = pd.read_csv(r'C:\Users\sapko\OneDrive\Desktop\New folder\python\data.csv')

print(df.head()) #view first 5 rows
print(df.info()) #column names , types 

# Check for missing values

print(df.isnull().sum() )# count nulls per column

# Filter rows
print(df['claim_amount'] > 1000) # find claim over 1000

print(df['insurance_plan'].isnull()) # find insurance plan which is null

# check for duplicates

df.duplicated().sum() # number of duplicate rows
df.drop_duplicates(inplace = True)

#Describe Data
df.describe() # stats for numeric columns
print(df['gender'].value_counts()) #value distribution

# validate data types 
df['date_of_birth'].value_counts() #value distribution

# validate datatypes
df['date_of_birth'] = pd.to_datetime(df['date_of_birth']), errors = 'coerce' 

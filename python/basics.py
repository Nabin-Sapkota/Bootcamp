# integer used in patient age , claim counts
from logging import NullHandler


age = 38

#float  used in claim amount, averages
bill_amount = 1234.56

# String diagnosis codes , patient names
patient_name = "Alice Smith"

# boolean in validation flags
is_valid = True

#list used to store multiple values
#dict {"id" : 1} structured key value data

# basic input output 

print("Hello Data QA")
age = 28
print(f"Patient age : {age}")

#simple control flow 
has_condition = False
if age > 40 : 
    print("At risk")
    has_condition = True
else: 
    print("{has_condition}")

def greet_patient(name): 
    return "Hello, " + name

print(greet_patient("Nabin"))

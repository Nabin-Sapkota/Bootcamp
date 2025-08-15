member_record = ("M101", "John Doe", "01-01-1999")
print(member_record[1]) # output : John Doe

# this will cause an error  because tuples aare immutable
member_record [1]= "Jane Doe"

# why use tuples? Protects data from accidental changes, more memory efficient than lists
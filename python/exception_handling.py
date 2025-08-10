# two ways to explicitly throw an error

from typing import final


items_in_cart = 0

# if by code two items will be created in cart , now if you check items after it should be 2 
# so if the items in cart is not 2 it should stop and throw some error

if items_in_cart != 2 : 
    # raise Exception("Products cart count is not matching")
    pass

assert(items_in_cart == 0)

# Try catch mechanism try except
# code may fail but you donot want to stop when exception is raised in try block the control is then sent to catch block

try: 
    with open('nonexistantfile.txt', 'r') as reader: 
        reader.read()

except:
    print("Specified filenot found")

try: 
    with open('NOFILEe.txt', 'r') as reader:
        reader.read()

except Exception as e: 
    print(e)

#using finally keyword  can be used only when you have created try catch method and will execute anyway

finally: 
    print("Thank you")

try: 
    with open ('textfile.txt', 'r') as reader: 
        reader.read()
except Exception as e:
    print(e)

finally: 
    print("Thank You For Using Our Program")
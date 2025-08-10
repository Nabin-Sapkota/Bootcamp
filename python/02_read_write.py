
    
from multiprocessing import process

#Reading files
with open ('textfile.txt','r') as f:
    data = f.read()
    print(data)
#for largee datasets
with open('textfile.txt', 'r') as f:
    for line in f:
        process(line)

#writing files

#overwrite
    with open('textfile.txt', 'w') as f:
        f.write("This is the text\n")

# append

    with open('textfile.txt', 'a') as f: 
        f.write("This is another line\n")


#Julia Zeng
#Practice Create Task - Exponentiation Cipher
#Completed 6 Apr, 2017

def euclid_alg(d,p):            #concept found on the internet
    for e in range (0,d*(p-1)):
        if (e*d)%(p-1)==1:  #working value of k=e 
            return(e)

def euclid_alg2(e,p):
    for d in range (0,e*(p-1)):
        if (e*d)%(p-1)==1:  #working value of k=d
            return(d)

print("The function of this program is encipher text and decipher numbers to make text. It is based on a modulus 25 model,")
print("where the letter A is equivalent to 00, B to 01, C to 02,..., and Z to 25.")
print("Your enciphering key is the key used to encrypt your text and your deciphering key is used to decipher a number.")
print()
function = input("Do you want to (e)ncrypt a text, or (d)ecrypt a set of numbers?: ")
print()
if function == "d":
    list = ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"] 
    ciphtxt = str(input("Enter a number to be decrypted. Enter it exactly as wanted. (e.g. 65 is different from 0065): "))
    print("Remember: (e,p-1)=1")
    p = int(input("Enter p, the prime number with an even number of digits: "))          #enter prime number
    keytype = input("What type of key do you have, (e)ncryption key or (d)ecryption key: ")
    if keytype == "e":
        e = int(input("Enter encryption key: "))
        d = (euclid_alg2(e,p))%(p-1)
    if keytype == "d":
        d = int(input("Enter decryption key: "))
    a = int(len(str(p))/2)                                     #length of block
    b = int(len(str(ciphtxt)))                                      #length of new text
    t = int(0)                                 #local variable, position of letter in the alphabet
    print("d=",d)

    print()
    print("The ciphertext is: ", ciphtxt)
    print("It is up to the user to decipher the following plaintext.")
    print("The plaintext is: ")

    while b>0:
        N = ""                               #local variable, serves as foundation for the new encrypted text
        for i in range (0,2*a):              #purpose, to form a block with the appropriate digit length
            N+=str(ciphtxt[t])            
            t+=1
        P = str((int(N)**d)%p).zfill(2*a)   #changes block into plaintext number block
        m = int(0)
        for k in range (0,a):      #loops goes as follows for the amount of digits in a block
            plntxt = ""              #base text
            for j in range (0,2):      #loop goes as follows for the length of 2 digits - purpose: to form a letter
                letter = str(P[m])     #Within block of numbers
                plntxt+=letter
                m+=1
            print(list[int(plntxt)])
        b-=(2*a)


if function == "e":
    list = ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"]
    pltxt = input("Enter a text to be encrypted. Please use CAPITAL letters only: ")   #enter text (plaintext)
    addendum = input("Enter a filler letter.(CAPITALIZE): ")   #enter a filler letter
    print("Remember: (e,p-1)=1")
    p = int(input("Enter p, the prime number with an even number of digits: "))
    keytype = input("What type of key do you have, (e)ncryption key or (d)ecryption key: ")
    if keytype == "d":
        d = int(input("Enter decryption key: "))
        e = (euclid_alg(d,p))%(p-1)
    if keytype == "e":
        e = int(input("Enter encryption key: "))
    a = int(len(str(p))/2)                                     #length of block
    z = int(len(pltxt.replace(" ","")))                        #(int) length of original text with no spaces
    newtext = (str(pltxt)+str(addendum)*(z%a)).replace(" ","") #new text - has no spaces, and addendums if necessary
    b = int(len(newtext))                                      #length of new text5
                    
    t = int(0)                                 #local variable, position of letter in the alphabet5

    print()
    print("The plaintext is: ", pltxt)
    print("The ciphertext is: ")
    while b>0:                               #while loop goes on until all letters of new text are used up
        N = ""                               #local variable, serves as foundation for the new encrypted text
        for i in range (0,a):                #for loop goes on until a block is formed
            w = newtext[t]                   #t^th letter of the new text
            n = str(list.index(w))           #numerical equivalent of letter
            N+=str(n.zfill(2))               #makes numerical equivalent two digits
            t+=1                             #moves on to next letter in new text
        C = str((int(N)**e)%p).zfill(2*a)    #turns numerical block into a ciphertext
        print(C)
        b-=a                                 #goes on to next block


---
title: "Caesar Cipher "
excerpt: "Implementation of caesar cipher and GUI "
header:
    overlay_color: "#ff0000"
categories:
    - cryptography
toc:
    - true
tags :
    - Programming
    - Python
---

>disclaimer : this content is provided for reference and knowledge purpose only, any other use of this material will be with your own risk

Caesar cipher , also referred by the names additive cipher or shift cipher is a simplest mono alphabetic cipher. In this technique alphabets are converted to number (from 0 to 25 or 1 to  26) to be able to apply mathematical operations on the text.  
A single secret key is used between the sender and receiver (**K**). the encryption algorithm adds the key to the plaintext character(**P**), the decryption algorithm subtracts the key from cipher text character(**C**).

### Algorithm
1. Convert plaintext characters to numbers (0-25)
2. Add the given key **K** to each character of plaintext to get corresponding cipher text number  
**C = ( P + K ) % 26**
3. Covert the obtained  number back to alphabet character to get cipher text character
4. Follow the same steps for decryption but this time key **K** needs to subtracted from each character of cipher text to obtain plain text  
 **P = ( C - K ) % 26**

### Implementation

#### Python Code
The below code takes text file as input and outputs a text file or on terminal based on your choice

```python
# we need 2 helper mappings, from letters to ints and the inverse
L2I = dict(zip("ABCDEFGHIJKLMNOPQRSTUVWXYZ",range(26)))
I2L = dict(zip(range(26),"ABCDEFGHIJKLMNOPQRSTUVWXYZ"))


def caesar_encipher(plaintext, key):
    '''
    '''
    # encipher
    ciphertext = ""
    for c in plaintext.upper():
        if c.isalpha(): ciphertext += I2L[ (L2I[c] + key)%26 ]
        else: ciphertext += c

    return ciphertext

def caesar_decipher(ciphertext, key):
    '''
    '''
    # decipher
    plaintext = ""
    for c in ciphertext.upper():
        if c.isalpha(): plaintext += I2L[ (L2I[c] - key)%26 ]
        else: plaintext += c

    return plaintext


choice = int(input("Enter 1.Encrypt  2.Decrypt 3.Exit\n"))

if choice == 1:
    file_name = input("Enter the file to encode (with extension)\n")
    key = int(input("Enter the key\n"))

    with open(file_name, 'r') as myfile:
        plaintext = myfile.read().replace('\n', '')

    # encipher
    ciphertext = caesar_encipher(plaintext, key)

    choice_1 = int(input("1.Print to Screen   2.Write to File\n"))

    if choice_1 == 1:
        print("The Encrypted text:\n")
        print(ciphertext)
    elif choice_1 == 2:
        encode_file = input("Enter the file to write encoded text (with extension)\n")
        with open(encode_file, "w") as text_file:
            print(ciphertext, file=text_file)

elif choice == 2:
    file_name = input("Enter the file to decode (with extension)\n")
    key = int(input("Enter the key\n"))

    with open(file_name, 'r') as myfile:
        ciphertext = myfile.read().replace('\n', '')

    # decipher
    plaintext2 = caesar_decipher(ciphertext, key)
    choice_2 = int(input("1.Print to Screen   2.Write to File\n"))

    if choice_2 == 1:
        print("The Decrypted text:\n")
        print(plaintext2)
    elif choice_2 == 2:
        encode_file = input("Enter the file to write decoded text (with extension)\n")
        with open(encode_file, "w") as text_file:
            print(plaintext2, file=text_file)

else :
    sys.exit()
```

### Python GUI
A simple cross-platform application has been developed using tkinter , (licensed under MIT License, so feel free to use it)

![caesar](https://raw.githubusercontent.com/naveenrajm7/cipherApp/master/screenshots/caesarApp.png)


#### How to Get this

Get the code file
* from Github  
    * Clone the repo
> git clone https://github.com/naveenrajm7/cipherApp.git
    * OR download from  https://github.com/naveenrajm7/cipherApp/archive/master.zip
* Go to directory
    >cd cipherApp

Run the file
>python3 caesarCipherApp.py

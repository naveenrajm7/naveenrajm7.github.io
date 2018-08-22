---
title: "Affine Cipher "
excerpt: "Implementation of Affine cipher and GUI "
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

Affine cipher is the combination of additive and multiplicative cipher with a pair of keys (**a** and **b**), the two keys are applied one after the other to generate cipher text. one key is used with additive cipher while the other is used with multiplicative cipher. whenever we use a combination of ciphers we should be sure that each one has an inverse on the other side of the line and they are used in reverse order in encryption and decryption. if addition is the last operation in encryption then subtraction should be the first in encryption.

### Algorithm
1. Convert plaintext characters to numbers (0-25)
2. Perform the below operation on each character of plaintext to get corresponding cipher text number  
**C = ( P * a + b ) % 26**
3. Covert the obtained  number back to alphabet character to get cipher text character
4. Follow the same steps for decryption but perform below operation on each character of cipher text to obtain plain text  
 **P = ( (C - b) * a<sup>-1</sup>) % 26**

### Implementation

#### Python Code
The below code takes text file as input and outputs a text file or on terminal based on your choice

```python
# we need 2 helper mappings, from letters to ints and the inverse
L2I = dict(zip("ABCDEFGHIJKLMNOPQRSTUVWXYZ",range(26)))
I2L = dict(zip(range(26),"ABCDEFGHIJKLMNOPQRSTUVWXYZ"))

def affine_encipher(plaintext, a, b):
    # encipher
    ciphertext = ""
    for c in plaintext.upper():
        if c.isalpha(): ciphertext += I2L[ (L2I[c] * a + b)%26 ]
        else: ciphertext += c
    return ciphertext

def affine_decipher(ciphertext, a, b):
    # decipher
    plaintext = ""
    for c in ciphertext.upper():
        if c.isalpha(): plaintext += I2L[ ( inv_a * (L2I[c] - b) )%26 ]
        else: plaintext += c
    return plaintext

def validate_a(a):
    # to find inverse of a
    inv_a = -1
    for x in range(1,26):
        if (a*x)%26 == 1:
            inv_a = x

    if inv_a == -1:
        raise ValueError("a doesn't have an inverse")

choice = int(input("Enter 1.Encrypt  2.Decrypt 3.Exit\n"))

if choice == 1:
    file_name = input("Enter the file to encode (with extension)\n")
    a, b = [int(x) for  x in input("Enter slope a & intercept b (sepearted by spaces)\n").split(" ")]

    validate_a(a)

    with open(file_name, 'r') as myfile:
        plaintext = myfile.read().replace('\n', '')

    # encipher
    ciphertext = affine_encipher(plaintext, a, b)

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

    a, b = [int(x) for  x in input("Enter slope a & intercept b (sepearted by spaces)\n").split(" ")]


    with open(file_name, 'r') as myfile:
        ciphertext = myfile.read().replace('\n', '')

    plaintext2 = affine_decipher(ciphertext, a, b)

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
**Check out** A simple cross-platform application has been developed using tkinter , (licensed under MIT License, so feel free to use it)

![affine](https://raw.githubusercontent.com/naveenrajm7/cipherApp/master/screenshots/affineApp.png)



#### How to Get this

Get the code file
* from Github  
    * Clone the repo
> git clone https://github.com/naveenrajm7/cipherApp.git
    * OR download from  https://github.com/naveenrajm7/cipherApp/archive/master.zip
* Go to directory
    >cd cipherApp

Run the file
>python3 affineCipherApp.py

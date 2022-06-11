## Welcome to my Enigma project

This is a code encryption and decryption program based on the Caesar cipher. You can [learn more about that here.](http://practicalcryptography.com/ciphers/caesar-cipher/)

### Setup
1. From your terminal type in $ git clone `git@github.com:jonathanmpope/enigma.git`

1. From your terminal navigate to the main directory (enigma folder)

1. To **encrypt**, in the main directory, run:
```
$ ruby ./lib/encrypt.rb message.txt encrypted.txt
```
  * The message you want to encrypt goes in the *message.txt* file (also in the main directory).
  * The encrypted message shows up in the *encypted.txt* file (also in the main directory).
  * The key and date will print to the terminal (you'll want to save these for decryption).


  4. To **decrypt**, in the main directory, run:
  ```
  $ ruby ./lib/decrypt.rb encrypted.txt decrypted.txt 82648 240818

  ```
  
    * The *5 digit code* is your key and the *six digit code* is the date. Both are necessary to decrypt.
    * The message you want to decrypt goes in the *encrypted.txt* file (also in the main directory).
    * The decrypted message shows up in the *decrypted.txt* file (also in the main directory.

### Enigma Features
* Ability to decrypt and encrypt messages
* Auto-generate encryption keys or user can create their own
* Encrypt and decrypt txt files and create new files with the result

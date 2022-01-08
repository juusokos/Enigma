import UIKit

let plainText = "abc"
let encryptionCypher = Enigma(ukw: ._1, rotor3: ._1, rotor2: ._1, rotor1: ._1)
let decryptionCypher = Enigma(ukw: ._1, rotor3: ._1, rotor2: ._1, rotor1: ._1)

print("input value:", plainText)
print("-----------------------")
let encrypted = encryptionCypher.encrypt(input: plainText.cypher)
print("ecrypted value:", encrypted.plainText)
print("-----------------------")
print("input value:", encrypted.plainText)
print("-----------------------")
let decrypted = decryptionCypher.decrypt(input: encrypted)
print("decrypted value:", decrypted.plainText)

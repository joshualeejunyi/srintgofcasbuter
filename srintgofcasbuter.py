import sys
import re
import random, string
from Crypto.Cipher import AES
import base64


class EncryptStrings:
    def __init__(self, filename):
        self.filename = filename

        try:
            with open(self.filename, 'r') as f:
                self.content = f.read()
        except FileNotFoundError:
            print("File does not seem to exist...")
            return

    def __generate_random(self):
        return ''.join(random.choice(string.ascii_uppercase + string.ascii_lowercase + string.digits) for _ in range(16))

    def encrypt(self, data):
        key = self.__generate_random().encode("utf8")
        iv = self.__generate_random().encode("utf8")
        aes_thing = AES.new(key, AES.MODE_CFB, iv, segment_size=128)
        ciphertext = aes_thing.encrypt(data.encode("utf8"))
        mashed_potato = key + iv + base64.b64encode(ciphertext)
        encrypted = base64.b64encode(mashed_potato)

        return encrypted

    def decrypt(self, data):
        decoded = base64.b64decode(data)
        key1 = decoded[0:16]
        iv1 = decoded[16:32]
        cipher1 = decoded[32:]
        aes_thing_2 = AES.new(key1, AES.MODE_CFB, iv1, segment_size=128)
        plain = aes_thing_2.decrypt(base64.b64decode(cipher1))
        return plain

    def find_strings(self):
        pattern = r'<encryptme>(.*)</encryptme>'
        regex = re.compile(pattern)

        for result in re.finditer(regex, self.content):
            to_encrypt = result.group(1)
            encrypted = self.encrypt(to_encrypt)
            self.content = self.content.replace(result.group(), encrypted.decode("utf8"))

    def save_changes(self, output=None):
        if output is None:
            output = self.filename.split('.smali')[0] + '_obfuscated' + '.smali'

        with open(output, 'w') as f:
            f.write(self.content)


if __name__ == '__main__':
    if len(sys.argv) != 2:
        print("Usage: {} <.smali file>".format(sys.argv[0]))
        sys.exit()

    file_path = sys.argv[1]
    mm = EncryptStrings(filename=file_path)
    mm.find_strings()
    mm.save_changes()

    print("Done.")
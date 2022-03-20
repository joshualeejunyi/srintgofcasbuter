from Crypto.Cipher import AES
import base64
import random, string
import re


class EncryptStrings:
    def __init__(self, filename):
        self.filename = filename

        with open(self.filename, 'r') as f:
            self.content = f.read()

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

        # print(len(key1))
        # print(key1)
        # print(len(iv1))
        # print(iv1)
        # print(cipher1)
        aes_thing_2 = AES.new(key1, AES.MODE_CFB, iv1, segment_size=128)
        plain = aes_thing_2.decrypt(base64.b64decode(cipher1))
        print(plain)

    def find_strings(self):
        pattern = r'<encryptme>(.*)</encryptme>'
        regex = re.compile(pattern)

        for result in re.finditer(regex, self.content):
            to_encrypt = result.group(1)
            encrypted = self.encrypt(to_encrypt)
            print(encrypted)
            self.content = self.content.replace(result.group(), encrypted.decode("utf8"))

    def save_changes(self, output=None):
        if output is None:
            output = self.filename.split('.smali')[0] + '_obfuscated' + '.smali'

        with open(output, 'w') as f:
            f.write(self.content)


if __name__ == '__main__':
    mm = EncryptStrings("./obfuscate_THREE.smali")
    mm.find_strings()
    mm.save_changes()
    # mm.decrypt("Mmh0UEFNbnEzQWwwYmJtWERTb201alRQdVd0aG5SZ00zNEs2ZkgvdmZhRjgvS2FqSWZpbTFLYTVITkZ4UFliejh5S3dKSFE9")
    # mm.decrypt("VVN5N3NRRlZwT3NPSUJlWkpRRFlPMk45dGQwYWEwOFVPV0xmQnduMlJUSnA5NEhqRVpCV1FOV3NWaDZuWnhuM01BU1o3S3U0d29hYkVoa1NvclFTb080PQ==")

    # print(mm.encrypt("hello!!!").decode("utf8"))
    # print(mm.encrypt("this is so cool").decode("utf8"))
    # print(mm.encrypt("please work pleaseee").decode("utf8"))
    # print(mm.encrypt("bye!!!").decode("utf8"))

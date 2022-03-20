# srintgofcasbuter
## Quote of the Day
```"if you don't know what you're doing, your enemies won't either" - confucius```

## New phone whu dis?
This is a string obfuscator for strings in Android Applications based on a encrypted strings that I have seen in a malware.

### Tools Required
* [apktool](https://ibotpeaches.github.io/Apktool/)
* [Android SDK](https://developer.android.com/studio)

### Usage
* Import the `DontLookHere` class located in the Android Application folder above
* For every string, wrap your string with `DontLookHere.decrypt("<encryptme> *original string* </encryptme>")`
  * You can refer to the `MainActivity.class`
* Build a signed APK of your application
* Use `apktool` to decompile the `.apk` file to get the `.smali` code
  * `apktool ./<apk_file>`
* Locate the `.smali` file that contains your strings
* Run `./srintgofcasbuter.py <.smali_file>`
* Recompile the folder back into an `.apk` file using `apktool`
  * `apktool b --use-aapt2 <folder>`
* Re-sign the `.apk` using `apksigner`
  * `.\apksigner.bat sign --ks <.jks_file> <apk>`
* Should be all done!

### What's the algo?
* Looks for `<encryptme> arbitrary string </encryptme>` in `.smali` code
* Generates a random 16-character key
* Generates a random 16-character IV
* Encrypts with AES CFB
* Base64 encodes the result of (in order): Key + IV + Base64-encoded Cipher
* Replaces the `<encryptme>` string with the result

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';

import 'package:open_filex/open_filex.dart';

import 'package:local_auth/local_auth.dart';
import 'package:encrypt/encrypt.dart' as cypher;

String currentDate = "${DateTime.now().year}/${DateTime.now().month}/${DateTime.now().day}";

final LocalAuthentication auth = LocalAuthentication();

openDocument({required String attachementUrl}) async {
  FileInfo file = await DefaultCacheManager().downloadFile(attachementUrl!);
  await OpenFilex.open(file.file.path);
}


Future<void> isAuthenticated({required Function onSuccess, required Function onError, required String biometricsMessage}) async{
  try {
    if (await auth.canCheckBiometrics && await auth.isDeviceSupported() &&
        await auth.authenticate(localizedReason: biometricsMessage))
    {
      onSuccess();
    } else {
      onError();
    }
  } on PlatformException catch (e){
    onError(e);
  }
}

Future<bool> biometricsPermission() async {
  return await auth.canCheckBiometrics && await auth.isDeviceSupported();
}


/*encryptData({required String text,  cypher.AESMode? aesmode}) {
  final key = cypher.Key.fromUtf8(EncryptionData.encryptionKey);

  final iv = cypher.IV.fromUtf8(EncryptionData.encryptionIV);

  final encrypter =
  cypher.Encrypter(cypher.AES(key, mode:aesmode?? cypher.AESMode.cbc, padding: EncryptionModes.AESPADDING));

  final encrypted = encrypter.encrypt(text, iv: iv);

  return encrypted.bytes;
}

decryptData({ required Uint8List text,  cypher.AESMode? aesmode }) {
  final key = cypher.Key.fromUtf8(EncryptionData.encryptionKey);

  final iv = cypher.IV.fromUtf8(EncryptionData.encryptionIV);

  final encrypter =
  cypher.Encrypter(cypher.AES(key, mode: aesmode?? cypher.AESMode.cbc, padding: EncryptionModes.AESPADDING));

  final decrypted = encrypter.decrypt(cypher.Encrypted(text), iv: iv);

  return decrypted.toString();
}

*/

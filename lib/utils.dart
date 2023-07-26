import 'dart:io';

import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

import 'dialog.dart';

class PermissionUtil {
  static List<Permission> androidPermissions = <Permission>[
    Permission.storage
  ];

  static List<Permission> iosPermissions = <Permission>[
    Permission.storage
  ];

  static Future<Map<Permission, PermissionStatus>> requestAll() async {
    if (Platform.isIOS) {
      return await iosPermissions.request();
    }
    return await androidPermissions.request();
  }

  static Future<Map<Permission, PermissionStatus>> request(
      Permission permission) async {
    final List<Permission> permissions = <Permission>[permission];
    return await permissions.request();
  }

  static bool isDenied(Map<Permission, PermissionStatus> result) {
    var isDenied = false;
    result.forEach((key, value) {
      if (value == PermissionStatus.denied) {
        isDenied = true;
        return;
      }
    });
    return isDenied;
  }

  static void showDeniedDialog(BuildContext context) {
    AppDialog.show(
        context: context,
        title: 'Request Permission',
        content: '',
        options: <DialogAction>[
          DialogAction(text: 'Open Setting', onPressed: () => openAppSettings())
        ]);
  }

  static Future<bool> checkGranted(Permission permission) async {
    PermissionStatus storageStatus = await permission.status;
    if (storageStatus == PermissionStatus.granted) {
      return true;
    } else {
      return false;
    }
  }
}

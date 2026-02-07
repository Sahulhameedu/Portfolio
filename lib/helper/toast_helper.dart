import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';

class ToastHelper {
  // Error toast
  static void showError(
    BuildContext context,
    String message, {
    String? title,
    Duration? duration,
  }) {
    toastification.show(
      context: context,
      type: ToastificationType.error,
      style: ToastificationStyle.fillColored,
      title: Text(title ?? 'Error'),
      description: Text(message),
      alignment: Alignment.topRight,
      autoCloseDuration: duration ?? const Duration(seconds: 3),
      icon: const Icon(Icons.error_outline),
      borderRadius: BorderRadius.circular(12),
      showProgressBar: true,
      closeButtonShowType: CloseButtonShowType.onHover,
      closeOnClick: true,
      pauseOnHover: true,
      dragToClose: true,
    );
  }

  // Success toast
  static void showSuccess(
    BuildContext context,
    String message, {
    String? title,
    Duration? duration,
  }) {
    toastification.show(
      context: context,
      type: ToastificationType.success,
      style: ToastificationStyle.fillColored,
      title: Text(title ?? 'Success'),
      description: Text(message),
      alignment: Alignment.topRight,
      autoCloseDuration: duration ?? const Duration(seconds: 3),
      icon: const Icon(Icons.check_circle_outline),
      borderRadius: BorderRadius.circular(12),
      showProgressBar: true,
      closeButtonShowType: CloseButtonShowType.onHover,
      closeOnClick: true,
      pauseOnHover: true,
      dragToClose: true,
    );
  }

  // Warning toast
  static void showWarning(
    BuildContext context,
    String message, {
    String? title,
    Duration? duration,
  }) {
    toastification.show(
      context: context,
      type: ToastificationType.warning,
      style: ToastificationStyle.fillColored,
      title: Text(title ?? 'Warning'),
      description: Text(message),
      alignment: Alignment.topRight,
      autoCloseDuration: duration ?? const Duration(seconds: 3),
      icon: const Icon(Icons.warning_amber_outlined),
      borderRadius: BorderRadius.circular(12),
      showProgressBar: true,
      closeButtonShowType: CloseButtonShowType.onHover,
      closeOnClick: true,
      pauseOnHover: true,
      dragToClose: true,
    );
  }

  // Info toast
  static void showInfo(
    BuildContext context,
    String message, {
    String? title,
    Duration? duration,
  }) {
    toastification.show(
      context: context,
      type: ToastificationType.info,
      style: ToastificationStyle.fillColored,
      title: Text(title ?? 'Info'),
      description: Text(message),
      alignment: Alignment.topRight,
      autoCloseDuration: duration ?? const Duration(seconds: 3),
      icon: const Icon(Icons.info_outline),
      borderRadius: BorderRadius.circular(12),
      showProgressBar: true,
      closeButtonShowType: CloseButtonShowType.onHover,
      closeOnClick: true,
      pauseOnHover: true,
      dragToClose: true,
    );
  }
}

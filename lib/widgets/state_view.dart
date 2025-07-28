import 'package:flutter/material.dart';
import '../utils/strings.dart';

class StateView extends StatelessWidget {
  final bool isLoading;
  final bool isError;
  final String? errorMessage;
  final Widget child;
  final bool isSuccess;
  final String? successMessage;

  const StateView({
    Key? key,
    required this.isLoading,
    required this.isError,
    required this.child,
    this.errorMessage,
    this.isSuccess = false,
    this.successMessage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Center(child: CircularProgressIndicator());
    }
    if (isError) {
      return Center(child: Text(errorMessage ?? AppStrings.error, style: const TextStyle(color: Colors.red)));
    }
    if (isSuccess) {
      return Center(child: Text(successMessage ?? AppStrings.success, style: const TextStyle(color: Colors.green)));
    }
    return child;
  }
} 
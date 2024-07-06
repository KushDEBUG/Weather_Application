import 'package:flutter/material.dart';
import 'package:weather_app/Resources/colors.dart';

class RoundButton extends StatelessWidget {
  final String title;
  final bool loading;
  final VoidCallback onPress;
  const RoundButton(
      {super.key,
      required this.title,
      this.loading = false,
      required this.onPress});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: SizedBox(
        height: 50,
        width: 100,
        child: Center(
            child: loading
                ? const CircularProgressIndicator(
                    backgroundColor: AppColors.whiteColor,
                  )
                : const Icon(Icons.search)),
      ),
    );
  }
}
//Button widget created so it can use anywhere it calls.
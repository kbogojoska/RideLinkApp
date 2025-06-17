import 'package:flutter/material.dart';

class ProgressBar extends StatelessWidget {
  final int currentStep;
  final int totalSteps;
  final List<String> stepLabels;

  ProgressBar({
    required this.currentStep,
    required this.totalSteps,
    required this.stepLabels,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        totalSteps * 2 - 1,
            (index) {
          if (index % 2 == 0) {
            int stepIndex = index ~/ 2 + 1;
            bool isCompleted = stepIndex < currentStep;
            bool isActive = stepIndex == currentStep;

            return Column(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: isCompleted
                        ? Colors.blue
                        : isActive
                        ? Colors.white
                        : Colors.grey.shade300,
                    border: Border.all(
                      color: isActive ? Colors.blue : Colors.grey.shade300,
                      width: 2,
                    ),
                  ),
                  child: Center(
                    child: isCompleted
                        ? Icon(Icons.check, color: Colors.white, size: 20)
                        : Text(
                      "$stepIndex",
                      style: TextStyle(
                        color: isActive ? Colors.blue : Colors.black54,
                        fontWeight: isActive
                            ? FontWeight.bold
                            : FontWeight.normal,
                        fontFamily: 'Lato',
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  stepLabels[stepIndex - 1],
                  style: TextStyle(
                    fontSize: 12,
                    color: isActive || isCompleted
                        ? Colors.blue
                        : Colors.black54,
                    fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
                    fontFamily: 'Lato',
                  ),
                ),
              ],
            );
          } else {
            bool isConnectorActive = (index ~/ 2 + 1) < currentStep;

            return Expanded(
              child: Container(
                height: 2,
                color: isConnectorActive
                    ? Color(0xFF3658B5)
                    : Colors.grey.shade300,
              ),
            );
          }
        },
      ),
    );
  }
}

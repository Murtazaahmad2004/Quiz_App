import 'package:flutter/material.dart';

class AnswerCard extends StatelessWidget {
  const AnswerCard({
    super.key,
    required this.question,
    required this.isSelected,
    required this.currentIndex,
    required this.correctAnswerIndex,
    required this.selectAnswerIndex,
    required this.borderColor, // New parameter
    this.icon, // New parameter for icons (correct/wrong)
  });

  final String question;
  final bool isSelected;
  final int? currentIndex;
  final int? correctAnswerIndex;
  final int selectAnswerIndex;
  final Color borderColor; // Pass the border color
  final Icon? icon; // Optional icon for checkmark or cancel

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Container(
        height: 75,
        padding: const EdgeInsets.all(19.0),
        decoration: BoxDecoration(
          color: Colors.white70,
          border: Border.all(
            width: 3,
            color: borderColor, // Use the provided border color
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween, // Space between text and icon
          children: [
            Expanded(
              child: Text(
                question, // Display the answer option text here
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.black87,
                ),
              ),
            ),
            // Display the icon if it's provided
            if (icon != null) icon!,
          ],
        ),
      ),
    );
  }
}

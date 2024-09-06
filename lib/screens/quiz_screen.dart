import 'package:flutter/material.dart';
import 'package:quiz_app/models/questions.dart';
import 'package:quiz_app/widgets/answer_card.dart';
import 'package:quiz_app/widgets/next_button.dart';
import 'package:quiz_app/screens/result.dart';

void main() {
  runApp(const QuizScreen());
}

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int selectAnswerIndex = -1; // -1 means no answer is selected
  int questionIndex = 0;
  int score = 0;
  bool isAnswered = false; // Track whether an answer has been selected
  bool isLastQuestion = false;

  // Function to pick an answer
  void pickAnswer(int value) {
    setState(() {
      selectAnswerIndex = value; // Set selected answer index
      final question = questions[questionIndex];
      isAnswered = true; // Mark the question as answered
      isLastQuestion = questionIndex == questions.length - 1;

      if (selectAnswerIndex == question.correctAnswerIndex) {
        score++; // Increment score if correct answer is selected
      }
    });
  }

  // Function to go to the next question
  void goToNextQuestion() {
    setState(() {
      if (!isLastQuestion) {
        selectAnswerIndex = -1; // Reset the selected answer
        questionIndex++; // Move to the next question
        isAnswered = false; // Reset the answered flag
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final question = questions[questionIndex]; // Get current question

    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        backgroundColor: Colors.deepOrangeAccent,
        title: const Text('Quiz App'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // Display the question
            Text(
              question.question,
              style: const TextStyle(
                fontSize: 23,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
            // List of answer options
            ListView.builder(
              shrinkWrap: true,
              itemCount: question.options.length,
              itemBuilder: (context, index) {
                // Define border color based on selection and correctness
                Color borderColor;
                Icon? icon;
                if (isAnswered) {
                  if (index == question.correctAnswerIndex) {
                    borderColor = Colors.green; // Highlight correct answer in green
                    icon = const Icon(Icons.check_circle, color: Colors.green);
                  } else if (index == selectAnswerIndex) {
                    borderColor = Colors.red; // Highlight wrong answer in red
                    icon = const Icon(Icons.cancel, color: Colors.red);
                  } else {
                    borderColor = Colors.white70; // Default border for other options
                  }
                } else {
                  borderColor = Colors.white70; // Default before answering
                }

                return GestureDetector(
                  onTap: !isAnswered // Only allow selection if not answered
                      ? () => pickAnswer(index)
                      : null,
                  child: AnswerCard(
                    currentIndex: index,
                    question: question.options[index],
                    isSelected: selectAnswerIndex == index,
                    selectAnswerIndex: selectAnswerIndex,
                    correctAnswerIndex: question.correctAnswerIndex,
                    borderColor: borderColor, // Pass the border color
                    icon: icon, // Pass the icon (if any)
                  ),
                );
              },
            ),
            // Display Finish or Next button
            isLastQuestion
                ? RectangularButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (_) => ResultScreen(
                        score: score,
                    )
                    )
                );
              },
              label: 'Finish',
            )
                : RectangularButton(
              onPressed: selectAnswerIndex != -1 // Only enable if answered
                  ? goToNextQuestion
                  : null,
              label: 'Next',
            ),
          ],
        ),
      ),
    );
  }
}

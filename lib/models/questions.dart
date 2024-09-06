class QuestionModel {
  final String question;
  final List<String> options;
  final int correctAnswerIndex;

  const QuestionModel({
    required this.correctAnswerIndex,
    required this.question,
    required this.options,
  });
}

const List<QuestionModel> questions = [
  QuestionModel(
    question: '1. What is the Formula of Velocity?',
    correctAnswerIndex: 2,
    options: [
      'a) d=v/t',
      'b) s=vt',
      'c) d=vt',
      'd) s=v/t',
    ]
  ),

  QuestionModel(
      question: '2. What is the symbol of Gravity?',
      correctAnswerIndex: 2,
      options: [
        'a) G',
        'b) gr',
        'c) g ',
        'd) None of these',
      ]
  ),

  QuestionModel(
      question: '3. What is the value of Gravity?',
      correctAnswerIndex: 0,
      options: [
        'a) 10ms^-2',
        'b) 10ms^-3',
        'c) 10ms^2',
        'd) 10ms^-1',
      ]
  ),

  QuestionModel(
      question: '4. What is the first equation of motion?',
      correctAnswerIndex: 1,
      options: [
        'a) 2as=vf^2-vi^2',
        'b) vf=vi+at',
        'c) s=vit+1/2at^2',
        'd) both a and b',
      ]
  ),

  QuestionModel(
      question: '5. 1Newton is equal to?',
      correctAnswerIndex: 2,
      options: [
        'a) 1 kg ms^-4',
        'b) 1 kg ms^2',
        'c) 1 kg ms^-2',
        'd) 1 kg ms^3',
      ]
  ),

  QuestionModel(
      question: '6. Centripetal acceleration is equal to?',
      correctAnswerIndex: 0,
      options: [
        'a) v^2/r',
        'b) mv^2/r',
        'c) v^-2/r',
        'd) mv^3/r',
      ]
  ),

  QuestionModel(
      question: '7. Formula of Torque?',
      correctAnswerIndex: 1,
      options: [
        'a) f*m',
        'b) F*L',
        'c) m*a',
        'd) v*t',
      ]
  ),

  QuestionModel(
      question: '8. Unit of Young Modules?',
      correctAnswerIndex: 2,
      options: [
        'a) Nm',
        'b) N',
        'c) Nm^-2',
        'd) Nm^2',
      ]
  ),

  QuestionModel(
      question: '9. Melting point of Aluminum in degree Celsius?',
      correctAnswerIndex: 3,
      options: [
        'a) 256',
        'b) 332',
        'c) 445',
        'd) 660',
      ]
  ),

  QuestionModel(
      question: '10. Boiling point of Water in degree Celsius?',
      correctAnswerIndex: 2,
      options: [
        'a) -100',
        'b) 200',
        'c) 100',
        'd) -250',
      ]
  ),
];
class Question {
  final String title;
  final Map<int, String> choices;
  final int correctChoice;

  const Question({required this.title, required this.choices, required this.correctChoice});
}
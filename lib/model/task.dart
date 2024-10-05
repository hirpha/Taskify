class Task {
  final String title;
  final String description;
  final DateTime dueDate;
  final DateTime endDate;
  final String workspace;

  Task({
    required this.title,
    required this.description,
    required this.dueDate,
    required this.endDate,
    required this.workspace,
  });
}
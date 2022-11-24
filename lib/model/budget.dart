class Budget {
  const Budget(this.judul, this.nominal, this.jenis, this.date);
  final String judul;
  final int nominal;
  final String jenis;
  final DateTime date;
}

class ListBudget {
  static List<Budget> budgetList = [];
}

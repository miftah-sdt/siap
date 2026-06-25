class DashboardSummary {
  const DashboardSummary({
    required this.totalPetani,
    required this.totalLahan,
    required this.totalPolis,
    required this.totalKlaim,
  });

  final int totalPetani;
  final int totalLahan;
  final int totalPolis;
  final int totalKlaim;
}

class ChartPoint {
  const ChartPoint({required this.label, required this.value});

  final String label;
  final double value;
}

class DashboardCharts {
  const DashboardCharts({
    required this.monthlyRegistrations,
    required this.monthlyClaims,
  });

  final List<ChartPoint> monthlyRegistrations;
  final List<ChartPoint> monthlyClaims;
}

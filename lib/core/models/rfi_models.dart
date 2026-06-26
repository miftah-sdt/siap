class WeatherForecast {
  const WeatherForecast({
    required this.temperature,
    required this.humidity,
    required this.windSpeed,
    required this.precipitation,
    required this.weatherCode,
    required this.summary,
  });

  final double temperature;
  final double humidity;
  final double windSpeed;
  final double precipitation;
  final int weatherCode;
  final String summary;
}

class ScoreFactor {
  const ScoreFactor({required this.factor, required this.impact});

  factory ScoreFactor.fromJson(Map<String, dynamic> json) => ScoreFactor(
    factor: json['factor'] as String? ?? '',
    impact: (json['impact'] as num?)?.toInt() ?? 0,
  );

  final String factor;
  final int impact;
}

class UnderwritingScore {
  const UnderwritingScore({
    required this.riskScore,
    required this.riskLevel,
    required this.factors,
    this.scoredAt,
  });

  factory UnderwritingScore.fromJson(Map<String, dynamic> json) =>
      UnderwritingScore(
        riskScore: (json['risk_score'] as num?)?.toInt() ?? 0,
        riskLevel: json['risk_level'] as String? ?? 'sedang',
        factors: _parseFactors(json['score_factors']),
        scoredAt: json['scored_at']?.toString(),
      );

  factory UnderwritingScore.fromAsuransiJson(Map<String, dynamic> json) =>
      UnderwritingScore(
        riskScore: (json['risk_score'] as num?)?.toInt() ?? 0,
        riskLevel: json['risk_level'] as String? ?? 'sedang',
        factors: _parseFactors(json['score_factors']),
        scoredAt: json['scored_at']?.toString(),
      );

  static List<ScoreFactor> _parseFactors(dynamic raw) {
    if (raw is! List) return [];
    return raw
        .map((e) => ScoreFactor.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  final int riskScore;
  final String riskLevel;
  final List<ScoreFactor> factors;
  final String? scoredAt;

  String get riskLabel => switch (riskLevel) {
    'rendah' => 'Risiko Rendah',
    'tinggi' => 'Risiko Tinggi',
    _ => 'Risiko Sedang',
  };
}

class OptAlert {
  const OptAlert({
    required this.id,
    required this.region,
    required this.pestType,
    required this.severity,
    required this.message,
    required this.recommendation,
    required this.reportedAt,
  });

  factory OptAlert.fromJson(Map<String, dynamic> json) => OptAlert(
    id: json['id'] as String? ?? '',
    region: json['region'] as String? ?? '',
    pestType: json['pest_type'] as String? ?? '',
    severity: json['severity'] as String? ?? '',
    message: json['message'] as String? ?? '',
    recommendation: json['recommendation'] as String? ?? '',
    reportedAt: json['reported_at'] as String? ?? '',
  );

  final String id;
  final String region;
  final String pestType;
  final String severity;
  final String message;
  final String recommendation;
  final String reportedAt;
}

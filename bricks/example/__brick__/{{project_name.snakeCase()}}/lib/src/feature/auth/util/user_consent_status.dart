enum UserConsentStatus {
  ageConfirmed,
  informationConsentGiven,
  termsAndConditionsAccepted;

  String get value {
    return switch (this) {
      ageConfirmed => 'أقر بأن عمري قد تخطى 15 عامًا',
      informationConsentGiven => 'أوافق على تلقي المعلومات والأخبار عن الدوري السعودي',
      termsAndConditionsAccepted => 'أوافق على الشروط والأحكام الخاصة بتطبيق هداف',
    };
  }
}

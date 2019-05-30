import 'package:flutter/material.dart';

typedef void LanguageCodeChangeCallback(String languageCode);

class Config {
  static final Config _config = Config._internal();

  factory Config() => _config;

  Config._internal() {
  }

  final List<String> supportedLanguageCodes = ["en", "zh"];

  Iterable<Locale> supportedLanguageLocales() => supportedLanguageCodes
      .map<Locale>((languageCode) => Locale(languageCode));

  LanguageCodeChangeCallback onLanguageCodeChanged;
}

Config config = Config();
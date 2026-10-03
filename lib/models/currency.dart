class Currency {
  final String code;
  final String name;
  final String symbol;

  const Currency({
    required this.code,
    required this.name,
    required this.symbol,
  });

  static const List<Currency> supported = [
    // South Asia
    Currency(code: 'NPR', name: 'Nepalese Rupee', symbol: '\u{930}\u{942}'),
    Currency(code: 'INR', name: 'Indian Rupee', symbol: '\u{20B9}'),
    Currency(code: 'PKR', name: 'Pakistani Rupee', symbol: '\u{20A8}'),
    Currency(code: 'BDT', name: 'Bangladeshi Taka', symbol: '\u{09F3}'),
    Currency(code: 'LKR', name: 'Sri Lankan Rupee', symbol: '\u{20A8}'),
    Currency(code: 'MVR', name: 'Maldivian Rufiyaa', symbol: 'Rf'),
    Currency(code: 'AFN', name: 'Afghan Afghani', symbol: '\u{060B}'),
    // East Asia
    Currency(code: 'JPY', name: 'Japanese Yen', symbol: '\u{00A5}'),
    Currency(code: 'CNY', name: 'Chinese Yuan', symbol: '\u{00A5}'),
    Currency(code: 'KRW', name: 'South Korean Won', symbol: '\u{20A9}'),
    Currency(code: 'TWD', name: 'Taiwan Dollar', symbol: 'NT\u{0024}'),
    Currency(code: 'HKD', name: 'Hong Kong Dollar', symbol: 'HK\u{0024}'),
    Currency(code: 'MNT', name: 'Mongolian Tugrik', symbol: '\u{20AE}'),
    // Southeast Asia
    Currency(code: 'THB', name: 'Thai Baht', symbol: '\u{0E3F}'),
    Currency(code: 'VND', name: 'Vietnamese Dong', symbol: '\u{20AB}'),
    Currency(code: 'IDR', name: 'Indonesian Rupiah', symbol: 'Rp'),
    Currency(code: 'PHP', name: 'Philippine Peso', symbol: '\u{20B1}'),
    Currency(code: 'MYR', name: 'Malaysian Ringgit', symbol: 'RM'),
    Currency(code: 'SGD', name: 'Singapore Dollar', symbol: 'S\u{0024}'),
    Currency(code: 'MMK', name: 'Myanmar Kyat', symbol: 'K'),
    Currency(code: 'KHR', name: 'Cambodian Riel', symbol: '\u{17DB}'),
    Currency(code: 'LAK', name: 'Lao Kip', symbol: '\u{20AD}'),
    Currency(code: 'BND', name: 'Brunei Dollar', symbol: 'B\u{0024}'),
    // Middle East
    Currency(code: 'AED', name: 'UAE Dirham', symbol: '\u{062F}.\u{0625}'),
    Currency(code: 'SAR', name: 'Saudi Riyal', symbol: '\u{FDFC}'),
    Currency(code: 'QAR', name: 'Qatari Riyal', symbol: '\u{FDFC}'),
    Currency(code: 'OMR', name: 'Omani Rial', symbol: '\u{FDFC}'),
    Currency(code: 'KWD', name: 'Kuwaiti Dinar', symbol: '\u{062F}.\u{0643}'),
    Currency(code: 'BHD', name: 'Bahraini Dinar', symbol: '.\u{062F}.\u{0628}'),
    Currency(code: 'ILS', name: 'Israeli Shekel', symbol: '\u{20AA}'),
    Currency(code: 'IRR', name: 'Iranian Rial', symbol: '\u{FDFC}'),
    Currency(code: 'IQD', name: 'Iraqi Dinar', symbol: '\u{0639}.\u{062F}'),
    Currency(code: 'JOD', name: 'Jordanian Dinar', symbol: '\u{062F}.\u{0627}'),
    Currency(code: 'LBP', name: 'Lebanese Pound', symbol: '\u{0644}.\u{0644}'),
    Currency(code: 'YER', name: 'Yemeni Rial', symbol: '\u{FDFC}'),
    Currency(code: 'TRY', name: 'Turkish Lira', symbol: '\u{20BA}'),
    // Africa
    Currency(code: 'ZAR', name: 'South African Rand', symbol: 'R'),
    Currency(code: 'NGN', name: 'Nigerian Naira', symbol: '\u{20A6}'),
    Currency(code: 'EGP', name: 'Egyptian Pound', symbol: '\u{00A3}'),
    Currency(code: 'KES', name: 'Kenyan Shilling', symbol: 'KSh'),
    Currency(code: 'GHS', name: 'Ghanaian Cedi', symbol: '\u{20B5}'),
    Currency(code: 'TZS', name: 'Tanzanian Shilling', symbol: 'TSh'),
    Currency(code: 'UGX', name: 'Ugandan Shilling', symbol: 'USh'),
    Currency(code: 'MAD', name: 'Moroccan Dirham', symbol: '\u{062F}.\u{0645}.'),
    Currency(code: 'DZD', name: 'Algerian Dinar', symbol: '\u{062F}.\u{062C}'),
    Currency(code: 'ETB', name: 'Ethiopian Birr', symbol: 'Br'),
    Currency(code: 'XOF', name: 'West African CFA', symbol: 'CFA'),
    Currency(code: 'XAF', name: 'Central African CFA', symbol: 'FCFA'),
    Currency(code: 'MUR', name: 'Mauritian Rupee', symbol: '\u{20A8}'),
    Currency(code: 'ZMW', name: 'Zambian Kwacha', symbol: 'ZK'),
    // Europe
    Currency(code: 'EUR', name: 'Euro', symbol: '\u{20AC}'),
    Currency(code: 'GBP', name: 'British Pound', symbol: '\u{00A3}'),
    Currency(code: 'CHF', name: 'Swiss Franc', symbol: 'Fr'),
    Currency(code: 'SEK', name: 'Swedish Krona', symbol: 'kr'),
    Currency(code: 'NOK', name: 'Norwegian Krone', symbol: 'kr'),
    Currency(code: 'DKK', name: 'Danish Krone', symbol: 'kr'),
    Currency(code: 'PLN', name: 'Polish Zloty', symbol: 'z\u{0142}'),
    Currency(code: 'CZK', name: 'Czech Koruna', symbol: 'K\u{010D}'),
    Currency(code: 'HUF', name: 'Hungarian Forint', symbol: 'Ft'),
    Currency(code: 'RON', name: 'Romanian Leu', symbol: 'lei'),
    Currency(code: 'BGN', name: 'Bulgarian Lev', symbol: '\u{043B}\u{0432}'),
    Currency(code: 'HRK', name: 'Croatian Kuna', symbol: 'kn'),
    Currency(code: 'RSD', name: 'Serbian Dinar', symbol: '\u{0434}\u{0438}\u{043D}'),
    Currency(code: 'UAH', name: 'Ukrainian Hryvnia', symbol: '\u{20B4}'),
    Currency(code: 'ISK', name: 'Icelandic Krona', symbol: 'kr'),
    // Americas
    Currency(code: 'USD', name: 'US Dollar', symbol: '\u{0024}'),
    Currency(code: 'CAD', name: 'Canadian Dollar', symbol: 'CA\u{0024}'),
    Currency(code: 'MXN', name: 'Mexican Peso', symbol: 'MX\u{0024}'),
    Currency(code: 'BRL', name: 'Brazilian Real', symbol: 'R\u{0024}'),
    Currency(code: 'ARS', name: 'Argentine Peso', symbol: '\u{0024}'),
    Currency(code: 'CLP', name: 'Chilean Peso', symbol: '\u{0024}'),
    Currency(code: 'COP', name: 'Colombian Peso', symbol: '\u{0024}'),
    Currency(code: 'PEN', name: 'Peruvian Sol', symbol: 'S/'),
    Currency(code: 'UYU', name: 'Uruguayan Peso', symbol: '\u{0024}U'),
    Currency(code: 'BOB', name: 'Bolivian Boliviano', symbol: 'Bs'),
    Currency(code: 'PYG', name: 'Paraguayan Guarani', symbol: '\u{20B2}'),
    Currency(code: 'CRC', name: 'Costa Rican Colon', symbol: '\u{20A1}'),
    Currency(code: 'DOP', name: 'Dominican Peso', symbol: 'RD\u{0024}'),
    Currency(code: 'GTQ', name: 'Guatemalan Quetzal', symbol: 'Q'),
    Currency(code: 'TTD', name: 'Trinidad Dollar', symbol: 'TT\u{0024}'),
    // Oceania
    Currency(code: 'AUD', name: 'Australian Dollar', symbol: 'A\u{0024}'),
    Currency(code: 'NZD', name: 'New Zealand Dollar', symbol: 'NZ\u{0024}'),
    Currency(code: 'FJD', name: 'Fijian Dollar', symbol: 'FJ\u{0024}'),
    Currency(code: 'PGK', name: 'Papua New Guinean Kina', symbol: 'K'),
    Currency(code: 'WST', name: 'Samoan Tala', symbol: 'WS\u{0024}'),
    Currency(code: 'SBD', name: 'Solomon Islands Dollar', symbol: 'SI\u{0024}'),
    Currency(code: 'TOP', name: 'Tongan Pa\u{02BB}anga', symbol: 'T\u{0024}'),
    Currency(code: 'VUV', name: 'Vanuatu Vatu', symbol: 'VT'),
    // Other
    Currency(code: 'RUB', name: 'Russian Ruble', symbol: '\u{20BD}'),
    Currency(code: 'KZT', name: 'Kazakhstani Tenge', symbol: '\u{20B8}'),
    Currency(code: 'UZS', name: 'Uzbekistani Som', symbol: 'so\u{02BB}m'),
  ];

  static Currency byCode(String code) {
    return supported.firstWhere(
      (c) => c.code == code,
      orElse: () => supported.first,
    );
  }
}

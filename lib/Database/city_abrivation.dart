class CityAbbreviation {
  // Map to store city name abbreviations
  static final Map<String, String> _abbreviations = {
    'Adiss Abeba': 'AA',
    'Dire Dawa': 'DD',
    'Adama':'AD',
    'Mojo':'MO',
    'Bika':'BI',
    'Bishoftu':'BS'
    // Add more city abbreviations as neededzz
  };

  // Function to get abbreviation for city name
  static String getAbbreviation(String cityName) {
    return _abbreviations[cityName] ?? cityName; // Return abbreviation if found, else return original city name
  }
}


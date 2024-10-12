class QueryParameterHandler {
  static String generateQueryParameters(Map<String, dynamic> parameters) {
    if (parameters.isEmpty) {
      return '';
    }

    List<String> pairs = [];
    parameters.forEach((key, value) {
      if (value != null && value != '') {
        if (value is List) {
          // Handle list values by joining them with commas
          pairs.add(
              '$key=${value.map((e) => Uri.encodeComponent(e.toString())).join(',')}');
        } else {
          pairs.add('$key=${Uri.encodeComponent(value.toString())}');
        }
      } else {
        // Include keys with empty string values without the equal sign
        pairs.add(key);
      }
    });

    return '?${pairs.join('&')}';
  }
}

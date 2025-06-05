import 'package:http/http.dart' as http;
import 'dart:convert';

Future<double?> calculateVolume(double length, double width, double height) async {
  final url = Uri.parse('https://Metreyar.onrender.com/calculate-volume');
  final response = await http.post(
    url,
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode({
      'length': length,
      'width': width,
      'height': height,
    }),
  );

  if (response.statusCode == 200) {
    final data = jsonDecode(response.body);
    return data['volume'];
  } else {
    print('Error: ${response.statusCode}');
    return null;
  }
}

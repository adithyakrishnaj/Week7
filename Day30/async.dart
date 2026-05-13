import 'dart:async';

// Simulated database fetch function
Future<String> fetchData() async {
  // Simulate network delay
  await Future.delayed(Duration(seconds: 3));

  // Simulated error
  throw Exception("Connection Timeout");

  // If success:
  // return "User data fetched successfully";
}

void main() async {
  print("Fetching data from database...");

  try {
    String result = await fetchData();
    print(result);
  } catch (e) {
    print("Error: $e");
  }

  print("Program completed.");
}

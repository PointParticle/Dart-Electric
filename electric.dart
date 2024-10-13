import 'dart:io';

void main() {
  print("Welcome to the Electric Vehicles Utility App!");
  while (true) {
    print("\nChoose an option:");
    print("1. String Manipulation");
    print("2. Collections");
    print("3. File Handling");
    print("4. Date and Time");
    print("5. Exit");

    String? choice = stdin.readLineSync();
    switch (choice) {
      case '1':
        stringManipulationDemo();
        break;
      case '2':
        collectionsDemo();
        break;
      case '3':
        fileHandlingDemo();
        break;
      case '4':
        dateTimeDemo();
        break;
      case '5':
        print("Exiting the application.");
        return;
      default:
        print("Invalid option. Please try again.");
    }
  }
}

void stringManipulationDemo() {
  print("\n--- String Manipulation ---");
  print("Enter a string:");
  String? input = stdin.readLineSync() ?? '';

  // Concatenate
  String greeting = "Welcome to the Electric Vehicles App!";
  print(greeting);
  
  // Reverse
  String reversed = input.split('').reversed.join('');
  print("Reversed: $reversed");
  
  // Change Case
  print("Uppercase: ${input.toUpperCase()}");
  print("Lowercase: ${input.toLowerCase()}");

  logAction("Performed string manipulation on: '$input'");
}

void collectionsDemo() {
  print("\n--- Collections ---");
  List<String> vehicles = ["Car", "Motorbike", "Scooter"];
  
  print("Current list of vehicles: $vehicles");
  
  print("Add a new vehicle:");
  String? newVehicle = stdin.readLineSync();
  if (newVehicle != null && newVehicle.isNotEmpty) {
    vehicles.add(newVehicle);
    print("Updated list of vehicles: $vehicles");
  } else {
    print("No vehicle added.");
  }

  // Unique Vehicles
  Set<String> uniqueVehicles = Set.from(vehicles);
  print("Unique Vehicles: $uniqueVehicles");

  // Vehicle Types
  Map<String, String> vehicleTypes = {
    "Car": "4 wheels",
    "Motorbike": "2 wheels",
    "Scooter": "2 wheels"
  };

  print("Vehicle Types: $vehicleTypes");
  logAction("Updated vehicle collection with: '${newVehicle ?? 'No new vehicle added'}'");
}

void fileHandlingDemo() async {
  const inputFilePath = 'input.txt';
  const outputFilePath = 'output.txt';

  try {
    // Read from a file
    String content = await File(inputFilePath).readAsString();
    print("File Content: $content");

    // Write to another file
    await File(outputFilePath).writeAsString("Processed: $content");
    print("Data written to $outputFilePath");
  } catch (e) {
    print("Error: $e");
  }
  
  logAction("Handled file operations: Read from '$inputFilePath' and wrote to '$outputFilePath'");
}

void dateTimeDemo() {
  DateTime now = DateTime.now();
  print("\n--- Date and Time ---");
  print("Current Date and Time: $now");

  // Format date
  String formattedDate = "${now.day}/${now.month}/${now.year}";
  print("Formatted Date: $formattedDate");

  // Calculate difference
  DateTime futureDate = now.add(Duration(days: 30));
  Duration difference = futureDate.difference(now);
  print("Days until future date: ${difference.inDays}");

  logAction("Displayed current date and time.");
}

void logAction(String message) {
  DateTime now = DateTime.now();
  String formattedMessage = "${now.toIso8601String()}: $message\n";
  
  // Append to log file
  File logFile = File('activity_log.txt');
  logFile.writeAsStringSync(formattedMessage, mode: FileMode.append);
}
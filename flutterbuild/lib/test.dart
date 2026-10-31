import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

void main() {
  // Initialize the native C-library bindings for desktop platforms
  if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
    sqfliteFfiInit();
    databaseFactory = databaseFactoryFfi;
  }

  runApp(const SensorDashboardApp());
}

class SensorDashboardApp extends StatelessWidget {
  const SensorDashboardApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(useMaterial3: true),
      home: const SensorScreen(),
    );
  }
}

// Data model handling dynamic key-value sensor attributes
class SensorSession {
  final String timestamp;
  final String location;
  final String macAddress;
  final Map<String, double> metrics; // Dynamic attributes land here

  SensorSession({
    required this.timestamp,
    required this.location,
    required this.macAddress,
    required this.metrics,
  });

  factory SensorSession.fromMap(Map<String, dynamic> map) {
    // Parse SQLite's json_group_object string into a Dart Map
    final rawMetrics = jsonDecode(map['metrics'] as String) as Map<String, dynamic>;

    return SensorSession(
      timestamp: map['timestamp'] as String,
      location: map['location'] as String,
      macAddress: map['mac_address'] as String,
      metrics: rawMetrics.map((key, val) => MapEntry(key, (val as num).toDouble())),
    );
  }
}

class SensorScreen extends StatefulWidget {
  const SensorScreen({super.key});

  @override
  State<SensorScreen> createState() => _SensorScreenState();
}

class _SensorScreenState extends State<SensorScreen> {
  Database? _db;
  List<SensorSession> _sessions = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _setupAndFetch();
  }

  Future<void> _setupAndFetch() async {
    // Open an in-memory SQLite database (replace with file path for persistent DB)
    final db = await openDatabase(
      inMemoryDatabasePath,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE old_sensor_data (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            timestamp TEXT,
            mac_address TEXT,
            location TEXT,
            reading_type TEXT,
            reading_value REAL
          )
        ''');

        // Seed sample rows with unpredictable reading_type keys
        await db.execute('''
          INSERT INTO old_sensor_data (timestamp, mac_address, location, reading_type, reading_value) VALUES
          ('2026-09-01T00:00:00', 'AA:BB:CC:11:22:09', 'Location C', 'temp', 24.0),
          ('2026-09-01T00:00:00', 'AA:BB:CC:11:22:09', 'Location C', 'hum', 72.3),
          ('2026-09-01T00:00:00', 'AA:BB:CC:11:22:09', 'Location C', 'co2_ppm', 412.0),
          ('2026-09-01T00:00:15', 'AA:BB:CC:11:22:05', 'Location B', 'temp', 21.5),
          ('2026-09-01T00:00:15', 'AA:BB:CC:11:22:05', 'Location B', 'uv_index', 5.2),
          ('2026-09-01T00:00:15', 'AA:BB:CC:11:22:05', 'Location B', 'noise_db', 45.8);
        ''');
      },
    );

    // Pivot EAV rows into a single JSON metric map per session
    final List<Map<String, dynamic>> rawResults = await db.rawQuery('''
      SELECT 
        timestamp,
        mac_address,
        location,
        json_group_object(reading_type, reading_value) AS metrics
      FROM old_sensor_data
      GROUP BY timestamp, mac_address, location
      ORDER BY timestamp DESC
    ''');

    setState(() {
      _db = db;
      _sessions = rawResults.map(SensorSession.fromMap).toList();
      _isLoading = false;
    });
  }

  @override
  void dispose() {
    _db?.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Dynamic EAV Sensor Reader')),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
        itemCount: _sessions.length,
        itemBuilder: (context, index) {
          final session = _sessions[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${session.location} • ${session.macAddress}',
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  Text(session.timestamp, style: const TextStyle(color: Colors.grey)),
                  const Divider(),
                  // Dynamically render whatever metric keys were returned
                  Wrap(
                    spacing: 8.0,
                    runSpacing: 8.0,
                    children: session.metrics.entries.map((entry) {
                      return Chip(
                        label: Text('${entry.key}: ${entry.value}'),
                        backgroundColor: Colors.teal.shade900,
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:path/path.dart' as p;
import 'package:flutter/material.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:file_picker/file_picker.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:math' as math;
import 'dart:io';
import 'package:audioplayers/audioplayers.dart';
import 'package:code_text_field/code_text_field.dart';
import 'package:highlight/languages/sql.dart';
import 'package:flutter_highlight/theme_map.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
    sqfliteFfiInit();
    databaseFactory = databaseFactoryFfi;
  }
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Body(),
      ),
    ),
  );
}

class Body extends StatefulWidget {
  const Body({super.key});

  @override

  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  CodeController? _codeController;
  String? _selectedLocation;
  List<String> _locations = [];
  String? _errorMessage;
  List<Map<String, dynamic>> _tableData = [];

  String? _selectedReading;
  List<String> _readings = [];
  final AudioPlayer _audioPlayer = AudioPlayer();

  @override
  void initState() {
    super.initState();
    final source = "SELECT * FROM old_sensor_data;";
    _audioPlayer.setSource(AssetSource('click.mp3'));
    _codeController = CodeController(
      text: source,
      language: sql,

    );
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    _codeController?.dispose();
    super.dispose();
  }

  Future<void> _Click() async {
    await _audioPlayer.play(
      AssetSource('click.mp3'),
      mode: PlayerMode.lowLatency,
    );
  }
  Future<void> RunQuery() async {
    if (_db == null || _codeController == null ||
        _codeController!.text.trim().isEmpty) {
      setState(() {
        _errorMessage = "No DataBase loaded/No query written";
        _tableData = [];
      });
      return;
    }
  try{
  String queryText = _codeController!.text.trim();

  String cleanQuery = queryText.endsWith(';')
  ? queryText.substring(0, queryText.length - 1).trim()
      : queryText;
  if(!cleanQuery.toUpperCase().contains('LIMIT')){
  queryText = "$cleanQuery LIMIT 300;";
  }
  final results = await _db!.rawQuery(queryText);
  setState(() {
  _tableData = results;
  _errorMessage = "Query executed succesfully , Rows : (${results.length} ";

  });

  }catch(e){
      setState(() {
        _errorMessage = e.toString();
        _tableData = [];
      });
    }
  }


  String? dbname;
  Database? _db;
  Future<void> _PATH() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['db'],
    );
    if (result != null && result.files.single.path != null) {
      String fullpath = result.files.single.path!;
      await _db?.close();
      final loadedDb = await openDatabase(fullpath, readOnly: true);
      print(loadedDb);
      final opts = await dropdownopt(loadedDb);
      setState(() {
        _locations = opts['locations'] ?? [];
        _readings = opts['readings'] ?? [];
        dbname = p.basename(fullpath);
        _db = loadedDb;
        _selectedLocation = _locations.isNotEmpty ? _locations.first : null;
        _selectedReading = _readings.isNotEmpty ? _readings.first : null;
      });
      String directory = p.dirname(fullpath);

      print("db name: $dbname");
      print('Path: $fullpath');
      print("directory: $directory");

    } else {
      print("db name selection canceled ");
    }

  }
  Future<Map<String,List<String>>> dropdownopt (Database db,{String? selectedLocation,}) async {

    final locationR = await db.rawQuery('SELECT DISTINCT location FROM old_sensor_data '
        'WHERE location IS NOT NULL AND location != "" '
        'ORDER BY location ASC'
        );
    final locations = locationR.map((r) => r['location'] as String).toList();

    final activeLocation = _selectedLocation ?? (locations.isNotEmpty? locations.first : null);
    List<String> readings = [];
    if (activeLocation != null){
      final readingR = await db.rawQuery('SELECT DISTINCT reading_type FROM old_sensor_data WHERE location = ?',
        [activeLocation],);
      readings = readingR.map((r) => r['reading_type'] as String).toList();
    }


    return{
      'locations':locations,
      'readings':readings,
    };
  }
  Future<List<Map<String,dynamic>>> match({
    required Database db,
    required String location,
    required String readingType,
})async {
    return await db.query(
      'old_sensor_data',
      columns: ['timestamp','reading_value'],
      where: 'location = ? AND reading_type = ?',
      whereArgs: [location,readingType],
      orderBy: 'timestamp ASC',
    );
  }



  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Container(
        color: const Color(0xFF1E293B),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 25.0, top: 25.0),
                    child: ElevatedButton(
                      onPressed: () {
                        _PATH();
                        _Click();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFC3C3C3),
                        fixedSize: const Size(200, 100),
                        elevation: 10,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      child: Text(
                        "Select Data Base",
                        style: GoogleFonts.inter(
                          color: const Color(0xFF1E293B),
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(left: 25.0, top: 25.0),
                    child: Text(
                      dbname == null
                          ? 'No Database Selected'
                          : 'DataBase : $dbname',
                      style: GoogleFonts.inter(
                        color: const Color(0xFFC3C3C3),
                        fontSize: 25,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 200.0, top: 25.0),
                    child: Text("Our-Air Monitor",style: GoogleFonts.inter(
                      color: const Color(0xFFC3C3C3),
                      fontSize: 50,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 0.5,
                    ),),
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(right: 25.0, top: 25.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [

                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16.0,
                            vertical: 4.0,
                          ),
                          decoration: BoxDecoration(
                            color: dbname == null
                                ? const Color(0xFF1E293B)
                                : const Color(0xFFC3C3C3),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              iconEnabledColor: const Color(0xFF1E293B),
                              value: _selectedReading,
                              dropdownColor: dbname == null
                                  ? const Color(0xFF1E293B)
                                  : const Color(0xFFC3C3C3),
                              borderRadius: BorderRadius.circular(10),
                              items: _readings.map((String reading) {
                                return DropdownMenuItem<String>(
                                  value: reading,
                                  child: Text(
                                    dbname == null
                                        ? 'No Database Selected'
                                        : reading,
                                    style: GoogleFonts.inter(
                                      color: const Color(0xFF1E293B),
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16,
                                    ),
                                  ),
                                );
                              }).toList(),
                              onChanged: (String? newValue) {
                                _Click();
                                setState(() {
                                  _selectedReading = newValue!;
                                });
                              },
                            ),
                          ),
                        ),
                        const SizedBox(width: 16),
                        // Location Dropdown
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16.0,
                            vertical: 4.0,
                          ),
                          decoration: BoxDecoration(
                            color: dbname == null
                                ? const Color(0xFF1E293B)
                                : const Color(0xFFC3C3C3),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              iconEnabledColor: const Color(0xFF1E293B),
                              value: _selectedLocation,
                              dropdownColor: dbname == null
                                  ? const Color(0xFF1E293B)
                                  : const Color(0xFFC3C3C3),
                              borderRadius: BorderRadius.circular(10),
                              items: _locations.map((String location) {
                                return DropdownMenuItem<String>(
                                  value: location,
                                  child: Text(
                                    dbname == null
                                        ? 'No Database Selected'
                                        : location,
                                    style: GoogleFonts.inter(
                                      color: const Color(0xFF1E293B),
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16,
                                    ),
                                  ),
                                );
                              }).toList(),
                              onChanged: (String? newlocation)async {
                                _Click();
                                if(newlocation != null && _db !=null){
                                  final opts = await dropdownopt(_db!, selectedLocation: newlocation);
                                  setState(() {
                                    _selectedLocation = newlocation!;
                                    _readings = opts['readings'] ?? [];

                                    _selectedReading = _readings.isNotEmpty ? _readings.first: null;
                                  });
                                }
                                
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: SizedBox(
                  height: 800,
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: const Color(0xFF151C28),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: LineChartSample12(
                      db: _db,
                      location: _selectedLocation,
                      readingType: _selectedReading,
                    ),
                  ),
                ),
              ),
              Padding(padding: const EdgeInsets.only(right: 25.0, top: 30, left: 50),
              child: Text("Sql Query Field : ",style: GoogleFonts.inter(
                color: const Color(0xFFC3C3C3),
                fontWeight: FontWeight.w600,
                fontSize: 50,

              ),),
              ),
              const SizedBox(height: 50),
              if(_codeController != null)
                Padding(padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                  constraints: const BoxConstraints(
                    minHeight: 20,
                    maxHeight: 2500,
                  ),
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: const Color(0xFF151C28),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: CodeTheme(
                    data: CodeThemeData(
                      styles: themeMap['monokai-sublime'] ?? {},
                    ),
                    child: CodeField(
                      controller: _codeController!,
                      background: Colors.transparent,
                      textStyle: GoogleFonts.firaCode(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                      lineNumberStyle: const LineNumberStyle(
                        width: 45,
                        margin: 10,
                        textStyle: TextStyle(
                          color: Color(0xFF64748B),
                        )
                      ),
                    ),
                  ),
                )

                ),
              Row(

                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 25.0, top: 25.0),
                    child: ElevatedButton(
                      onPressed: () {
                        _Click();
                        RunQuery();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF16b386,),
                        fixedSize: const Size(300, 100),
                        elevation: 10,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      child: Text(
                        "Run Query",
                        style: GoogleFonts.inter(
                          color: const Color(0xFF1E293B),
                          fontSize: 40,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ),

                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 25.0, top: 25.0),
                    child: Container(
                      width: 1500,
                        height: 100 ,
                        padding: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          color: const Color(0xFF151C28),
                          borderRadius: BorderRadius.circular(16),
                        ),
                      child: Text('Debug Console : $_errorMessage',style: GoogleFonts.inter(
                        color: const Color(0xFFC3C3C3),
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 0.5,
                      ),),
                      ),
                  ),
                ],
              ),
              if(_tableData.isNotEmpty)
                Padding(padding: const EdgeInsets.all(15),
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: const Color(0xFF151C28),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: DataTable(
                        columns: _tableData.first.keys.map((key){
                          return DataColumn(label: Text(key.toUpperCase(),
                          style: GoogleFonts.inter(color: const Color(0xFFC3C3C3)),
                          ),
                          );
                        }).toList(),
                        rows: _tableData.map((row){
                          return DataRow(
                            cells: row.values.map((val){
                              return DataCell(Text(val?.toString()?? '',
                                  style: GoogleFonts.inter(color: const Color(0xFFC3C3C3)),
                              ));
                            }).toList(),
                          );
                        }).toList(),
                      ),
                    ),
                  ),

                )

            ],
          ),
        ),
      ),
    );
  }
}

class LineChartSample12 extends StatefulWidget {
  final Database? db;
  final String? location;
  final String? readingType;

  const LineChartSample12({
    super.key,
    this.db,
    this.location,
    this.readingType,
  });
  State<LineChartSample12> createState() => _LineChartSample12State();
}

class _LineChartSample12State extends State<LineChartSample12> {

  List<(DateTime, double)> _sensorData = [];
  @override
  Future<void> _getdata()async{
    if (widget.db == null || widget.location == null || widget.readingType == null) {
      return;
    }
      final rows = await widget.db!.query(
        'old_sensor_data',
        columns: ['timestamp','reading_value'],
        where: 'location = ? AND reading_type = ?',
        whereArgs: [widget.location,widget.readingType],
        orderBy: 'timestamp ASC',
      );
      setState(() {
        _sensorData = rows.map((row){
          return(
          DateTime.parse(row['timestamp'].toString()),
          (row['reading_value']as num).toDouble(),
          );
        }).toList();
        _reset();
      });


  }
  @override
  void didUpdateWidget(covariant LineChartSample12 oldWidget){
    super.didUpdateWidget(oldWidget);
    if (widget.db == null || widget.location == null || widget.readingType == null) return;
      _getdata();

  }

  double _minX = 0;
  double _maxX = 10;
  final double _windowSize = 10;

  @override
  void initState() {
    super.initState();
    _getdata();
    final now = DateTime.now();
    _reset();
  }

  void _moveLeft() {
    setState(() {
      if (_minX > 0) {
        _minX = math.max(0.0, _minX - 2);
        _maxX = _minX + _windowSize;
      }
    });
  }

  void _moveRight() {
    setState(() {
      final maxIndex = (_sensorData.length - 1).toDouble();
      if (_maxX < maxIndex) {
        _maxX = math.min(maxIndex, _maxX + 2);
        _minX = _maxX - _windowSize;
      }
    });
  }

  void _zoomIn() {
    setState(() {
      if ((_maxX - _minX) > 4) {
        _minX += 1;
        _maxX -= 1;
      }
    });
  }

  void _zoomOut() {
    setState(() {
      final maxIndex = (_sensorData.length - 1).toDouble();
      _minX = math.max(0.0, _minX - 1);
      _maxX = math.min(maxIndex, _maxX + 1);
    });
  }

  void _reset() {
    setState(() {
      _maxX = (_sensorData.length - 1).toDouble();
      _minX = math.max(0.0, _maxX - _windowSize);
    });
  }

  @override
  Widget build(BuildContext context) {
    const leftReservedSize = 52.0;

    return Column(
      children: [
        Row(
          children: [
            const SizedBox(width: leftReservedSize),
            const _ChartTitle(),
            const Spacer(),
            // Navigation Controls (Move Left/Right & Zoom)
            Row(
              children: [
                IconButton(
                  tooltip: 'Move Left',
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    color: Color(0xFFC3C3C3),
                    size: 18,
                  ),
                  onPressed: _moveLeft,
                ),
                IconButton(
                  tooltip: 'Zoom In',
                  icon: const Icon(Icons.add, color: Color(0xFFC3C3C3)),
                  onPressed: _zoomIn,
                ),
                IconButton(
                  tooltip: 'Reset View',
                  icon: const Icon(Icons.refresh, color: Color(0xFFC3C3C3)),
                  onPressed: _reset,
                ),
                IconButton(
                  tooltip: 'Zoom Out',
                  icon: const Icon(Icons.remove, color: Color(0xFFC3C3C3)),
                  onPressed: _zoomOut,
                ),
                IconButton(
                  tooltip: 'Move Right',
                  icon: const Icon(
                    Icons.arrow_forward_ios,
                    color: Color(0xFFC3C3C3),
                    size: 18,
                  ),
                  onPressed: _moveRight,
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 16),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(top: 0.0, right: 18.0),
            child: LineChart(
              LineChartData(
                clipData: const FlClipData.all(),
                minX: _minX,
                maxX: _maxX,
                lineBarsData: [
                  LineChartBarData(
                    spots: _sensorData.asMap().entries.map((e) {
                      return FlSpot(e.key.toDouble(), e.value.$2);
                    }).toList(),
                    dotData: const FlDotData(show: false),
                    color: const Color(0xFFC3C3C3),
                    barWidth: 2,
                    belowBarData: BarAreaData(
                      show: true,
                      gradient: LinearGradient(
                        colors: [
                          const Color(0xFFC3C3C3).withOpacity(0.2),
                          const Color(0xFFC3C3C3).withOpacity(0.0),
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                  ),
                ],
                lineTouchData: LineTouchData(
                  touchSpotThreshold: 5,
                  getTouchLineStart: (_, __) => -double.infinity,
                  getTouchLineEnd: (_, __) => double.infinity,
                  getTouchedSpotIndicator:
                      (LineChartBarData barData, List<int> spotIndexes) {
                    return spotIndexes.map((spotIndex) {
                      return TouchedSpotIndicatorData(
                        const FlLine(
                          color: const Color(0xFFC3C3C3),
                          strokeWidth: 1.5,
                          dashArray: [8, 2],
                        ),
                        FlDotData(
                          show: true,
                          getDotPainter: (spot, percent, barData, index) {
                            return FlDotCirclePainter(
                              radius: 6,
                              color: const Color(0xFFC3C3C3),
                              strokeWidth: 0,
                              strokeColor: const Color(0xFFC3C3C3),
                            );
                          },
                        ),
                      );
                    }).toList();
                  },
                  touchTooltipData: LineTouchTooltipData(
                    getTooltipItems: (List<LineBarSpot> touchedBarSpots) {
                      return touchedBarSpots.map((barSpot) {
                        final price = barSpot.y;
                        final index = barSpot.x.toInt();
                        if (index < 0 || index >= _sensorData.length) {
                          return null;
                        }
                        final date = _sensorData[index].$1;
                        final hour = date.hour.toString().padLeft(2, '0');
                        final minute = date.minute.toString().padLeft(2, '0');
                        final year = date.year.toString().padLeft(2,'0');
                        return LineTooltipItem(
                          '',
                          const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                          children: [
                            TextSpan(
                              text: '$year ${date.month}/${date.day} $hour:$minute ',
                              style: const TextStyle(
                                color: Color(0xFFC3C3C3),
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                              ),
                            ),
                            TextSpan(
                              text: '\n${price.toStringAsFixed(2)} ${(widget.readingType)}',
                              style: const TextStyle(
                                color: Color(0xFFC3C3C3),
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        );
                      }).toList();
                    },
                  ),
                ),
                titlesData: FlTitlesData(
                  show: true,
                  rightTitles: const AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  topTitles: const AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  leftTitles: const AxisTitles(
                    drawBelowEverything: true,
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: leftReservedSize,
                    ),
                  ),
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,

                      reservedSize: 60,
                      getTitlesWidget: (double value, TitleMeta meta) {
                        final index = value.toInt();
                        if (index < 0 || index >= _sensorData.length) {
                          return const SizedBox.shrink();
                        }
                        final date = _sensorData[index].$1;
                        final hour = date.hour.toString().padLeft(2, '0');
                        final minute = date.minute.toString().padLeft(2, '0');
                        final year = date.year.toString().padLeft(2,'0');
                        return SideTitleWidget(
                          axisSide: meta.axisSide,
                          child: Transform.rotate(

                            angle: -45 * math.pi / 180,
                            child:

                            Text(
                              '$year ${date.month}/${date.day} $hour:$minute ',
                              style: const TextStyle(
                                color: Color(0xFFC3C3C3),
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _ChartTitle extends StatelessWidget {
  const _ChartTitle();

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 14),
        Text(
          'DataBase Graph',
          style: TextStyle(
            color: Color(0xFFC3C3C3),
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        Text(
          'Sqlite Only',
          style: TextStyle(
            color: Color(0xFFC3C3C3),
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
        ),
        SizedBox(height: 14),
      ],
    );
  }
}
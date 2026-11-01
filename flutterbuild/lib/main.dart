import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:math' as math;
import 'dart:io';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_libserialport/flutter_libserialport.dart';
import 'package:shared_preferences/shared_preferences.dart';
void main() {
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
  List<String> Mac =[];

  String Wait = '';
  bool isNode = false;
  bool isMaster = false;
  List<String> Live =[];
  List<String> debug = [];
  List<String> Ports =[];
  String? selectedPort;
  SerialPort? _activePort;
  SerialPortReader? _reader;
  String str ='';
  int Warn = 0;

  final AudioPlayer _audioPlayer = AudioPlayer();
  final TextEditingController _controller = TextEditingController();


  @override
  void initState(){
    _audioPlayer.setSource(AssetSource('click.mp3'));
    super.initState();
    UpdateStorage();
    _loadPorts();
  }
  @override
  void dispose() {
    _disconnectPort();
    _audioPlayer.dispose();
    super.dispose();

  }
  Future<void> _Click() async {
    await _audioPlayer.play(
      AssetSource('click.mp3'),
      mode: PlayerMode.lowLatency,
    );
  }
  void _loadPorts(){
      setState(() {
        Ports = SerialPort.availablePorts;
        if(selectedPort != null && !Ports.contains(selectedPort)){
          selectedPort = null;
          _disconnectPort();
        }
      });
  }
void _connect(String portN){
    _disconnectPort();
    setState(() {
      isNode = false;
      isMaster = false;
      Wait = '';
    });
    Live.clear();
    debug.clear();
    print('1. ATTEMPTING TO CONNECT TO: $portN');
    final port = SerialPort(portN);
    if(port.openReadWrite()){
      print('2. SUCCESS: Port $portN opened!');
      final config = SerialPortConfig();
      config.baudRate = 115200;
      config.bits = 8;
      config.stopBits =1;
      config.parity = SerialPortParity.none;
      port.config = config;
      _activePort = port;
      _reader = SerialPortReader(port);
      _reader!.stream.listen((Uint8List bytes){
        final text = String.fromCharCodes(bytes);
        Wait += text;
        while(Wait.contains('\n')) {
          int newLineIndex = Wait.indexOf('\n');
          String msmn = Wait.substring(0, newLineIndex).trim();
          Wait = Wait.substring(newLineIndex + 1);
          print('RECEIVED FROM ESP: "$msmn"');
          if (msmn == "Node") {
            setState(() {
              isNode = true;
            });
          } else if (msmn == "Master") {
            setState(() {
              isMaster = true;
            });
          }
          if (msmn.startsWith("Reading :") && isMaster == true) {
            setState(() {
              Live.insert(0, msmn);
              if (Live.length > 50) {
                Live.removeLast();
              }
            });
          }

          setState(() {
            if(isNode == false && isMaster == false){
              debug.insert(0, msmn +   " (Warning : Not From Trusted Node or Master)");
            }else {
              debug.insert(0, msmn);
            }


            if (debug.length > 30) {
              debug.removeLast();
            }
          });

        };

      });
    }
}
void _disconnectPort(){
    _reader?.close();
    _reader = null;
    if(_activePort != null && _activePort!.isOpen){
      _activePort!.close();
    }
}
void Send(String order){
    if(_activePort != null && _activePort!.isOpen){
      final bytes = Uint8List.fromList('$order\n'.codeUnits);
      _activePort!.write(bytes);
    }
}
void Flash(List<String> macs){
    if(macs.isEmpty)return;
    String CD = macs.join(',');
    Send(CD);


}
void UpdateStorage()async{
  final prefs = await SharedPreferences.getInstance();
  final savedList = prefs.getStringList('BlackList_saved') ?? [];
  setState(() {
    Mac = savedList;
  });
  print('LOADED ON STARTUP: $Mac');
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
                  Padding(padding: const EdgeInsets.only(left: 35.0, top: 35.0),
                  child: Text('Live Our-Air Monitor',style: GoogleFonts.inter(
                    color: const Color(0xFFC3C3C3),
                    fontSize: 40,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 0.5,
                  ),),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 350, top: 25.0),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16.0,
                        vertical: 4.0,
                      ),
                      decoration:BoxDecoration(
                        color:const Color(0xFFC3C3C3),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          iconEnabledColor: const Color(0xFF1E293B),
                          value: selectedPort,
                          dropdownColor: const Color(0xFFC3C3C3),
                          borderRadius: BorderRadius.circular(10),
                          items: Ports.map((String port){
                            return DropdownMenuItem(
                                value: port,
                                child: Text(port, style:GoogleFonts.inter(
                              color: const Color(0xFF1E293B),
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              letterSpacing: 0.5,
                            ),));
                          }).toList(),
                          onChanged: (String? newvalue){
                            if(newvalue != null) {
                              setState(() {
                                selectedPort = newvalue;
                              });
                              _Click();

                            _connect(newvalue);

                            Send('WakeUp');
                            }},
                          hint: Text('Select Port',style: GoogleFonts.inter(
                            color: const Color(0xFFC3C3C3),
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 0.5,
                          ),),
                        ),
                      ),
                    )
                  ),




                  Padding(
                    padding: const EdgeInsets.only(left: 25.0, top: 25.0),
                    child: ElevatedButton(
                      onPressed: () {
                        _loadPorts();
                        _Click();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFC3C3C3),
                        fixedSize: const Size(200, 70),
                        elevation: 10,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      child: Text(
                        "Refresh",
                        style: GoogleFonts.inter(
                          color: const Color(0xFF1E293B),
                          fontSize: 35,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ),

                  ),


                  Padding(padding: const EdgeInsets.only(left:250, top: 35.0),
                    child: Text(selectedPort ??
                        'No Port Selected',style: GoogleFonts.inter(
                      color: const Color(0xFFC3C3C3),
                      fontSize: 40,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 0.5,
                    ),),
                  )
                ],
              ),

              Padding(padding:const EdgeInsets.only(left:25, top: 35.0, right: 25),
                child: Column(
                  children: [

                    Container(

                      width: double.infinity,
                      constraints: const BoxConstraints(
                        minHeight: 50,
                        maxHeight: 500,
                      ),
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: const Color(0xFFC3C3C3),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Live.isEmpty ? Text('Waiting for incoming serial data...'
                          ,style: GoogleFonts.inter(
                        color: const Color(0xFF1E293B),
                        fontSize: 28,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 0.5,
                      ),):ListView.builder(
                        shrinkWrap: true,
                        itemCount: Live.length,

                        itemBuilder: (context, index){
                          return Padding(padding: const EdgeInsets.symmetric(vertical: 4.0),
                          child: Text(
                            Live[index],
                            style: GoogleFonts.inter(
                              color: const Color(0xFF1E293B),
                              fontSize: 24,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 0.5,
                            ),
                          ),
                          );
                        },)

                    ),
                    if(selectedPort != null)
                    Padding(padding: const EdgeInsets.only(left: 25.0, top: 25.0),
                    child: Text('Connected Device: ${isNode ? "NODE" : isMaster ? "Master" : "(not a Master or Node connected)"}'
                      ,style: GoogleFonts.inter(
                      color: const Color(0xFFC3C3C3),
                      fontSize: 25,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 0.5,
                    ),),

                    ),

                    if(selectedPort != null)

                    Padding(padding: const EdgeInsets.only(left: 25.0, top: 25.0),
                    child: TextField(
                      controller: _controller,
                      style: GoogleFonts.inter(
                        color: const Color(0xFFC3C3C3),
                        fontSize: 25,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 0.5,
                      ),
                      decoration: InputDecoration(

                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: const Color(0xFFC3C3C3), width: 4),
                          borderRadius: BorderRadius.circular(12),
                        ),

                        border: InputBorder.none,
                        filled: true,
                        fillColor: const Color(0xFF1E293B),
                        labelText: 'Type ${isNode ? "Location" : isMaster ? "MacAdress" : "no Master or Node connected"}',
                        labelStyle: GoogleFonts.inter(
                          color: const Color(0xFFC3C3C3),
                          fontSize: 25,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 0.5,
                        ),

                      ),
                      onSubmitted: (String value)async{
                        Send(value);
                        _Click();
                        final prefs = await SharedPreferences.getInstance();
                        if(isMaster){
                          Mac.insert(0,_controller.text);
                          await prefs.setStringList('BlackList_saved', Mac);
                          print('Saved');

                        }

                      },
                    ),


                    ),


                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [

                        if(selectedPort != null)
                        Padding(
                          padding: const EdgeInsets.only(left: 25.0, top: 25.0),
                          child: ElevatedButton(
                            onPressed: ()async {
                              _loadPorts();
                              _Click();
                              if(isMaster == true){
                                final prefs = await SharedPreferences.getInstance();
                                final List<String>? ans = prefs.getStringList('BlackList_saved');


                                Flash(ans ?? []);
                                print('Flashed');
                              }

                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: str.isNotEmpty
                                  ? const Color(0xFF1E293B)
                                  : const Color(0xFFC3C3C3),
                              fixedSize: const Size(200, 70),
                              elevation: 10,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                            child:


                            Text(
                              "ReFlash ",
                              style: GoogleFonts.inter(
                                color: const Color(0xFF1E293B),
                                fontSize: 35,
                                fontWeight: FontWeight.w700,
                                letterSpacing: 0.5,
                              ),
                            ),
                          ),

                        ),

                      ],
                    ),
                    if(selectedPort != null)
                    Padding(padding: const EdgeInsets.only(top: 35.0,right: 50),
                      child: Text('BlackListed Devices',style: GoogleFonts.inter(
                        color: const Color(0xFFC3C3C3),
                        fontSize: 40,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 0.5,
                      ),),
                    ),
                    if(selectedPort != null)
                      Padding(
                        padding:const EdgeInsets.only(left:5, top: 35.0, right: 5),
                        child: Container(

                            width: double.infinity,
                            constraints: const BoxConstraints(
                              minHeight: 50,
                              maxHeight: 500,
                            ),
                            padding: const EdgeInsets.all(15),
                            decoration: BoxDecoration(
                              color: const Color(0xFF1E293B),
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(
                                color: const Color(0xFFC3C3C3),
                                width: 4,

                              )
                            ),
                            child: Mac.isEmpty ? Text('BlackList Empty'
                              ,style: GoogleFonts.inter(
                                color: const Color(0xFFC3C3C3),
                                fontSize: 28,
                                fontWeight: FontWeight.w700,
                                letterSpacing: 0.5,
                              ),):ListView.builder(
                              shrinkWrap: true,
                              itemCount: Mac.length,

                              itemBuilder: (context, index){
                                return Padding(padding: const EdgeInsets.symmetric(vertical: 4.0),
                                  child: Text(
                                    Mac[index],
                                    style: GoogleFonts.inter(
                                      color: const Color(0xFFC3C3C3),
                                      fontSize: 24,
                                      fontWeight: FontWeight.w600,
                                      letterSpacing: 0.5,
                                    ),
                                  ),
                                );
                              },)

                        ),
                      ),
                    if(selectedPort != null)
                    Padding(
                    padding:const EdgeInsets.only(left:5, top: 35.0, right: 5),
                      child: Container(

                          width: double.infinity,
                          constraints: const BoxConstraints(
                            minHeight: 50,
                            maxHeight: 500,
                          ),
                          padding: const EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            color: const Color(0xFFC3C3C3),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: debug.isEmpty ? Text('Waiting for incoming debug data...'
                            ,style: GoogleFonts.inter(
                              color: const Color(0xFF1E293B),
                              fontSize: 28,
                              fontWeight: FontWeight.w700,
                              letterSpacing: 0.5,
                            ),):ListView.builder(
                            shrinkWrap: true,
                            itemCount: debug.length,

                            itemBuilder: (context, index){
                              return Padding(padding: const EdgeInsets.symmetric(vertical: 4.0),
                                child: Text(
                                  debug[index],
                                  style: GoogleFonts.inter(
                                    color: const Color(0xFF1E293B),
                                    fontSize: 24,
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: 0.5,
                                  ),
                                ),
                              );
                            },)

                      ),
                    ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          if(selectedPort != null)
                          Padding(
                            padding: const EdgeInsets.only(left: 25.0, top: 25.0,bottom: 25,),
                            child: ElevatedButton(
                              onPressed: () {
                                _loadPorts();
                                _Click();
                                if(Warn == 7 || Warn > 7){
                                  Mac.clear();
                                  Warn = 0;
                                }
                                setState(() {
                                  Warn ++;
                                });
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: str.isNotEmpty
                                    ? const Color(0xFF1E293B)
                                    : const Color(0xFFC3C3C3),
                                fixedSize: const Size(500, 70),
                                elevation: 10,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                              child: Text(
                                "Wipe Mac Address data ",
                                style: GoogleFonts.inter(
                                  color: const Color(0xFF1E293B),
                                  fontSize: 35,
                                  fontWeight: FontWeight.w700,
                                  letterSpacing: 0.5,
                                ),
                              ),
                            ),

                          ),if(selectedPort != null)
                          Text('$Warn',style: GoogleFonts.inter(
                            color: const Color(0xFFC3C3C3),
                            fontSize: 45,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 0.5,
                          ),)
                        ],
                      ),

                  ],
                ),
              )
            ],
          ),
        ),

      ),
    );
  }
}



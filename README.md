<div align="center">
  <img src="https://github.com/user-attachments/assets/8586c6fd-3f75-4e56-ac96-6804116b456b" alt="image psd" style="width: 60%;">
</div>
<div align="center">


![KiCad](https://img.shields.io/badge/kicad-%2300578F.svg?style=for-the-badge&logo=kicad&logoColor=white) 
![OpenSource](https://img.shields.io/badge/Open%20Source-%232EA44F.svg?style=for-the-badge&logo=opensourceinitiative&logoColor=white) 
![Fusion360](https://img.shields.io/badge/Autodesk%20Fusion%20360-%230696D7.svg?style=for-the-badge&logo=autodesk&logoColor=white) 
![ESP32](https://img.shields.io/badge/ESP32-%23E7352C.svg?style=for-the-badge&logo=espressif&logoColor=white)
</div>

<h1 align="center">Our-Air</h1>


<h2 align ="center">A platform for Our Environment:</h2> 


<img width="1920" height="1080" alt="Untitled" src="https://github.com/user-attachments/assets/43afd81c-82f0-4f5c-99fa-1280d4dbfa6b" />


التلميذ : **مزوز أحمد الامين** 

**مسابقة الابتكار المدرسي الطبعة 2 الانظمة الذكية و انترنت الاشياء**

**هذا المشروع مفتوح المصدر تحت رخصة GNU  و هذه الجيت هاب ريبو نسخة احتياطية في حالة تلف ملفات المسابقة المرفقة** 
<h1 align="center"> 
The Problem :
</h1>


<h4 align="center"> With the overall all change with Our environment  we notice an increasing in Disasters like Air Pollution ,Wildfires
Water Pollution, Big Chemical Accidents, and environmental emergencies , but we only act when they happen , what if we 
had something , that lets us do advanced research and predicting</h4>



**Our-Air** Is a complete environmental scanning network that with the **flagship best in the world** sensors that scan for :

**Nitrogen Oxides(NOX)** : A group of very important gases because they are the same gases that cars and Factories emit 

**Volatile Organic Compounds (VOCs)** : A group of gases that is emitted from Paint, Oil Refineries, and Factories in general

**Humidity** : The consternation of vapor water in the Air , it is the Reason for Mold, and important for Respiratory Comfort 

**Temperature** : It tells us the thermal state of our environment, main reason of heatstroke

**Barometric Pressure** : It tells us the weight of the atmosphere, can be used to predict storms/rain

**Carbon Dioxide** : True sensing of the Co2 that`s  in the air we breath

**RunTime** : Nodes Up to 1.2 years of run time on 2x18650 in a parallel configuration, and Master around 87h of runtime on its backup battery 
with automatic Power Switching

---

And Our-Air has a **Desktop App** made to analyze the data both live and in a **sqlite db** format with **advanced environment researching tools** such as SQL query code field and professional graphs with a sleek design

<img width="1528" height="1080" alt="Untitled" src="https://github.com/user-attachments/assets/baa742f9-da8e-41ec-ba66-2d781803c172" />
<div align="center">
  <img src="https://img.shields.io/badge/Flutter-%2302569B.svg?style=for-the-badge&logo=Flutter&logoColor=white" alt="Flutter" />
  <img src="https://img.shields.io/badge/Dart-%230175C2.svg?style=for-the-badge&logo=Dart&logoColor=white" alt="Dart" />
  <img src="https://img.shields.io/badge/Desktop-4A154B?style=for-the-badge&logo=desktop&logoColor=white" alt="Desktop" />
</div>



---
<h1 align="center"> 
But Why Our-Air : 
</h1>

-1 Its **fully open source**  , This project does`nt have to stop its development   

-2 The sensors all have 2 common reading and those are the humidity and temperature, and this lets us compare sensor data to detect faulty sensors 

-3 Community driven nodes that the  **smart** system adds to its **network**  

-4 Achieving **Long Range** without a Lora IC, our system uses a broadcasting esp-now interface with range up to 1.5km 

-5 No encryption to the sent packets  and broadcast mode, this lets solo researchers and tech hobbyists check their local environment data , even build their own project around the sensor data

-6 Very versatile the system is dynamic so it can read multiple kinds of data , For example someone can make one that watches water level at a nearby lake,

Or someone can make a bracelet with a button to notify the nearby receiver when that the person wearing the bracelet is lost, 

<h1 align="center"> 
Our-Air Node technical details 
</h1>

<img width="1118" height="791" alt="image psd(21) - Copy" src="https://github.com/user-attachments/assets/48b14e6f-e57a-485a-bb67-363cc58d5ccc" />

<h2 align="center"> 
Schematic : 
</h2>
<img width="1138" height="779" alt="image" src="https://github.com/user-attachments/assets/2a46128f-b2b2-41e9-9b92-9849e538df58" />
<div align="center">
  <img src="https://img.shields.io/badge/Schematic-%23E34F26.svg?style=for-the-badge&logo=cisco&logoColor=white" alt="Schematic" />
</div>



<h1 align="center"> 
Rough Bom : 
</h1>


 **Microcontroller : Esp32 C3 U1 N4 , Risc-V 160Mhz , 4MB of flash memory** 

 

<h2 align="center"> 
Sensors: 
</h2>

   | Sensor| Manufacturer | Description |
| --- | --- | --- |
| Bme690 | Bosch | The bme690 is Bosch latest environment sensor , and is the worlds best general environmental sensor , it is set to Spi Mode |
| SGP41| Senisiron|one of Senisiron`s latest Sensors whats special about it is its NOX sensing|
| SCD41| Senisiron|one of the Only sensors in the World , that can truly sense CO2 in the Air| 

<h2 align="center"> 
ICs: 
</h2>

   | Ic| Manufacturer | Description |
| --- | --- | --- |
| IP2312 | Injoinic | a high end charging ic set to 3A charging, whats special about it is the buck based design allowing low heat under full load |
| TPS63802| Texas instruments  |a high efficiency Buck and Boost ic with a Input voltage of 1.2v to 5.5v and Output of 3.3v , its efficiency is 95% , at full load it reaches 45°C which prevents burnouts, and its design lets use an 18650 directly , in the pcb its  used to power the components|
| CK340k| WCH |its a USB to UART programmer, in this case its used to flash the code to the MCU , and view live data , also offering debugging for both Nodes and Master| 

<div align="center">
  <img src="https://img.shields.io/badge/PCB-%2300599C.svg?style=for-the-badge&logo=probot&logoColor=white" alt="PCB" />
</div>
<h2 align="center"> 
Pcb Specs :
</h2>

 **4 Layer Design** : a 4 layer based pcb design lets us minimize Emi Noise , Improve Stability and Reliability
 
 **TearDrops** : they Improve Reliability on the Long Run , its a must for a pcb like this that runs for long sessions
 
 **Smart heat accommodated design** : the Sensors are sensitive to heat so i designed it for thermal isolation 
 
 **Stitching Vias** : they were used to lower noise and help with heating 

 **fencing Vias** : they are used to make sure the LongRange Stays stable
 
 **External Antenna** : there is a IPX connector to connect an external Antenna
 


<div align="center">
  <img src="https://img.shields.io/badge/Case-333333?style=for-the-badge&logo=box&logoColor=white" alt="Case" />
</div>
<h1 align="center"> 
Casing Design : 
</h1>
<img width="2000" height="1414" alt="Node Case" src="https://github.com/user-attachments/assets/67b0cb87-1c66-420e-961a-1312b594845a" />

  <h2 align="center"> 
Features : 
</h2>

   **OuterWalls** : ~125mm x 98mm 
      
   **InnerWalls** : ~120mm x 95mm
     
  **Wall Thickness** : 3mm
      
   **Closing Mechanism** : Annular snap-fit with 2mm long lip and 2 vertical cuts  for easier use when closing or opening
      
   **Meterial** : TODO
      
   **Breathing Vents** : needed so the sensors can read the measurement of outside air
   
   **Ports** : there are spaces for the 2 USB C receptacles (35mm x ~4mm)and the external antenna(~7mm x ~15mm)

   <h1 align="center"> 
Our-Air Master technical details 
</h1>
<img width="1224" height="852" alt="image psd(20) - Copy" src="https://github.com/user-attachments/assets/c558ff3f-5820-443a-b2dc-36575c1bcf7e" />
<h2 align="center"> 
Schematic : 
</h2>
<img width="1160" height="818" alt="image" src="https://github.com/user-attachments/assets/68b839c4-8cf5-40aa-8aff-7454c5029f13" />

<div align="center">
  <img src="https://img.shields.io/badge/Schematic-%23E34F26.svg?style=for-the-badge&logo=cisco&logoColor=white" alt="Schematic" />
</div>

<h1 align="center"> 
Rough Bom : 
</h1>


 **Microcontroller : Esp32 C3 U1 N4 , Risc-V 160Mhz , 4MB of flash memory** 
 **SD Card (8gb)

ICs: 
</h2>

   | Ic| Manufacturer | Description |
| --- | --- | --- |
| IP2312 | Injoinic | a high end charging ic set to 3A charging, whats special about it is the buck based design allowing low heat under full load |
| TPS63802| Texas instruments  |a high efficiency Buck and Boost ic with a Input voltage of 1.2v to 5.5v and Output of 3.3v , its efficiency is 95% , at full load it reaches 45°C which prevents burnouts, and its design lets use an 18650 directly , in the pcb its  used to power the components|
| CK340k| WCH |its a USB to UART programmer, in this case its used to flash the code to the MCU , and view live data , also offering debugging for both Nodes and Master| 
| DS3231SN| Maxim Integrated |A RTC Ic (Real Time Clock ic ) used to make the timestamps of the when Sensors is received by the Master  | 
<div align="center">
  <img src="https://img.shields.io/badge/PCB-%2300599C.svg?style=for-the-badge&logo=probot&logoColor=white" alt="PCB" />
</div>
<h2 align="center"> 
Pcb Specs :
</h2>

 **4 Layer Design** : a 4 layer based pcb design lets us minimize Emi Noise , Improve Stability and Reliability
 
 **TearDrops** : they Improve Reliability on the Long Run , its a must for a pcb like this that runs for long sessions
 
 **Stitching Vias** : they were used to lower noise and help with heating 

 **fencing Vias** : they are used to make sure the LongRange Stays stable
 
 **External Antenna** : there is a IPX connector to connect an external Antenna
 


<div align="center">
  <img src="https://img.shields.io/badge/Case-333333?style=for-the-badge&logo=box&logoColor=white" alt="Case" />
</div>
<h1 align="center"> 
Casing Design : 
</h1>
<img width="2000" height="1414" alt="Master Case" src="https://github.com/user-attachments/assets/853ea033-b1f5-429c-a319-2ee3f2b41159" />


  <h2 align="center"> 
Features : 
</h2>

   **OuterWalls** : ~168mm x 107mm 
      
   **InnerWalls** : ~160mm x 100mm
     
  **Wall Thickness** : 3mm
      
   **Closing Mechanism** : Annular snap-fit with 2mm long lip and 2 vertical cuts  for easier use when closing or opening
      
   **Meterial** : TODO
   
   **Ports** : there are spaces for the 2 USB C receptacles (35mm x ~4mm)and the external antenna(~7mm x ~15mm) and Sd card ( ~60mm x 16mm) the holes for the sd card and external antenna are merged


<h1 align="center">
Node Logic  :
</h1>
<img width="2000" height="1414" alt="Node Software(1)" src="https://github.com/user-attachments/assets/915287a0-2c13-4455-9666-2c7b8185661e" />



<h3 >
An Our-Air node can last up to a whole year thanks to deepsleep and low power sensors and the explanation of the logic is as of the following:

 Deepsleep and Lightsleep timers are 15 minutes for the Deepsleep and 10 seconds for the Lightsleep

after waking up from deepsleep 

it checked for the reason of waking up this allows us to use the debugger with the nodes where when rx is low the rtc wakes up the  mcu,if the reason is the timer ended it initiates the sensors then goes to light sleep 

after light sleep it reads the sensors and makes a json packet then sends it with espnow set to broadcast mode and long range on and the send strength to 80(max)

it sends 3 times to prevent data loss 
then goes back to sleep

it had an average power consumption of 1.1mAh per hour

</h3>
<h1 align="center">
Master Logic  :
</h1>
<img width="2000" height="1414" alt="Master Software" src="https://github.com/user-attachments/assets/cc4b0673-5980-478a-999f-cff04f480f9c" />



<h3>
The Master can last almost 3 days on its backup battery,with automatic power switching from main source to backup and the explanation of the logic is as of the following:

the Master actively scans for espnow packets in Lr mode (Long Range) and deserialises it with json 

then checks if its mac address is in the blacklist

if yes it ignores the packet

if no it parses and adds a time stamp using the rtc ic it into a queue then a function that writes it into an Entity Attributed Value sqlite database on an sd card 
</h3>
<div align="center">
  <img src="https://img.shields.io/badge/APP-%23121011.svg?style=for-the-badge&logo=gnu&logoColor=white" alt="APP" /> 
</div>


<h1>
The Database viewer App :
</h1>
<img width="1528" height="1080" alt="Untitled" src="https://github.com/user-attachments/assets/baa742f9-da8e-41ec-ba66-2d781803c172" />

<h2>
It has 2 Parts :
</h2>

<h3>
-1 A tool that turns the database into Graphs to detect spikes it has 2 buttons one to select location and the other to select reading type (what reading you want to graph) then it makes a graph with zoom in and out and a slider to be able to see all of the graph 


-2 An SQL manual query code box for advanced research with a console to show errors and output then a table to see the query result 


right now it is limited to 300 rows max
</h3>
<h1>
The Live viewer App :
</h1>
<img width="1528" height="1080" alt="Untitled" src="https://github.com/user-attachments/assets/baa742f9-da8e-41ec-ba66-2d781803c172" />

<h2>
It has 3 Parts :
</h2>

<h3>
-1 A box shows live readings taken from the master through USB and updates automatically, also there is a button to select a usb port


-2 it is used to flash location and blacklist into the master and node,it automatically detectes if the plugged in is thr master or node,


if master is connected you get a text field to write MAC address of a node you want to blacklist to sent you click enter 


also there is a reflash blacklist, the app saves a copy of thr blacklist and if the master lost its blacklist you can reflash it whole


if node is connected you get a textfield
you write in the location you want to flash to the node to assign a location to it and it shows up in the database 
 
-3 a debug table that helps with debugging a broken node or master that shows debug prints 
</h3>

<div align="center">
   <img src="https://img.shields.io/badge/Flashing-%23FF6F00.svg?style=for-the-badge&logo=flashrom&logoColor=white" alt="Flashing" />
  <img src="https://img.shields.io/badge/Software-%23121011.svg?style=for-the-badge&logo=gnu&logoColor=white" alt="Software" />
</div>
<h1 align="center">
Flashing The Software
</h1>

Master / Node: 
**Flashing the Software is The Same For The Node or Master**  :  

 **-1** Make sure you Have ch340x drivers installed (or Arduino ide since it comes packaged with It)
 
 **-2** Download the .ino Sketches 
 
 **-3** Make Sure you have these libraries installed : 
 
  **For the Master .ino**: 
  
<SPI.h>,<WiFi.h>,<esp_now.h>
<Wire.h>, <sqlite3.h>,<FS.h>
<SD.h>,<RTClib.h> ,<ArduinoJson.h>
<queue>,<esp_wifi.h>,<vector>

 **For the Node .ino** : 
 
<Wire.h>, <7semi_BME690.h>, <Adafruit_SGP41.h>
<SensirionI2cScd4x.h>, <SPI.h>, <WiFi.h>
<esp_now.h>, <ArduinoJson.h>, <esp_wifi.h>

 **-4** Open Arduino Ide (platformIo and esp-idf are not supported) and load the .ino , in the "**file**" button

 **-5** plug in Node/Master through the top usb c port (lower ones are for 3A charging only )

 **-6** select the Node/Master from the COM selection button at the top 

 **-7** Click Upload ( this might Take Some time)  

  






 

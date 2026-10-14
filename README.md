<div align="center">
  <img src="https://github.com/user-attachments/assets/76a6b691-314e-4682-a79f-fa545415f097" alt="image psd" style="width: 80%;">
</div>

<h1 align="center">Our-Air</h1>

<img width="1920" height="1080" alt="Untitled" src="https://github.com/user-attachments/assets/43afd81c-82f0-4f5c-99fa-1280d4dbfa6b" />
<div align="center">

![KiCad](https://img.shields.io/badge/kicad-%2300578F.svg?style=for-the-badge&logo=kicad&logoColor=white) 
![OpenSource](https://img.shields.io/badge/Open%20Source-%232EA44F.svg?style=for-the-badge&logo=opensourceinitiative&logoColor=white) 
![Fusion360](https://img.shields.io/badge/Autodesk%20Fusion%20360-%230696D7.svg?style=for-the-badge&logo=autodesk&logoColor=white) 
![ESP32](https://img.shields.io/badge/ESP32-%23E7352C.svg?style=for-the-badge&logo=espressif&logoColor=white)
</div>

<h2 align ="center">A platform for Our Environment:</h2> 


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

**RunTime** : Nodes Up to 2 years of run time on 2x18650 in a parallel configuration, and Master around 87h of runtime on its backup battery 

---

And Our-Air has a **Desktop App** made to analyze the data both live and in a **sqlite db** format with **advanced environment researching tools** such as SQL query code field and professional graphs with a sleek design

<img width="1528" height="1080" alt="Untitled" src="https://github.com/user-attachments/assets/baa742f9-da8e-41ec-ba66-2d781803c172" />



---
<h1 align="center"> 
But Why Our-Air : 
</h1>

-1 Its **fully open source**  , This project does`nt have to stop its development   

-2 The sensors all have 2 common reading and those are the humidity and temperature, and this lets us compare sensor data to detect faulty sensors 

-3 Community driven nodes that the  **smart** system adds to its **network**  

-4 Achieving **Long Range** without a Lora IC, our system uses a broadcasting esp-now interface with range up to 1.5km 

-5 No encryption to the sent packets  and broadcast mode, this lets solo researchers and tech hobbyists check their local environment data , even build their own 
project around the sensor data

-6 Very versatile the system is dynamic so it can read multiple kinds of data , For example someone can make one that watches water level at a nearby lake, Or someone can make a
bracelet with a button to notify the nearby receiver when that the person wearing the bracelet is lost, 

<h1 align="center"> 
Our-Air Node technical details 
</h1>

<img width="1118" height="791" alt="image psd(21) - Copy" src="https://github.com/user-attachments/assets/48b14e6f-e57a-485a-bb67-363cc58d5ccc" />

<h2 align="center"> 
Schematic : 
</h2>
<img width="1138" height="779" alt="image" src="https://github.com/user-attachments/assets/2a46128f-b2b2-41e9-9b92-9849e538df58" />



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


<h2 align="center"> 
Pcb Specs :
</h2>

 **4 Layer Design** : a 4 layer based pcb design lets us minimize Emi Noise , Improve Stability and Reliability
 
 **TearDrops** : they Improve Reliability on the Long Run , its a must for a pcb like this that runs for long sessions
 
 **Smart heat accommodated design** : the Sensors are sensitive to heat so i designed it for thermal isolation 
 
 **Stitching Vias** : they were used to lower noise and help with heating 

 **fencing Vias** : they are used to make sure the LongRange Stays stable
 
 **External Antenna** : there is a IPX connector to connect an external Antenna
 



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

<h2 align="center"> 
Pcb Specs :
</h2>

 **4 Layer Design** : a 4 layer based pcb design lets us minimize Emi Noise , Improve Stability and Reliability
 
 **TearDrops** : they Improve Reliability on the Long Run , its a must for a pcb like this that runs for long sessions
 
 **Stitching Vias** : they were used to lower noise and help with heating 

 **fencing Vias** : they are used to make sure the LongRange Stays stable
 
 **External Antenna** : there is a IPX connector to connect an external Antenna
 



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
   






 

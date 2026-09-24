# Our-Air
<img width="1920" height="1080" alt="Untitled" src="https://github.com/user-attachments/assets/43afd81c-82f0-4f5c-99fa-1280d4dbfa6b" />

**An platform for Our Environment** : 
---

التلميذ : **مزوز أحمد الامين** 

**مسابقة الابتكار المدرسي الطبعة 2 الانظمة الذكية و انترنت الاشياء**

**هذا المشروع مفتوح المصدر تحت رخصة GNU  و هذه الجيت هاب ريبو نسخة احتياطية في حالة تلف ملفات المسابقة المرفقة** 

# The Problem :

With the overall all change with Our environment  we notice an increasing in Disasters like Air Pollution ,Wildfires
Water Pollution, Big Chemical Accidents, and environmental emergencies , but we only act when they happen , what if we 
had something , that lets us do advanced research and predicting,



**Our-Air** Is a complete environmental scanning network that with the **flagship best in the world** sensors that scan for :

**Nitrogen Oxides(NOX)** : A group of very important gases because they are the same gases that cars and Factories emit 

**Volatile Organic Compounds (VOCs)** : A group of gases that is emitted from Paint, Oil Refineries, and Factories in general

**Humidity** : The consternation of vapor water in the Air , it is the Reason for Mold, and important for Respiratory Comfort 

**Temperature** : It tells us the thermal state of our environment, main reason of heatstroke

**Barometric Pressure** : It tells us the weight of the atmosphere, can be used to predict storms/rain

**Carbon Dioxide** : True sensing of the Co2 that`s  in the air we breath

**RunTime** : Nodes Up to 2 years of run time on 2x18650 in a parallel configuration, and Receiver around 87h of runtime on its backup battery 

---

And Our-Air has a **Desktop App** made to analyze the data both live and in a **sqlite db** format with **advanced environment researching tools** such as SQL query code field and professional graphs with a sleek 
design

---
# But Why Our-Air :

-1 Its **fully open source**  , This project does`nt have to end with me 

-2 The sensors all have 2 common reading and those are the humidity and temperature, and this lets us compare sensor data to detect faulty sensors 

-3 Community driven nodes that the  **smart** system adds to its **network** 

-4 Achieving **Long Range** without a Lora IC, our system uses a broadcasting esp-now interface with range up to 1.5km

-5 No encryption to the sent packets  and broadcast mode, this lets solo researchers and tech hobbyists check their local environment data , even build their own 
project around the sensor data

-6 Very versatile the system is dynamic so it can read multiple kinds of data , For example someone can make one that watches water level at a nearby lake, Or someone can make a
bracelet with a button to notify the nearby receiver when that the person wearing the bracelet is lost, 

# Our-Air Node technical details 

<img width="1118" height="791" alt="image psd(21) - Copy" src="https://github.com/user-attachments/assets/48b14e6f-e57a-485a-bb67-363cc58d5ccc" />

**The Pcb :** 
<img width="1153" height="790" alt="image" src="https://github.com/user-attachments/assets/ef8af99f-2008-4cb0-a368-d47398fc7353" />

# Technical details :


 # Microcontroller : Esp32 C3 U1 N4 , Risc-V 160Mhz , 4MB of flash memory 

 
 # Sensors: 
 
 **Bme690 By Bosch** : The bme690 is Bosch latest environment sensor , and is the worlds best general environmental sensor , it is set to Spi Mode 
 
 **SGP41 By Senisiron** : one of Senisiron`s latest Sensors whats special about it is its NOX sensing
 
 **SCD41 By Senisiron** : one of the Only sensors in the World , that can truly sense CO2 in the Air

  # Ic`s

  **IP2312 :** a high end charging ic set to 3A charging, whats special about it is the buck based design allowing low heat under full load 

  **TPS63802 By Ti :** a high efficiency Buck and Boost ic with a Input voltage of 1.2v to 5.5v and Output of 3.3v , its efficiency is 95% , at full load it reaches 
  45°C which prevents burnouts, and its design lets use an 18650 directly , in the pcb its  used to power the components

  **CK340k By WCH : ** its a USB to UART programmer, in this case its used to flash the code to the MCU , and debug with the project debugger app

  

 

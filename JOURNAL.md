---
title: "Our-Air"
author: "CORE"
description: "Our-Air is a example of a platform i made (in making) that is used to monitor our environment and help with advanced research with 2 years of life time (per our air node)   also im using this project to participate in a national competition\n"
created_at: "2026-08-05"
---

# 2026-09-22: node

**Total time spent: 0.6 hours**

so i added the ciruitery for the node pcb also i found that the cs pin was shorted becuase i didnt use global labels,also i added silk screen with my name and license type, and i adjusted the node case to fit and a dding a hole for the new usb c port, i resized the master caseto fit and added a whole for the new usb c port ![image.png](https://cdn.hackclub.com/01a0ca9d-5f32-748d-aa76-460409bf0d86/image.png)![image.png](https://cdn.hackclub.com/01a0ca9d-62a1-781b-92c0-64e71a90d986/image.png)![image.png](https://cdn.hackclub.com/01a0ca9d-6f3b-704f-a453-17fa0b255fca/image.png)![image.png](https://cdn.hackclub.com/01a0ca9d-7b63-7ef1-9414-fcd36cf119c7/image.png) i still need to run the design through jlcdfm

# 2026-09-22: master done

**Total time spent: 0.5 hours**

i just finished the master ch340k pcb and i just couldnt tie  A6 to B6 and A7 to B7 its not needed but it will make the usb c port only work  like i just couldnt make the traces the same length ( A6 to B6 and A7 to B7) but for the ones going to the ch340k programmer i made them a differential pair and i ran drc and fixed the errors![image.png](https://cdn.hackclub.com/01a0c9eb-c602-72f4-9bfe-268c4a5ac69b/image.png)

# 2026-09-22: new  app

**Total time spent: 1.5 hours**

there is one thing i forgot about and its that the project needs a live data app rn i made the ui and i did some research , the only way for esp to talk to pc reliably is through usb , but it cant send the data why? becuase it doesnt have a usb interface , after some thinking and looking over other alternativs, the best way ifound was to integrated a usb to uart bridge like the ch340k, and i can also use it as a programmer i will add it to both pcbsand i might need to change the case of both pcbs![image.png](https://cdn.hackclub.com/01a0c9c3-2364-74d1-bbee-0f9070a2b40b/image.png)![image.png](https://cdn.hackclub.com/01a0c9c3-309e-738e-b9b5-533c358243cb/image.png)![image.png](https://cdn.hackclub.com/01a0c9c3-7988-7e0a-86cb-044bb6cf5916/image.png)

# 2026-09-21: more work

**Total time spent: 0.7 hours**

i debugged the master code it wasnt  as much as the node one only just a few bugs, then i was going over some designs for the software  banner ![image.png](https://cdn.hackclub.com/01a0c5d5-4748-77e7-b116-904a7334eb34/image.png)i was going to choose this but it just felt low quality and out of place so guess what ii added a software sympole to the pcb ones font name is Jet Brains Mono![Master_Software.png](https://cdn.hackclub.com/01a0c5d6-a857-7016-ac4f-12625c044681/Master_Software.png)![Node_Software_1_.png](https://cdn.hackclub.com/01a0c5d6-c4fd-7143-b505-c5c76672742a/Node_Software_1_.png)![Node_Case.png](https://cdn.hackclub.com/01a0c5d6-d67d-7468-9293-db317d9182ad/Node_Case.png)![Master_Case.png](https://cdn.hackclub.com/01a0c5d6-de29-7bdd-a110-024754b392dd/Master_Case.png)

# 2026-09-21: debugging

**Total time spent: 1.1 hours**

firstly i "fixed" the flutter ui issue idk how, but it somehow fixed itself, secondly i finished the fusion drawings for the project, (i still need to add text in canva), then i started debugging the node code it was full of bugs it took a lot time but with the precompile tool is sped up  the debugging just imagine if i had to guess every bug, and the scd 7semi lib is messed up and faulty so i switched it for the SensirionI2cScd4x lib ![image.png](https://cdn.hackclub.com/01a0c54c-fcac-7fea-abc7-b8d1cfe69571/image.png)![image.psd_19_-_Copy.png](https://cdn.hackclub.com/01a0c54d-5e66-7bd3-8b15-adee15259e95/image.psd_19_-_Copy.png)
![image.psd_20_-_Copy.png](https://cdn.hackclub.com/01a0c54d-5f15-7ec8-80e9-e31adbb71205/image.psd_20_-_Copy.png)
![image.psd_21_-_Copy.png](https://cdn.hackclub.com/01a0c54d-5f7c-748e-a62a-8ffbb2f5bfbc/image.psd_21_-_Copy.png)
![mecha.PNG](https://cdn.hackclub.com/01a0c54d-601d-759d-ba03-96dd7eec5345/mecha.PNG)
![image.png](https://cdn.hackclub.com/01a0c54d-9a75-79fd-ad6b-7e844a0ae4fb/image.png)![image.png](https://cdn.hackclub.com/01a0c54d-b861-725c-bb7b-d3c865af71d6/image.png)

# 2026-09-21: price 

**Total time spent: 0.2 hours**

guess what my coupons expired which drove the price to 575$dollars, i though about buying from lcsc and soldering when they arrive then i checked lcsc site but some parts are reserved for jlc pcba service and its pretty hard to hand solder 0603 passives, also i made the drawing for the master case now im going to make the pcb drawings then the software ones ![image.png](https://cdn.hackclub.com/01a0c4d6-f897-7442-8ba2-aeac847ce386/image.png)![image.png](https://cdn.hackclub.com/01a0c4d7-032d-724b-afb7-2baa8a28f6bd/image.png)

# 2026-09-20: review

**Total time spent: 0.2 hours**

so i did some pcb review of the node and master , it seems to all check out , i also checked the power consumption of the master and its a good  ~90mA which gives it 3days of runtime![image.png](https://cdn.hackclub.com/01a0c0c1-4552-7120-a039-c5144cdca39e/image.png)![image.png](https://cdn.hackclub.com/01a0c0c1-9730-7b17-9662-835a6cf12c68/image.png)

# 2026-09-20: mech

**Total time spent: 0.7 hours**

so i decided to start make the files for the github repo and competetion files i started by using the drawing tool in fusion which was hard and i didnt know anything about it , i made the photo for the mechanical design (the node one) till now i still dont understand projected view and that stuff!![mecha.PNG](https://cdn.hackclub.com/01a0c080-3c3b-7e07-88f4-22d15d185ae4/mecha.PNG)

# 2026-09-20: almost done 

**Total time spent: 0.9 hours**

so i have finished the app the only thing left is ui debugging, i added a run query button a debug console and the table , it works but there are some ui issues as you see in the photo  that i need to fix, i had lots of problems with semi coloms and commas because in the table part dart logic that uses ; was mixed with ui logic that uses , ![image.png](https://cdn.hackclub.com/01a0bfc3-e2b6-77e2-9a27-a60a86288b9b/image.png)![image.png](https://cdn.hackclub.com/01a0bfc3-fd37-71e5-9465-2c76ef18ef5f/image.png)

# 2026-09-19: fixes 

**Total time spent: 0.43 hours**

so i did some testing and i realised you can only type 10 lines then the codefield before pixels overflowed so i fixed it by adding a Boxconstraint and setting the minheight 20 and the max 2500 which should be enough unless you are some cracked researcher that wants to know everything, also i fixed another issue that was the readingtype dropdown button showed all the readingtypes of all locations this would result in confusing ui , and error if you choose a readingtype the selected location does not have , so i made the readingtype button reletive to the location one  and when no reading types are select it selects the first one on the list of that location![image.png](https://cdn.hackclub.com/01a0bb7a-9305-7e1a-a40d-15c531759f01/image.png)![image.png](https://cdn.hackclub.com/01a0bb7a-d59a-7190-a83b-23e755bc6541/image.png)

# 2026-09-19: LR and codefield

**Total time spent: 1 hour**

so i came by a vid talking about the espnow  LR mode (long range),so i did some research  and its true there is a espnow lr mode but it prone to packets losses but in my case its ok so i added it to the reciever and sender also i cranked the tx and rx power to the max 82 i think, then i added the  code field it was kinda hard because the pub dev wasnt really documented properly and it was made for dart lang so  i switched it to sql , but the ui looked off and i realized the issue the Codetheme widget wasnt so customizable, so i made a container widget and added codetheme widget because it was needed for codefield to work but i made everything in it transparent(the Codetheme widget) ![image.png](https://cdn.hackclub.com/01a0b9c2-2134-708f-b01b-52a2aa4b684e/image.png) ![image.png](https://cdn.hackclub.com/01a0b9c2-71d2-7d69-a5c7-dc997ff50370/image.png) i still need to make the query logic and run button and table


# 2026-09-18: sql box

**Total time spent: 0.5 hours**

so i added a simple text as you see in the photo i also did some research and i was goingto use a textbox widget but then i looked at some sql query apps and they all seem to be using a library called CodeField that lets you hardcode a lang and then the text will be the same as an ide , i installed the needed libs which were tricky because i am using an older version of flutter sdk ![image.png](https://cdn.hackclub.com/01a0b62d-c443-7ee1-8e28-3051dac30f6b/image.png)![image.png](https://cdn.hackclub.com/01a0b62d-d0b6-7bc0-a201-87d40a98bbe6/image.png)![image.png](https://cdn.hackclub.com/01a0b62d-f4bf-7c6b-a404-73130da2b5f5/image.png) example of the CodeField![image.png](https://cdn.hackclub.com/01a0b62e-44f4-740d-aa36-402e43e6b1fd/image.png)

# 2026-09-18: graph done 

**Total time spent: 1.1 hours**

so i made the x and y logic for the graphing and fixed issues like , the old time thing at the bottom only showed day and month i fixed it to show month hour year , and there was this thing when you hover over the graph it shows you the data at  the point you hover at it had the old $ sign and colors and i tried to make a thing where if you had humidity it would show % or ppm indicators to type of reading ,i scrapped that idea because i want it to be dynamic so it will be embedded to the db reading_type for example one of the reading is called humi , instead of humi it will be "humi (%)" i  also need to work on  the  dropdown buttons imagine you choose a  reading then location that would crash the app (currently i havent added the indicators im still using the same db) ![image.png](https://cdn.hackclub.com/01a0b5cd-524c-711b-b56c-9ef8d4139eb1/image.png) and hackatime proof ![image.png](https://cdn.hackclub.com/01a0b5ce-03e9-7bcc-881c-78e92d677fb7/image.png)

# 2026-09-18: ui

**Total time spent: 0.2 hours**

so i just added the readingtype and locations to the ui i had some issues because of the hardcoded ones and thier var names  ,now im going to make the x and y logic , its not gonna be hard because  i already made thhe sqflite logic for the eav ![image.png](https://cdn.hackclub.com/01a0b4af-0a91-7308-a166-93e183812936/image.png)![image.png](https://cdn.hackclub.com/01a0b4af-1283-7abc-91c5-0ae56983874a/image.png)

# 2026-09-17: sqflite

**Total time spent: 1.1 hours**

even though sqflite lib is popular i couldnt really find much documentation on usage examples but after some time i got the hang of it , so i started by fixing an issue with the graph is that it would overflow horizontally will a single line ( clipData: const FlClipData.all(),) also i looked back at the website app of the fl chart and i noticed my app version does not have a move right move left button so i added them , then i went to the sqflite logic and its not that complicated with normal db but because mine was eav it was kinda tricky i made the drop down menu logic (i havent added it to the ui) by using sql queries to get DISTINCT locations and reading types ![image.png](https://cdn.hackclub.com/01a0af6d-b7f5-71da-b134-58e2592878e6/image.png)![image.png](https://cdn.hackclub.com/01a0af6d-e33d-7ac5-ba67-0ee38036fefa/image.png)

# 2026-09-16: sfx

**Total time spent: 0.4 hours**

so i came across some app ad and i noticed something the buttons had sfx, i liked the idea so i went to pixabay and got some sfx i tested some of them  and tried to modify one , but in the end i liked one of them i dont know how to express how it sounds , its  like "click" but sleek premium  ![image.png](https://cdn.hackclub.com/01a0ab8a-cfdd-76ce-a630-21c5efcdf4c5/image.png)

# 2026-09-16: stealthy

**Total time spent: 0.3 hours**

so i made the reading type and location buttons disappear while there is no db selected by makiing thier color blend in with the background ![image.png](https://cdn.hackclub.com/01a0aa98-7404-7986-9b53-a60f68029810/image.png)

# 2026-09-16: time flies

**Total time spent: 1.5 hours**

so i added the select reading button and location button and made it so that you can only choose one at a time , also i had a lot of trouble in the ui because the 2 dropdown buttons overlap took some time to fix it i also made the init code for the sqflite lib![image.png](https://cdn.hackclub.com/01a0aa40-ff07-7e54-894c-a6e2cf951602/image.png) ![image.png](https://cdn.hackclub.com/01a0aa41-9858-7954-bb6e-354e35a1f713/image.png) now the table and sqflite logic is left 

# 2026-09-15: graph

**Total time spent: 0.8 hours**

so i fixed the ui issue by wrapping the whole thing in a colowm widgeti added the graph but its displaying the old example data i also need to add select reading and node buttons ![image.png](https://cdn.hackclub.com/01a0a731-089a-71f2-bd7e-ee3f2ba46943/image.png)

# 2026-09-15: graph logic

**Total time spent: 0.1 hours**

i think i overthinked the graph logic part, i thought about it for some time and i even tried making a py script to help me make the logic , now i think about it its really simple just make the timestamp the x position and the readings the y position![image.png](https://cdn.hackclub.com/01a0a4a3-53f9-7e51-b4e2-8531600c9b1e/image.png)

# 2026-09-15: button

**Total time spent: 0.3 hours**

so i finished the select db logic and i even added a indicator to show which db is selected  i had some issues with the dbname var not showing in the indicator so i wrapped it with setstate function
i still havent figured a way to turn the db data into x and y positions ![image.png](https://cdn.hackclub.com/01a0a495-9625-7dcb-a8d0-6b9d942e2207/image.png)

# 2026-09-14: path

**Total time spent: 0.4 hours**

so i found out the filepicker lib cant save directories so i reimported path lib im almost going to finish the logic of it ![image.png](https://cdn.hackclub.com/01a0a1bf-3cf5-74ac-8621-2fda875852c4/image.png)

# 2026-09-14: render and firmware 

**Total time spent: 0.67 hours**

ok so i did some compositing and i made the render and saved it as you see its in the forge project thumbnail, then i went to the app i did somewhat of a redesign i went with another theme i liked  its based on the render and i make the button for the data base path select and i changed the lib of "path" to 'file_picker' because path only used permenant path hardcoded ![image.png](https://cdn.hackclub.com/01a0a155-f6f2-7e6d-ab87-b173af57fea6/image.png)![Uploading image.png...]()

# 2026-09-13: background: Color.#1E293B,

**Total time spent: 0.5 hours**

so i tested more colors for the background of the render its #1E293B a dark blue that goes really well with the depth lighting, and i exported the casing of the master and preped it (the top and buttom dont come separated) im going to use this render for the banner of  the forge project![image.png](https://cdn.hackclub.com/01a09ca9-ad65-733c-b7c6-fd507973724c/image.png)

# 2026-09-13: blender 

**Total time spent: 1 hour**

so i started with the animation but im still choosing a style i kinda wanna do a white theme but the app is dark theme,  ,the dark theme i have done many times before , and i wanna switch up things im still not sure i made 2 renders with simple compositing to help me choose but still im  not sure ![image.png](https://cdn.hackclub.com/01a09b2d-2444-7eea-9678-e857815151f0/image.png)![0.5.PNG](https://cdn.hackclub.com/01a09b2d-4918-7fa2-9fef-8d2cc94abc89/0.5.PNG)

# 2026-09-13: this is gonna take some time 

**Total time spent: 1.5 hours**

i just realized that im really bad at flutter and for a minute i forgot everything , thankfully i remembered  and started coding as you see in the upload the top left rectangle is for the db path button and the broken one right to it is the table for the data , i still dont know what the issue is but it wont center ![image.png](https://cdn.hackclub.com/01a09af0-6c2a-7964-9b96-702713012c10/image.png) and i checked the master pcb price . . . 200$  which mean the total is 532$ ![image.png](https://cdn.hackclub.com/01a09afb-db9a-704a-b693-235e6884bbd3/image.png) and i  need to finish and get enough hours before September 28

# 2026-09-12: more research

**Total time spent: 0.3 hours**

so i researched how the libs work and looked at some examples to use the fl chart i need to somehow convert the db data to x and y positions,also i am also going to add a normal sql command based searcher  because my old idea was just like the sqlite web viewer was a search bar based and it was simple every one can understand it but it  had limitation for example if you want to check the time where humidity is 30% and temperature is 25°C  you can only check one at a time but with the sql commands you can even check average peak lowest  but its not that easy , also i was going to use drift instead of sqflite_ffi_common lib but then i found out sqflite_ffi_common had more support on pc , i also found some similar apps made with flutter im gonna take inspiration  from them , and i made new project file because the old one just seemed to not work no matter what i try  and im trying out some graph designs i think a dark theme is better ![image.png](https://cdn.hackclub.com/01a096ff-7d93-7fbf-b46c-7a0116985c97/image.png)

# 2026-09-12: app

**Total time spent: 0.7 hours**

so i was checking out the premade designs on the fl chart app and i liked the bitcoin one becuase of its zoom in feature and i even got it to run on my pc and after lots of tries because im using anolder flutter sdk version , also i think the pdf idea is bad becuase for example a whole month of readings is arounnd 11000 readings which when put in a pdf its hard to read accuratly and its impossible for a printer to print that kind of pdf , so now the app is a db monitor with the normal sql browser and a cool looking graph(ignor the overflow in the image im still modifying it ) ![image.png](https://cdn.hackclub.com/01a09586-e652-748f-a2e0-6ca90f3955d5/image.png)

# 2026-09-11: app design

**Total time spent: 1.1 hours**

so i did lots of research , at first i thought it was simple but it turns out the libs im using are harder than i though , also i made a python script to make a sqlite .db  file to test the app even though i forgot to add location to it but its ok, i tried explain my app idea to gemini to get a base design for the app but it would add things and mess up others  and i am going to also have a db viewer in the app, i have a rough idea im gonna explain , in the photo you see a online sqlite db viewer the app design will be similar but it would have a sleek not dark dark blue /white  design in the top left "Our-Air Database Monitor" then in the top right the pdf export button and the other part of the screen is going to be a db viewer very similar to the one in the upload ![image.png](https://cdn.hackclub.com/01a0920f-60fd-73d6-a2d5-f81f29812a88/image.png)

# 2026-09-10: pcb files

**Total time spent: 0.15 hours**

so after i did the redesigns i have to redo the pcb production files so i did them and put them in seperate files ![image.png](https://cdn.hackclub.com/01a08c20-1e12-73ee-9221-f621d31e0878/image.png)

# 2026-09-10: master done 

**Total time spent: 1 hour**

finally i finished the master code i fixed some bugs (js some typos) and made a func called butter (dont ask me why that name) that checks the queue brings up  the one in front puts it in a json document and deserializes it then inserts to db (obviously its not that simple i added failsafes and  a thing that detects corrupt data and if the json format is right) ![image.png](https://cdn.hackclub.com/01a08b8d-674f-73f1-b294-90df9f899e1f/image.png)  
and i gave gemini the db structure and told it to make a example ![image.png](https://cdn.hackclub.com/01a08b8b-cb6e-7e93-af8f-1ccb7bdfd34a/image.png)  and i researched the libs for the graph maker  so the plan is fl chart makes the graph and widget_image converts into an image then the pdf lib makes the pdf file 


# 2026-09-09: flutter app 

**Total time spent: 0.15 hours**

so i created the flutter file and linked to hackatime for the app and i rethinked the idea of the LLM (gemma e2b)  the reason i even added to the project is for the wow factor but now it has became a major bottleneck becuase it will make coding the app hard since with every hot reload the model has to reload and the output of the graph maker will be big , were are talking about 30mB per image which is large and i made it so to be able to zoom in and not loss any details or  readings ![image.png](https://cdn.hackclub.com/01a087a2-7050-797a-898b-8b0f2c57d004/image.png)

# 2026-09-09: READandWrite

**Total time spent: 0.97 hours**

so i made a function for the master to read the espnow data and prepare a packet for it it starts wih defining the sender  info and messege length then it makes a json header +1 and converts the raw bytes to json then turns the mac address into a char variable then it gets the time by calling another function TIMEcall() and converts from the custom datatype DateTime to a string then a line prepares everything sensor data and mac and timestamp also i made a function that lets me use sql commands like READ WRITE and more and i added a queue thing because the writing might be slow  ![image.png](https://cdn.hackclub.com/01a08674-95aa-7f3e-8e3f-03f0196eabc6/image.png)

# 2026-09-09: almost done 

**Total time spent: 0.97 hours**

so i made a function for the master to read the espnow data and prepare a packet for it it starts wih defining the sender  info and messege length then it makes a json header +1 and converts the raw bytes to json then turns the mac address into a char variable then it gets the time by calling another function TIMEcall() and converts from the custom datatype DateTime to a string then a line prepares everything sensor data and mac and timestamp also i made a function that lets me use sql commands like READ WRITE and more ![Uploading image.png...]()

# 2026-09-08: JSON

**Total time spent: 1.1 hours**

so i added stitching vias to the node pcb  and i now know why the plugins werent working its because in the board setup via settings it was set that vias are not fixed to the net they are assigned so if i made a bunch of vias not connected to any traces they will be all random nets even if i declare them for the GND net , also i switched the   esp now sending from struct to json to be  able to recieve from many differant nodes  ( and community made ones ) what was frustrating was it was hard finding a forum talking about json and esp now but i made it work and even set a limit for the json (250bytes) ![image.png](https://cdn.hackclub.com/01a082f8-6635-73f6-9ac4-12fe0596132f/image.png)![image.png](https://cdn.hackclub.com/01a082f8-6712-70f0-88b8-b977d24c4a4c/image.png)

# 2026-09-07: some redesign

**Total time spent: 2 hours**

so i redid some redesign like adding copper fills on the top and buttom layers and redoing the stitching vias , i was going to use a stitching via addon but kicad 10.0 is just so unsupported of a version that  any addon i try does not work i even got one that was patched to work w 10.0 and it didnt work so i got a via assigned it a netlist (GND) and used the manual create array tool ![image.png](https://cdn.hackclub.com/01a07d98-c971-7a92-8bed-cb6a7a6d812e/image.png) ( also i have to redo the bom and blender 3d model and i scaled  the casing of the node by 1.01 to insure the pcb will fit in it ) 

# 2026-09-06: pcb and master

**Total time spent: 0.5 hours**

so ireasearched the libs needed for the master (sd sqlite rtc ) and i imported them also i checked with jlc3d service and the 3d case is around 30$ im gonna order from jlc in case my 3d printer takes long to ship (and i  setup the rtc start date as my bday) , ![image.png](https://cdn.hackclub.com/01a07730-8a59-7fa3-9677-983de699fbad/image.png) then i went and connected the BATT+ and VBAT of the rtc ic to act as a backup battery  ![image.png](https://cdn.hackclub.com/01a07731-7b02-73a6-a106-41ad12bd6efb/image.png)

# 2026-09-06: finished node code

**Total time spent: 0.51 hours**

so i just finished the node code i added the packaging of the espnow packet , and i debugged but still there might be other issues i need to fix only after i get the pcbs, now i will make the master code ![image.png](https://cdn.hackclub.com/01a076a3-b20e-7fc5-8152-d344394c0625/image.png)

# 2026-09-05: espnow

**Total time spent: 0.56 hours**

man i thought espnow was easy , it wasnt i realized i had to save peer data and sometimes the espnow just does not send the data so you have to check , rn the last thing i have to do is adding packaging to the Read() function![image.png](https://cdn.hackclub.com/01a07365-c932-71fb-82ec-45158b5fe215/image.png)

# 2026-09-05: more coding

**Total time spent: 0.5 hours**

so i did more coding and i realized that i couldnt add timer interrupts to fix the cpu blocking , so i reemoved the function for reading each sensor and put in in one function and structured them in a way were the sensors (bme and scd) start before the sgp calibration which takes 10 sec and the good thing about them (bme and scd) is their reading does not block  that means they can read sorta parallal , also  i made the deepsleep and lightsleep logic which was tricky because they share the same timer    function ![image.png](https://cdn.hackclub.com/01a071a3-f4df-7a3a-8c7f-d25155b07cf1/image.png)

# 2026-09-04: log hackatime 

**Total time spent: 1.97 hours**

so i am not sure of this fact (the smith told me about it ) is that i have to log the hackatime time this journal is to do that , im still working on the node code  , and i had some issues with timer interrupts and cpu blocking ![image.png](https://cdn.hackclub.com/01a06d5a-3373-7dbb-b45b-8b7de42f8031/image.png)

# 2026-09-04: redesign

**Total time spent: 1 hour**

was it hard to get the real datasheet for the rtc ic (DS3231SN) it took some time to find it and i added it to the pcb design  also i added stitching vias to reduce noise and made the clearance area a bit bigger ![image.png](https://cdn.hackclub.com/01a06cd7-7334-7955-ab11-c64d092c535e/image.png)

# 2026-09-03: redesign?

**Total time spent: 0.2 hours**

so i was thinking about the timestamp feature , and i realized that the node cant send the  timestamps reliably because of rtc drift and time limit, so the node sends the sensor data and the master  adds the timestamp , but that would mean i have to add a detecated RTC ic , maybe DS3231SN#? idk im still trying to find a good ic ![Uploading image.png...]()

# 2026-09-03: devlog : 1

**Total time spent: 0 hours**

this is a devlog with no time logged because im using hackatime , ok i made the init logic for all the sensors and read logic but i might tweak it a bit (the scd one) and i need to add timer interrupts to be able to start sensors reading at the same time ![image.png](https://cdn.hackclub.com/01a0674b-f01b-7125-96f1-f742ca1b1666/image.png)

# 2026-09-02: libs

**Total time spent: 0.4 hours**

so i did some research on the libraries for the esp32 node code and in the upload you will see  the sensor libraries i selected each of them and i used 7semi libraries for the bme690 and scd41 because theirs had good support and good examples to get inspo from there is more to do like defining the i2c and spi pins and espnow protoccol![image.png](https://cdn.hackclub.com/01a063d9-a732-7117-8a91-46c441ebd3af/image.png)

# 2026-09-02: verifying

**Total time spent: 0.9 hours**

so i exported the 3d models from kicad as .step to get real meassurements and i imported them to fusion360(which took sometime because it was my first time importing) andthe node case matched but the master one was a bit too big so i scaled it down but still its still a little too long and i made some sliced photos(they looked better in my head) ![image.png](https://cdn.hackclub.com/01a061fc-1d34-77a6-b8bb-155c0a6752ef/image.png)![image.png](https://cdn.hackclub.com/01a061fc-266f-7f6a-a2fc-17d58199e505/image.png)

# 2026-09-02: verifying

**Total time spent: 0.9 hours**

so i exported the 3d models from kicad as .step to get real meassurements and i imported them to fusion360(which took sometime because it was my first time importing) andthe node case matched but the master one was a bit too big so i scaled it down but still its still a little too long and i made some sliced photos(they looked better in my head) ![image.png](https://cdn.hackclub.com/01a061fc-1d34-77a6-b8bb-155c0a6752ef/image.png)![image.png](https://cdn.hackclub.com/01a061fc-266f-7f6a-a2fc-17d58199e505/image.png)

# 2026-09-01: ahhhhh

**Total time spent: 2 hours**

i hate uv unwraping , like if the uv unwrap isnt good the texture messes up, it took me a long time to uv unwrap the new models , i finished the models for the pcbs(note these models are going to be used in the presentation video they dont have to be accurate 100%) then i fixed the master case now it 159mm x107mm ![image.png](https://cdn.hackclub.com/01a05cfc-94e6-7964-a0b4-2124dafdd5b6/![image.png](https://cdn.hackclub.com/01a05cfc-af43-7903-bced-633cd2723329/image.png)image.png)![image.png](https://cdn.hackclub.com/01a05cfc-bc06-7727-8578-5643a338e3ab/image.png)
![image.png](https://cdn.hackclub.com/01a05cfc-f8a5-7e13-9fd6-c3d5cd81d84e/image.png)

# 2026-08-31: man i knew something would go wrong

**Total time spent: 3 hours**

so i exported the pcb model in glb to use in blender but guess what no matter how much i uv wrap the texture would stay messed up because of the bad topology so i remodeled the pcb part and i added the missing models of the stuf rn i only did the master one because guess what i realized the footprint i used for the sd card does not match up with the jlc one i selected for pcba so i got an easy eda downloader for kicad and got the new footprint but i had to tweak it because the way the pads where named wasnt like the older one , and i have to remodel the case for the master bacause now the pcb is 155mm long and the case is 149mm long  ![image.png](https://cdn.hackclub.com/01a057f3-3180-75e6-a2af-bf92282cc0ae/image.png)![image.png](https://cdn.hackclub.com/01a057f3-59e0-708f-a8d6-990f2fc26da8/image.png)

# 2026-08-31: master cad

**Total time spent: 0.5 hours**

so i finished the master cad model and i added little groves(i think thats what you call them) to help when closing the case ,now i have to export the pcb models and fix them in blender(the textures are messed up and the some models  of the components are absent so i have to add them manualy) ![image.png](https://cdn.hackclub.com/01a0578e-008b-7f28-9497-2ea0cd7f34f9/image.png)

# 2026-08-30: fixing the snap fit

**Total time spent: 1 hour**

so i realized that the snap fit was wrong i forgot a chamfer and the sizing was wrong , also i couldnt copy the node case to use it for the master case because the master pcb is way larger than the node pcb ,i made a new case for the master and fixed the snap fit issue and sizing issue on both cases ![image.png](https://cdn.hackclub.com/01a052ee-dff5-7f48-b7fb-89cef1bd900b/image.png)

# 2026-08-30: node case

**Total time spent: 2.2 hours**

so i finished the node case im surprised on how good it turned out  now im gonna copy the node model and modify it to work with the master pcb ![image.png](https://cdn.hackclub.com/01a0529d-ef2c-7fc9-83dc-222c569a2294/image.png) 

# 2026-08-29: 3d casing

**Total time spent: 2.5 hours**

let me tell you as good as i am in pcb designing as bad as i am in fusion 360 and software , i made the case for the node(somewhat) and the thing that took a long time was the snap fit and messurements i had to messure inside kicad , now i need to add ventilation  a place for the usb and sd card ports and a hole for the external antenna , ![image.png](https://cdn.hackclub.com/01a04f5a-8a4d-79d6-9150-46c57064cc91/image.png)

# 2026-08-29: cost

**Total time spent: 6 hours**

so i went to kicad and went to bom and added a lcsc colown and put in all the part numbers which took some time  , then (today ) i went and exported with the fabrication toolkit and guess what it messed up the bom so i redid the bom of both pcbs and exported them manualy then i went to jlc pcba service and i placed the order and guess what its 327$ with a 20$ coupon  way higher than expected and this is only the nodes the thing that increase price like crazy was the scd41 and shipping ![image.png](https://cdn.hackclub.com/01a04da7-6061-77d8-bea3-322b771d5a31/image.png)

# 2026-08-28: Done 

**Total time spent: 1.5 hours**

im done i ran the pcb throught jlc dfm service and added labels to the pinheader now i need to prep the manufacturing files ( BOM and pcba needed files) for both pcbs good thing that i prepared all the partnumbers for each thing ![image.png](https://cdn.hackclub.com/01a04913-64d7-7701-8e99-074cb098e6df/image.png) ESP32-C3-MINI-1U-N4 C2911374

BME690 C42431867

SGP41-D-R4 C3659325

SCD41-D-R2  C3659294

IP2312-4V35 C605433

18650 HOLDER C5249310

AMS1117 3.3v C6186
 
MT3608 C84817

0.1uf caps C14663

22uf C45783

1uf caps C15849

2.2k Ω C4190

10k Ω C25804

4.7k Ω C25900

5.1kΩ C23186

100Ω C22775

1kΩ C21190

51k ohm C23196

0.5ohm C25340

ss34 C8678
 
47k ohm C25819


1uh C3002565

22uh C7461351

Resettable Fuse C883128

2x1 pin header C124375

1x1 pinheader C81276

MT3608 93% to 82% effecincy

4.7ohm low pass filter C131714

10uf C96446

led C2286 red 

usb C165948 

100k R C25803 

3.7 to 3.3v C1849531 (ti new)

inductor 470nh C5441998

91k R C325723

511k R C23194

# 2026-08-27: master done 

**Total time spent: 2 hours**

so the master  pcb is done i still haven run it through jlc dfm ,![image.png](https://cdn.hackclub.com/01a04353-2c46-7c5f-9a2c-1fe64f6ebd93/image.png) and i added the debugger pinheaders ![image.png](https://cdn.hackclub.com/01a04353-aeca-7b20-9035-cfafbeedea36/image.png) rn the last thing to do is review both pcbs then order then program them , and while in delivery i will make the app 

# 2026-08-26: schematics finished

**Total time spent: 1 hour**

so i finished the master schematic , and i noticed an issue is that i forgot the 2ohm resistor for the ip2312 and 10uf cap to protect from voltage spikes ,and i fixed the issue on both the schematics of the node and master and i fixed the node pcb , ![image.png](https://cdn.hackclub.com/01a03e01-4985-76fc-8704-946b4663419b/image.png) and the "Update PCB from Schematic" button didnt work for me but after sometrying it did the issue was i had 2 schematics in the same folder 
![image.png](https://cdn.hackclub.com/01a03e06-c246-7e87-a7f8-0ee5c32e510c/image.png)

# 2026-08-24: master

**Total time spent: 1.5 hours**

i did the master schematic , i was going to  add passthrough charging but the charging is at 3A and a passthrough charging system will decrease effecincy , so now it will be 2  2x1pinheader you short one to short to switch to battery mode i still havent added it, and i still have to  review it (the schematic) ![image.png](https://cdn.hackclub.com/01a03532-08b2-7b18-ba70-329070fabc81/image.png)

# 2026-08-21: TPS63802DLAT

**Total time spent: 1.3 hours**

finding the TPS datasheet was easy and in the data sheet there is an example for 3.3v output exactly what i needed so i replaced the old ic with the TPS63802DLAT now the effecincy jumps to 95% and the  heating is no longer an issue i also ran it through jlc dfm service and fixed the issues , and i made the sorta BOM (the parts and theyre part number for pcba) and i getting quite confused with calculating power consumption because when i checked idle power consumption for the sensors i got differante values some say scd41 is 150uA idle while some say its 30uA , either way i did the average and i estimate 3 years but accounting to effecincy and the way li ion 18650s behave its  more like 1.8 years ![image.png](https://cdn.hackclub.com/01a02535-8ed2-72ad-8ce7-05fe4f885dfd/image.png)

# 2026-08-19: finished node pcb

**Total time spent: 2.5 hours**

so i finished node pcb and ran it through jlc dfm service and the drc only showed simple issues that i fixed like silkscreens over lapping, i also added better thermal isolation and i i thought that the ic i was using for 3.7v to 3.3v was buck and boost turns out  it was just boost, i will switch it to the TPS63802 ( specificly TPS63802DLAT  also its really good in heating it does not hea) then i will make the master pcb it will be simple just a sd card slot and passthrough charging ![image.png](https://cdn.hackclub.com/01a01a2c-5a33-7ffa-90d5-f422b1e551cb/image.png)

# 2026-08-15: pcb schematic and idea

**Total time spent: 7 hours**

firstly i did the research  and part picking i was going to use esp32 c6 but it wasnt in stock at jlcpcb so i switched to esp32 c3 u1 n4 mcu , and i sorta planned the code like the EAV sqlite db to be able to add more nodes of varios tasks , and i was gonna use just sgp41 and bme680 then  i did more research and now its a scd41 sgp41 bme690 then i got all the datasheets and i designed the pcb schematic ![image.png](https://cdn.hackclub.com/01a0057c-e5b6-7f9f-b38b-675b6cb91ef2/image.png) and i removed the AMS1117 ldo and switched the resistor value to 10k ohm to boost directly from mt3608 instead of 5v then 3.3v with ldo this is to boost effecincy (now its around 86% and 92%) and i added a ressatable fuse(1.5A) and added too many debugger tht test pads that i can also solder pin headers to and i made the i2c pull up  resistor to 2.2kohm instead of 4.7 so i can enable fast mode i2c , and i sorta planned the app i was gonna make it a sort of 2 step thing the ai (gemma e2b) reads the prombt then makes a sql command to check the database then with the data makes a reply its slow so what i will do is make an exporter in 
.pptx or .pdf (exports a graph)then you can give the ai some of that graph and it will be faster , also the pdf or slide can be used in reports , ![image.png](https://cdn.hackclub.com/01a00583-99bf-76d8-9130-a16e88ecc82d/image.png)  
then i made the pcb design 4 layer with gnd plane and 3.3v plane i also added clearance to the esp even though its a u1 module and i added thermal isolation keep out rule areas under the 2 18650 and beside the ip2312 and mt3608 and i isolated them as you see in the design a hot side and a cold side even though the tracing is completed there are some silkscreen errors in drc which i will fix and i also need to add silkscreen text for the debugger pads


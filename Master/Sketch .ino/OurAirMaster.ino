#include <SPI.h>
#include <WiFi.h>
#include <esp_now.h>
#include <Wire.h>
#include <sqlite3.h>
#include <FS.h>
#include <SD.h>
#include <RTClib.h> 
#include <ArduinoJson.h>
#include <queue>
#include <esp_wifi.h>
#include <vector>


const int MYSCLK = 3;
const int MYMISO = 6;
const int MYMOSI = 7;
const int MYCS = 10;

#define Max_List 1000

const int MYSDA = 4;
const int MYSCL = 5;
struct MacAddress {
  uint8_t bytes[6];
};

std::vector<MacAddress> blacklist;

RTC_DS3231 rtc;
DateTime currentTime;
sqlite3 *db = NULL;
int Count(uint8_t *mac){
  for(int i = 0; i< blacklist.size(); i++){
    if(memcmp(blacklist[i].bytes,mac,6)== 0){
      return i;
    }
  }
  return -1;
}
bool SQfunc(sqlite3 *db, const char *sql){
  char *zErrMsg =0;
  int rc = sqlite3_exec(db,sql,NULL,NULL,&zErrMsg);
  if(rc != SQLITE_OK){
    Serial.printf("error SQinit %s\n",zErrMsg);
    sqlite3_free(zErrMsg);
    return false; 
  }
  return true;
}
bool SQinit(){
  sqlite3_initialize();
  if(sqlite3_open("/sd/sensor_logs.db", &db) != SQLITE_OK){
    Serial.println("SQinit failed");
    return false;}
  const char *createTableSQL = "CREATE TABLE IF NOT EXISTS sensor_data ("
                               "id INTEGER PRIMARY KEY AUTOINCREMENT,"
                               "timestamp TEXT,"
                               "mac_address TEXT,"
                               "location TEXT,"
                               "reading_type TEXT,"
                               "reading_value TEXT);";
  return SQfunc(db,createTableSQL);  
}
struct SensorPacket{
  String macStr;
  String jsonADD;
  String timestamp;
};
std::queue<SensorPacket> dataQueue;
void butter(){
  if(!dataQueue.empty()){
    SensorPacket currentPacket = dataQueue.front();
    JsonDocument data;
    DeserializationError error = deserializeJson(data, currentPacket.jsonADD);
    if(!error){
      JsonObject rootObj =data.as<JsonObject>();
      String location = rootObj["loc"] | "Unknown";
       SQfunc(db, "BEGIN TRANSACTION");
       for(JsonPair kv: rootObj){
        String sensorType = kv.key().c_str();
        if (sensorType == "loc") {
        continue;
      }
        String sensorValue = kv.value().as<String>();

        String sql ="INSERT INTO sensor_data (timestamp, mac_address, location, reading_type, reading_value) VALUES('"
                   + currentPacket.timestamp + "','" 
                   + currentPacket.macStr + "','" 
                   + location + "','" 
                   + sensorType + "','" 
                   + sensorValue + "');";
        SQfunc(db, sql.c_str());
       }
       

    }
    SQfunc(db, "COMMIT; ");
    Serial.println("DB updated succesfully");
  }else{
    Serial.println("packet currupt");
  }
  dataQueue.pop();

}



void READandQUEUE(const esp_now_recv_info *recvinfo, const uint8_t *data, int len ){
  if(Count((uint8_t*) recvinfo-> src_addr)!=-1){
    Serial.println("Blocked : HAHAHAHA Troll blocked");
    return;
  }
  
  char jsonADD[len + 1];
  memcpy (jsonADD,data,len);
  jsonADD[len]= '\0';
  char macStr[18];
  snprintf(macStr, sizeof(macStr),"%02X:%02X:%02X:%02X:%02X:%02X",
  recvinfo -> src_addr[0],
  recvinfo -> src_addr[1],
  recvinfo -> src_addr[2],
  recvinfo -> src_addr[3],
  recvinfo -> src_addr[4],
  recvinfo -> src_addr[5]
  );
  TIMEcall();
  String timestamp = String(currentTime.timestamp(DateTime:: TIMESTAMP_FULL));
  //prep packet(yay im done (sorta(wsp cool bracket)))
 SensorPacket packet = {String(macStr), String(jsonADD), timestamp};
  dataQueue.push(packet);
  Serial.println("Reading :" +String(macStr) + String(jsonADD) + timestamp);
  
}
bool RTCinit(){
  if (!rtc.begin()){
    Serial.println("RTCinit failed");
    return false;
  }
  return true;
}
void TIMEcall(){
  currentTime = rtc.now();
}
bool ESPNOWinit(){
  WiFi.mode(WIFI_STA);
  if (esp_now_init() != ESP_OK){
    Serial.print("espnow FAILED TO START");
    return false;
  }
  esp_now_register_recv_cb(READandQUEUE);
  return true;
}
bool SDinit(int ChipS){
  if(!SD.begin(ChipS)){
    Serial.println("SD init failed");
    return false;
  }
  return true ;
}
void setup() {

  Serial.begin(115200);
  
  SPI.begin(MYSCLK, MYMISO, MYMOSI, MYCS);
  Wire.begin(MYSDA, MYSCL);
  RTCinit();
  rtc.adjust(DateTime(2026, 12, 29,12, 0, 0));
  ESPNOWinit();
  SDinit(10);
  esp_wifi_set_protocol(
    WIFI_IF_STA,
    WIFI_PROTOCOL_11B | WIFI_PROTOCOL_11G | WIFI_PROTOCOL_11N | WIFI_PROTOCOL_LR
  );
  esp_wifi_set_max_tx_power(84);

}
void Werk(){
    if (Serial.available()>0){
    String sent = Serial.readStringUntil('\n');
    sent.trim();
    if(sent.length()< 18){
      Serial.println("ERROR: Mac too short or operator not added");
      return;
    }
    char action = sent.charAt(0);
    String macList = sent.substring(1);
    int start = 0;
    int comma = macList.indexOf(',');
    while(true){
      String macText = (comma == -1) ? macList.substring(start) : macList.substring(start, comma);
      macText.trim();
      if(macText.length() >= 17){
        uint8_t tempMac[6];
    unsigned int rawB[6];
            int parse = sscanf(macText.c_str(),"%x:%x:%x:%x:%x:%x",
    &rawB[0],&rawB[1],&rawB[2],&rawB[3],&rawB[4],&rawB[5]
     );
     if(parse == 6){
        for(int i=0; i< 6; i++)tempMac[i]= (uint8_t)rawB[i];
  int index = Count(tempMac);
  if (action == '+'){
    if(index != -1){
      Serial.println("INFO: MAC already Blacklisted");
    }else if (blacklist.size() >= Max_List){
      Serial.println("Blacklist full");
    }else {
      MacAddress newMac;
      memcpy(newMac.bytes,tempMac,6);
      blacklist.push_back(newMac);
      Serial.println("Mac Blacklisted");
    }
     }if (action == '-'){
    if(index == -1){
      Serial.println("INFO: MAC Not Found.");
    }else {
      blacklist.erase(blacklist.begin()+index);
      Serial.println("Mac UnBlacklisted");
      Serial.println(blacklist.size());
    }
  }
      }else {
                    Serial.print("ERROR: Mac format wrong -> ");
                    Serial.println(macText);
                }
    }
    if(comma == -1)break;
    start = comma +1;
    comma = macList.indexOf(',',start);

  }
  
    }
}
 

void loop() {
  Serial.println("Master");
  
  butter();
  delay(50);

}

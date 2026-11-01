#include <Wire.h>
#include <7semi_BME690.h>
#include <Adafruit_SGP41.h>
#include <SensirionI2cScd4x.h>
#include <SPI.h>
#include <WiFi.h>
#include <esp_now.h>
#include <ArduinoJson.h>
#include <esp_wifi.h>

const int MYSCLK = 3;
const int MYMISO = 6;
const int MYMOSI = 7;
const int MYCS = 10;

const int MYSDA = 4;
const int MYSCL = 5;

uint8_t broadcastAddress[] = {0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF};



esp_now_peer_info_t PEER;

const int BATT = 0;

uint16_t sraw_voc = 0;
uint16_t sraw_nox = 0;

float voltageP = 0;
float BATTV = 0;

uint16_t co2SCD;
float tempSCD;
float rhSCD;

bool messageDelivered = false;

const uint64_t deepcycle = 900000000;
const uint64_t lightcycle = 20000000;

char place [10];

float humiBME = 0;
float tempBME = 0;
float presBME = 0;
float gasrBME = 0;

RTC_DATA_ATTR char location[32];
SensirionI2cScd4x scd;
Adafruit_SGP41 sgp41;
BME690_7semi bme(10, BME690_7semi::MODE_SPI);

String Loc;
int MYrx = 20;
void setup() {
  Serial.begin(115200);
  esp_sleep_wakeup_cause_t wakeup_reason = esp_sleep_get_wakeup_cause();
  if(wakeup_reason == ESP_SLEEP_WAKEUP_EXT0){
    Serial.println("Node")
    if(Serial.available()> 0){

      memset(location,0,sizeof(location));
      int bytesRead = Serial.readBytesUntil('\n',location, sizeof(location)-1);
      location[bytesRead]='\0';
      Serial.println("Location Changed");
      


    }
  }
  WiFi.mode(WIFI_STA);
  ESPNOWinit();
  esp_now_register_send_cb(esp_now_send_cb_t(DataSent));
  PEERcon();
  SPI.begin(MYSCLK, MYMISO, MYMOSI, MYCS);
  Wire.begin(MYSDA, MYSCL);
  esp_wifi_set_protocol(
    WIFI_IF_STA,
    WIFI_PROTOCOL_11B | WIFI_PROTOCOL_11G | WIFI_PROTOCOL_11N | WIFI_PROTOCOL_LR
  );
  esp_wifi_set_max_tx_power(84);
  Wire.setClock(400000);
  pinMode(BATT, INPUT);
  BMEinit();
  SGPinit();
  SCDinit();
  esp_sleep_enable_timer_wakeup(lightcycle);
  esp_light_sleep_start();
  float rawbatt = analogRead(BATT);
  voltageP = (rawbatt/ 4095.0)*3.3;
  BATTV = voltageP *2;
  Read();

  SGPlow();

  ESPNOWsend();
  
  messageDelivered = false;
  esp_sleep_enable_timer_wakeup(deepcycle);
  esp_sleep_enable_ext0_wakeup(MYrx, 0); 
  esp_deep_sleep_start();
}
bool PEERcon(){
  memcpy(PEER.peer_addr,broadcastAddress,6 );
  PEER.channel = 0;
  PEER.encrypt = false; 

  if(esp_now_add_peer(&PEER)!= ESP_OK){
     Serial.print("failed to add PEER");
     return false;
  }
  return true;
}

  
void ESPNOWsend(){
  JsonDocument DATA;
  DATA["voc"]   = sraw_voc;
  DATA["nox"]   = sraw_nox;
  DATA["bat"]   = BATTV;
  DATA["co2"]   = co2SCD;
  DATA["tscd"]  = tempSCD;
  DATA["rhscd"] = rhSCD;
  DATA["hbme"]  = humiBME;
  DATA["tbme"]  = tempBME;
  DATA["pbme"]  = presBME;
  DATA["gbme"]  = gasrBME;
  DATA["location"]   = location;
  char jsonBuffer[250];
  size_t len = serializeJson(DATA, jsonBuffer);
  Serial.print("Sending JSON (");
  Serial.print(len);
  Serial.println(" bytes):");
  Serial.println(jsonBuffer);
  esp_now_send(broadcastAddress, (uint8_t *)jsonBuffer, len);
  delay(800);
  esp_now_send(broadcastAddress, (uint8_t *)jsonBuffer, len);
  delay(800);
  esp_now_send(broadcastAddress, (uint8_t *)jsonBuffer, len);

  
}
void DataSent(const uint8_t *mac_addr,esp_now_send_status_t status){
  Serial.print("\r\nLast Packet Send Status:\t");
  Serial.print(status == ESP_NOW_SEND_SUCCESS ?"sent successfly" : "sending failed" );
}
bool ESPNOWinit(){
  if (esp_now_init() != ESP_OK){
    Serial.print("espnow FAILED TO START");
    return false;
  }
  return true;
}
void SGPlow() {
  if (sgp41.turnHeaterOff()) {
    Serial.println(F("Heater off — entering low power mode"));
  } else {
    Serial.println(F("Failed to turn heater off!"));
    
  }
}
void BMEinit() {
  if (!bme.begin()) {
    Serial.print("BME690 FAILED TO START");
    while (1)
      ;
  }
  Serial.print("BME690 *STARTED*");
}
void SGPinit() {
  if (!sgp41.begin()) {
    Serial.print("SGP41 FAILED TO START");
    while (1)
      ;
  }
  Serial.print("SGP41 STARTED");
}
void SCDinit() {
  scd.begin(Wire,0x62); 
  uint16_t error = scd.stopPeriodicMeasurement(); 
  if (error){
    Serial.print("SCD4x Error: ");
    Serial.println(error);
  }
  delay(500);
}
static void runConditioning(uint8_t seconds) {
  Serial.print(F("Conditioning ("));
  Serial.print(seconds);
  Serial.println(F(" seconds)..."));

  for (uint8_t i = 0; i < seconds; i++) {

    if (sgp41.executeConditioning(&sraw_voc)) {
      Serial.print(F("SRAW_VOC: "));
      Serial.println(sraw_voc);
    } else {
      Serial.println(F("Conditioning failed!"));
    }
  }
}
static bool runMeasurements(uint8_t samples) {
  Serial.println(F("Starting measurements."));

  for (uint8_t i = 0; i < samples; i++) {


    if (sgp41.measureRawSignals(&sraw_voc, &sraw_nox)) {
      Serial.print(F("Raw VOC: "));
      Serial.print(sraw_voc);
      Serial.print(F("\tRaw NOx: "));
      Serial.println(sraw_nox);
    } else {
      Serial.println(F("Measurement failed!"));
      return false;
    }
  }
  return true;
}
bool Read() {
  scd.measureSingleShot();
  bme.readSensorData();
  runConditioning(10);
  runMeasurements(5);
  SGPlow();
  scd.readMeasurement(co2SCD, tempSCD, rhSCD);
  humiBME = bme.getHumidity();
  tempBME = bme.getTemperature();
  presBME = bme.getPressure();
  gasrBME = bme.getGasResistance();
  return true;
}
void loop() {

  // put your main code here, to run repeatedly:
}

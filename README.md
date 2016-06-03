# NodeMCU
Small IoT project using the NodeMCU to publish HTU21D sensor data to a SensorThings server over MQTT

# Running
Flash your NodeMCU with the firmware found under the folder "firmware" using the ESP8266Flasher tool.
Change config.lua to the desired settings (WiFi SSID/password, MQTT Broker, Interval, SDA/SCL pins for HTU21D, etc) Load .lua files to NodeMCU using ESPlorer and run node.compile("filename.lua") on all files, run dofile("test.lua") to start publishing HTU21D temperature and humidity readings.

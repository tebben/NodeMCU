-- file : application.lua
local module = {}  
m = nil

local function send_measurements()        
    htu.init()
    temp = htu.getTemp()
    humi = htu.getHumidity()    
    m:publish(config.TEMPERATURETOPIC, "{\"result\": " ..temp.. "}",0 ,0 , function(conn) end)
    m:publish(config.HUMIDITYTOPIC, "{\"result\": " ..humi.. "}", 0, 0, function(conn) end)
    print("temp: " ..temp.. " humidity: " ..humi.. "")
end

local function mqtt_start()  
    m = mqtt.Client(config.ID, 120)
    
    print("connect to MQTT")
    m:connect(config.HOST, config.PORT, 0, function(con)         
        tmr.stop(6)
        tmr.alarm(6, config.PUBLISHINTERVAL, 1, send_measurements)
    end) 
end

function module.start()  
  htu.init()
  mqtt_start()
end

return module  

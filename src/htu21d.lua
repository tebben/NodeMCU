local module = {} 

local id = 0
local addr = 0x40
local r
local HUMIDITY = 0xE5
local TEMPERATURE = 0xE3

function readTemp()
  i2c.start(id)
  i2c.address(id, addr, i2c.TRANSMITTER)
  i2c.write(id, TEMPERATURE)
  i2c.start(id)
  i2c.address(id, addr, i2c.RECEIVER)
  tmr.delay(50000) --wait for measurment
  r = i2c.read(id,3)
  i2c.stop(id)
return (bit.band((bit.lshift(string.byte(r,1),8)+string.byte(r,2)),0xfffc)*17572)/65536-4685
end

local function readHumi()
  i2c.start(id)
  i2c.address(id, addr, i2c.TRANSMITTER)
  i2c.write(id, HUMIDITY)
  i2c.start(id)
  i2c.address(id, addr, i2c.RECEIVER)
  tmr.delay(50000)
  r = i2c.read(id,3)
  i2c.stop(id)
return (bit.band((bit.lshift(string.byte(r,1),8)+string.byte(r,2)),0xfffc)*12500)/65536-600
end

function module.getTemp()
  return tonumber(string.format("%.1f", tostring(readTemp()/100)))
end

function module.getHumidity()
  return tonumber(string.format("%.1f", tostring(readHumi()/100)))
end

function test()
    t = module.getTemp()
    t2 = module.getHumidity()
    print("Temperature: "..t.." °C")
    print("Humidity: "..t2.." %")   
end

function module.init()    
    i2c.setup(id, config.HTUSDA, config.HTUSCL, i2c.SLOW)
    test()
end

return module

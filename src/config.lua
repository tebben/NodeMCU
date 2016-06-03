-- file: config.lua
local module = {}

module.SSID = {}  
module.SSID["SSID"] = "PASS"

module.HOST = "host"  
module.PORT = 1883  
module.ID = node.chipid()

module.PUBLISHINTERVAL = 120000
module.TEMPERATURETOPIC = "GOST/Datastreams(3)/Observations"  
module.HUMIDITYTOPIC = "GOST/Datastreams(4)/Observations"  

module.HTUSDA = 3
module.HTUSCL = 4

return module 

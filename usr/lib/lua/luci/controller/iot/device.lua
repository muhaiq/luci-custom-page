module("luci.controller.iot.device", package.seeall)

function index()
    entry({"admin", "iot"}, firstchild(), "IoT", 10).dependent=false
    --entry({"admin", "iot", "device"}, call("action_hello"))
    entry({"admin", "iot", "device"}, template("iot-device/index"), "IoT Device", 20).dependent=false
    entry({"admin", "iot", "device", "devicedata"}, call("action_devicedata")).leaf = true
end

function action_hello()
    luci.http.prepare_content("text/plain")
    luci.http.write("Hello World!!!")
end

function action_devicedata()
    local fs = require "nixio.fs"
    local data = fs.readfile("/root/iot/data/temp_latest.json")
    luci.http.prepare_content("application/json")
    luci.http.write(data)
end



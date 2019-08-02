

--local db2 = require("ipdb.reader")
--
--db2 = db2:new("/home/frk/city.free.ipdb")
--
--local loc = db2:find("118.28.1.1")
--
--for k, v in ipairs(loc) do
--
--    print(k, v)
--end
--
--print("\n\n")
--print("=========================\n\n")

local file = "ipip.ipdb"

function test_reader()
	
	print("-----------------test_reader")
    local reader = require("reader")

    local db = reader:new(io.open(file, "rb"):read("*a"), true)

    local loc1 = db:find("123.58.160.153", "CN")

    for k, v in ipairs(loc1) do
        print("-----------------", k,"," ,v)
    end

    local max = 100000
    local min = 0
    while true do
        db:find("118.28.1.1", "CN")
        min = min + 1
        if min >= max then
            break
        end
    end

    print(db.node_count)
end

function test_city()
	print("-----------------test_city")
    local city = require("city")

 	local city = city:new(io.open(file, "rb"):read("*a"), true)

	print(city:languages())

    local loc = city:find("123.58.160.153", "CN")
    local is_lang = string.find(city:languages(), "CN")

    print("-----------------------is_language=", is_lang)
    for k, v in pairs(loc) do
        print(k, v)
    end

    print(loc.country_name)
end


function test_district()
	print("-----------------test_district")
    local dis = require("district")
    local db = dis:new(file)
    local loc = db:find("111.199.79.160", "CN")
    for k, v in pairs(loc) do
        print(k, v)
    end
    print(loc.district_name)

    print(db:languages())

    local cj = require("cjson");
    print(cj.encode(loc));

    local min = 0
    local max = 100000

    while true do
        min = min + 1
        if min > max then
            break
        end

        db:find("111.199.79.160", "CN")
    end
end

--test_district()
test_reader()
test_city()
test_district()

function test_base_station()
	print("-----------------test_base")
    local bst = require("base_station")
    local db = bst:new(file)
    local loc = db:find("111.199.79.160", "CN")
    for k, v in pairs(loc) do
        print(k, v)
    end

    print(loc.country_name)
end

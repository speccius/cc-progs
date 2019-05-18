DEFAULT_TZ="Europe/London"

args={...}

function update()

local x,y=http.checkURL(
"http://raw.github.com/speccius/cc-progs/master/realtime/test")

if not x then print("Repo down?") print(y) else

if fs.exists("/real_time")==false or
fs.isDir("/real_time")==false then
fs.delete("/real_time")
fs.makeDir("/real_time")
end

main=fs.open("/real_time/datetime")
main.write(
http.get(
"http://raw.github.com/speccius/cc-progs/master/realtime/main.lua"
).readAll())
main.close()
end end

if args[1]~=nil then

if args[1]=='update' then
update() else
print(
http.get(
"http://worldtimeapi.org/api/timezone"..
args[1]..".txt"
).readAll()) end

else

print(
http.get(
"http://worldtimeapi.org/api/timezone/"..
DEFAULT_TZ..".txt"
).readAll())

end

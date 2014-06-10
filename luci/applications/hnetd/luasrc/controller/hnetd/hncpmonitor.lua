module("luci.controller.hnetd.hncpmonitor", package.seeall)

function index()
	entry({"admin", "status", "hnet"}, template("hnetd-hncpmonitor/monitor"), "HNCP Monitor", 10).dependent=false
	entry({"admin", "status", "hncp-dump"}, call("get_hncp_dump")).dependent=false
end

function get_hncp_dump()
	luci.http.prepare_content("application/json")
	luci.http.write(luci.sys.exec("ubus call hnet dump 2> /dev/null || echo '{\"error\": \"ubus call failed\"}'"))
end


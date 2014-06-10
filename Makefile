# This makefile intends to create a locally broswable monitor page
# for debugging pruposes.
MONITOR=luci/applications/hnetd/luasrc/view/hnetd-hncpmonitor/monitor.htm

RESOURCE_STR=<% write (resource) %>
RESOURCE_PATH=luci/applications/hnetd/htdocs/luci-static/resources
CONTROLLER_STR=<% write (controller) %>
CONTROLLER_PATH=/no-page/nopage

all: monitor.htm
	
monitor.htm: $(MONITOR)
	cp $(MONITOR) monitor.htm
	sed -i "" "s/$(RESOURCE_STR)/$(subst /,\/,$(RESOURCE_PATH))/g" monitor.htm
	sed -i "" "s/$(CONTROLLER_STR)/$(subst /,\/,$(CONTROLLER_PATH))/g" monitor.htm
	
clean:
	rm -f monitor.htm

# NOTHING TO EXPLAIN


CMD ["nginx", "-g", "daemon off;"]
u tell nginx to set a global directive with the -g option, the directive here is to run nginx as a foreground process instead of as a daemon (bg process) to prevent the contianer from stopping.

CGI :
wahd l partia dyal l webservers li katmanager lina kifach 
kaycomuniqui l webserver m3a l client (browser) 3an tari9 l http, katsayb wahd l process li kat runni fih wahd script(php, py)

FAST CGI:
CGI ki sayb process jdid ki loadi modules kamline w kidir bzf dl5dma fach kibghi yprocessi kola script, fastCGI makidirch hadchi, kib9a mrunni as a daemon(bg) donc ki7eyed l overhead dyal creating a process w loading memory w everything f every request


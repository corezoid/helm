-- init nginx
local rr_upstream = ngx.shared.rr_upstream
rr_upstream:set("index", 1)

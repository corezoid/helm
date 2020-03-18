local upstream = require "upstream"

local upstream_name = upstream.get_next_server()

local callbacks = ngx.shared.callbacks
local request_id = ngx.var.request_id

-- write to callback DB
callbacks:set(request_id, upstream_name, 360)

ngx.var.upstream = upstream_name

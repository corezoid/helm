local upstream = require "upstream"

local callbacks = ngx.shared.callbacks
local request_id = ngx.var.income_request_id

local upstream_name = callbacks:get(request_id)
if not upstream_name then
    ngx.log(ngx.ERR, "not_found_callback(", request_id, ")");
    upstream_name = upstream.get_next_server()
end

ngx.var.upstream = upstream_name
callbacks:delete(request_id)

local upstream = require "ngx.upstream"
local svs = upstream.get_servers("api-sync")
local rr_upstream = ngx.shared.rr_upstream

local _M = {}


function _M.get_next_server()
    -- get previous upstream index
    local prev_upstream_id = rr_upstream:get("index")

    -- set next upstream index
    local next_upstream_id = 1
    if prev_upstream_id and prev_upstream_id < table.getn(svs) then
        next_upstream_id = prev_upstream_id + 1
    end

    rr_upstream:set("index", next_upstream_id)
    return svs[next_upstream_id].addr
end

return _M

local contriner_client = require "contriner_client"
local skynet = require "skynet"
local setmetatable = setmetatable
local select = select
local tunpack = table.unpack
local assert = assert

contriner_client:register("orm_table_m")

local g_instance_map = {}

local M = {}

local mt = {__index = function(t,k)
    t[k] = function(self,...)
        t._client = t._client or contriner_client:new("orm_table_m",t._orm_name)
        local ret = nil
        --尝试 5 次，还不成功，那肯定是数据库挂逼了或者热更后执行保存比较耗时
        for i = 1,5 do
            ret = {t._client:mod_call_by_name("call", k, ...)}
            local is_move = ret[1]
            if not is_move then
                return select(2,tunpack(ret))
            end
            skynet.yield()
        end
    end
    return t[k]
end}

function M:new(orm_name)
    assert(orm_name, "not orm_name")
    local t = {
        _orm_name = orm_name,
        _client = false
    }
    setmetatable(t, mt)
    return t
end

function M:instance(orm_name)
    if not g_instance_map[orm_name] then
        g_instance_map[orm_name] = M:new(orm_name)
    end

    return g_instance_map[orm_name]
end

return M
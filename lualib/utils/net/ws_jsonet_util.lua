local json_netpack = require "json_netpack"
local websocket = require "websocket"
local util_net_base = require "util_net_base"

local M = {}

--给fd发送socket text消息
M.send = util_net_base.create_ws_gate_send_text(json_netpack.pack)

--给fd_list发送socket消息
M.broadcast = util_net_base.create_ws_gate_broadcast_text(json_netpack.pack)

--解包
M.unpack = util_net_base.create_ws_gate_unpack(json_netpack.unpack)

--读取
M.recv = util_net_base.create_recv(websocket.read,json_netpack.unpack)

return M
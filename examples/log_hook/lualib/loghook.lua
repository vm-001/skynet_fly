local log = require "log"
local string = string

return function(log_str)
    log.info("loghook >>>>>>>>>>>>>>>>> ",log_str)
    log.info(log.parse(log_str))
end
#!/bin/bash
#构建服务设施 skynet.config 还有script脚本

skynet_fly_path=$1

if [ "$#" -ne 1 ]; then
    echo "缺少参数 请输入1个参数 skynet_fly_path"
    exit 1
fi

if [ -z "${skynet_fly_path}" ]; then
    echo "缺少 skynet_fly_path"
    exit 1
fi

shell_path="${skynet_fly_path}/script/shell"

bash ${shell_path}/make_server.sh ${skynet_fly_path}
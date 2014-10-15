# MAC下没有everything那么犀利的vbs打开CRT队列了。
# 自己动手，丰衣足食，分享个在 Alfred 下直接搜索队列并调用CRT打开的 Workflows
# 傻瓜式，用shell直接打开CRT，简单粗暴
# 步骤：
# 1. 添加一个 File Filter 和 Run Script
# 2. 双击 Run Script，把下面的脚本贴进去搞定。

#!/bin/bash
# By:fuqihuan

file={query}
ip=$(strings ${file} | awk -F= '/Hostname/ {print $2}')
port=$(echo $((16#$(strings ${file}|awk -F= '/\"\[SSH2\] Port\"/ {print $2}'))))

/Applications/SecureCRT.app/Contents/MacOS/SecureCRT ${ip}:${port} -t


#!/bin/bash

# 记录当前日期和时间
NOW=$(date +"%Y-%m-%d-%H-%M")


# 如未设置，填充默认值
if [ -z "$PROCESS_WORKERS" ]; then
    export PROCESS_WORKERS=1
fi

if [ -z "$PROCESS_THREADS" ]; then
    export PROCESS_THREADS=2
fi

# 启动 Gunicorn 并使用 tee 命令同时输出日志到文件和控制台
exec gunicorn -w ${PROCESS_WORKERS} --threads ${PROCESS_THREADS} --bind 0.0.0.0:33333 main:app --access-logfile - --error-logfile -

# python3 ./main.py


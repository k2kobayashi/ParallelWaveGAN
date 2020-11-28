#! /bin/bash
#
# test.sh
# Copyright (C) 2020 Kazuhiro KOBAYASHI <root.4mac@gmail.com>
#
# Distributed under terms of the MIT license.
#

n_jobs=4

# lbl=itu-g
# lbl=original
# lbl=itu-g_shift171
lbl=itu-g_shift80

conf=./conf/parallel_wavegan.v1."${lbl}".yaml
confname=$(basename "${conf}" .yml)
sbatch \
    -p centos \
    --gres=gpu:1 \
    -c $n_jobs \
    ./run.sh \
        --stage 2 \
        --stop_stage 5 \
        --dumpdir dump_"${lbl}" \
        --conf $conf

#!/bin/bash
echo "输入查看的目录，例如/data"
read data
ls $data|wc -l

#!/bin/bash
i=0
echo "输入你的数字"
read numb
if [ $numb -gt $i ];
then
sum=$(($numb+$i))
i=$(($i+1))
echo "结果$sum"
fi

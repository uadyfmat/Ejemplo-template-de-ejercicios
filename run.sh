#!/bin/bash
z=$(grep -s -L this E-*)

directories=0
exercises=0

for i in ${z}; 
do
  directories=$((directories + 1))
  test-runner -e ${i} >> result
  
  if [ $? -eq 0 ]
  then
    exercises=$((exercises + 1))
    printf '%s\t%s\n' ${i} Correcto >> exercises-list
  else
    printf '%s\t%s\n' ${i} Error >> exercises-list
  fi
done;


echo '#########'
echo Resumen: $exercises/$directories
echo '#########'

echo ' '
echo '#########'
echo Exercises list
echo '#########'

cat exercises-list
cat result

if [ $exercises -eq $directories ]
then
  exit 0
else
  exit 1
fi
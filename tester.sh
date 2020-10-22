#!/bin/bash

cnt=10
printf "Enter number of tests: "
read cnt

for (( i = 1; i <= cnt; i++ )) do
	printf "test $i: " 
	./gen > testcase.txt
	./navie < testcase.txt > answer.txt
	./main < testcase.txt > output.txt
	diff -Bbq answer.txt output.txt
	if [ $? -ne 0 ]; then
		printf "WA!! \n" 
		exit
	fi

	printf "AC \n"
done


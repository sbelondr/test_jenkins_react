npm start > /tmp/result.txt &

echo "Launch compilation"
pass=0;
while [ $pass -eq 0 ]
do
	if [ $(cat /tmp/result.txt | grep "Compiled successfully!" | wc -l) == "1" ]; then
		echo "ok"
		pass=1;
		exit 0;
	fi
	if [ $(cat /tmp/result.txt | grep "Compilation failed!" | wc -l) == "1" ]; then
		echo "Error"
		pass=2;
		exit 1;
	fi
done

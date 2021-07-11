##list of blockchain directories
$blockchain_list = 
("C:\Users\Nathan3\AppData\Local\chia-blockchain\app-1.2.0\resources\app.asar.unpacked\daemon\chia.exe", 
 "C:\Users\Nathan3\AppData\Local\flax-blockchain\app-0.1.0\resources\app.asar.unpacked\daemon\flax.exe",
 "C:\Users\Nathan3\AppData\Local\goji-blockchain\app-0.2.3\resources\app.asar.unpacked\daemon\goji.exe",
 "C:\Users\Nathan3\AppData\Local\chaingreen-blockchain\app-1.2.0\resources\app.asar.unpacked\daemon\chaingreen.exe",
 "C:\Users\Nathan3\Downloads\Spare-win32-x64\resources\app.asar.unpacked\daemon\spare.exe",
 "C:\Users\Nathan3\AppData\Local\seno-blockchain\app-1.1.834\resources\app.asar.unpacked\daemon\seno.exe",
 "C:\Users\Nathan3\AppData\Local\equality-blockchain\app-1.1.715\resources\app.asar.unpacked\daemon\equality.exe",
 "C:\Users\Nathan3\AppData\Local\hddcoin-blockchain\app-1.2.115\resources\app.asar.unpacked\daemon\hddcoin.exe",
 "C:\Users\Nathan3\AppData\Local\greendoge-blockchain\app-0.1.16\resources\app.asar.unpacked\daemon\greendoge.exe",
 "C:\Users\Nathan3\AppData\Local\flora-blockchain\app-0.2.3\resources\app.asar.unpacked\daemon\flora.exe",
 "C:\Users\Nathan3\AppData\Local\chiadoge\app-1.2.10\resources\app.asar.unpacked\daemon\chiadoge.exe"
 )

$check_interval = 900 #farm summary interval

#starts farmer for each blockchain
for ($i = 0; $i -lt $blockchain_list.length; $i++) {
    powershell -command $blockchain_list[$i] start farmer -r 
    start-sleep 20 #wait 20 seconds between instances
}

#gets farm summary of each blockchain
while($true){

    for ($i = 0; $i -lt $blockchain_list.length; $i++) {
        #write host "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
        powershell -command $blockchain_list[$i] farm summary 
        write host "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
        #start-sleep 1
    }
    start-sleep $check_interval
}
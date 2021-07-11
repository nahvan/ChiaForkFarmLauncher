##list of blockchain directories
$blockchain_list = 
("C:\Users\Nathan4\AppData\Local\chia-blockchain\app-1.2.0\resources\app.asar.unpacked\daemon\chia.exe", 
 #"C:\Users\Nathan4\AppData\Local\flax-blockchain\app-0.1.0\resources\app.asar.unpacked\daemon\flax.exe",
 "C:\Users\Nathan4\AppData\Local\goji-blockchain\app-0.2.0\resources\app.asar.unpacked\daemon\goji.exe",
 "C:\Users\Nathan4\AppData\Local\chaingreen-blockchain\app-1.2.0\resources\app.asar.unpacked\daemon\chaingreen.exe",
 "C:\Users\Nathan4\AppData\Local\Spare-win32-x64\resources\app.asar.unpacked\daemon\spare.exe",
 "C:\Users\Nathan4\AppData\Local\seno-blockchain\app-1.1.834\resources\app.asar.unpacked\daemon\seno.exe",
 "C:\Users\Nathan4\AppData\Local\equality-blockchain\app-1.1.714\resources\app.asar.unpacked\daemon\equality.exe",
 "C:\Users\Nathan4\AppData\Local\hddcoin-blockchain\app-1.2.115\resources\app.asar.unpacked\daemon\hddcoin.exe",
 "C:\Users\Nathan4\AppData\Local\greendoge-blockchain\resources\app.asar.unpacked\daemon\greendoge.exe",
 "C:\Users\Nathan4\AppData\Local\flora-blockchain\app-0.2.3\resources\app.asar.unpacked\daemon\flora.exe",
 "C:\Users\Nathan4\AppData\Local\chiadoge\app-1.2.10\resources\app.asar.unpacked\daemon\chiadoge.exe"
 )

$start_interval = 5

#starts harvester for each blockchain
for ($i = 0; $i -lt $blockchain_list.length; $i++) {
    powershell -command $blockchain_list[$i] start harvester -r 
    start-sleep $start_interval #pause between instances
}


#gets farm summary of each blockchain
#while($true){
#
#    for ($i = 0; $i -lt $blockchain_list.length; $i++) {
#        #write host "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
#        powershell -command $blockchain_list[$i] farm summary 
#        write host "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
#        #start-sleep 1
#    }
#    start-sleep 300 #wait 5 minutes before parsing farm information again
#}
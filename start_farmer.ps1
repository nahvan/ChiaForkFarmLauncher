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
 "C:\Users\Nathan3\AppData\Local\greendoge-blockchain\app-1.0.2104\resources\app.asar.unpacked\daemon\greendoge.exe",
 "C:\Users\Nathan3\AppData\Local\flora-blockchain\app-0.2.3\resources\app.asar.unpacked\daemon\flora.exe",
 "C:\Users\Nathan3\AppData\Local\chiadoge\app-1.2.20\resources\app.asar.unpacked\daemon\chiadoge.exe",
 "C:\Users\Nathan3\AppData\Local\dogechia-blockchain\app-0.1.4\resources\app.asar.unpacked\daemon\dogechia.exe",
 "C:\Users\Nathan3\AppData\Local\kale-blockchain\app-0.1.180\resources\app.asar.unpacked\daemon\kale.exe",
 "C:\Users\Nathan3\AppData\Local\avocado-blockchain\app-1.1.7120\resources\app.asar.unpacked\daemon\avocado.exe"
 )

$fork_names = ("Chia", "Flax", "Goji", "Chaingreen", "Spare", "Seno", "Equality", "HDDCoin", "GreenDoge", "Flora", "ChiaDoge", "DogeChia", "Kale", "Avocado")

##get user imputs (put this inside a while loop later)
write "functions: 'start farmer', 'start harvester', 'farm summary'"

$function_run = read-host "What would you like to run?"

$check_interval = 900 #farm summary interval - put in config later

#starts farmer for each blockchain
function start_farmer{

    for ($i = 0; $i -lt $blockchain_list.length; $i++) {
        powershell -command $blockchain_list[$i] start farmer -r 
        start-sleep 20 #wait 20 seconds between instances
    }
    return
}

#starts harvester for each blockchain
function start_harvester{

    for ($i = 0; $i -lt $blockchain_list.length; $i++) {
        powershell -command $blockchain_list[$i] start harvester -r 
        start-sleep 5 #wait 5 seconds between instances
    }
    return
}

#gets farm summary of each blockchain
function farm_summary{
    while($true){

        for ($i = 0; $i -lt $blockchain_list.length; $i++) {

            $farm_title = $fork_names[$i]+" Farm summary: " 
            write $farm_title
            write ""
            powershell -command $blockchain_list[$i] farm summary 
            write "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
            #start-sleep 1
        }

        $current_time = (Get-Date -f HH:mm)
        $current_date = (Get-Date -f MM"/"dd)
        write-host "Last updated:" $current_date", "$current_time

        start-sleep $check_interval
    }
}



switch ($function_run)
{
    "farm summary" {farm_summary}
    "start farmer" {start_farmer}
    "start harvester" {start_harvester}

}


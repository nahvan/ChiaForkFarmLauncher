##gets settings and fork list from json files
$blockchain_list = Get-Content -raw -path blockchain.json | convertFrom-Json
$config =  Get-Content -raw -path config.json | ConvertFrom-Json

#Making array of executables
$execute_arr = @()
for ($i = 0; $i -lt $blockchain_list.length; $i++) {
        $execute_arr+= $blockchain_list[$i].ForkDir+$blockchain_list[$i].ForkName+".exe"
}
write $execute_arr
#adds variables from config.json
$check_interval = $config.check_interval
$farm_delay = $config.farm_delay
$harvester_delay = $config.harvester_delay

$wait_time = $check_interval/60


##get user imputs (put this inside a while loop later)
write "functions: 'start farmer', 'start harvester', 'farm summary full', 'farm summary short'"

$function_run = read-host "What would you like to run?"

#starts farmer for each blockchain
function start_farmer{

    for ($i = 0; $i -lt $execute_arr.length; $i++) {
        write-host "Starting "$fork_names[$i]" farmer..."
        powershell -command $execute_arr[$i] start farmer -r 
        start-sleep $farm_delay #wait between instances
    }

    write "All fork farmers launched! Do not close this window!"
}

#starts harvester for each blockchain
function start_harvester{

    for ($i = 0; $i -lt $execute_arr.length; $i++) {
        powershell -command $execute_arr[$i] start harvester -r 
        start-sleep $harvester_delay #wait between instances
    }
    
    write "All fork harvesters launched! Do not close this window!"
}

#gets farm summary of each blockchain
function farm_summary_full{
    while($true){

        for ($i = 0; $i -lt $execute_arr.length; $i++) {

            $farm_title = $blockchain_list[$i].ForkName +" Farm summary: " 
            $wallet_title = $blockchain_list[$i].ForkName +" Wallet: "
            write $farm_title
            write ""
            powershell -command $execute_arr[$i]" farm summary"  
            write ""
            write $wallet_title
            write ""
            powershell -command $execute_arr[$i]" wallet show" 
            write "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
            
        }
        write-host "-----------------------------------------------------------------------------"
        $current_time = (Get-Date -f HH:mm)
        $current_date = (Get-Date -f MM"/"dd)
        write-host "Last updated:" $current_date", "$current_time

        write-host "Next check in"$wait_time "minutes..."
        start-sleep $check_interval
    }
}

#gets condensed farm and wallet summary
function farm_summary_condensed{

    while($true){

    $summary = @()
    write-host "Getting fork farm and wallet information..."
    write-host ""

        for ($i = 0; $i -lt $execute_arr.length; $i++) {
          
            $farmed_fork = powershell -command $execute_arr[$i]" farm summary"
            $wallet_fork = powershell -command $execute_arr[$i]" wallet show"
            $status = $farmed_fork[0].Substring(16)
            $farm_status = $fork_names[$i] + " Status: " + $status
            $summary += $farm_status
            $summary += $farmed_fork[1].Substring(6) 
            $summary += $wallet_fork[4].Substring(10)
            $summary += ""
        
        }  
    
    write $summary
    $current_time = (Get-Date -f HH:mm)
    $current_date = (Get-Date -f MM"/"dd)
    write-host "-----------------------------------------------------------------------------"
    write-host "Last updated:" $current_date", "$current_time
    write-host "Next check in"$wait_time "minutes..."
    start-sleep $check_interval
    
    }

}

switch ($function_run)
{
    "start farmer" {start_farmer}
    "start harvester" {start_harvester}
    "farm summary full" {farm_summary_full}
    "farm summary short" {farm_summary_condensed}
}

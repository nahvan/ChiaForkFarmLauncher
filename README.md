# ChiaForkFarmLauncher

A simple powershell script to launch your chia fork farmer, harvester, and parse through farm summary every few minutes. 

# Configure:
$blockchain_list - array list of your blockchain directories

$fork_names - List of fork coin names

$check_interval - wait time in seconds between checks of farm summary

# Functions:
"start farmer" - Starts all farmers for forks in your blockchain list. default wait time of 20 seconds between instances.

"start harvester" - Starts all harvesters for forks in your blockchain list. default wait time of 5 seconds between instances.

"farm summary full" - Will output result of 'fork_name' farm summary and 'fork_name' wallet show, for each fork. repeats after $check_interval. 

"farm summary short" - Will condense farm summary and wallet show to only farm status, farmed coins, and wallet balance. repeats after $check_interval.


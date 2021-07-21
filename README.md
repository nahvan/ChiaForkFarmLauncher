# ChiaForkFarmLauncher

A simple powershell script to launch your chia fork farmer, harvester, and parse through farm summary every few minutes. 

# Configure:
**blockchain.json: Array list of your blockchain directories**

"ForkDir" - your fork daemon directory 

"ForkName" - Your fork binary name

**config.json: Settings**

"check_interval": 900 (wait time in seconds to check farm summary)

"farm_delay": 20 (wait time between starting farmer instances - default 20 seconds)

"harvester_delay": 5 (wait time between starting harvester instances - default 5 seconds)

# Functions:
"start farmer" - Starts all farmers for forks in your blockchain list.

"start harvester" - Starts all harvesters for forks in your blockchain list. 

"farm summary full" - Will output result of 'fork_name' farm summary and 'fork_name' wallet show, for each fork. repeats after $check_interval. 

"farm summary short" - Will condense farm summary and wallet show to only farm status, farmed coins, and wallet balance. repeats after $check_interval.

# Current issues: 
Will not work right if you have multiple keys stored on a fork client. 

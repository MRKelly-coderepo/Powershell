
//Use Case: connect to Python SimpleHTTPServer and download all files located there
//Assumes no nested directory structure

$IP="0.0.0.0" // Replace with Server IP
$PORT="80"    // Replace with Server Port
$SERVER="{0}:{1}" -f $IP,$PORT

Write-Host "Connecting to : " $SERVER
$allFiles = wget http://$SERVER -OutFile allFiles.txt

$regex="href"
foreach($line in Get-Content .\allFiles.txt) {
     if($line -match $regex){
	     $InputString = $line
	     $FileArray =$InputString.Split("><")
	     Write-Host "Downloading File :" $FileArray[4]
             $getLink = "{0}:{1}/{2}" -f $IP,$PORT,$FileArray[4]
	     wget -Uri http://$getLink -OutFile $FileArray[4]
	}
}
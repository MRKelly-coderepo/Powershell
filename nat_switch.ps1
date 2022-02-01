New-VMSwitch -SwitchName NATSwitch -SwitchType Internal
New-NetIPAddress -IPAddress 192.168.4.1 -PrefixLength 24 -InterfaceIndex 40 
New-NetNat -Name NATNetwork -InternalIPInterfaceAddressPrefix 192.168.4.0/24


#Remove-NetNat -Name NATNetwork
#Remove-NetIPAddress -IPAddress 192.168.4.1
#Remove-VMSwitch -SwitchName NATSwitch
#!/system/bin/sh
LogFile="/storage/emulated/0/MagiskHideDenyImport.log"
ListFile="/storage/emulated/0/MagiskList.txt"

if [ ! -f "$LogFile" ]; then
    touch "$LogFile"
fi

ui_print "**********************************************************"
ui_print "Importing MagiskList.txt to MagiskHide or Magisk Deny List" 2>&1 | tee $LogFile
ui_print "**********************************************************"
ui_print ""
if [[ -f "$ListFile" && -s "$ListFile" ]]; then 
i=$(magisk --list)
if ui_print "$i" | grep -q "magiskhide"; then
	ui_print "Your Magisk supports: MagiskHide hiding method" 2>&1 | tee -a $LogFile
	MagiskCmd='magiskhide'
else	
	ui_print "Your Magisk supports: Zygisk Deny List hiding method" 2>&1 | tee -a $LogFile
	MagiskCmd='magisk --denylist'
fi 
ui_print "Command used for hiding: $MagiskCmd" 2>&1 | tee -a $LogFile
while IFS=_ read -r package proc; do
ui_print "Trying to hide/deny: $package $proc" 2>&1 | tee -a $LogFile
	$MagiskCmd add $package $proc 
	if [ $? -eq 0 ] ;	then
		ui_print "Trying to hide/deny: hidden successfully" 2>&1 | tee -a $LogFile
	else
		ui_print "Trying to hide/deny: already hidden" 2>&1 | tee -a $LogFile	
	fi	
done < /storage/emulated/0/MagiskList.txt
ui_print "**********************************************************"
else
ui_print "$ListFile not found" 2>&1 | tee -a $LogFile
ui_print "**********************************************************"
fi

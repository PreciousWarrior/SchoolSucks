rm -R /Library/Sophos\ Anti-Virus/
rm -R /Library/Application\ Support/Sophos/
rm -R /Library/Preferences/com.sophos.*
rm /Library/LaunchDaemons/com.sophos.*
rm /Library/LaunchAgents/com.sophos.*
rm -R /Library/Extensions/Sophos*
rm -R /Library/Caches/com.sophos.*
cd /Applications/Sophos
open "Remove Sophos Endpoint.app"

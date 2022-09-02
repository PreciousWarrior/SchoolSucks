# SchoolSucks

# Background

Our school prevents us from using the internet without installing SSL certificates. We have to hand over our laptops for them to install the certificates (and install Sophos Antivirus suite of applications along with it). Their apparent justification for this is to block phishing/distraction/porn domains, but this can very well be done without installing SSL certificates as the IP-TCP layer stands below the SSL layer in the OSI model.

While I do believe they have the best of intentions, I didn't quite feel comfortable handing over my laptop to the IT to install an antivirus, as these programs are typically terrible for privacy and aren't open source or transparent in general. Recently, Norton started adding cryptominers in their antivirus software and only giving the end user a cut of the bitcoins mined. All these companies see is money and are willing to compromise your privacy in order to get it. 

I am putting their SSL cert in this repository so you can start using the internet without going through the long and privacy-disrespecting process of installing spyware on your system. Installing the certificate will allow the school to see all your traffic (including auth tokens in HTTP headers which could potentially give them permanent access to your accounts even after you leave the school). The school will most probably not be able to see your traffic after you leave the premises, as this seems like a special certificate for the school (judging by the original file name which contained our city's name) it seems unlikely they will have connections with national ISPs such as Airtel and Jio to launch a MiTM attack (this sounds like a conspiracy theory lol, they probably won't be able to see your traffic after you leave school, but there's a section for the extra paranoid out there.


# Installing the SSL certificate

Download the file named `sophos.crt`. Then double click to install it (if using MacOS). You should now be able to use the school internet without ever having to install spyware on your laptop!

# Removing the antivirus

Note: This may not completely remove Sophos, in order to guarentee this it is recommended to hard reset your laptop and then get the cert from here if you already have the antivirus. But as far as I have tested no files or processes named "Sophos" or similar run after uninstalling and rebooting. If you are fine with this, you can use the following command to uninstall sophos, follow the installation wizard, and then reboot.

`curl https://raw.githubusercontent.com/PreciousWarrior/SchoolSucks/main/kill_sophos.sh | sudo bash`

This was taken from the following support forum article: https://community.sophos.com/intercept-x-endpoint/f/discussions/129053/disable-sophos-tamper-protection-on-mac

# Trust issues

As I have provided this certificate, I could very well have provided a public key that corresponds to a private key that I generated locally (which would give me the ability to spy on yourtraffic). Therefore, you will have to trust me with the fact that I have provided the Sophos public key. You could go to the IT to install the cert and check if they match if you do not trust me, but that defeats the whole purpose of this repository.


# For the extra paranoid out there

To disable the cert automatically when the school ends and enable it when it starts use the following steps:

- Login as root and save the certificate to `/Users/Shared/sophos.crt` (or any other file name you like). <ins>Do not</ins> delete this file.
- Run `security add-certificates -k "/Library/Keychains/System.keychain" /Users/Shared/sophos.crt` to install the certificates.
- Give `/usr/bin/cron` and `Terminal.app` full Disk acccess in System Preferences > Security and Privacy > Privacy.
- Edit the root user's crontab via `crontab -e` and add the following lines:

```
0 8 * * 1,2,3,4,5 security add-trusted-cert /Users/Shared/sophos.crt
30 3 * * 1,2,3,4,5 security remove-trusted-cert /Users/Shared/sophos.crt
```

- These commands will not be executed when your laptop is asleep. To prevent this, go to System Preferences > Energy Saver > Schedule to automatically wake your laptop in the morning and evening.
- You're done! Keep in mind macos is garbage so you might face some errors.

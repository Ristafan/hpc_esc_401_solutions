## Exercise 1

```bash
root@martin:~# ssh ubuntu@172.23.7.243
The authenticity of host '172.23.7.243 (172.23.7.243)' can't be established.
ED25519 key fingerprint is SHA256:zfQfov8WXYjNnu0Ynosul0j7SodbIWJaTikDoypu9yQ.
This key is not known by any other names
Are you sure you want to continue connecting (yes/no/[fingerprint])? yesWarning: Permanently added '172.23.7.243' (ED25519) to the list of known hosts.
Welcome to Ubuntu 22.04.4 LTS (GNU/Linux 5.15.0-107-generic x86_64)

 * Documentation:  https://help.ubuntu.com
 * Management:     https://landscape.canonical.com
 * Support:        https://ubuntu.com/pro

 System information disabled due to load higher than 1.0


Expanded Security Maintenance for Applications is not enabled.

0 updates can be applied immediately.

Enable ESM Apps to receive additional future security updates.
See https://ubuntu.com/esm or run: sudo pro status


The list of available updates is more than a week old.
To check for new updates run: sudo apt update


The programs included with the Ubuntu system are free software;
the exact distribution terms for each program are described in the
individual files in /usr/share/doc/*/copyright.

Ubuntu comes with ABSOLUTELY NO WARRANTY, to the extent permitted by
applicable law.

Last login: Wed May 29 14:15:54 2024 from 172.23.255.4
ubuntu@mafaeh-first:~$ sudo apt install cowsay
Reading package lists... Done
Building dependency tree... Done
Reading state information... Done
Suggested packages:
  filters cowsay-off
The following NEW packages will be installed:
  cowsay
0 upgraded, 1 newly installed, 0 to remove and 0 not upgraded.
Need to get 18.6 kB of archives.
After this operation, 93.2 kB of additional disk space will be used.
Get:1 http://nova.clouds.archive.ubuntu.com/ubuntu jammy/universe amd64 cowsay all 3.03+dfsg2-8 [18.6 kB]
Fetched 18.6 kB in 0s (188 kB/s)
Selecting previously unselected package cowsay.
(Reading database ... 72652 files and directories currently installed.)
Preparing to unpack .../cowsay_3.03+dfsg2-8_all.deb ...
Unpacking cowsay (3.03+dfsg2-8) ...
Setting up cowsay (3.03+dfsg2-8) ...
Processing triggers for man-db (2.10.2-1) ...
Scanning processes...
Scanning linux images...

Running kernel seems to be up-to-date.

No services need to be restarted.

No containers need to be restarted.

No user sessions are running outdated binaries.

No VM guests are running outdated hypervisor (qemu) binaries on this
 host.
ubuntu@mafaeh-first:~$ cowsay "Corona was a lie! Until we meet again"
 _______________________________________
< Corona was a lie! Until we meet again >
 ---------------------------------------
        \   ^__^
         \  (oo)\_______
            (__)\       )\/\
                ||----w |
                ||     ||
```
### Step by step

1. Create instance on ScienceCloud (https://cloud.s3it.uzh.ch/project/instances/)
2. Connect to instance 
```bash
ssh ubuntu@172.23.7.243
```

3. Install packages
```bash
sudo apt update
sudo apt install -q g++ make
```

4. Run file
```bash
./main
```

5. Create snapshot using the "Create Snapshot" button
![image](https://github.com/user-attachments/assets/0f7350dc-f696-4f35-a116-d8c938f096dc)

See Snapshot:
![image](https://github.com/user-attachments/assets/4cfe5cf4-dc1e-4d7b-b560-922b8f600882)


Due to errors during installation of the python packages, I ran the following cmd:
```bash
sudo apt install -q python3-pip --fix-missing
```

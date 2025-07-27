# After installation 
android studio has an problem when USB debbuging enabled phone connected it dosent show in android studio divices 

## Solution 

## Connect in android Studio 
open android studio  and do followings 
![Step 1](/img/android-studio-adb/1.png)
![Step 2](/img/android-studio-adb/2.png)
![Step 3](/img/android-studio-adb/3.png)

###install android studio Platform tools
```bash
sudo dnf install android-tools
```

While Ubuntu provides the `android-sdk-platform-tools-common package` for device udev rules, Fedora does not. 
Instead, you should manually install Android udev rules

```bash
sudo curl -o /etc/udev/rules.d/51-android.rules https://raw.githubusercontent.com/M0Rf30/android-udev-rules/master/51-android.rules
sudo chmod a+r /etc/udev/rules.d/51-android.rules
sudo udevadm control --reload-rules
sudo udevadm trigger
```

connect your divice and check if it is shown in `adb` list

```bash
adb devices
```
if it is then open android studio and check if it is shown in divices list 

## Trubleshooting
### Verify **adb divicelsit**
```bash
adb devices
```

### adb device is not Showing 

if your android Divice is not showing in `adb divices ` list 

1. Check USB Connection
	- try changing USB cable 
2. check whether the system recognized your usb connection to mobile phone
```bash
lsusb
```
3. if it dosent show in there then it is hardware problem so check usb port and connection,cable etc.

4. Udev config
again try installing `udev`
```bash
sudo curl -o /etc/udev/rules.d/51-android.rules https://raw.githubusercontent.com/M0Rf30/android-udev-rules/master/51-android.rules
sudo chmod a+r /etc/udev/rules.d/51-android.rules
```

reload `udev`
```bash
sudo udevadm control --reload-rules
sudo udevadm trigger
```
reaload adb 
```bash
adb kill-server
adb start-server
```
reconnect Device 

5. if all above steps dosen't work try adding your `adb` into sudo grupe 
```bash 
sudo groupadd adbusers
sudo usermod -aG adbusers $USER
```
restart services and pc 
and try again first step in android studio


## You can build and run your app via USB but the physical device screen is not appearing in Android Studio’s `Running Devices` window on Fedora 42, 

The Reson That i Found is by default divice mirroring si not enable in android studio settings 
 to anable Those 
1. File --> Settings --> Tools --> Device Mirroring 
2. enable followings 
- Activate Mirroring when a new Physicle Device is connected 
- Activate Mirroring when launching an app on physicle device
- Activate Mirroring when launching a test on physicle device 

## **DirectoryLock$CannotActivateException** in Android Studio
- Summary
```text
DirectoryLock$CannotActivateException: Process "/app/extra/android-studio/bin/studio" is still running and does not respond.
```
This error occurs when Android Studio detects an active or stuck instance preventing a new launch,
often caused by stale lock files or zombie processes.

### How to Fix

Step 1. Check for Running Android Studio Processes
Open a terminal.
```bash
ps aux | grep -i studio
```
If you see any running Android Studio or related processes 
(entries mentioning studio, android-studio, or android-studio-wrapper),
note the process IDs (PIDs).

Step 2: Kill Running Android Studio Processes
- If processes are found, terminate them by running:

```bash
kill -9 <PID1> <PID2> ...
```
- Replace <PID1>, <PID2>, etc., with the actual process IDs.
- Example Command
```bash
kill -9 3412 3436 3441 3534
```
Those 4 digit numbers are the Ids you can find those after runnin `s aux | grep -i studio`

- Verify no processes remain:

```bash
ps aux | grep -i studio
```
- The only output should be the grep process itself or no Android Studio processes.

Important: Killing processes forcibly will cause loss of any unsaved data in those instances.

Step 3: Locate and Delete `.lock` Files
- The `.lock` file prevents simultaneous instances and is usually located in the config directory.

- Run this command to find lock files related to Android Studio:
```bash
find ~/.var/app/com.google.AndroidStudio/ -name ".lock"
```

- Then you can find file path like this `(eg:) /home/asitha/.var/app/com.google.AndroidStudio/config/Google/AndroidStudio2025.1.1/.lock`
```bash
rm /full/path/to/.lock
```
Step 4: Check for Port Conflicts (Optional)


Step 5: Restart Android Studio
- After ensuring no stale processes or lock files remain, try launching Android Studio again.


Step 6: Reboot System (if all else fails)
- Sometimes, stubborn background processes or OS-level resource locks require a full reboot to clear.

##### after doing all of above things it worked but when i restart it need to be done again otherwise it will crash
- so the sudjest solution was
	- give nessosry permission 
	```bash 
chmod -R u+rw ~/.var/app/com.google.AndroidStudio/
chown -R $USER ~/.var/app/com.google.AndroidStudio/
```
	- install android srudio via official site (flatpack and snap version some times has problem since thay run app in sandbox env )
	- keep android studio upto date

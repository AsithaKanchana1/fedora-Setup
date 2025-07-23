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



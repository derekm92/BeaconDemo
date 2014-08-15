# Beacon Demo

iOS 7 application that demonstrates iBeacon functionality for entering and leaving a restaurant. Includes iOS 7.1 wake up alert functionality

Originally based off Chris Wagner's tutorial available here: http://www.raywenderlich.com/66584/ios7-ibeacons-tutorial

### Features:

* **Enter Region** - Displays an alert when the user enters within range of the beacon
* **Exit Region** - Displays an alert in alert center when user leaves range of beacon
* **Add Beacon** - Add a beacon to the list by using the beacon UUID, major and minor

### Notes:

The app will continue to alert the user when the app is in the background and when exited via double tapping the home button and swipe exiting.

iOS scans bluetooth every ~30 seconds while in the background
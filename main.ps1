Write-Output "For yes or no questions, write yes or no. Do it without the period and make it all lowercase."
if ($(Read-Host "Are you sure you want to continue? This may damage your phone. I am not responsible for any damage") -ne "yes") {
    Exit
}
if ($(Read-Host "Delete Messages? This is a Google app that might spy on you") -eq "yes") {
    adb shell pm uninstall --user 0 com.google.android.apps.messaging
}
if ($(Read-Host "Delete Google Play Services? Some apps require it") -eq "yes") {
    adb shell pm uninstall --user 0 com.google.android.gms
}
if ($(Read-Host "Delete Google Play Store? This might let Android reinstall the apps. There are replacements like the Aurora Store, which is a proxy to Play") -eq "yes") {
    adb shell pm uninstall --user 0 com.android.vending
}

@(
"com.google.android.apps.googleassistant",
"com.google.android.calendar",
"com.android.chrome",
"com.google.android.deskclock",
"com.google.android.apps.docs",
"com.google.android.apps.tachyon",
"com.google.android.gm",
"com.google.android.googlequicksearchbox",
"com.google.android.apps.subscriptions.red",
"com.google.android.videos",
"com.google.android.apps.maps",
"com.google.android.apps.photos",
"com.google.android.apps.youtube.music",
"com.google.android.youtube",
"com.google.android.contacts",
"com.google.android.apps.nbu.files"
) | Foreach-Object {
	adb shell pm uninstall --user 0 $_
}
Write-Output "If there was no errors, other than Not Installed, then everything was sucessful."
Pause
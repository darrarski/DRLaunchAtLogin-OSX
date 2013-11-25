DRLaunchAtLogin OSX Library
===========================

Utility for enabling app launching at login under OS X.

Based on [alexzielenski's StartAtLoginController](https://github.com/alexzielenski/StartAtLoginController)

Requires ServiceManagement framework to be linked with project.

## Install via Cocoapods

Add this line to your project's Podfile:

	pod "DRLaunchAtLogin", :git => "http://bitbucket.org/darrarski/drlaunchatlogin-osx.git"

## Launch helper

If you want to use this utlity to start your sand-boxed application, you can use LauchHelper app
from this repository. To do so:

- Add LauchHelper project as a child of your application project in Xcode (to get it you have to download or clone this repo to your machine, as it's not contained in pod)
- Update LauchHelper application identifier so it has the same company id as your application (ex. if your app has identifier com.company.MyApp, the LaunchHelper app identifier should be com.company.MyAppLaunchHelper)
- Under your project's target configuration, add a new "Copy Files" build phase with this configuration:
	- Set destination to "Wrapper"
	- Set subpath to "Contents/Library/LoginItems"
	- Make sure "Copy only when installing" is not checked
	- Add LaunchHelper.app file to the list (choose YourProject/LauchHelper/Products/LaunchHelper.app)
- Under your project's target configuration, set "Strip Debug Symbols During Copy" to NO for Debug and Relese on "Build Settings" tab
- Inside DRAppDelegate.m file edit two static variables to match your main application config:
	- Set DRLaunchHelperMainApplicationIdentifier to your application identifier
	- Set DRLaunchHelperMainApplicationProductName to your application product name

That's all, now you can enable/disable launching your application at login by executing this code inside you main application:

	NSBundle *bundle = [NSBundle bundleWithPath:[[[NSBundle mainBundle] bundlePath] stringByAppendingPathComponent:@"Contents/Library/LoginItems/LaunchHelper.app"]];
	DRLaunchAtLogin *launchAtLogin = [[DRLaunchAtLogin alloc] initWithIdentifier:bundle.bundleIdentifier];
	launchAtLogin.enabled = YES; // or NO to disable
	
The "enabled" property reads system configuration each time you access it, so you can check current setting by reading the value any time.

## Additional informations

Remember to update your application's and LaunchHelper application's code signing configuration to be the same to make sure everything will work nice together. It will also work with both main app and launch helper app code signing set to none. The app should have sandboxing enabled.

There is one limitation that you should be aware of, this won't work if you run your application directly from Xcode. It's only working if the app is expored to "YourApplicationName.app" and saved in /Applications or ~/Applications directory.

Tested under OS X 10.9 Mavericks without code signing configured.

The utility and helper are based on [tutorial by timschroeder.net](http://blog.timschroeder.net/2012/07/03/the-launch-at-login-sandbox-project/)

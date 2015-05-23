# AppLS
AppLS stands for *ls* on your app's *Document* directory. It is a simple-to-use plug-and-play app that allows iOS developers to visually see the directory organisation of their app's *Document* directory when debugging file-related issues.

# Release Notes
**Release version:** 1.0beta  
Currently, only the Swift version of the app is available. Version 1.0, which contains the Objective-C version, will be made available as soon as possible(not anytime soon).  
**.framework binaries:** Framework binary for Swift version is **now available** for iOS simulator. Details of usage is described in the next section. Objective-C users currently have to do some bridging. Some fixing and test runs still need to be done for the Objective-C version.
It is difficult for me to create the binaries that can be used in apps that are deployed onto iOS devices as I do not have any certificates to allow me to test on actual devices. The best I can do is to put up binaries for iOS simulator in the near future. If not, just import the source codes to your project as described in the "Usage" section. In that case, please use only the public class in your source codes. 

# Importing to project
1. Download the repository.
2. Open the project to which this app is to be imported to.
3. Drag the **.framework** file into your project.
4. Click on your project and add the framework as **Embedded Binaries** under **General** tab.
* Note: To easily keep an updated version of this app, fork and/or clone this repository and use file referencing instead of copying into your project. This way, updating this app is as simple as pulling changes from this repository.
 
# Usage
1. Go to the view controller from which to launch this app.
2. Call *presentViewController:animated:completion:*, passing in *AppLS.viewController* as the 1st parameter.
3. Run your app and start exploring/debugging your app's **Document** directory.

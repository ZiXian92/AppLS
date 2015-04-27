# AppLS
AppLS stands for *ls* on your app's *Document* directory. It is a simple-to-use plug-and-play app that allows iOS developers to visually see the directory organisation of their app's *Document* directory when debugging file-related issues.

# Importing to project
1. Download the repository.
2. Open the project to which this app is to be imported to.
3. Click on **Files** -> **Add Files to ...**, and select the folder in the repository containing the project you wish to import.
* Note: To easily keep an updated version of this app, fork and/or clone this repository and use file referencing instead of copying source files into your project. This way, updating this app is as simple as pulling changes from this repository.
 
# Usage
1. Go to the view controller from which to launch this app.
2. Call *presentViewController:animated:completion:*, passing in *AppLS.viewController* as the 1st parameter.
3. Run your app and start exploring/debugging your app's **Document** directory.

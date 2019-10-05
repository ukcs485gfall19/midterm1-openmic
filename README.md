#  OpenMic
## Team OpenMic

### Overview

This app is an implementation if the yik yak clone tutorial ([part 1](https://shrikar.com/ios-app-design-using-xcode-6-and-interface-builder-yik-yak-clone-part-1/) and [part 2](https://shrikar.com/parse-backed-uitableview-in-ios-8-build-yik-yak-clone-part-2/)) in swift 5.1. We have also added images, a login screen prototype, and a profile screen prototype.

### Starting a parse server instance
**Note**: The following commands are modified from [the parse server github repo](https://github.com/parse-community/parse-server)
The following requires installation of Docker. Docker can be downloaded from [here](https://www.docker.com)
~~~
$ git clone https://github.com/parse-community/parse-server
$ cd parse-server
$ docker build --tag parse-server .
$ docker run --name my-mongo -d mongo
$ docker run --name my-parse-server --link my-mongo:mongo -d parse-server --appId openMicParse --masterKey MASTER_KEY --databaseURI mongodb://mongo/test --clientKey parseClientKey
~~~

### Using the OpenMic app
This app requires the cocoapods libraries **Parse** and **Parse/UI**. Please ensure that you have these libraries installed.
Run this app through Xcode's build and run button. This code has been tested with an iPhone 11 Pro Max simulator running iOS 12.4 on Xcode 11.

### Known issues
* Parse server communicates with apps through http. Xcode 11 and swift 5.1 do not support http queries. (The App Transport Security policy requires the use of a secure connection.)
* In the create a post view, the default text in the text box is not automatically cleared when a user begins typing.
* (any more issues to be added here)

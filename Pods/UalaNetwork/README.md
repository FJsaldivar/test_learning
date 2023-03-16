# UalaNetwork

[![CI Status](https://img.shields.io/travis/Andrés Bonilla/UalaNetwork.svg?style=flat)](https://travis-ci.org/Andrés Bonilla/UalaNetwork)
[![Version](https://img.shields.io/cocoapods/v/UalaNetwork.svg?style=flat)](https://cocoapods.org/pods/UalaNetwork)
[![License](https://img.shields.io/cocoapods/l/UalaNetwork.svg?style=flat)](https://cocoapods.org/pods/UalaNetwork)
[![Platform](https://img.shields.io/cocoapods/p/UalaNetwork.svg?style=flat)](https://cocoapods.org/pods/UalaNetwork)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

UalaNetwork is available through [CocoaPods](https://cocoapods.org). 
To install it, simply add the following line to your Podfile:

```ruby
pod 'UalaNetwork'
```

## Author

Andrés Bonilla, andres.bonilla@ua.la

## License

UalaNetwork is available under the MIT license. See the LICENSE file for more info.

### About UalaNetwork

UalaNetwork is a module that allow us to perform networking request using Alamofire as the main provider, it uses Async/Await as the main mechanism to handle the response, you can check how to use async/await code [here](https://github.com/Bancar/uala-ios-app/wiki/Async---Await-with-regular-swift-code).

### Objects

UalaNetwork has some objects required to perform the request, here is a list of them an the responsabilities: 
* `APIClient`: Perform the request
* `APIRequest `: Contains the request data
* `HTTPParameterEncoding `: Sets the type of encoding for the request
* `HTTPRequestMethod `: Set the type of HTTP request. 
* `APIClientErrorWrapper `: It is a wrapper of the error returned in the request, contains the network error and the data on the response if exists. 
* `AlamofireAPIClient `: It is the default implementation of the `APIClient`, it uses Alamofire to process the request, it's able to log the request and response if needed and capable of retrying the request in case that it fails.  

### Performing requests

To perform a request, simply implement the protocol `APIRequest` and pass it to the `AlamofireAPIClient` in the function `processRequest` and specify the number of retries(the default is 0). 

Here is an example:

```
let client = AlamofireAPIClient()
let request = SomeRequest()

Task {
    let result = await client.processRequest(request)
    
    switch result {
        case .success(let data):
            // Do something with the data
        case .failure(let error):
            // Handle the error
    }
}
```

As you can see, it is pretty much straightforward. 

# SONetworking

NSURLSession network abstraction layer, using Codable and Decodable for response and Encodable for request. 
<p align="center"><img src="README-Files/headerLogo.png?raw=true"/></p>

## Project Folder and File Structure

```
Data
├── ServiceConfig
├── DataTransferService
│    ├── DataTransferService
│    ├── ResponseDecoder
│    ├── DataTransferErrorLogger 
│    └── DataTransferErrorResolver            
├── NetworkService
│     ├── NetworkService
│     ├── NetworkSessionManager
│     ├── NetworkCancellable
│     ├── NetworkError
│     └── NetworkErrorLogger
│── Endpoint
│      ├── Requestable
│      ├── ResponseRequestable
│      ├── HTTPMethodType
│      └── Endpoint
└── Extensions    
    ......  
```

## High Level Overview 

### ServiceConfig
Configuration file, contains base URL, headers and query Parameters to be reused as an interceptor, under any instance.

```swift
public protocol NetworkConfigurable {
    var baseURL: URL { get }
    var headers: [String: String] { get }
    var queryParameters: [String: String] { get }
}
```
<p align="center"><img src="README-Files/ApiDataNetworkConfig.png?raw=true"/></p>


### DataTransferService
Decode the response into the model and return a error in an case failure.

```swift
public protocol DataTransferService {
    typealias CompletionHandler<T> = (Result<T, DataTransferError>) -> Void
    
    @discardableResult
    func request<T: Decodable, E: ResponseRequestable>(with endpoint: E,
                                                       completion: @escaping CompletionHandler<T>) -> NetworkCancellable? where E.Response == T
    @discardableResult
    func request<E: ResponseRequestable>(with endpoint: E,
                                         completion: @escaping CompletionHandler<Void>) -> NetworkCancellable? where E.Response == Void
}
```
```swift
public protocol DataTransferErrorResolver {
    func resolve(error: NetworkError) -> Error
}
```
```swift
public protocol DataTransferErrorLogger {
    func log(error: Error)
}
```
<p align="center"><img src="README-Files/DefaultDataTransferService.png?raw=true"/></p>



### NetworkService
take the configuration and do the request and log it.

```swift
public protocol NetworkService {
    typealias CompletionHandler = (Result<Data?, NetworkError>) -> Void
    func request(endpoint: Requestable, completion: @escaping CompletionHandler) -> NetworkCancellable?
}
```

```swift
public protocol NetworkSessionManager {
    typealias CompletionHandler = (Data?, URLResponse?, Error?) -> Void
    func request(_ request: URLRequest,
                 completion: @escaping CompletionHandler) -> NetworkCancellable
}
```

```swift
public protocol NetworkErrorLogger {
    var  logEnabled: Bool {get set}
    func log(request: URLRequest)
    func log(responseData data: Data?, response: URLResponse?)
    func log(error: Error)
}
```
<p align="center"><img src="README-Files/DefaultNetworkService.png?raw=true"/></p>



### Endpoint
Convert path to the URL Request with a certain method, header, body, and query.
```swift
public protocol Requestable {
    var path: String { get }
    var isFullPath: Bool { get }
    var method: HTTPMethodType { get }
    var headerParamaters: [String: String] { get }
    var queryParametersEncodable: Encodable? { get }
    var queryParameters: [String: Any] { get }
    var bodyParamatersEncodable: Encodable? { get }
    var bodyParamaters: [String: Any] { get }
    var bodyEncoding: BodyEncoding { get }
    
    func urlRequest(with networkConfig: NetworkConfigurable) throws -> URLRequest
}

extension Requestable {
    /// prepare the url by appening the base url and query parameters. 
    private func url(with config: NetworkConfigurable) throws -> URL { }
    /// prepare the Request by adding headers and bodyParamaters. 
    public func urlRequest(with config: NetworkConfigurable) throws -> URLRequest { }
}

public protocol ResponseRequestable: Requestable {
    associatedtype Response
    var responseDecoder: ResponseDecoder { get }
}
```
<p align="center"><img src="README-Files/Endpoint.png?raw=true"/></p>



## Installing

**SONetworking** is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:
```ruby
pod 'SONetworking'
```

**SONetworking** is also available through [Carthage](https://github.com/Carthage/Carthage). To install
it, simply add the following line to your Cartfile:

```ruby
// TODO 
```

**SONetworking** is also available through [Package Manager](https://swift.org/package-manager/). To install
it, simply add the following line to your Package Manager:

```ruby
// TODO 
```

## 👨🏻‍💻 Author
- Created by [Ahmad AlSofi](https://www.linkedin.com/in/ahmadalsofi/)
- Ahmadalsofi, alsofiahmad@yahoo.com

## ❤️ Contributing
Bug reports and pull requests are welcome on GitHub



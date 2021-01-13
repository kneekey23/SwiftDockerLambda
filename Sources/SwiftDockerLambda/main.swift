import AWSLambdaRuntime

struct Input: Codable {
  
}

struct Output: Codable {
    let statusCode:Int
    let body: String
}

Lambda.run { (context, input: Input, callback: @escaping (Result<Output, Error>) -> Void) in
  callback(.success(Output(statusCode: 200, body: "Hello")))
}


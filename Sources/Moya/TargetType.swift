import Foundation
import Alamofire

/// The protocol used to define the full specifications necessary for a `MoyaProvider`.
public protocol TargetType: TargetURLType, TargetHTTPMethodType, TargetParametersType, TargetSampleDataType, TargetTaskType, TargetValidationType {}

/// The protocol used to define the 'baseURL' and 'path' specifications.
public protocol TargetURLType {

  /// The target's base `URL`.
  var baseURL: URL { get }

  /// The path to be appended to `baseURL` to form the full `URL`.
  var path: String { get }
}

/// The protocol used to define the HTTP request method specifications.
public protocol TargetHTTPMethodType {

  /// The HTTP method used in the request.
  var method: Moya.Method { get }
}

/// The protocol used to define the parameter and encoding specifications.
public protocol TargetParametersType {

  /// The parameters to be incoded in the request.
  var parameters: [String: Any]? { get }

  /// The method used for parameter encoding.
  var parameterEncoding: ParameterEncoding { get }
}

/// The protocol used to define the sample data specifications.
public protocol TargetSampleDataType {

  /// Provides stub data for use in testing.
  var sampleData: Data { get }
}

/// The protocol used to define the HTTP task type specifications.
public protocol TargetTaskType {

  /// The type of HTTP task to be performed.
  var task: Task { get }
}

/// The protocol used to define the Alamofire validation requirements.
public protocol TargetValidationType {

  /// Whether or not to perform Alamofire validation. Defaults to `false`.
  var validate: Bool { get }
}


public extension TargetValidationType {
    var validate: Bool {
        return false
    }
}

/// Represents a type of upload task.
public enum UploadType {

    /// Upload a file.
    case file(URL)

    /// Upload "multipart/form-data"
    case multipart([MultipartFormData])
}

/// Represents a type of download task.
public enum DownloadType {

    /// Download a file to a destination.
    case request(DownloadDestination)
}

/// Represents an HTTP task.
public enum Task {

    /// A basic request task.
    case request

    /// An upload task.
    case upload(UploadType)

    /// A download task.
    case download(DownloadType)
}

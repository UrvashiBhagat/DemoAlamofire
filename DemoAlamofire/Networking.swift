//
//  Networking.swift
//  HomeHunt
//
//  Created by Deepak Pandey on 9/21/15.
//  Copyright © 2015 Neuron Solutions Inc. All rights reserved.
//

import UIKit

struct Networking {
    
    enum Router: URLRequestConvertible {
        
        //** Login / Register
        case appRegistration([String: AnyObject])
        case externalLogin([String: AnyObject])
        case facebookLogin(String)
        case forgotPassword(String)
        case registerDevice(String)
        case removeRegisterDevice(String)
        
        //** About
        case contactUs([String: AnyObject])
    
        //** My account alerts and searches
        case myAccountAlertsAndSearches
        case updateAlertStatus(String)
        case removeAlertsAndSearches(String)

        //** Saved homes
        case savedHomesList(String)
        case savedHomes(String)
        case removeSavedHomes(String)
        case savedHomesIdList
        
        //** Search home
        case searchHome(String, [String: AnyObject])
        
        //** Save search
        case saveSearch(String, [String: AnyObject])

        //** Home detail
        case homeDetails(String)
        
        //** Search criteria
        case searchCriteria
        
        //** Geolocation
        case geoLocation(String)

        // Block User
        case blockPerson([String: AnyObject])
        
        //** RetrieveLocalData
        case retrieveLocalData(String)
        
        //** Home enquiry
        case homeEnquiry(String)
        case contactLandlord([String: AnyObject])
        
        
        var method: HTTPMethod {
            
            switch self {
                //** Post Api
            case .contactUs, .forgotPassword, .updateAlertStatus, .savedHomes, .appRegistration, .externalLogin, .searchHome, .saveSearch, .contactLandlord, .registerDevice:
                return .post
                
                //** Get Api
            case .myAccountAlertsAndSearches, .savedHomesList, .homeDetails, .searchCriteria, .geoLocation, .retrieveLocalData, .savedHomesIdList, .facebookLogin, .homeEnquiry:
                return .get
                
                //** PUT Api
            case .blockPerson:
                return .put
                
                //** DELETE Api
            case .removeAlertsAndSearches, .removeRegisterDevice, .removeSavedHomes:
                return .delete
            }
        }
        
        
        //** Intialize api path in |path|
        var path: String {
            
            switch self {
                
                //** Login / Registration
            case .appRegistration:
                return "appregistration"
                
            case .externalLogin:
                return "externallogin"
                
            case .facebookLogin(let accessToekn):
                return "api/FacebookAppLogin?facebookAccessToken=\(accessToekn)"

            case .forgotPassword(let email):
                return "api/AccountForgotPassword?email=\(email)"
                
            case .registerDevice(let deviceToken):
                return "api/RegisterDevice?\(deviceToken)"
                
            case .removeRegisterDevice(let deviceToken):
                return "api/RegisterDevice?\(deviceToken)"
                
            //** About us
            case .contactUs:
                return "api/ContactUs"
                
            //** My account alerts and searches
            case .myAccountAlertsAndSearches:
                return "api/MyAccountAlertsAndSearches"
                
            case .updateAlertStatus (let query):
                return "api/MyAccountAlertsAndSearches\(query)"
                
            case .removeAlertsAndSearches (let query):
                return "api/MyAccountAlertsAndSearches\(query)"
                
            //** My Saved homes
            case .savedHomesList:
                return "api/MyAccountSavedHomes"
                
            case .savedHomes (let homeId):
                return "api/SaveHome/\(homeId)"
                
            case .removeSavedHomes (let homeId):
                return "api/SaveHome/\(homeId)"
                
            //** My Saved homes
            case .savedHomesIdList:
                return "api/SaveHome"
                
            //** Search home
            case .searchHome(let searchType, _):
                return "search/\(searchType)"
                
            //** Save search
            case .saveSearch(let serachQuery, _):
                return "api/RecordSearch\(serachQuery)"
                
                //** Block User
            case .blockPerson:
                return "api/BlockPerson"
                
                //** Home detail
            case .homeDetails(let homeId):
                return "api/HomeDetails/\(homeId)"
                
            //** Search criteria
            case .searchCriteria:
                return "api/SearchCriteriaLookups"
                
            //** Geolocation
            case .geoLocation(let location):
                return "api/geolocation?location=\(location)"
                
            //** Geolocation
            case .retrieveLocalData(let postcode):
                return "RetrieveLocalData?postcode=\(postcode)"
                
            //** Home enquiry
            case .homeEnquiry(let homeId):
                return "api/HomeEnquiry/\(homeId)"
                
            case .contactLandlord:
                return "api/HomeEnquiry"

            }
        }
        
        
        func asURLRequest() throws -> URLRequest {
            
//            let url = Foundation.URL(string:kAPI_BaseURL)!
//            var urlRequest = URLRequest(url: url.appendingPathComponent(path))
//            urlRequest.httpMethod = method.rawValue
            
            var strUrl = ""
            
            if LoggedInUser.sharedUser.isUserLoggedIn == true || path == "api/SearchCriteriaLookups" || path == appDelegate.retriveDataPath {
                
                if path == appDelegate.retriveDataPath {
                    strUrl = kAPI_BaseURLRetrieveLocalData + path
                }
                else if path == "search/rent" || path == "search/buy" {
                    strUrl = kAPI_BaseURLSearchHome + path
                }
                else {
                    strUrl = kAPI_BaseURL + path
                }
            }
            else {
                if path == "search/rent" || path == "search/buy" {
                    strUrl = kAPI_BaseURLSearchHome + path
                }
                else if path == "appregistration" {
                    strUrl = kAPI_BaseURLIdentityServerRegister + path
                }
                else {
                    strUrl = kAPI_BaseURL + path
                }
            }
            
            strUrl = Util.encodedURL(strUrl)
            
            let URL = NSURL(string:strUrl)!
            var urlRequest = URLRequest(url: URL as URL)
            urlRequest.httpMethod = method.rawValue
            
            if let token = LoggedInUser.sharedUser.accessToken {
                urlRequest.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
            }
            
            urlRequest.setValue(kAPI_XMLHttpRequest, forHTTPHeaderField: kAPI_Key_XRequestedWith)
            urlRequest.setValue("application/json", forHTTPHeaderField: "Content")
            urlRequest.setValue("keep-alive", forHTTPHeaderField: "Connection")
            urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
            
            switch self {
                
                //** Register
            case .appRegistration(let parameters):
                urlRequest = try URLEncoding.default.encode(urlRequest, with: parameters)
                
            case .externalLogin(let parameters):
                urlRequest = try JSONEncoding.default.encode(urlRequest, with: parameters)

            case .searchHome(_, let parameters):
                urlRequest = try JSONEncoding.default.encode(urlRequest, with: parameters)

            //** About
            case .contactUs(let parameters):
                urlRequest = try JSONEncoding.default.encode(urlRequest, with: parameters)

            case .blockPerson(let parameters):
                urlRequest = try JSONEncoding.default.encode(urlRequest, with: parameters)
                
            case .saveSearch(_, let parameters):
                urlRequest = try JSONEncoding.default.encode(urlRequest, with: parameters)
                
            case .contactLandlord(let parameters):
                urlRequest = try JSONEncoding.default.encode(urlRequest, with: parameters)
                
            default:
                break
            }
            
            log.debug(urlRequest.allHTTPHeaderFields!)
            
            return urlRequest
        }

    }
    
    
    /**
     * Genric method use for performing web api request and after getting response callback to caller class.
     *
     * - parameter requestName: A perticular request that define in Router Enum. It may contain request parameter or may not be.
     * - parameter callerObj: Object of class which make api call
     * - parameter showHud: A boolean value that represent is need to display hud for the api or not
     * - parameter completionHandler: A closure that provide callback to caller after getting response
     */
    
    static func performApiCall(_ requestName: Networking.Router, callerObj: AnyObject, showHud: Bool, completionHandler:@escaping ( (DataResponse<Any>) -> Void)) {
        
        //** Show Hud
        if showHud {
            var hudTitle : String
            hudTitle = "Loading"
            
            appDelegate.showProgressIndicator(indicatoreTitle: hudTitle, isShowIndicator: true)
        }
        
        let request = Alamofire.request(requestName).validate().responseJSON { response in
            
            log.debug("Parsed JSON:=========== \(response.result.value)")

            //** Hide Hud
            if showHud {
                appDelegate.hideProgressIndicator()
            }
            
            switch response.result {
                
            case .success:
                log.debug("Get Success response from server with status code:\(response.response?.statusCode), for api request:\(response.request?.url)")
                
                //** Handle failure response
            case .failure:
                log.debug("Get response from server for api request:\(response.request?.url) in failure section")
                log.debug("Get Success response from server with status code:\(response.response?.statusCode), for api request:\(response.request?.url)")
                
                switch requestName {
                case .removeRegisterDevice, .registerDevice, .searchCriteria:
                    break
                    
                default:
                    Networking.handleApiResponse(response)
                }
            }
            completionHandler(response)
        }
        log.debug("Request Added to Queue for exection. Request URL:\(request)")
    }
    
    static func handleApiResponse(_ response: DataResponse<Any>) {
        
        let errorCode = response.response?.statusCode
        if errorCode == nil {
            //errorCode = response.result.error as! Int?
        }
        log.debug("Get response from server with status code:\(errorCode), for api request:\(response.request?.url)")
        
        let dataString = String(data: response.data!, encoding: String.Encoding.utf8)
        
        let result = Util.convertStringToDictionary(dataString!)
        
        var errorDescription = ""
        
        if let errorDes = result?["error_description"] {
            errorDescription = errorDes as! String
        }
        if let errorDes = result?["Message"] {
            errorDescription = errorDes as! String
        }
        if let errorDes = result?["message"] {
            errorDescription = errorDes as! String
        }
        
        if errorDescription == "" && dataString != nil {
            errorDescription = dataString!
        }
        
        log.debug("Api response error:\(errorDescription)")
        
        let strError = errorDescription as String
        
        if let httpStatusCode = errorCode {
            switch httpStatusCode {
                
            case 200, 204:
                log.debug("Request successful")
                
            case 401:
                log.debug("Session Expired")
                
                if LoggedInUser.sharedUser.isUserLoggedIn == true {
                    
                    if UserDefaults.standard.bool(forKey: kAPI_LoginFromFacebook) == true {
                        self.getFacebookTokenAPI_Call()
                    }
                    else {
                        self.getTokenAPI_Call()
                    }
                }
                
                let uiAlert = UIAlertController(title: "Session expire", message: "Authorization has been denied for this request." , preferredStyle:UIAlertControllerStyle.alert)
                appDelegate.window?.rootViewController!.present(uiAlert, animated: true, completion: nil)
                
                uiAlert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { action in
                    
                    if LoggedInUser.sharedUser.isUserLoggedIn == true {
                        //** Perform logout method and show Login screen
                        appDelegate.accountLogoutAPI_Call()
                        
                        UserDefaults.standard.removeObject(forKey: kAPI_SearchDataBuy)
                        UserDefaults.standard.removeObject(forKey: kAPI_SearchDataRent)
                    }
                }))
                
                //** Almofire libarary error code
            case -999:
                log.debug("\(response.request?.url) request was cancelled")
            case -1001:
                Util.showAlertWithMessage(msgTimeOut, title:"Error")
            case -1003, -1004, -1009:
                Util.showAlertWithMessage(msgCheckConnection, title:"Error")
            case -1005:
                Util.showAlertWithMessage(msgConnectionLost, title:"Error")
            case -1200, -1201, -1202, -1203, -1204, -1205, -1206:
                Util.showAlertWithMessage("The secure connection failed for an unknown reason.", title:"SSL Server Error")
                
            default:
                if Util.isValidString(strError) {
                    
                    if (strError.range(of: "The web app you have attempted to reach") != nil) || (strError.range(of: "HomeHunt is offline at the moment") != nil){
                        Util.showAlertWithMessage("HomeHunt is offline at the moment whilst we make some changes to the site. Don't worry - we'll be back up and running in 10 minutes, so please check back then. \n\n The HomeHunt Team.", title:"Server Offline")
                    }
                    else if (strError.range(of: "The user name or password is incorrect") != nil) {
                        
                        let uiAlert = UIAlertController(title: "Error", message: strError , preferredStyle:UIAlertControllerStyle.alert)
                        appDelegate.window?.rootViewController!.present(uiAlert, animated: true, completion: nil)
                        
                        uiAlert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
                            
                        }))
                    }
                    else {
                        let str = strError.replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression, range: nil)
                        Util.showAlertWithMessage(str, title:"Error")
                    }
                }
                else {
                    Util.showAlertWithMessage(msgSorry, title:"Error")
                }
            }
        }
        else {
            Util.showAlertWithMessage(msgSorry, title:"Error")
        }
    }
    
    
    /**
     *   This method upload image(s) as a multipart data format
     * - parameter requestName: A perticular request that define in Router Enum. It may contain request parameter or may not be.
     * - parameter imageArray: Array of images it must not be nil
     * - parameter callerObj: Object of class which make api call
     * - parameter showHud: A boolean value that represent is need to display hud for the api or not
     * - parameter completionHandler: A closure that provide callback to caller after getting response
     */
    static func uploadImages(_ requestName: Networking.Router, imageArray: [UIImage], callerObj: AnyObject, showHud: Bool, completionHandler: ((SessionManager.MultipartFormDataEncodingResult) -> Void)?) {
        
        if imageArray.count < 1 {
            return
        }
        
        Alamofire.upload(multipartFormData: { multipartFormData in
            var index = 1
            for image in imageArray {
                let imageData: Data = (UIImageJPEGRepresentation(image, 1.0) as Data?)!
                
                multipartFormData.append(imageData, withName: "home-\(index)", fileName: "home-\(index)", mimeType: "image/jpeg")
                
                index += 1
            }
            }, with: requestName, encodingCompletion: { result in
                switch result {
                case .success(let upload, _, _):
                    
                    upload.responseJSON { response in
                        log.debug("Image(s) Uploaded successfully:\(response)")
                        Networking.handleApiResponse(response)
                    }
                case .failure(let encodingError):
                    log.debug("encodingError:\(encodingError)")
                }
                completionHandler!(result)
        })
        
    }
    
    
    /**
     * Method use for Image downloading from URL using KingFisher library.
     * - parameter fromUrl: Downloading image URL string
     * - parameter completionHandler: A closure that provide callback to caller after getting response
     */
     static func downloadImage(fromUrl url: String, completionHandler:@escaping (_ image: UIImage?) -> Void) {
 
         if url.isEmpty {
             completionHandler(nil)
             return
         }
 
         let imageViewTest = UIImageView()
        
        imageViewTest.kf.setImage(with: URL(string: url), placeholder: nil, options: nil, progressBlock: nil) { (image, error, cacheType, imageURL) -> () in
            
            completionHandler(image)
        }
        
//         imageViewTest.kf_setImageWithURL(URL(string: url)!, placeholderImage: nil, optionsInfo: nil, completionHandler: { (image, error, cacheType, imageURL) -> () in
// 
//             completionHandler(image: image)
//         })
     }
    
     /**
     * Genric method use for Image downloading from URL.
     * - parameter fromUrl: Downloading image URL string
     * - parameter paceholder: paceholder image name. If we not get image from server then return placehodel image.
     * - parameter completionHandler: A closure that provide callback to caller after getting response
     */
    
    static func downloadImage(fromUrl url: String, withPlaceHolder paceholder: String, completionHandler:@escaping (_ image: UIImage?) -> Void) {
        
        if url.isEmpty && paceholder.isEmpty {
            completionHandler(nil)
            return
        }
        
        if url.isEmpty && !paceholder.isEmpty {
            completionHandler(UIImage(named:paceholder))
            return
        }
        
        let imageViewTest   = UIImageView()
        var defaultImage    = UIImage()
        
        if !paceholder.isEmpty {
            defaultImage = UIImage(named:paceholder)!
        }
        
        imageViewTest.kf.setImage(with: URL(string: url), placeholder: defaultImage, options: nil, progressBlock: nil) { (image, error, cacheType, imageURL) -> () in
            
            if image == nil {
                completionHandler(defaultImage)
            } else {
                completionHandler(image)
            }
        }
    }
    
    
    //****************************************************
    // MARK: - API Methods
    //****************************************************
    
    static func getTokenAPI_Call()
    {
        if (!isNetworkAvailable) {
            return
        }
        
        // create the request & response
        var request = URLRequest(url: URL(string: kAPI_BaseURLIdentityServer + "token")! as URL)
        
        let jsonString = String(format: "grant_type=password&username=%@&password=%@&scope=openid email profile all_claims", Util.getValidString(LoggedInUser.sharedUser.email), Util.getValidString(LoggedInUser.sharedUser.password))
        
        log.debug(jsonString)
        
        //encode the header values
        let encodedAuthorization : Data = "ro.client:secret".data(using: String.Encoding.utf8)!
        var bytes = [UInt8](repeating: 0, count: encodedAuthorization.count)
        encodedAuthorization.copyBytes(to: &bytes, count: encodedAuthorization.count)
        
        let base64EncodedString = encodedAuthorization.base64EncodedString(options: NSData.Base64EncodingOptions.lineLength64Characters)
        
        request.httpMethod = "POST"
        
        request.addValue("Basic \(base64EncodedString)", forHTTPHeaderField: "Authorization")
        request.addValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        request.httpBody = jsonString.data(using: String.Encoding.utf8)
        
        Alamofire.request(request as URLRequest).validate().responseJSON { response in
            
            //** Json Parsing: using SwiftyJSON library
            if let result = response.result.value {
                LoggedInUser.sharedUser.initLoggedInUserFromResponse(result as AnyObject)
            }
        }
    }
    
    static func getFacebookTokenAPI_Call() {
        
        if (!isNetworkAvailable) {
            return
        }
        
        let accessToken = Util.getValidString(UserDefaults.standard.string(forKey: kAPI_FBAccessToken))
        
        let view = UIView()

        Networking.performApiCall(Networking.Router.facebookLogin(Util.getValidString(accessToken as String)), callerObj: view, showHud:true) { (response) -> () in
            
            if response.result.isSuccess {
                
                //** Json Parsing: using SwiftyJSON library
                if let result = response.result.value {
                    LoggedInUser.sharedUser.initLoggedInUserFromResponse(result as AnyObject)
                }
            }
        }
    }
    
}


/**
 * Response Object Serialization Extension
 */
public protocol ResponseObjectSerializable {
    init?(response: HTTPURLResponse, representation: AnyObject)
}
/*
extension Request {

public func responseObject<T: ResponseObjectSerializable>(completionHandler: (NSURLRequest?, NSHTTPURLResponse?, Result<T>) -> Void) -> Self {
let responseSerializer          = GenericResponseSerializer<T> { request, response, data in
let JSONResponseSerializer  = Request.JSONResponseSerializer(options: .AllowFragments)
let result                  = JSONResponseSerializer.serializeResponse(request, response, data)

switch result {
case .Success(let value):
if let
response        = response,
responseObject  = T(response: response, representation: value)
{
return .Success(responseObject)
} else {
let failureReason   = "JSON could not be serialized into response object: \(value)"
let error           = Error.errorWithCode(.JSONSerializationFailed, failureReason: failureReason)
return .Failure(data, error)
}
case .Failure(let data, let error):
return .Failure(data, error)
}
}

return response(responseSerializer: responseSerializer, completionHandler: completionHandler)
}
}

/**
* Response Object Collection Serialization Extension
*/
public protocol ResponseCollectionSerializable {
static func collection(response response: NSHTTPURLResponse, representation: AnyObject) -> [Self]
}

extension Alamofire.Request {
public func responseCollection<T: ResponseCollectionSerializable>(completionHandler: (NSURLRequest?, NSHTTPURLResponse?, Result<[T]>) -> Void) -> Self {
let responseSerializer = GenericResponseSerializer<[T]> { request, response, data in
let JSONSerializer = Request.JSONResponseSerializer(options: .AllowFragments)
let result = JSONSerializer.serializeResponse(request, response, data)

switch result {
case .Success(let value):
if let response = response {
return .Success(T.collection(response: response, representation: value))
} else {
let failureReason = "Response collection could not be serialized due to nil response"
let error = Error.errorWithCode(.JSONSerializationFailed, failureReason: failureReason)
return .Failure(data, error)
}
case .Failure(let data, let error):
return .Failure(data, error)
}
}

return response(responseSerializer: responseSerializer, completionHandler: completionHandler)
}
}
*/

/**
* Response Image Serialization Extension
*/

/*extension Alamofire.Request {

/** Response serializer for images from: http://www.raywenderlich.com/85080/beginning-alamofire-tutorial */
public static func imageResponseSerializer() -> ResponseSerializer<UIImage, NSError> {
return ResponseSerializer { request, response, data, error in

guard let validData = data else {
let failureReason = "Data could not be serialized. Input data was nil."
let error = Error.errorWithCode(.DataSerializationFailed, failureReason: failureReason)
return .Failure(error)
}

if let image = UIImage(data: validData, scale: UIScreen.mainScreen().scale) {
return .Success(image)
}
else {
return .Failure(Error.errorWithCode(.DataSerializationFailed, failureReason: "Unable to create image."))
}

}
}

/** Convenience method for returning images from: http://www.raywenderlich.com/85080/beginning-alamofire-tutorial */
func responseImage(completionHandler: Response<UIImage, NSError> -> Void) -> Self {
return response(responseSerializer: Request.imageResponseSerializer(), completionHandler: completionHandler)
}
}*/

////////////////


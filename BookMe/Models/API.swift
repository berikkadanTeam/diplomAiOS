//
//  API.swift
//  HomeScan
//
//  Created by Dima on 10.05.2018.
//  Copyright © 2018 fime. All rights reserved.
//

import Foundation
import Alamofire

public enum APIRouter: URLRequestConvertible {
    
    private static let baseUrl = Globals.main.url
    
    case getCities, getRestaurants, getDishType, getRestaurantMenu(String)
    
    var method: HTTPMethod {
        
        switch self {
        case .getCities, .getRestaurants, .getDishType, .getRestaurantMenu:
            return .get
        }
        
    }
    
    var path: String{
        
        switch self {
        case .getCities:
            return "Restaurants/GetCities"
        case .getRestaurants:
            return "Restaurants/GetRestaurants"
        case .getDishType:
            return "Restinfo/GetDishType"
        case .getRestaurantMenu:
            return "Restinfo/GetRestaurantMenu"
        }
        
    }
    
    
    var parameters: [String: Any] {
        
        switch self {
        case .getRestaurantMenu(let id):
            return ["restarauntId": id]
        default:
            return [:]
        }
        
        
    }
    
    
    public func addAuthHeader(_ request: inout URLRequest) {
        if Keys.current.get(.token) != "" {
            request.addValue("Authorization", forHTTPHeaderField: "Bearer \(Keys.current.get(.token))")
        }
    }
    
    
    public func asURLRequest() throws -> URLRequest {
        let url = try APIRouter.baseUrl.asURL()
        var request = URLRequest(url: url.appendingPathComponent(path))
        request.httpMethod = method.rawValue
        request.timeoutInterval = TimeInterval(10 * 1000)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        addAuthHeader(&request)
        
        if method == .post || method == .put {
            let data = try JSONSerialization.data(withJSONObject: parameters, options: [])
            request.httpBody = data
            return try URLEncoding.default.encode(request, with: nil)
        }
        
        return try URLEncoding.default.encode(request, with: parameters)
    }
    
    
    
}


public struct APIError{
    var code: String = ""
//    var errorDescription: String{
//        return self.code.localized()
//    }
    
    init(_ code: String){
        self.code = code
    }
}

public func checkResponse(response: DataResponse<Any>) -> String? {
    
    guard let code = response.response?.statusCode, let headers = response.response?.allHeaderFields else {
        return "notResponse"
    }
    
    
    if let _ = response.result.value{
//        var json = JSON(response.data!)
        
//        if json["code"].stringValue != ""{
//            
//            let errString = json["code"].stringValue
//            
//            if(APIError(errString).errorDescription == errString){
//                return json["code"].stringValue
//            }
//            
//            return errString
//            
//        }
    }
    
    if code > 203{
        return "\(code)"
    }
    
    
    
    
    return nil
}

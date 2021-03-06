//
//  AuthAPI.swift
//  MUL
//
//  Created by Dima on 24.05.2018.
//  Copyright © 2018 fime. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper

struct UserAPI{
    
    typealias DefaultResponse = (_ error: APIError?) -> Void
    
    typealias CitiesResponse = (_ result: [City]?, _ error: APIError?) -> Void
    typealias RestaurantsResponse = (_ result: [Restaurant]?, _ error: APIError?) -> Void
    typealias DishTypeResponse = (_ result: [DishType]?, _ error: APIError?) -> Void
    typealias RestaurantMenuResponse = (_ result: [Dish]?, _ error: APIError?) -> Void

//    typealias PromocodeResponse = (_ result: [User]?, _ error: APIError?) -> Void
    
    static public func getCities(_ completion: @escaping CitiesResponse){
        
        AF.manager.request(APIRouter.getCities)
            .log(.verbose)
            .responseJSON { res in
                if let error = checkResponse(response: res){
                    if error != ""{
                        completion(nil, APIError(error))
                    }
                }
            }
            .responseArray { (response: DataResponse<[City]>) in
                if let result = response.result.value {
                    completion(result, nil)
                }
        }
        
    }
    
    static public func getRestaurants(_ completion: @escaping RestaurantsResponse){
        AF.manager.request(APIRouter.getRestaurants)
            .log(.verbose)
            .responseJSON { res in
                if let error = checkResponse(response: res){
                    if error != ""{
                        completion(nil, APIError(error))
                    }
                }
            }
            .responseArray { (response: DataResponse<[Restaurant]>) in
                if let result = response.result.value {
                    completion(result, nil)
                }
        }
    }
    
    static public func getDishTypes(_ completion: @escaping DishTypeResponse){
        AF.manager.request(APIRouter.getDishType)
            .log(.verbose)
            .responseJSON { res in
                if let error = checkResponse(response: res){
                    if error != ""{
                        completion(nil, APIError(error))
                    }
                }
            }
            .responseArray { (response: DataResponse<[DishType]>) in
                if let result = response.result.value {
                    completion(result, nil)
                }
        }
    }
    
    static public func getDihes(id: String, _ completion: @escaping RestaurantMenuResponse){
        AF.manager.request(APIRouter.getRestaurantMenu(id))
            .log(.verbose)
            .responseJSON { res in
                if let error = checkResponse(response: res){
                    if error != ""{
                        completion(nil, APIError(error))
                    }
                }
            }
            .responseArray { (response: DataResponse<[Dish]>) in
                if let result = response.result.value {
                    completion(result, nil)
                }
        }
    }

}

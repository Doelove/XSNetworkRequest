//
//  XSNetworkRequest.swift
//  XSNetworkRequest
//
//  Created by 刘佳斌 on 2017/9/19.
//  Copyright © 2017年 xiaosi. All rights reserved.
//

import UIKit
import AFNetworking

public class XSNetWorkRequest{
    
    public class func sharedInstance()->XSNetWorkRequest{
        struct shareStatic{
            static var instance:XSNetWorkRequest = XSNetWorkRequest()
        }
        return shareStatic.instance
    }
    
    public func getRequest(baseUrl:String,lastUrl:String,params:Any?,success: ((URLSessionDataTask, Any?) -> Void)?,failture: ((URLSessionDataTask?, Error) -> Void)?){
        
        let manager:AFHTTPSessionManager = AFHTTPSessionManager()
        manager.requestSerializer = AFJSONRequestSerializer()
        manager.responseSerializer.acceptableContentTypes = NSSet.init(objects: "text/html","text/plain","application/json") as? Set<String>
        manager.get(baseUrl+lastUrl, parameters: params, progress: nil, success: success, failure: failture)
    }
    
    public func postRequest(baseUrl:String,lastUrl:String,params:Any?,token:String?,headerField:String?,success:((URLSessionDataTask,Any?)->Void)?,failture:((URLSessionDataTask?,Error)->Void)?){
        let manager:AFHTTPSessionManager = AFHTTPSessionManager()
        manager.requestSerializer = AFJSONRequestSerializer()
        manager.responseSerializer.acceptableContentTypes = NSSet.init(objects: "text/html","text/plain","application/json") as? Set<String>
        if token != nil{
            manager.requestSerializer.setValue(token, forHTTPHeaderField: headerField!)
        }
        manager.post(baseUrl+lastUrl, parameters: params, progress: nil, success: success, failure: failture)
    }
    
    public func deleteRequest(baseUrl:String,lastUrl:String,params:Any?,success:((URLSessionDataTask,Any?)->Void)?,failure:((URLSessionDataTask?,Error)->Void)?){
        let manager:AFHTTPSessionManager = AFHTTPSessionManager()
        manager.responseSerializer.acceptableContentTypes = NSSet.init(objects: "text/html","text/plain","application/json") as? Set<String>
        manager.requestSerializer = AFJSONRequestSerializer()
        manager.responseSerializer = AFJSONResponseSerializer()
        manager.delete(baseUrl+lastUrl, parameters: params, success: success, failure: failure)
    }
}

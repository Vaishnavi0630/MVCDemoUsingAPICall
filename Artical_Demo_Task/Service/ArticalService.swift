//
//  ArticalService.swift
//  Artical_Demo_Task
//
//  Created by Admin on 10/06/19.
//  Copyright © 2019 Admin. All rights reserved.
//

import Foundation
import SwiftyJSON
import Alamofire
import SVProgressHUD


protocol ArticalDelegate {
    
    func showArticalData(artical: [Artical])
}


class ArticalService {
    
    static var instance = ArticalService()
    
    private var sessionManger = Alamofire.SessionManager()
    
    var articalsArray: [Artical] = []
    
    var delegate: ArticalDelegate?
    
    func getArticalData()
    {
        let headers: HTTPHeaders = [
            "Content-Type": "application/json"
        ]
        
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = 100
        self.sessionManger = Alamofire.SessionManager(configuration: configuration)
        
        SVProgressHUD.show()
        self.sessionManger.request(articalURL, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: headers).responseJSON { response in
            SVProgressHUD.dismiss()
            switch response.result{
            case .success(let value):
                let json = JSON(value)
                json["articles"].array?.forEach({ (artical) in
                    let articalData = Artical(author: artical["author"].stringValue, title: artical["title"].stringValue, url: artical["url"].stringValue, description: artical["description"].stringValue, img: artical["urlToImage"].stringValue)
                    self.articalsArray.append(articalData)
                })
                self.delegate?.showArticalData(artical: self.articalsArray)

            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
}

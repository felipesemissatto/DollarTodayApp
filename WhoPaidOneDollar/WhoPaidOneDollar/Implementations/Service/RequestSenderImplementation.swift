//
//  RequestSenderImplementation.swift
//  WhoPaidOneDollar
//
//  Created by Felipe Semissatto on 08/02/21.
//

import Foundation
import Alamofire
import SwiftyJSON

class RequestSenderImplementation {
    
    
    func addNewPerson(name: String,
                      photoUrl: URL?,
                      twitter: String?,
                      instagram: String?,
                      date: NSDate,
                      completion: @escaping(String?) -> Void) {
        
        guard let url = URL(string: rootBackendURL + "/person") else {
            completion("Error: URL not decoded")
            return
        }
        
        let parameters: Parameters = [ "name" : name,
                                       "photoUrl" : photoUrl ?? "",
                                       "twitter": twitter ?? "",
                                       "instagram": instagram ?? "",
                                       "date": date]
        
        Alamofire
            .request(url,
                    method: .post,
                    parameters: parameters,
                    encoding: JSONEncoding.default)
            .responseJSON(completionHandler: { response in
                switch response.result {
                    case .success(let json):
                        let jsonData = json
                        print(jsonData)
                        completion(nil)
                    case .failure(let error):
                        completion(error.localizedDescription)
               }
           })
    }
}

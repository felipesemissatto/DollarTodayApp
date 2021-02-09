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
    
    func getURLFromAnImage(image: UIImage,
                           completion: @escaping(String?) -> Void) -> URL?{
        guard let url = URL(string: "https://api.imgur.com/3/image") else {
            completion("Error: URL not decoded")
            return nil
        }
        
        let imageData = image.jpeg(.lowest)
        let base64Image = imageData?.base64EncodedString(options: .lineLength64Characters)
        
        let parameters: Parameters = [ "image" : base64Image ?? ""]
        
        Alamofire
            .request(url,
                     method: .post,
                     parameters: parameters,
                     encoding: JSONEncoding.default,
                     headers: ["Authorization": "Client-ID " + clientIdIMGUR])
            .responseJSON(completionHandler: { response in
                switch response.result {
                case .success:
                    let json = try? JSONSerialization.jsonObject(with: response.data!, options: .allowFragments) as? [String:Any]
                    print(json)
                    let imageDic = json?["data"] as? [String:Any]
                    print(imageDic?["link"])
                    completion(nil)
                case .failure(let error):
                    completion(error.localizedDescription)
                }
            })
        
        //https://i.imgur.com/QmM5F3a.jpg
        return URL(fileURLWithPath: "dcd")
    }
    
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

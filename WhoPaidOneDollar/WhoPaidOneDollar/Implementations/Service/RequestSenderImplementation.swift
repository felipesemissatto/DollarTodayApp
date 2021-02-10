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
                           completion: @escaping(String?, String?) -> Void){
        var newProfilePicURLString: String?
        
        guard let url = URL(string: "https://api.imgur.com/3/image") else {
            completion(nil, "Error: URL not decoded")
            return
        }
        
        let imageData = image.jpeg(.lowest)
        let base64Image = imageData?.base64EncodedString(options: .lineLength64Characters)
        
        let parameters: Parameters = [ "image" : base64Image ?? ""]
        
        Alamofire
            .request(url,
                     method: .post,
                     parameters: parameters,
                     encoding: JSONEncoding.default,
                     headers: ["Authorization": "Client-ID " + CLIENT_ID_IMGUR])
            .responseJSON(completionHandler: { response in
                switch response.result {
                case .success:
                    let json = try? JSONSerialization.jsonObject(with: response.data!, options: .allowFragments) as? [String:Any]
                    let imageDic = json?["data"] as? [String:Any]
                    newProfilePicURLString = imageDic?["link"] as? String
                    completion(newProfilePicURLString ?? IMAGE_DEFAULT_URL,nil)
                case .failure(let error):
                    completion(nil, error.localizedDescription)
                }
            })
    }
    
    func addNewPerson(name: String,
                      photoUrlString: String?,
                      twitter: String?,
                      instagram: String?,
                      date: String,
                      completion: @escaping(String?) -> Void) {
        
        guard let url = URL(string: ROOT_BACKEND_URL + "/person") else {
            completion("Error: URL not decoded")
            return
        }
        
        let parameters: Parameters = [ "name" : name,
                                       "photoUrl" : photoUrlString ?? "",
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

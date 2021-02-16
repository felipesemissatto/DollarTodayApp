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
    
    // MARK: - Parsers
    private var parserPeople = ConverterPersonJSON()
    private var parserMessages = ConverterMessageJSON()
    
    // MARK: - People Methods
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
                      completion: @escaping(String?, String?) -> Void) {
        
        guard let url = URL(string: ROOT_BACKEND_URL + "/person") else {
            completion(nil, "Error: URL not decoded")
            return
        }
        
        let parameters: Parameters = ["name": name,
                                      "photoUrl": photoUrlString ?? IMAGE_DEFAULT_URL,
                                      "twitter": twitter ?? "",
                                      "instagram": instagram ?? "",
                                      "date": date]
        Alamofire
            .request(url,
                     method: .post,
                     parameters: parameters,
                     encoding: JSONEncoding.default)
            .responseString(completionHandler: { response in
                switch response.result {
                case .success:
                    guard let idResponse = response.result.value else {
                        completion(nil, "Error: can not save datas")
                        return
                    }
                    completion(idResponse, nil)
                case .failure(let error):
                    completion(nil, error.localizedDescription)
                }
            })
    }
    
    func getAllPeople(completion: @escaping([Person]?, String?) -> Void) {
        guard let url = URL(string: ROOT_BACKEND_URL + "/person") else {
            completion(nil, "Error: URL not decoded")
            return
        }
        
        Alamofire
            .request(url,
                     method: .get,
                     encoding: JSONEncoding.default)
            .responseJSON(completionHandler: { response in
                switch response.result {
                case .success:
                    guard let responseValue = response.value else { return }
                    let jsonResponse = JSON(responseValue)
                    guard let jsonResponseArray = jsonResponse.array else {
                        completion(nil, "Error: it was not possible to process response")
                        return
                    }
                    let people = self.parserPeople.parserJSONPeople(json: jsonResponseArray)
                    completion(people, nil)
                case .failure(let error):
                    completion(nil, error.localizedDescription)
                }
            })
    }
    
    func updatePerson(person: Person,
                      completion: @escaping(String?) -> Void) {
        var nameText = ""
        var photoUrlText = ""
        var twitterText = ""
        var instagramText = ""
        
        // Building the url
        // a pessoa pode retirar o twitter ou instagram deixando os campos vazios
        var urlString = ROOT_BACKEND_URL + "person/\(person.personId)?"
        
        urlString += "name=\(person.name)"
        nameText = person.name
        
        if let twitter = person.twitter {
                urlString += "&twitter=\(twitter)"
                twitterText = twitter
        } else  {
            urlString += "&twitter="
            twitterText = ""
        }
        
        if let url = person.photoUrl {
                urlString += "&photoUrl=\(url.absoluteString)"
                photoUrlText = url.absoluteString
        } else {
            urlString += "&photoUrl="
            photoUrlText = ""
        }
        
        if let instagram = person.instagram  {
                urlString += "&instagram=\(instagram)"
                instagramText = instagram
        } else {
            urlString += "&instagram="
            instagramText = ""
        }
        
        print(urlString)
        
        guard let uString = urlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else {
            completion("Error: URL not decoded")
            return
        }
        
        guard let url = URL(string: uString) else {
            completion("Error: URL not decoded")
            return
        }
        

        let parameters: Parameters = ["name": nameText,
                                      "photoUrl": photoUrlText,
                                      "twitter": twitterText,
                                      "instagram": instagramText]
        
        Alamofire
            .request(url,
                     method: .put,
                     parameters: parameters,
                     encoding: JSONEncoding.default)
            .responseString(completionHandler: { response in
                switch response.result {
                case .success:
                    completion(nil)
                case .failure(let error):
                    completion(error.localizedDescription)
                }
            })
    }
    // MARK: - Message Methods
    func getAllMessages(completion: @escaping([Message]?, String?) -> Void) {
        guard let url = URL(string: ROOT_BACKEND_URL + "/message") else {
            completion(nil, "Error: URL not decoded")
            return
        }
        
        Alamofire
            .request(url,
                     method: .get,
                     encoding: JSONEncoding.default)
            .responseJSON(completionHandler: { response in
                switch response.result {
                case .success:
                    guard let responseValue = response.value else { return }
                    let jsonResponse = JSON(responseValue)
                    guard let jsonResponseArray = jsonResponse.array else {
                        completion(nil, "Error: it was not possible to process response")
                        return
                    }
                    let messages = self.parserMessages.parserJSONMessages(json: jsonResponseArray)
                    completion(messages, nil)
                case .failure(let error):
                    completion(nil, error.localizedDescription)
                }
            })
    }
    
    func postNewMessage(person: Person, date: String, textMessage: String, completion: @escaping(String?) -> Void) {
        guard let url = URL(string: ROOT_BACKEND_URL + "/message") else {
            completion("Error: URL not decoded")
            return
        }
        
        let parameters: Parameters = [
            "idPerson": [
                "personId": person.personId,
                "name": person.name,
                "photoUrl": person.photoUrl?.absoluteString ?? IMAGE_DEFAULT_URL,
                "twitter": person.twitter ?? "",
                "instagram": person.instagram ?? "",
                "date": person.date.description[0 ..< 11]
            ],
            "textMessage": textMessage,
            "date": date]
        
        Alamofire
            .request(url,
                     method: .post,
                     parameters: parameters,
                     encoding: JSONEncoding.default)
            .responseString(completionHandler: { response in
                switch response.result {
                case .success:
                    completion(nil)
                case .failure(let error):
                    completion(error.localizedDescription)
                }
            })
    }
}

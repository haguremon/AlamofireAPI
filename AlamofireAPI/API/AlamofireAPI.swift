//
//  AlamofireAPI.swift
//  AlamofireAPI
//
//  Created by IwasakIYuta on 2021/07/31.
//

import Foundation
import Alamofire
protocol getMyGitHubDelegate: AnyObject {
    func getUser(user: [Owner],repository: [HaguremonRepository])
}
class AlamofireAPI {
    weak var delegate: getMyGitHubDelegate?
    //URLSessionと似てるけど楽しいし簡単
    func alamofireApi(){
        AF.request("https://api.github.com/search/repositories?q=user:haguremon").responseJSON { [weak self] response in
            guard let data = response.data,
                  response.error == nil ,
                  let response = response.response,
                  response.statusCode == 200  else { return }
            do {

                let repository = try JSONDecoder().decode(MyGitHub.self, from: data).items
                guard let user = repository.first?.owner else { return }
                self?.delegate?.getUser(user: [user],repository: repository)
            } catch {
                print(error)
            }
        }
    }
    
}

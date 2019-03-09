//
//  NormalDetailInteractor.swift
//  Viper-Sample
//
//  Created by 손창우 on 04/03/2019.
//  Copyright © 2019 kor45cw. All rights reserved.
//

import Foundation
import Alamofire

struct Posts: Decodable {
    var userId: Int
    var id: Int
    var title: String
    var body: String
}

class NormalDetailInteractor: NormalDetailInteractorInputProtocol {
    var presenter: NormalDetailInteractorOutputProtocol?
    
    func fetchDatas() {
        let url = URL(string: "http://jsonplaceholder.typicode.com/posts")!
        AF.request(url, method: .get).validate().responseDecodable { (response: DataResponse<[Posts]>) in
            switch response.result {
            case .success(let value):
                print(value.count)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}

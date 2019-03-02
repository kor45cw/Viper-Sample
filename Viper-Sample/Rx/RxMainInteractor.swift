//
//  RxMainInteractor.swift
//  Viper-Sample
//
//  Created by 손창우 on 01/03/2019.
//  Copyright © 2019 kor45cw. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa
import Alamofire

enum OtherError: Error {
    case unexpected(Error)
    case unknownError
}

class RxMainInteractor: RxMainInteractorInputProtocol {
    weak var output: RxMainInteractorOutputProtocol?
    
    func fetchDatas() -> Single<Result<[MainEntity]>> {
        return Single.create(subscribe: { [weak self] observer in
            guard self != nil else {
                observer(.error(OtherError.unknownError))
                return Disposables.create()
            }
            DispatchQueue.main.async {
                observer(.success(Result.success(MainEntity.allCases)))
            }
            return Disposables.create()
        })
    }
}

//
//  RxMainProtocols.swift
//  Viper-Sample
//
//  Created by 손창우 on 02/03/2019.
//  Copyright © 2019 kor45cw. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift
import Alamofire

protocol RxMainRouterProtocol {
    static func createModule() -> UIViewController
    // PRESENTER -> Router
    func presentDetailScreen(for data: MainEntity)
}

protocol RxMainPresenterProtocol {
    func viewDidLoad()
    func viewWillAppear(animated: Bool)
    func viewDidAppear(animated: Bool)
    func viewWillDisappear(animated: Bool)
    func viewDidDisappear(animated: Bool)
    
    var didItemsChange: Driver<[MainEntity]> { get }
    func showDetails(for item: MainEntity)
}

protocol RxMainViewProtocol: class {
    
}

protocol RxMainInteractorInputProtocol {
    // PRESENTER -> INTERACTOR
    func fetchDatas() -> Single<Result<[MainEntity]>>
}

protocol RxMainInteractorOutputProtocol: class {
    
}

//
//  RxMainRouter.swift
//  Viper-Sample
//
//  Created by 손창우 on 01/03/2019.
//  Copyright © 2019 kor45cw. All rights reserved.
//

import UIKit

class RxMainRouter: RxMainRouterProtocol {
    static func createModule() -> UIViewController {
        let view = mainStoryboard.instantiateViewController(withIdentifier: "RxMainView")
        if let view = view as? RxMainView {
            let interactor = RxMainInteractor()
            let presenter = RxMainPresenter(router: RxMainRouter(), view: view, interactor: interactor)
            view.presenter = presenter
            interactor.output = presenter
            return view
        }
        return UIViewController()
    }
    
    static var mainStoryboard: UIStoryboard {
        return UIStoryboard(name: "Main", bundle: Bundle.main)
    }
    
    func presentDetailScreen(for data: MainEntity) {
        
    }
}

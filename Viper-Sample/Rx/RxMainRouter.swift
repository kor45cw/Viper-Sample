//
//  RxMainRouter.swift
//  Viper-Sample
//
//  Created by 손창우 on 01/03/2019.
//  Copyright © 2019 kor45cw. All rights reserved.
//

import UIKit

class RxMainRouter: RxMainRouterProtocol {
    // MARK: - Private properties -
    weak var viewController: UIViewController!
    
    func createModule() -> UIViewController {
        let view = mainStoryboard.instantiateViewController(withIdentifier: "RxMainView")
        if let view = view as? RxMainView {
            let interactor = RxMainInteractor()
            let presenter = RxMainPresenter(router: self, view: view, interactor: interactor)
            view.presenter = presenter
            interactor.output = presenter
            self.viewController = view
            return view
        }
        return UIViewController()
    }
    
    var mainStoryboard: UIStoryboard {
        return UIStoryboard(name: "Main", bundle: Bundle.main)
    }
    
    func presentDetailScreen(for data: MainEntity) {
        
    }
}

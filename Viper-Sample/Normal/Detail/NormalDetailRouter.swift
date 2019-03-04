//
//  NormalDetailRouter.swift
//  Viper-Sample
//
//  Created by 손창우 on 04/03/2019.
//  Copyright © 2019 kor45cw. All rights reserved.
//

import UIKit

class NormalDetailRouter: NormalDetailRouterProtocol {
    
    func dismiss(from view: NormalDetailViewProtocol) {
        if let sourceView = view as? UIViewController {
            sourceView.navigationController?.popViewController(animated: true)
        }
    }
    
    static func createModule() -> UIViewController {
        let view = mainStoryboard.instantiateViewController(withIdentifier: "NormalDetailView")
        if let view = view as? NormalDetailView {
//            let presenter: NormalMainPresenterProtocol & NormalMainInteractorOutputProtocol = NormalMainPresenter()
//            let interactor: NormalMainInteractorInputProtocol = NormalMainInteractor()
            //            let localDataManager: PostListLocalDataManagerInputProtocol = PostListLocalDataManager()
            //            let remoteDataManager: PostListRemoteDataManagerInputProtocol = PostListRemoteDataManager()
//            let router: NormalMainRouterProtocol = NormalMainRouter()
            
//            view.presenter = presenter
//            presenter.view = view
//            presenter.router = router
//            presenter.interactor = interactor
//            interactor.presenter = presenter
            //            interactor.localDatamanager = localDataManager
            //            interactor.remoteDatamanager = remoteDataManager
            //            remoteDataManager.remoteRequestHandler = interactor
            
            return view
        }
        return UIViewController()
    }
    
    static var mainStoryboard: UIStoryboard {
        return UIStoryboard(name: "Main", bundle: Bundle.main)
    }
}

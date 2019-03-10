//
//  NormalDetailProtocols.swift
//  Viper-Sample
//
//  Created by 손창우 on 04/03/2019.
//  Copyright © 2019 kor45cw. All rights reserved.
//

import UIKit

protocol NormalDetailPresenterProtocol: class {
    var view: NormalDetailViewProtocol? { get set }
    var interactor: NormalDetailInteractorInputProtocol? { get set }
    var router: NormalDetailRouterProtocol? { get set }
    
    // VIEW -> PRESENTER
    func viewDidLoad()
    func showDetails(for item: MainEntity)
    var itemCount: Int { get }
    subscript(index: Int) -> Post? { get }
}

protocol NormalDetailInteractorOutputProtocol: class {
    // INTERACTOR -> PRESENTER
    func loadFinished(_ result: [Post])
    func loadOnError()
}

protocol NormalDetailInteractorInputProtocol: class {
    var presenter: NormalDetailInteractorOutputProtocol? { get set }
    // PRESENTER -> INTERACTOR
    func fetchDatas()
}

protocol NormalDetailViewProtocol {
    var presenter: NormalDetailPresenterProtocol? { get set }
    
    // PRESENTER -> VIEW
    func updateData()
    func showError()
}

protocol NormalDetailRouterProtocol {
    static func createModule() -> UIViewController
    
    // PRESENTER -> Router
    func dismiss(from view: NormalDetailViewProtocol)
}



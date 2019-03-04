//
//  NormalMainProtocols.swift
//  Viper-Sample
//
//  Created by 손창우 on 01/03/2019.
//  Copyright © 2019 kor45cw. All rights reserved.
//

import UIKit

protocol NormalMainPresenterProtocol: class {
    var view: NormalMainViewProtocol? { get set }
    var interactor: NormalMainInteractorInputProtocol? { get set }
    var router: NormalMainRouterProtocol? { get set }

    // VIEW -> PRESENTER
    func viewDidLoad()
    func showDetails(for item: MainEntity)
}

protocol NormalMainInteractorOutputProtocol: class {
    // INTERACTOR -> PRESENTER
    func loadFinished()
    func loadOnError()
}

protocol NormalMainInteractorInputProtocol: class {
    var presenter: NormalMainInteractorOutputProtocol? { get set }
    // PRESENTER -> INTERACTOR
    func fetchDatas()
}

protocol NormalMainViewProtocol {
    var presenter: NormalMainPresenterProtocol? { get set }

    // PRESENTER -> VIEW
    func showDatas(with datas: [MainEntity])
}

protocol NormalMainRouterProtocol {
    static func createModule() -> UIViewController

    // PRESENTER -> Router
    func presentPostDetailScreen(from view: NormalMainViewProtocol, for data: MainEntity)
}



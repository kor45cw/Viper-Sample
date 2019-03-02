//
//  RxMainPresenter.swift
//  Viper-Sample
//
//  Created by 손창우 on 01/03/2019.
//  Copyright © 2019 kor45cw. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class RxMainPresenter {
    private weak var _view: RxMainViewProtocol?
    private let _interactor: RxMainInteractorInputProtocol
    private let _router: RxMainRouterProtocol
    
    // MARK: - Public properties -
    let didItemsChange: Driver<[MainEntity]>
    
    // MARK: - Private properties -
    private let didItemsChangeRelay: BehaviorRelay<[MainEntity]>
    private let disposeBag = DisposeBag()

    init(router: RxMainRouterProtocol, view: RxMainViewProtocol, interactor: RxMainInteractorInputProtocol) {
        self._router = router
        self._view = view
        self._interactor = interactor
        
        let didItemsChangeRelay = BehaviorRelay<[MainEntity]>(value: [])
        self.didItemsChangeRelay = didItemsChangeRelay
        self.didItemsChange = didItemsChangeRelay.asDriver()
    }
}

extension RxMainPresenter: RxMainPresenterProtocol {
    func showDetails(for item: MainEntity) {
        _router.presentDetailScreen(for: item)
    }
    
    func viewDidLoad() {
        self.fetchList()
    }
    
    func viewWillAppear(animated: Bool) {
        
    }
    
    func viewDidAppear(animated: Bool) {
        
    }
    
    func viewWillDisappear(animated: Bool) {
        
    }
    
    func viewDidDisappear(animated: Bool) {
        
    }
    
    private func fetchList() {
        _interactor.fetchDatas()
            .subscribeOn(MainScheduler.instance)
            .subscribe(
                onSuccess: { [weak self] result in
                    guard let self = self else { return }
                    switch result {
                    case let .success(items):
                        self.didItemsChangeRelay.accept(items)
                    case let .failure(error):
                        print(error)
                    }
                }, onError: { error in
                    print(error)
            }).disposed(by: disposeBag)
    }
}

extension RxMainPresenter: RxMainInteractorOutputProtocol {
    
}


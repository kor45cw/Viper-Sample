//
//  Viper_NormalMainTests.swift
//  Viper-SampleTests
//
//  Created by 손창우 on 10/04/2019.
//  Copyright © 2019 kor45cw. All rights reserved.
//

import XCTest
@testable import Viper_Sample

class NormalMainTests: XCTestCase {
    
    var interactor: NormalMainInteractor!
    var presenter: NormalMainPresenterMock!
    
    override func setUp() {
        super.setUp()
        presenter = NormalMainPresenterMock()
        interactor = NormalMainInteractor()
        
        presenter.interactor = interactor
        interactor.presenter = presenter
    }
    
    override func tearDown() {
        super.tearDown()
        presenter = nil
        interactor = nil
    }
    
    func testGetDatas() {
        // When
        presenter.viewDidLoad()
        
        // Then
        XCTAssertEqual(presenter.datas, MainEntity.allCases)
    }
}

class NormalMainPresenterMock: NormalMainInteractorOutputProtocol, NormalMainPresenterProtocol {
    var view: NormalMainViewProtocol?
    var interactor: NormalMainInteractorInputProtocol?
    var router: NormalMainRouterProtocol?
    
    var datas: [MainEntity] = []
    
    func viewDidLoad() {
        interactor?.fetchDatas()
    }
    
    func showDetails(for item: MainEntity) {
        
    }
    
    func loadFinished(with datas: [MainEntity]) {
        self.datas = datas
    }
    
    func loadOnError() {
        
    }
}

//
//  BaseViewModel.swift
//  OMDB-API-URLSession-MVVMR
//
//  Created by Amber Çatalbaş on 28.10.2023.
//

import Foundation

protocol BaseViewModelDataSource: AnyObject {}

protocol BaseViewModelEventSource: AnyObject {

}

protocol BaseViewModelProtocol: BaseViewModelDataSource, BaseViewModelEventSource {}

class BaseViewModel<R: Router>: BaseViewModelProtocol {
    
    let router: R
  
  init(router: R) {
      self.router = router
  }
    
    #if DEBUG
    deinit {
        debugPrint("deinit \(self)")
    }
    #endif
    
}

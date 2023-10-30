//
//  HomeViewModel.swift
//  OMDB-API-URLSession-MVVMR
//
//  Created by Amber Çatalbaş on 28.10.2023.
//

import Foundation

enum SearchType {
    case tableViewList
    case collectionViewList
}

protocol HomeViewDataSource {
    func numberOfItemsAtCollectionView(section: Int) -> Int
    func cellItemAtCollectionView(indexPath: IndexPath) -> HomeCollectionViewCellProtocol
    func numberOfItemsAtTableView(section: Int) -> Int
    func cellItemAtTableView(indexPath: IndexPath) -> HomeTableViewCellProtocol
    func showDetailScene(movie: Movie)
    func generateInıtialize()
    func searchTimer(text: String, searchType: SearchType)
    func searchMovie(text: String, searchType: SearchType)
    func searchRemainingMovies(searchType: SearchType)
}

protocol HomeViewEventSource {
    var didListUpdated: SearchTypeClosure? {get}
}

protocol HomeViewProtocol: HomeViewDataSource, HomeViewEventSource {}

final class HomeViewModel: BaseViewModel<HomeRouter>, HomeViewProtocol {
    var didListUpdated: SearchTypeClosure?
    private var isSearchableTV = false
    private var isSearchableCV = false
    private var pageTV = 1
    private var pageCV = 1
    private var movieNameTV: String = ""
    private var movieNameCV: String = ""
    var totalItemsTV = 0
    var totalItemsCV = 0
    var cellItemsTableView: [HomeTableViewCellProtocol] = []
    var timer: Timer?
    var cellItemsCollectionView: [HomeCollectionViewCellProtocol] = []
    
    func showDetailScene(movie: Movie) {
        router.pushDetail(movie: movie)
    }
    
    func generateInıtialize() {
        let dispatchGroup = DispatchGroup()
        dispatchGroup.enter()
        DispatchQueue.global().async { [self] in
            searchMovie(text: "star", searchType: .tableViewList)
            dispatchGroup.leave()
        }
        dispatchGroup.enter()
        DispatchQueue.global().async { [self] in
            searchMovie(text: "comedy", searchType: .collectionViewList)
            dispatchGroup.leave()
        }
        dispatchGroup.notify(queue: .main) {
        }
    }
    
    func searchTimer(text: String, searchType: SearchType) {
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false, block: { _ in
            self.searchMovie(text: text, searchType: searchType)
        })
    }
    
    func searchMovie(text: String, searchType: SearchType) {
        var request = SearchRequest(s: "", page: 1)
        switch searchType {
        case .tableViewList:
            if text != movieNameTV {
                request = SearchRequest(s: text, page: 1)
                self.cellItemsTableView.removeAll()
            } else {
                request = SearchRequest(s: text, page: pageTV)
            }
        case .collectionViewList:
            if text != movieNameCV {
                request = SearchRequest(s: text, page: 1)
                self.cellItemsCollectionView.removeAll()
            } else {
                request = SearchRequest(s: text, page: pageCV)
            }
        }
        LoadingUtils.shared.visible()
        SearchManager.shared.search(request: request) { [self] response in
            LoadingUtils.shared.visible(false)
            switch searchType {
            case .tableViewList:
                self.cellItemsTableView += response.searchTableViewList
                self.totalItemsTV = response.totalResults?.toInt ?? 0
                self.isSearchableTV = self.totalItemsTV > cellItemsTableView.count
                self.movieNameTV = text
                self.didListUpdated?(.tableViewList)
            case .collectionViewList:
                self.cellItemsCollectionView += response.searchCollectionViewList
                self.totalItemsCV = response.totalResults?.toInt ?? 0
                self.isSearchableCV = self.totalItemsCV > cellItemsCollectionView.count
                self.movieNameCV = text
                self.didListUpdated?(.collectionViewList)
            }
        } onFailure: { error in
            LoadingUtils.shared.visible(false)
        }
        
    }
    
    func searchRemainingMovies(searchType: SearchType) {
        switch searchType {
        case .tableViewList:
            guard isSearchableTV else {return}
            LoadingUtils.shared.visible()
            isSearchableTV = false
            pageTV += 1
            
            searchMovie(text: movieNameTV, searchType: .tableViewList)
        case .collectionViewList:
            guard isSearchableCV else {return}
            LoadingUtils.shared.visible()
            isSearchableCV = false
            pageCV += 1
            searchMovie(text: movieNameCV, searchType: .collectionViewList)
        }
    }
    
}

// MARK: - TableView
extension HomeViewModel {
    
    func numberOfItemsAtTableView(section: Int) -> Int {
        return cellItemsTableView.count
    }
    
    func cellItemAtTableView(indexPath: IndexPath) -> HomeTableViewCellProtocol {
        return cellItemsTableView[indexPath.row]
    }
    
}

extension HomeViewModel {
    
    func numberOfItemsAtCollectionView(section: Int) -> Int {
        return cellItemsCollectionView.count
    }
    
    func cellItemAtCollectionView(indexPath: IndexPath) -> HomeCollectionViewCellProtocol {
        return cellItemsCollectionView[indexPath.row]
    }
    
}

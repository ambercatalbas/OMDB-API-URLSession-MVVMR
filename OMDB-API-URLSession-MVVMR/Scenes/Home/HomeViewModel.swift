//
//  HomeViewModel.swift
//  OMDB-API-URLSession-MVVMR
//
//  Created by Amber Çatalbaş on 28.10.2023.
//

import Foundation

protocol HomeViewDataSource {
    func numberOfItemsAtCollectionView(section: Int) -> Int
    func cellItemAtCollectionView(indexPath: IndexPath) -> HomeCollectionViewCellProtocol
    func numberOfItemsAtTableView(section: Int) -> Int
    func cellItemAtTableView(indexPath: IndexPath) -> HomeTableViewCellProtocol
}

protocol HomeViewEventSource {}

protocol HomeViewProtocol: HomeViewDataSource, HomeViewEventSource {}

final class HomeViewModel: BaseViewModel<HomeRouter>, HomeViewProtocol {
    private let cellItemsTableView: [HomeTableViewCellProtocol] = [
        HomeTableViewCellModel(movie: Movie(image: "https://m.media-amazon.com/images/M/MV5BMTk2NzczOTgxNF5BMl5BanBnXkFtZTcwODQ5ODczOQ@@._V1_SX300.jpg", title: "Star Trek", description: "it is amazing movie. The ships are very big and wide. They are coming soon to world.it is amazing movie. The ships are very big and wide. They are coming soon to world.it is amazing movie. The ships are very big and wide. They are coming soon to world.")),
        HomeTableViewCellModel(movie: Movie(image: "https://m.media-amazon.com/images/M/MV5BMTk2NzczOTgxNF5BMl5BanBnXkFtZTcwODQ5ODczOQ@@._V1_SX300.jpg", title: "Star Trek", description: "it is amazing movie. ")),
        HomeTableViewCellModel(movie: Movie(image: "https://m.media-amazon.com/images/M/MV5BMTk2NzczOTgxNF5BMl5BanBnXkFtZTcwODQ5ODczOQ@@._V1_SX300.jpg", title: "Star Trek", description: "it is amazing movie. The ships are very big and wide. They are coming soon to world.it is amazing movie. The ships are very big and wide. They are coming soon to world.it is amazing movie. The ships are very big and wide. They are coming soon to world.it is amazing movie. The ships are very big and wide. They are coming soon to world.it is amazing movie. The ships are very big and wide. They are coming soon to world.it is amazing movie. The ships are very big and wide. They are coming soon to world.it is amazing movie. The ships are very big and wide. They are coming soon to world.it is amazing movie. The ships are very big and wide. They are coming soon to world.it is amazing movie. The ships are very big and wide. They are coming soon to world.it is amazing movie. The ships are very big and wide. They are coming soon to world.it is amazing movie. The ships are very big and wide. They are coming soon to world.it is amazing movie. The ships are very big and wide. They are coming soon to world.it is amazing movie. The ships are very big and wide. They are coming soon to world.it is amazing movie. The ships are very big and wide. They are coming soon to world.it is amazing movie. The ships are very big and wide. They are coming soon to world.")),
        HomeTableViewCellModel(movie: Movie(image: "https://m.media-amazon.com/images/M/MV5BMTk2NzczOTgxNF5BMl5BanBnXkFtZTcwODQ5ODczOQ@@._V1_SX300.jpg", title: "Star Trek", description: "it is amazing movie. The ships are very big and wide. They are coming soon to world.")),
        HomeTableViewCellModel(movie: Movie(image: "https://m.media-amazon.com/images/M/MV5BMTk2NzczOTgxNF5BMl5BanBnXkFtZTcwODQ5ODczOQ@@._V1_SX300.jpg", title: "Star Trek", description: "it is amazing movie. The ships are very big and wide. They are coming soon to world.")),
        HomeTableViewCellModel(movie: Movie(image: "https://m.media-amazon.com/images/M/MV5BMTk2NzczOTgxNF5BMl5BanBnXkFtZTcwODQ5ODczOQ@@._V1_SX300.jpg", title: "Star Trek", description: "it is amazing movie. The ships are very big and wide. They are coming soon to world.")),
        HomeTableViewCellModel(movie: Movie(image: "https://m.media-amazon.com/images/M/MV5BMTk2NzczOTgxNF5BMl5BanBnXkFtZTcwODQ5ODczOQ@@._V1_SX300.jpg", title: "Star Trek", description: "it is amazing movie. The ships are very big and wide. They are coming soon to world.")),
        HomeTableViewCellModel(movie: Movie(image: "https://m.media-amazon.com/images/M/MV5BMTk2NzczOTgxNF5BMl5BanBnXkFtZTcwODQ5ODczOQ@@._V1_SX300.jpg", title: "Star Trek", description: "it is amazing movie. The ships are very big and wide. They are coming soon to world.")),
        HomeTableViewCellModel(movie: Movie(image: "https://m.media-amazon.com/images/M/MV5BMTk2NzczOTgxNF5BMl5BanBnXkFtZTcwODQ5ODczOQ@@._V1_SX300.jpg", title: "Star Trek", description: "it is amazing movie. The ships are very big and wide. They are coming soon to world.")),
        HomeTableViewCellModel(movie: Movie(image: "https://m.media-amazon.com/images/M/MV5BMTk2NzczOTgxNF5BMl5BanBnXkFtZTcwODQ5ODczOQ@@._V1_SX300.jpg", title: "Star Trek", description: "it is amazing movie. The ships are very big and wide. They are coming soon to world.")),
        HomeTableViewCellModel(movie: Movie(image: "https://m.media-amazon.com/images/M/MV5BMTk2NzczOTgxNF5BMl5BanBnXkFtZTcwODQ5ODczOQ@@._V1_SX300.jpg", title: "Star Trek", description: "it is amazing movie. The ships are very big and wide. They are coming soon to world.")),
        HomeTableViewCellModel(movie: Movie(image: "https://m.media-amazon.com/images/M/MV5BMTk2NzczOTgxNF5BMl5BanBnXkFtZTcwODQ5ODczOQ@@._V1_SX300.jpg", title: "Star Trek", description: "it is amazing movie. The ships are very big and wide. They are coming soon to world.")),
        HomeTableViewCellModel(movie: Movie(image: "https://m.media-amazon.com/images/M/MV5BMTk2NzczOTgxNF5BMl5BanBnXkFtZTcwODQ5ODczOQ@@._V1_SX300.jpg", title: "Star Trek", description: "it is amazing movie. The ships are very big and wide. They are coming soon to world.")),
        HomeTableViewCellModel(movie: Movie(image: "https://m.media-amazon.com/images/M/MV5BMTk2NzczOTgxNF5BMl5BanBnXkFtZTcwODQ5ODczOQ@@._V1_SX300.jpg", title: "Star Trek", description: "it is amazing movie. The ships are very big and wide. They are coming soon to world.")),
        HomeTableViewCellModel(movie: Movie(image: "https://m.media-amazon.com/images/M/MV5BMTk2NzczOTgxNF5BMl5BanBnXkFtZTcwODQ5ODczOQ@@._V1_SX300.jpg", title: "Star Trek", description: "it is amazing movie. The ships are very big and wide. They are coming soon to world.")),
        HomeTableViewCellModel(movie: Movie(image: "https://m.media-amazon.com/images/M/MV5BMTk2NzczOTgxNF5BMl5BanBnXkFtZTcwODQ5ODczOQ@@._V1_SX300.jpg", title: "Star Trek", description: "it is amazing movie. The ships are very big and wide. They are coming soon to world.")),
        HomeTableViewCellModel(movie: Movie(image: "https://m.media-amazon.com/images/M/MV5BMTk2NzczOTgxNF5BMl5BanBnXkFtZTcwODQ5ODczOQ@@._V1_SX300.jpg", title: "Star Trek", description: "it is amazing movie. The ships are very big and wide. They are coming soon to world.")),
        HomeTableViewCellModel(movie: Movie(image: "https://m.media-amazon.com/images/M/MV5BMTk2NzczOTgxNF5BMl5BanBnXkFtZTcwODQ5ODczOQ@@._V1_SX300.jpg", title: "Star Trek", description: "it is amazing movie. The ships are very big and wide. They are coming soon to world.")),
        HomeTableViewCellModel(movie: Movie(image: "https://m.media-amazon.com/images/M/MV5BMTk2NzczOTgxNF5BMl5BanBnXkFtZTcwODQ5ODczOQ@@._V1_SX300.jpg", title: "Star Trek", description: "it is amazing movie. The ships are very big and wide. They are coming soon to world.")),
        HomeTableViewCellModel(movie: Movie(image: "https://m.media-amazon.com/images/M/MV5BMTk2NzczOTgxNF5BMl5BanBnXkFtZTcwODQ5ODczOQ@@._V1_SX300.jpg", title: "Star Trek", description: "it is amazing movie. The ships are very big and wide. They are coming soon to world.")),
        HomeTableViewCellModel(movie: Movie(image: "https://m.media-amazon.com/images/M/MV5BMTk2NzczOTgxNF5BMl5BanBnXkFtZTcwODQ5ODczOQ@@._V1_SX300.jpg", title: "Star Trek", description: "it is amazing movie. The ships are very big and wide. They are coming soon to world."))
    ]
    
    private let cellItemsCollectionView: [HomeCollectionViewCellProtocol] = [
        HomeCollectionViewCellModel(movie: Movie(image: "https://m.media-amazon.com/images/M/MV5BMTk2NzczOTgxNF5BMl5BanBnXkFtZTcwODQ5ODczOQ@@._V1_SX300.jpg", title: "Star Trek", description: "it is amazing movie. The ships are very big and wide. They are coming soon to world.")),
        HomeCollectionViewCellModel(movie: Movie(image: "https://m.media-amazon.com/images/M/MV5BMTk2NzczOTgxNF5BMl5BanBnXkFtZTcwODQ5ODczOQ@@._V1_SX300.jpg", title: "Star Trek", description: "it is amazing movie. The ships are very big and wide. They are coming soon to world.")),
        HomeCollectionViewCellModel(movie: Movie(image: "https://m.media-amazon.com/images/M/MV5BMTk2NzczOTgxNF5BMl5BanBnXkFtZTcwODQ5ODczOQ@@._V1_SX300.jpg", title: "Star Trek", description: "it is amazing movie. The ships are very big and wide. They are coming soon to world.")),
        HomeCollectionViewCellModel(movie: Movie(image: "https://m.media-amazon.com/images/M/MV5BMTk2NzczOTgxNF5BMl5BanBnXkFtZTcwODQ5ODczOQ@@._V1_SX300.jpg", title: "Star Trek", description: "it is amazing movie. The ships are very big and wide. They are coming soon to world.")),
        HomeCollectionViewCellModel(movie: Movie(image: "https://m.media-amazon.com/images/M/MV5BMTk2NzczOTgxNF5BMl5BanBnXkFtZTcwODQ5ODczOQ@@._V1_SX300.jpg", title: "Star Trek", description: "it is amazing movie. The ships are very big and wide. They are coming soon to world.")),
        HomeCollectionViewCellModel(movie: Movie(image: "https://m.media-amazon.com/images/M/MV5BMTk2NzczOTgxNF5BMl5BanBnXkFtZTcwODQ5ODczOQ@@._V1_SX300.jpg", title: "Star Trek", description: "it is amazing movie. The ships are very big and wide. They are coming soon to world.")),
        HomeCollectionViewCellModel(movie: Movie(image: "https://m.media-amazon.com/images/M/MV5BMTk2NzczOTgxNF5BMl5BanBnXkFtZTcwODQ5ODczOQ@@._V1_SX300.jpg", title: "Star Trek", description: "it is amazing movie. The ships are very big and wide. They are coming soon to world."))
    ]

    func showDetailScene(movie: Movie) {
        router.pushDetail(movie: movie)
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

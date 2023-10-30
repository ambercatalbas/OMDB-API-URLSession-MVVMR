//
//  HomeViewController.swift
//  OMDB-API-URLSession-MVVMR
//
//  Created by Amber Çatalbaş on 28.10.2023.
//

import UIKit
import SnapKit

final class HomeViewController: BaseViewController<HomeViewModel> {
    
    private let searchBar: UISearchBar = {
        let bar = UISearchBar()
        bar.backgroundColor = .green
        bar.placeholder = Constants.search
        return bar
    }()
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(HomeTableViewCell.self)
        tableView.backgroundColor = .white
        return tableView
    }()
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 100, height: 150)
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 0
        layout.sectionInset = UIEdgeInsets(top: 2, left: 20, bottom: 2, right: 0)
        let col = UICollectionView(frame: .zero, collectionViewLayout: layout)
        col.showsHorizontalScrollIndicator = false
        col.isScrollEnabled = true
        col.register(HomeCollectionViewCell.self)
        col.backgroundColor = .white
        return col
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubViews()
        configureContents()
        initViewModels()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
            self.view.endEditing(true)
    }
}

// MARK: - UILayout
extension HomeViewController {
    
    private func addSubViews() {
        view.addSubview(searchBar)
        view.addSubview(tableView)
        view.addSubview(collectionView)
        searchBar.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.left.right.equalToSuperview().inset(20)
        }
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(searchBar.snp.bottom).offset(10)
            make.left.right.equalToSuperview().inset(20)
        }
        
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(tableView.snp.bottom).offset(8)
            make.left.right.equalToSuperview()
            make.height.equalTo(150)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).inset(8)
        }
    }
}

// MARK: - Configure and Set Localize
extension HomeViewController {
    
    private func configureContents() {
        title = Constants.home
        view.backgroundColor = .white
        self.addDelegates()
    }
    
    func addDelegates() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        self.searchBar.delegate = self
    }
    
    func initViewModels() {
        self.viewModel.generateInıtialize()
        
        self.viewModel.didListUpdated = { [weak self] type in
            guard let self = self else {return}
            DispatchQueue.main.async {
                switch type {
                case .tableViewList:
                    self.tableView.reloadData()
                case .collectionViewList:
                    self.collectionView.reloadData()
                }
            }
        }
    }
}

// MARK: - Actions
extension HomeViewController {
    
}

// MARK: - SearchBarDelegate
extension HomeViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        guard searchText.count > 0 else {return}
        self.viewModel.searchTimer(text: searchText, searchType: .tableViewList)
    }
    
}

// MARK: - UITableViewDataSource
extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfItemsAtTableView(section: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: HomeTableViewCell = tableView.dequeueReusableCell(for: indexPath)
        let cellItem = viewModel.cellItemAtTableView(indexPath: indexPath)
        cell.set(viewModel: cellItem)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let movie = self.viewModel.cellItemAtTableView(indexPath: indexPath).movie
        self.viewModel.showDetailScene(movie: movie)
    }
    
}

// MARK: - UICollectionViewDataSource
extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfItemsAtCollectionView(section: section)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: HomeCollectionViewCell = collectionView.dequeueReusableCell(for: indexPath)
        let cellItem = viewModel.cellItemAtCollectionView(indexPath: indexPath)
        cell.set(viewModel: cellItem)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let movie = self.viewModel.cellItemAtCollectionView(indexPath: indexPath).movie
        self.viewModel.showDetailScene(movie: movie)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let position = scrollView.contentOffset.y
        let positionx = scrollView.contentOffset.x
        if positionx > (collectionView.contentSize.width - 50) - scrollView.frame.size.width {
            self.viewModel.searchRemainingMovies(searchType: .collectionViewList)
        }
        
        if position > (tableView.contentSize.height - 10) - scrollView.frame.size.height {
            self.viewModel.searchRemainingMovies(searchType: .tableViewList)
        }
    }
}

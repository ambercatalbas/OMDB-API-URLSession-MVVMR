//
//  DetailViewController.swift
//  OMDB-API-URLSession-MVVMR
//
//  Created by Amber Çatalbaş on 28.10.2023.
//

import UIKit

final class DetailViewController: BaseViewController<DetailViewModel> {
    
    private let swMain: UIScrollView = {
        let sview = UIScrollView()
        sview.alwaysBounceVertical = true
        sview.alwaysBounceHorizontal = false
        sview.isScrollEnabled = true
        return sview
    }()
    
    private let vwContainer = UIView()
    private let iwPoster = UIImageView()
    
    private let lblTitle: UILabel = {
        let lbl = UILabel()
        lbl.numberOfLines = 0
        return lbl
    }()
    
    private let lblDesc: UILabel = {
        let lbl = UILabel()
        lbl.numberOfLines = 0
        return lbl
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureContents()
        addSubViews()
        initViewModels()
    }
}

// MARK: - UILayout
extension DetailViewController {
    
    private func addSubViews() {
        view.addSubview(swMain)
        swMain.addSubview(vwContainer)
        vwContainer.addSubview(iwPoster)
        vwContainer.addSubview(lblTitle)
        vwContainer.addSubview(lblDesc)
        
        swMain.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        vwContainer.snp.makeConstraints { make in
            make.width.equalToSuperview()
            make.top.bottom.equalToSuperview()
        }
        
        iwPoster.snp.makeConstraints { make in
            make.top.left.right.equalToSuperview().inset(30)
        }
        
        lblTitle.snp.makeConstraints { make in
            make.top.equalTo(iwPoster.snp.bottom).offset(20)
            make.left.right.equalToSuperview().inset(20)
        }
        
        lblDesc.snp.makeConstraints { make in
            make.top.equalTo(lblTitle.snp.bottom).offset(20)
            make.left.right.equalToSuperview().inset(20)
            make.bottom.equalToSuperview()
        }
    }
}

// MARK: - Configure and Set Localize
extension DetailViewController {
    
    private func configureContents() {
        title = Constants.detail
        view.backgroundColor = .yellow
        iwPoster.contentMode = .scaleAspectFit
    }
    
    func initViewModels() {
        guard let movie = self.viewModel.movie else {return}
        iwPoster.setImage(movie.image)
        lblTitle.text = movie.title
        lblDesc.text = movie.description
    }
}

// MARK: - Actions
extension DetailViewController {
    
}

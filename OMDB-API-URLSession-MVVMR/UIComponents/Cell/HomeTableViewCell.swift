//
//  HomeTableViewCell.swift
//  OMDB-API-URLSession-MVVMR
//
//  Created by Amber Çatalbaş on 28.10.2023.
//

import UIKit

public class HomeTableViewCell: UITableViewCell, ReusableView {
    
    weak var viewModel: HomeTableViewCellProtocol?
    
    private let iwPoster = UIImageView()
    
    private let lblTitle: UILabel = {
        let lbl = UILabel()
        lbl.numberOfLines = 1
        return lbl
    }()
    
    private let lblDesc: UILabel = {
        let lbl = UILabel()
        lbl.numberOfLines = 0
        return lbl
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubViews()
        configureContents()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        addSubViews()
        configureContents()
    }
    
    private func configureContents() {
        
    }
    
    public func set(viewModel: HomeTableViewCellProtocol) {
        self.viewModel = viewModel
        let movie = viewModel.movie
        self.iwPoster.setImage(movie.image)
        self.lblTitle.text = movie.title
        self.lblDesc.text = movie.description
    }
    
}

// MARK: - UILayout
extension HomeTableViewCell {
    
    private func addSubViews() {
        addSubview(iwPoster)
        addSubview(lblTitle)
        addSubview(lblDesc)
        
        iwPoster.snp.makeConstraints { make in
            make.top.left.bottom.equalToSuperview().inset(4)
            make.height.equalTo(100)
            make.width.equalTo(125)
        }
        
        lblTitle.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(8)
            make.left.equalTo(iwPoster.snp.right).offset(8)
            make.height.equalTo(20)
            make.right.equalToSuperview().inset(4)
        }
        
        lblDesc.snp.makeConstraints { make in
            make.top.equalTo(lblTitle.snp.bottom).offset(4)
            make.left.equalTo(iwPoster.snp.right).offset(8)
            make.right.equalToSuperview().inset(4)
            make.bottom.lessThanOrEqualTo(4)
        }
    }
}

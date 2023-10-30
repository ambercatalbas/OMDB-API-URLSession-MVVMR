//
//  HomeCollectionViewCell.swift
//  OMDB-API-URLSession-MVVMR
//
//  Created by Amber Çatalbaş on 28.10.2023.
//

import UIKit

public class HomeCollectionViewCell: UICollectionViewCell, ReusableView {
    
    weak var viewModel: HomeCollectionViewCellProtocol?
    private let iwPoster = UIImageView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubViews()
        configureContents()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        addSubViews()
        configureContents()
    }
    
    private func configureContents() {
        iwPoster.contentMode = .scaleAspectFit
    }
    
    public func set(viewModel: HomeCollectionViewCellProtocol) {
        self.viewModel = viewModel
        let movie = self.viewModel?.movie
        self.iwPoster.setImage(movie?.image)
    }
    
}

// MARK: - UILayout
extension HomeCollectionViewCell {
    
    private func addSubViews() {
        addSubview(iwPoster)
        iwPoster.snp.makeConstraints { make in
            make.top.left.right.bottom.equalToSuperview().inset(4)
            make.height.equalTo(100)
        }
    }
}

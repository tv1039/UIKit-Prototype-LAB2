//
//  CollectionViewCell.swift
//  MatMatProject
//
//  Created by 정운관 on 1/17/24.
//

import UIKit

class TagCollectionViewCell: UICollectionViewCell {
    
    //    let mainTitle : UILabel = {
    //        let title = UILabel()
    //        title.text = "주제별 맛집"
    //    }
    static let identifier = "TagCollcetionViewCell"
    
    
    let tagLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let foodImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = imageView.frame.size.height / 2
        imageView.clipsToBounds = true
        return imageView
    }()
    
    let stackView : UIStackView = {
        let stakcView = UIStackView()
        stakcView.axis = .vertical
        stakcView.alignment = .center
        stakcView.spacing = 10
        return stakcView
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setStackView()
        setFoodImageViewConstraints()
        setTagLabelConstraints()
    }
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setStackView() {
        self.contentView.addSubview(stackView)
        stackView.addArrangedSubview(foodImageView)
        stackView.addArrangedSubview(tagLabel)
    }
    
    func setFoodImageViewConstraints() {
        NSLayoutConstraint.activate([
            foodImageView.heightAnchor.constraint(equalToConstant: 80),
            foodImageView.widthAnchor.constraint(equalToConstant: 80),
            foodImageView.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor),
            foodImageView.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor)
        ])
    }
    
    func setTagLabelConstraints() {
        NSLayoutConstraint.activate([
            tagLabel.topAnchor.constraint(equalTo: self.foodImageView.bottomAnchor, constant: 10),
            tagLabel.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor)
        ])
    }
}

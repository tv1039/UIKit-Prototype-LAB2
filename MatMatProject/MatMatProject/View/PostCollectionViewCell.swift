//
//  PostCollectionViewCell.swift
//  MatMatProject
//
//  Created by 정운관 on 1/18/24.
//

import UIKit

class PostCollectionViewCell: UICollectionViewCell {
    
    
    
    // 식당 이름
    let storeLabel: UILabel = {
        let storeLabel = UILabel()
        storeLabel.textAlignment = .left
        storeLabel.font = UIFont.boldSystemFont(ofSize: 17)
        return storeLabel
    }()
    
    // 식당 주소
    let addressLabel: UILabel = {
        let addressLabel = UILabel()
        addressLabel.textAlignment = .left
        addressLabel.font = UIFont.systemFont(ofSize: 17)
        return addressLabel
    }()
    
    let foodImageView : UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    
    // 이모지
    let emojiButton: UIButton = {
        let emojiButton = UIButton(type: .custom)
        emojiButton.backgroundColor = .systemBlue

        return emojiButton
    }()
    
    // 별점
    let starLabel: UILabel = {
        let starLabel = UILabel()
        starLabel.font = UIFont.boldSystemFont(ofSize: 10)
        return starLabel
    }()
    
    //ID
    let iDLabel: UILabel = {
        let iDLabel = UILabel()
        return iDLabel
    }()
    
    // 콘텐츠
    let contentLabel: UILabel = {
        let contentLabel = UILabel()
        return contentLabel
    }()
    let horizontal : UIStackView = {
        let stakcView = UIStackView()
        stakcView.axis = .horizontal
        stakcView.alignment = .leading
        stakcView.spacing = 3
        return stakcView
    }()
    
    let stackView : UIStackView = {
        let stakcView = UIStackView()
        stakcView.axis = .vertical
        stakcView.alignment = .leading
        stakcView.spacing = 10
        return stakcView
    }()
    
    
    func setStackView() {
        self.contentView.addSubview(stackView)
        self.contentView.addSubview(horizontal)
        stackView.addArrangedSubview(horizontal)
        horizontal.addArrangedSubview(storeLabel)
        horizontal.addArrangedSubview(starLabel)
        stackView.addArrangedSubview(addressLabel)
        contentView.addSubview(foodImageView)
        contentView.addSubview(emojiButton)
    }
    
    func setLayoutViewConstraints() {
       
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
//            stackView.heightAnchor.constraint(equalToConstant: 600),
            stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            stackView.topAnchor.constraint(equalTo: self.topAnchor),
            horizontal.topAnchor.constraint(equalTo: stackView.topAnchor),
            horizontal.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
            storeLabel.leadingAnchor.constraint(equalTo: horizontal.leadingAnchor),
            starLabel.bottomAnchor.constraint(equalTo: horizontal.bottomAnchor),
            addressLabel.topAnchor.constraint(equalTo: horizontal.bottomAnchor, constant: 5),
        ])
        
        foodImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            foodImageView.heightAnchor.constraint(equalToConstant: 250),
            foodImageView.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
            foodImageView.trailingAnchor.constraint(equalTo: stackView.trailingAnchor),
            foodImageView.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 10)
        ])
        
        emojiButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            emojiButton.widthAnchor.constraint(equalToConstant: 50),
        emojiButton.leadingAnchor.constraint(equalTo: foodImageView.leadingAnchor),
        emojiButton.topAnchor.constraint(equalTo: foodImageView.bottomAnchor , constant: 10)
        ])
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setStackView()
        setLayoutViewConstraints()
    }
   
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

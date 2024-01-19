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
        emojiButton.layer.cornerRadius = 10
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
        iDLabel.font = UIFont.boldSystemFont(ofSize: 17)
        return iDLabel
    }()
    
    //태그
    let tagLabel: UILabel = {
        let tagLabel = UILabel()
        tagLabel.font = UIFont.systemFont(ofSize: 13)
        return tagLabel
    }()
    
    // 콘텐츠
    let contentLabel: UILabel = {
        let contentLabel = UILabel()
        contentLabel.font = UIFont.boldSystemFont(ofSize: 15)
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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpBorder()
        setStackView()
        setLayoutViewConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpBorder() {
        self.layer.borderWidth = 2.0
        self.layer.borderColor = UIColor.lightGray.cgColor
        self.layer.cornerRadius = 3.0
    }
    
    
    func setStackView() {
        self.contentView.addSubview(stackView)
        self.contentView.addSubview(horizontal)
        stackView.addArrangedSubview(horizontal)
        horizontal.addArrangedSubview(storeLabel)
        horizontal.addArrangedSubview(starLabel)
        stackView.addArrangedSubview(addressLabel)
        contentView.addSubview(foodImageView)
        contentView.addSubview(emojiButton)
        contentView.addSubview(iDLabel)
        contentView.addSubview(tagLabel)
        contentView.addSubview(contentLabel)
    }
    
    func setLayoutViewConstraints() {
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            //            stackView.heightAnchor.constraint(equalToConstant: 600),
            
            stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 10),
            stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor , constant: -10),
            stackView.topAnchor.constraint(equalTo: self.topAnchor),
            horizontal.topAnchor.constraint(equalTo: stackView.topAnchor),
            horizontal.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
            storeLabel.topAnchor.constraint(equalTo: horizontal.topAnchor , constant: 10),
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
        
        iDLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            iDLabel.leadingAnchor.constraint(equalTo: emojiButton.leadingAnchor),
            iDLabel.topAnchor.constraint(equalTo: emojiButton.bottomAnchor , constant: 10)
        ])
        
        tagLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tagLabel.leadingAnchor.constraint(equalTo: iDLabel.leadingAnchor),
            tagLabel.topAnchor.constraint(equalTo: iDLabel.bottomAnchor , constant: 5)
        ])
        
        contentLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            contentLabel.widthAnchor.constraint(equalToConstant: 300),
            contentLabel.leadingAnchor.constraint(equalTo: tagLabel.leadingAnchor),
            contentLabel.topAnchor.constraint(equalTo: tagLabel.bottomAnchor , constant: 10)
        ])
    }
    
    
    
}

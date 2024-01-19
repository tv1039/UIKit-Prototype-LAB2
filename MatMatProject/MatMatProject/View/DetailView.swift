//
//  detailView.swift
//  MatMatProject
//
//  Created by 정운관 on 1/18/24.
//

// 지도보기 누르면 Map 넘어가기
// 글 추가 기능 만들기 

import UIKit

class DetailView: UIView {
    
    var userData: User?
    
    let storeLabel: UILabel = {
        let storeLabel = UILabel()
        storeLabel.textAlignment = .left
        storeLabel.font = UIFont.boldSystemFont(ofSize: 24)
        storeLabel.translatesAutoresizingMaskIntoConstraints = false
        return storeLabel
    }()
    // 별점
    let starLabel: UILabel = {
        let starLabel = UILabel()
        starLabel.textColor = .orange
        starLabel.font = UIFont.systemFont(ofSize: 20)
        starLabel.translatesAutoresizingMaskIntoConstraints = false
        return starLabel
    }()
    
    
    lazy var  storeStarHorizontal : UIStackView = {
        let sv = UIStackView(arrangedSubviews: [storeLabel,starLabel])
        sv.axis = .horizontal
        sv.spacing = 30
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()
    
    
    
    // 식당 주소
    let addressLabel: UILabel = {
        let addressLabel = UILabel()
        addressLabel.textAlignment = .left
        addressLabel.font = UIFont.systemFont(ofSize: 20)
        addressLabel.translatesAutoresizingMaskIntoConstraints = false
        return addressLabel
    }()
    
    let foodImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    
    
    
    
    // 이모지
    let emojiButton: UIButton = {
        let emojiButton = UIButton(type: .custom)
        
        emojiButton.backgroundColor = .systemYellow
        emojiButton.layer.cornerRadius = CGFloat(10.0)
        emojiButton.translatesAutoresizingMaskIntoConstraints = false
        return emojiButton
    }()
    
    
    let mapGoButton : UIButton = {
        let button = UIButton(type: .custom)
        
        button.setTitle("지도 보기", for: .normal)
        button.backgroundColor = .systemOrange
        button.layer.cornerRadius = CGFloat(10.0)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    lazy var buttonHorizontal : UIStackView = {
        let sv = UIStackView(arrangedSubviews: [emojiButton,mapGoButton])
        sv.axis = .horizontal
//        sv.alignment = .fill
//        sv.distribution = .fill
        sv.spacing = 100
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()
    
    
    
    //ID
    let iDLabel: UILabel = {
        let iDLabel = UILabel()
        iDLabel.translatesAutoresizingMaskIntoConstraints = false
        return iDLabel
    }()
    
    //태그
    let tagLabel: UILabel = {
        let tagLabel = UILabel()
        tagLabel.textColor = .systemRed
        tagLabel.font = UIFont.boldSystemFont(ofSize: 13)
        return tagLabel
    }()
    
    lazy var  idTagHorizontal : UIStackView = {
        let sv = UIStackView(arrangedSubviews: [iDLabel,tagLabel])
        sv.axis = .horizontal
        sv.spacing = 30
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()
    
    // 콘텐츠
    let contentLabel: UILabel = {
        let contentLabel = UILabel()
        contentLabel.numberOfLines = 0
        contentLabel.lineBreakMode = .byWordWrapping
        contentLabel.translatesAutoresizingMaskIntoConstraints = false
        
        return contentLabel
    }()
    
    
    lazy var stackView : UIStackView = {
        let sv = UIStackView(arrangedSubviews: [storeStarHorizontal, addressLabel , foodImageView , buttonHorizontal , idTagHorizontal, contentLabel])
        sv.axis = .vertical
        sv.spacing = 10
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()
    
    override func updateConstraints() {
        makeDetailView()
        super.updateConstraints()
    }
    
    private func setupScrollView() {
        // Add scrollView and contentView
        self.addSubview(stackView)
        
    }
    func makeDetailView() {
        
        self.addSubview(stackView)
        
        
        if let userData {
            storeLabel.text = userData.food.name
            starLabel.text = "\(userData.star)/5.0"
            addressLabel.text = userData.food.address
            foodImageView.image = UIImage(named: userData.food.image)
            emojiButton.setTitle(userData.emoji, for: .normal)
            iDLabel.text = "작성자: \(userData.id)"
            tagLabel.text = "#\(userData.food.foodTag.rawValue)"
            contentLabel.text = "맛집평가: \(userData.content)"
        }
                
        NSLayoutConstraint.activate([
            foodImageView.heightAnchor.constraint(equalToConstant: 230),
            emojiButton.trailingAnchor.constraint(equalTo: stackView.trailingAnchor , constant: -300)
        ])
                
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 10),
            stackView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20)
        ])
    }
    
}

protocol DetailViewDelegate: AnyObject {
    func didTapMapButton(withWebLink webLink: String)
}

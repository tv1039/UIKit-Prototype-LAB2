//
//  DetailStackViewController.swift
//  MatMatProject
//
//  Created by YUJIN JEON on 1/18/24.
//

import UIKit

class DetailStackViewController: UIViewController {
    var userData: User?
    var detailScrollView: UIStackView = UIStackView()

    let storeLabel: UILabel = {
        let storeLabel = UILabel()
        storeLabel.textAlignment = .left
        storeLabel.font = UIFont.boldSystemFont(ofSize: 24)
        storeLabel.translatesAutoresizingMaskIntoConstraints = false
        return storeLabel
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
    
    // 별점
    let starLabel: UILabel = {
        let starLabel = UILabel()
        starLabel.textColor = .orange
        starLabel.font = UIFont.systemFont(ofSize: 10)
        starLabel.translatesAutoresizingMaskIntoConstraints = false
        return starLabel
    }()
    
    //ID
    let iDLabel: UILabel = {
        let iDLabel = UILabel()
        iDLabel.translatesAutoresizingMaskIntoConstraints = false
        return iDLabel
    }()
    
    // 콘텐츠
    let contentLabel: UILabel = {
        let contentLabel = UILabel()
        contentLabel.translatesAutoresizingMaskIntoConstraints = false
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .systemBackground
        makeDetailView()
    }
    func makeDetailView() {
        let safeArea: UILayoutGuide = view.safeAreaLayoutGuide
        
        
        detailScrollView.backgroundColor = .systemRed
        self.view.addSubview(detailScrollView)
        
        if let userData {
            storeLabel.text = userData.food.name
            starLabel.text = "\(userData.star)/5.0"
            addressLabel.text = userData.food.address
            foodImageView.image = UIImage(named: userData.food.image)
            emojiButton.setTitle(userData.emoji, for: .normal)
            iDLabel.text = userData.id
            contentLabel.text = userData.content
        }
        
        detailScrollView.addSubview(stackView)
        stackView.addSubview(horizontal)
        horizontal.addSubview(storeLabel)
        horizontal.addSubview(starLabel)
        stackView.addSubview(addressLabel)
        stackView.addSubview(foodImageView)
        stackView.addSubview(emojiButton)
        stackView.addSubview(iDLabel)
        stackView.addSubview(contentLabel)
        
        detailScrollView.translatesAutoresizingMaskIntoConstraints = false
        stackView.translatesAutoresizingMaskIntoConstraints = false
        horizontal.translatesAutoresizingMaskIntoConstraints = false
        
    
        NSLayoutConstraint.activate([
            detailScrollView.topAnchor.constraint(equalTo: safeArea.topAnchor),
            detailScrollView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor),
            detailScrollView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            detailScrollView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
            
            stackView.leadingAnchor.constraint(equalTo: detailScrollView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: detailScrollView.trailingAnchor),
        ])
    }
    
}

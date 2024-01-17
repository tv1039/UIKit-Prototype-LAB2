//
//  ViewController.swift
//  MatMatProject
//
//  Created by 정운관 on 1/17/24.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNaviBar()
        buildInterface()
    }
    
    func setupNaviBar() {
        let titleLabel = UILabel()
        titleLabel.text = "MatMat"
        titleLabel.textColor = .brown
        let leftBarItem = UIBarButtonItem(customView: titleLabel)
        navigationItem.leftBarButtonItem = leftBarItem
        
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .white
        
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
    }
    
    func buildInterface() {
        
        let scrollView = UIScrollView()
        scrollView.backgroundColor = .cyan
        view.addSubview(scrollView)
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        
        scrollView.contentSize = CGSize(width: view.frame.width, height: 2500)
        
        let contentStackView = UIStackView()
        contentStackView.axis = .vertical
        
        contentStackView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(contentStackView)
        
        // contentStackView 안쪽 내용들
        
        let label = UILabel()
        label.text = "Hello, world!"
        contentStackView.addArrangedSubview(label)
        
        let miniScrollView = UIScrollView()
        miniScrollView.backgroundColor = .red
        miniScrollView.contentSize = CGSize(width: view.frame.width, height: 150)
        miniScrollView.frame = CGRect(x: 0, y: 0, width:300, height: 150)
        
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "scroll")
        imageView.frame = CGRect(x: 0, y: 0, width:100, height: 100)
        miniScrollView.addSubview(imageView)
        
        // 이미지 위에 덧씌워질 가상의 투명한 버튼
        let button = UIButton()
        button.backgroundColor = .yellow
        button.alpha = 0.35
        button.frame = CGRect(x: 0, y: 0, width:100, height: 100)
        button.addTarget(self, action: #selector(sayHello), for: .touchUpInside)
        miniScrollView.addSubview(button)
        
        
        
        miniScrollView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            miniScrollView.widthAnchor.constraint(equalToConstant: 350),
            miniScrollView.heightAnchor.constraint(equalToConstant: 150)
        ])
        
        contentStackView.addArrangedSubview(miniScrollView)
        
        let label2 = UILabel()
        label2.text = "Hello, world!"
        contentStackView.addArrangedSubview(label2)
        
    }
    
    @objc func sayHello() {
        print("Hello World")
    }

}

//
//  ViewController.swift
//  MatMatProject
//
//  Created by 정운관 on 1/17/24.
//

import UIKit

class ViewController: UIViewController {
   
    
    let tagName = Tag.allCases
    var functionArray : [Selector] = [#selector(hydo),#selector(alchol),#selector(dating),#selector(something)]
    
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
        scrollView.backgroundColor = .systemBackground
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
        contentStackView.spacing = 20
        contentStackView.axis = .vertical
        
        contentStackView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(contentStackView)
        
        // contentStackView 안쪽 내용들
        
        let label = UILabel()
        label.text = "  주제별 맛집"
        contentStackView.addArrangedSubview(label)
        
        let miniScrollView = UIScrollView()
        miniScrollView.contentSize = CGSize(width: view.frame.width, height: 110)
        miniScrollView.frame = CGRect(x: 0, y: 0, width:300, height: 110)
        
        
        let numberOfItems = 4
        let itemWidth : CGFloat = 100
        let itemHeight : CGFloat = 100
        let spacing : CGFloat = 5
        
        for i in 0..<numberOfItems {
            
            //x좌표
            let xOffset = CGFloat(i) * (itemWidth + spacing) + 10
            print(xOffset)
            
            let imageView = UIImageView()
            imageView.image = UIImage(named: tagName[i].rawValue)
            imageView.frame = CGRect(x: xOffset, y: 0, width:100, height: 100)
            miniScrollView.addSubview(imageView)
            
            
            let button = UIButton()
            button.alpha = 0.35
            button.frame = CGRect(x: xOffset, y: 0, width:100, height: 100)
            button.addTarget(self, action: functionArray[i], for: .touchUpInside)
            miniScrollView.addSubview(button)
        }
        
        
        
        
        miniScrollView.contentSize = CGSize(width: CGFloat(numberOfItems) * (itemWidth + spacing ) - spacing , height: itemHeight)
        // 이미지 위에 덧씌워질 가상의 투명한 버튼
        
        
        
        
        miniScrollView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            miniScrollView.widthAnchor.constraint(equalToConstant: view.frame.width),
            miniScrollView.heightAnchor.constraint(equalToConstant: 110),
            
        ])
        
        contentStackView.addArrangedSubview(miniScrollView)
        
        let label2 = UILabel()
        label2.text = "  나의 피드"
        contentStackView.addArrangedSubview(label2)
        
    }
    
    
}

//이미지를 누르면 수행되는 함수

extension ViewController {
    
    @objc func hydo() {
        getImageData(idx: 0)
    }
    @objc func alchol() {
        getImageData(idx: 1)
    }
    @objc func dating() {
        getImageData(idx: 2)
    }
    @objc func something() {
        getImageData(idx: 3)
    }
    
    
    func getImageData(idx : Int) {
        let nextViewController = MapViewController()
        nextViewController.filter = Tag.allCases[idx]
        self.navigationController?.pushViewController(nextViewController, animated: true)
    }
}

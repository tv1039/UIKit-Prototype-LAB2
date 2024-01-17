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
        // 메인
        let scrollView = UIScrollView()
<<<<<<< HEAD
//        scrollView.backgroundColor = .cyan
=======
        scrollView.backgroundColor = .systemBackground
>>>>>>> 11066155ac3e98baf14b723d2c23363c32a5d949
        view.addSubview(scrollView)
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        
        scrollView.contentSize = CGSize(width: view.frame.width, height: 1500)
        

        let contentStackView = UIStackView()
        contentStackView.spacing = 20
        contentStackView.axis = .vertical
//        contentStackView.backgroundColor = .blue
        scrollView.addSubview(contentStackView)
        

        contentStackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            contentStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            contentStackView.topAnchor.constraint(equalTo: scrollView.bottomAnchor)
        ])
        
        
        
        
        // contentStackView 안쪽 내용들
        
        let label = UILabel()
        label.text = "  주제별 맛집"
        contentStackView.addArrangedSubview(label)
        
        let miniScrollView = UIScrollView()
<<<<<<< HEAD
//        miniScrollView.backgroundColor = .red
        miniScrollView.contentSize = CGSize(width: view.frame.width, height: 150)
        miniScrollView.frame = CGRect(x: 0, y: 0, width:300, height: 150)
=======
        miniScrollView.contentSize = CGSize(width: view.frame.width, height: 110)
        miniScrollView.frame = CGRect(x: 0, y: 0, width:300, height: 110)
>>>>>>> 11066155ac3e98baf14b723d2c23363c32a5d949
        
        
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
<<<<<<< HEAD
        let button = UIButton()
        button.backgroundColor = .yellow
        button.alpha = 0.35
        button.frame = CGRect(x: 0, y: 0, width:100, height: 100)
//        button.addTarget(self, action: #selector(sayHello), for: .touchUpInside)
        miniScrollView.addSubview(button)
=======
        
>>>>>>> 11066155ac3e98baf14b723d2c23363c32a5d949
        
        
        
        miniScrollView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            miniScrollView.widthAnchor.constraint(equalToConstant: view.frame.width),
            miniScrollView.heightAnchor.constraint(equalToConstant: 110),
            
        ])
        
        contentStackView.addArrangedSubview(miniScrollView)
        
<<<<<<< HEAD
        //뷰 이동 버튼 1
        let viewButton1 = UIButton()
=======
        let label2 = UILabel()
        label2.text = "  나의 피드"
        contentStackView.addArrangedSubview(label2)
>>>>>>> 11066155ac3e98baf14b723d2c23363c32a5d949
        
        let image1 = UIImage(named: "content")
        viewButton1.setImage(image1, for: .normal)
        contentStackView.addArrangedSubview(viewButton1)
       
        viewButton1.addTarget(self, action: #selector(navigate), for: .touchUpInside)
        
        contentStackView.setCustomSpacing(20, after: miniScrollView)
        //뷰 이동 버튼 2
        let viewButton2 = UIButton()
        
        let image2 = UIImage(named: "content")
        viewButton2.setImage(image2, for: .normal)
        contentStackView.addArrangedSubview(viewButton2)
        
        contentStackView.setCustomSpacing(20, after: viewButton1)
        
        //뷰 이동 버튼 3
        let viewButton3 = UIButton()
        
        let image3 = UIImage(named: "content")
        viewButton3.setImage(image3, for: .normal)
        contentStackView.addArrangedSubview(viewButton3)
        
        viewButton3.addTarget(self, action: #selector(navigate), for: .touchUpInside)
        
        contentStackView.setCustomSpacing(20, after: viewButton2)

      
    }
    
<<<<<<< HEAD
   
    
    @objc func navigate() {
        print("뷰 이동")
    }

=======
    
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
>>>>>>> 11066155ac3e98baf14b723d2c23363c32a5d949
}

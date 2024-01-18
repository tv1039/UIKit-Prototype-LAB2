//
//  ViewController.swift
//  MatMatProject
//
//  Created by 정운관 on 1/17/24.
//

import UIKit

class ViewController: UIViewController {
    
    
    let tagName = Tag.allCases
    let scrollView = UIScrollView()
    let contentStackView = UIStackView()
    let taglabel = UILabel()
    let miniScrollView = UIScrollView()
    let lineView = UIView()
    let postLabel = UILabel()

    let image1 = UIImage(named: "content")
    var viewButtonArray : [UIButton] = []
    
    //버튼을 반복문으로 만들 때 함수를 반복문에 넣어주기 위한 배열
    var functionArray : [Selector] = [#selector(hydo),#selector(alchol),#selector(dating),#selector(something)]

    
    override func viewDidLoad() {
        super.viewDidLoad()
        buildInterface()
    }
    
    //인터페이스 생성 메소드를 모아놈
    func buildInterface() {
        setupNaviBar()
        buildBasicInterface()
        makeTag()
        makePost()
        setAutoLayOut()
    }
    
    //네비게이션바 설정
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
    
    //스크롤뷰와 내용을 담을 스택뷰 설정
    func buildBasicInterface() {
        scrollView.backgroundColor = .systemBackground
        view.addSubview(scrollView)
        scrollView.contentSize = CGSize(width: view.frame.width, height: 1500)
        
        contentStackView.spacing = 10
        contentStackView.axis = .vertical
        scrollView.addSubview(contentStackView)
    }
    
    func makeTag() {
        // 1. 주제별 맛집 내용
        taglabel.text = "  주제별 맛집"
        taglabel.textColor = .systemYellow
        taglabel.translatesAutoresizingMaskIntoConstraints = false
        
        contentStackView.addArrangedSubview(taglabel)
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
        contentStackView.addArrangedSubview(miniScrollView)
        // 2. 태그별 맛집과 피드 게시물을 구분하는 얇은 선
        
        lineView.backgroundColor = .systemGray
        contentStackView.addArrangedSubview(lineView)
    }
    
    // 게시물내용 (추후에 버튼이 아니라 게시물 형식으로 수정하면 좋음)
    func makePost() {
        
        postLabel.text = "  나의 피드"
        postLabel.textColor = .systemBrown
        contentStackView.addArrangedSubview(postLabel)
        
        // 추후에 모델에서 갯수를 받아와서 생성
        let numberOfButton = 3
        for i in 0..<numberOfButton {
            let button = UIButton()
            
            
            button.setImage(image1, for: .normal)
            contentStackView.addArrangedSubview(button)
            button.addTarget(self, action: #selector(navigatePostFood), for: .touchUpInside)
            if viewButtonArray.isEmpty {
                contentStackView.setCustomSpacing(20, after: miniScrollView)
            } else {
                contentStackView.setCustomSpacing(20, after: viewButtonArray[i-1])
            }
            viewButtonArray.append(button)
        }
    }
    
    //오토 레이아웃 설정
    func setAutoLayOut() {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        
        contentStackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            contentStackView.topAnchor.constraint(equalTo: scrollView.topAnchor , constant: 10)
        ])
        
        miniScrollView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            miniScrollView.widthAnchor.constraint(equalToConstant: view.frame.width),
            miniScrollView.heightAnchor.constraint(equalToConstant: 110),
            
        ])
        
        lineView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            lineView.heightAnchor.constraint(equalToConstant: 2),
            lineView.topAnchor.constraint(equalTo: miniScrollView.bottomAnchor , constant: -6)
        ])
    }
    
    
}

//이미지를 누르면 수행되는 함수

extension ViewController {
    
    //가로 뷰
    @objc func hydo() {
        navigateTagFood(idx: 0)
    }
    @objc func alchol() {
        navigateTagFood(idx: 1)
    }
    @objc func dating() {
        navigateTagFood(idx: 2)
    }
    @objc func something() {
        navigateTagFood(idx: 3)
    }
    
    
    func navigateTagFood(idx : Int) {
        let nextViewController = MapViewController()
        nextViewController.filter = Tag.allCases[idx]
        self.navigationController?.pushViewController(nextViewController, animated: true)
    }
    
    //세로 뷰
    @objc func navigatePostFood() {
        let nextViewController = WebViewController()
        self.navigationController?.pushViewController(nextViewController, animated: true)
    }
}

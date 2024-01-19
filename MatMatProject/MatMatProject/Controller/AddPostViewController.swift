//
//  AddPostViewController.swift
//  MatMatProject
//
//  Created by 정운관 on 1/19/24.
//

import UIKit

class AddPostViewController: UIViewController {
    
    let addPostView = AddPostView()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNaviBar()
        setupButtonAction()
        self.view.backgroundColor = .systemBackground
    }
    
    // 현재 뷰컨트롤 뷰에 우리가 만든 AddPsotView를 넣어줍시다
    override func loadView() {
        view = addPostView
    }
    
    func setupButtonAction() {
        addPostView.addButton.addTarget(self, action: #selector(addPostButtonTapped), for: .touchUpInside)
    }
    
    func setupNaviBar() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .white
        
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
    }

    //버튼이 눌리면 모델에 있는 user에 데이터를 추가 
    @objc func addPostButtonTapped() {
        let id = addPostView.idLabelTextField.text ?? "user-1231241"
        let storeName = addPostView.storeLabelTextField.text ?? "앱스쿨 식당"
        let addressName = addPostView.addressLabelTextField.text ?? "이 지구 어딘가"
        let star = Double(addPostView.starLabelTextField.text ?? "0.0") ?? 0.0
        let tag = addPostView.tagLabelTextField.text ?? "아무 맛집"
        let emoji = addPostView.emojiLabelTextField.text ?? "😢"
        let content = addPostView.contentLabelTextField.text ?? "별로임"
        let webLink = addPostView.webLinkLabelTextField.text ?? "www.naver.com"
        
        let newFood = Food(name: storeName, foodTag: tag, image: "", webLink: webLink, address: addressName)
        let post = User(id: id, emoji: emoji, content: content, star: star, food: newFood)
        print(post)
        
        let index = navigationController!.viewControllers.count - 2
        
        let vc = navigationController?.viewControllers[index] as! MainViewController
        
        vc.userDataManager.makeNewPost(user: post)
        
        self.navigationController?.popViewController(animated: true)
    }
    
    deinit {
    }
}

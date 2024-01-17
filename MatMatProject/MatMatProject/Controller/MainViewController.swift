//
//  ViewController.swift
//  MatMatProject
//
//  Created by 정운관 on 1/17/24.
//

import UIKit

class MainViewController: UIViewController, UITableViewDataSource , UITableViewDelegate , UICollectionViewDataSource , UICollectionViewDelegate {
    

    

    private let horizontalCollcetionView : UICollectionView
    private let verticalTableVeiw : UITableView

    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        
        //콜렉션 뷰 초기화
        let collcetionViewLayout = UICollectionViewFlowLayout()
        
        // Cell의 크기와 간격
        collcetionViewLayout.itemSize = CGSize(width: 150, height: 100) // 셀의 크기?
        collcetionViewLayout.minimumLineSpacing = 10 // 줄 간격
        collcetionViewLayout.minimumInteritemSpacing = 10// 셀 간격
        collcetionViewLayout.scrollDirection = .horizontal // 가로 스크롤
        
        // 위치는 AutoLayout으로 관리하기 위해 임시로 .zero
        horizontalCollcetionView = UICollectionView(frame: .zero, collectionViewLayout: collcetionViewLayout)
        
        
        //테이블 뷰 초기화
        verticalTableVeiw = UITableView()
        
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
        horizontalCollcetionView.dataSource = self
        horizontalCollcetionView.delegate = self
        horizontalCollcetionView.register(TagCollectionViewCell.self, forCellWithReuseIdentifier: TagCollectionViewCell.identifier)
        
        verticalTableVeiw.dataSource = self
        verticalTableVeiw.delegate = self
        verticalTableVeiw.register(UserTableViewCell.self, forCellReuseIdentifier: UserTableViewCell.identifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .systemBackground
        
        setupNaviBar()
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
    
    func setCollectioViewCellLayout() {
    
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return UICollectionViewCell()
    }
    
    

}


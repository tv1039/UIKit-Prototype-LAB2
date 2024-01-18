//
//  ViewController.swift
//  MatMatProject
//
//  Created by 정운관 on 1/17/24.
//

import UIKit

class MainViewController: UIViewController , UICollectionViewDataSource , UICollectionViewDelegate {


    private let postCollcetionView : UICollectionView
//    private let verticalTableVeiw : UITableView
    
    var userDataArray : [User] = []
    var userDataManager = DataManager()
    var count = 0
    let colors : [UIColor] = [.systemYellow,.systemRed,.black , .systemBlue , .systemCyan]
    
    let addPostButton : UIBarButtonItem = {
        let button = UIBarButtonItem(barButtonSystemItem: .add, target: MainViewController.self, action: #selector(addPostButtonTapped))
        return button
    }()

    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        
        //콜렉션 뷰 초기화
        let collcetionViewLayout = UICollectionViewFlowLayout()
        
        // Cell의 크기와 간격
        collcetionViewLayout.itemSize = CGSize(width: 350, height: 450) // 셀의 크기?
        collcetionViewLayout.minimumLineSpacing = 10 // 줄 간격
        collcetionViewLayout.minimumInteritemSpacing = 10// 셀 간격
        collcetionViewLayout.scrollDirection = .vertical // 가로 스크롤
        
        // 위치는 AutoLayout으로 관리하기 위해 임시로 .zero
        postCollcetionView = UICollectionView(frame: .zero, collectionViewLayout: collcetionViewLayout)
                
//        //테이블 뷰 초기화
        
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
        postCollcetionView.dataSource = self
        postCollcetionView.delegate = self
        
        postCollcetionView.register(PostCollectionViewCell.self, forCellWithReuseIdentifier: "reuseIdentifier")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .systemBackground
        
        setupNaviBar()
        setupData()
        setCollectioViewCellLayout()
        
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

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
        
        self.navigationItem.rightBarButtonItem = self.addPostButton
    }
    
    func setCollectioViewCellLayout() {
        let safeArea: UILayoutGuide = view.safeAreaLayoutGuide
        
        postCollcetionView.backgroundColor = .systemBackground
        self.view.addSubview(postCollcetionView)
        
        postCollcetionView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([            
            postCollcetionView.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 10),
            postCollcetionView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor),
            postCollcetionView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            postCollcetionView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
        ])
    }
    
    func setupData(){
        userDataArray = userDataManager.userDataArray
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return userDataArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "reuseIdentifier", for: indexPath) as! PostCollectionViewCell
        cell.storeLabel.text = userDataArray[indexPath.row].food.name
        cell.starLabel.text = "\(userDataArray[indexPath.row].star)/5.0"
        cell.addressLabel.text = userDataArray[indexPath.row].food.address
        cell.foodImageView.image = UIImage(named: userDataArray[indexPath.row].food.image)
        cell.emojiButton.setTitle("\(userDataArray[indexPath.row].emoji) \(count)", for: .normal)
        cell.emojiButton.addTarget(self, action: #selector(addCount), for: .touchUpInside)
        cell.emojiButton.backgroundColor = colors[indexPath.row]
        cell.iDLabel.text = userDataArray[indexPath.row].id
        cell.tagLabel.text = "#\(userDataArray[indexPath.row].food.foodTag.rawValue)"
        cell.contentLabel.text = "\"\(userDataArray[indexPath.row].content)\""
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let nextViewController = DetailStackViewController()
        nextViewController.userData = userDataArray[indexPath.row]
        self.present(nextViewController, animated: true, completion: nil)
    }
    @objc func addCount() {
        print("눌렸냐")
        count += 1
    }
    
    @objc func addPostButtonTapped() {
        // 추가 화면
    }

}


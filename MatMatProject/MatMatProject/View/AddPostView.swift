//
//  AddPostView.swift
//  MatMatProject
//
//  Created by 정운관 on 1/18/24.
//

import UIKit


// 새로운 게시글 작성시 필요한 것들
// 사진(ImageView), 아이디(TextField), 맛집 이름(TextField) , 장소(TextField) , 웹 링크(TextField) , 맛집 추천 내용(TextField) , 별점(TextField(Double만 허용)) , 추천 태그(TextField) , 원하는 이모지 (TextField) 

class AddPostView: UIView {
    
    //MARK: - UI
    
    let foodImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .systemGray3
        imageView.image = UIImage(systemName: "photo.artframe")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var imageContainView : UIView = {
        let view = UIView()
        view.addSubview(foodImageView)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    // id
    let idLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 10)
        label.text = "아이디:"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let idLabelTextField : UITextField = {
        let tf = UITextField()
        tf.frame.size.height = 20
        tf.textColor = .black
        // 테두리 스타일
        tf.borderStyle = .roundedRect
        //첫 글자 자동으로 대문자 처리 기능
        tf.autocapitalizationType = .none
        // 문자열 자동 추천
        tf.autocorrectionType = .no
        // 맞춤법 검사
        tf.spellCheckingType = .no
        // 편집시 기존 값 제거
        tf.clearsOnBeginEditing = false
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    lazy var idStackView : UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [idLabel,idLabelTextField] )
        stackView.spacing = 5
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.alignment = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    //식당이름
    let storeLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 10)
        label.text = "맛집 이름:"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let storeLabelTextField : UITextField = {
        let tf = UITextField()
        tf.frame.size.height = 20
        tf.textColor = .black
        tf.borderStyle = .roundedRect
        tf.autocapitalizationType = .none
        tf.autocorrectionType = .no
        tf.spellCheckingType = .no
        tf.clearsOnBeginEditing = false
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    lazy var storeStackView : UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [storeLabel,storeLabelTextField] )
        stackView.spacing = 5
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.alignment = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    //식당주소
    let addressLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 10)
        label.text = "식당 주소:"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let addressLabelTextField : UITextField = {
        let tf = UITextField()
        tf.frame.size.height = 20
        tf.textColor = .black
        tf.borderStyle = .roundedRect
        tf.autocapitalizationType = .none
        tf.autocorrectionType = .no
        tf.spellCheckingType = .no
        tf.clearsOnBeginEditing = false
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    lazy var addressStackView : UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [addressLabel,addressLabelTextField] )
        stackView.spacing = 5
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.alignment = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    // 별점
    let starLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 10)
        label.text = "별점(5점 만점):"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let starLabelTextField : UITextField = {
        let tf = UITextField()
        tf.frame.size.height = 20
        tf.textColor = .black
        tf.borderStyle = .roundedRect
        tf.autocapitalizationType = .none
        tf.autocorrectionType = .no
        tf.spellCheckingType = .no
        tf.clearsOnBeginEditing = false
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    lazy var starStackView : UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [starLabel,starLabelTextField] )
        stackView.spacing = 5
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.alignment = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    // 태그
    let tagLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 10)
        label.text = "추천태그(하나만):"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let tagLabelTextField : UITextField = {
        let tf = UITextField()
        tf.frame.size.height = 20
        tf.textColor = .black
        tf.borderStyle = .roundedRect
        tf.autocapitalizationType = .none
        tf.autocorrectionType = .no
        tf.spellCheckingType = .no
        tf.clearsOnBeginEditing = false
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    lazy var tagStackView : UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [tagLabel,tagLabelTextField] )
        stackView.spacing = 5
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.alignment = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    // 이모지
    let emojiLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 10)
        label.text = "이모티콘(하나만):"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let emojiLabelTextField : UITextField = {
        let tf = UITextField()
        tf.frame.size.height = 20
        tf.textColor = .black
        tf.borderStyle = .roundedRect
        tf.autocapitalizationType = .none
        tf.autocorrectionType = .no
        tf.spellCheckingType = .no
        tf.clearsOnBeginEditing = false
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    lazy var emojiStackView : UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [emojiLabel,emojiLabelTextField] )
        stackView.spacing = 5
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.alignment = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    
    // 식당
    let contentLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 10)
        label.text = "추천 이유 및 후기:"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let contentLabelTextField : UITextField = {
        let tf = UITextField()
        tf.frame.size.height = 20
        tf.textColor = .black
        tf.borderStyle = .roundedRect
        tf.autocapitalizationType = .none
        tf.autocorrectionType = .no
        tf.spellCheckingType = .no
        tf.clearsOnBeginEditing = false
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    lazy var contentStackView : UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [contentLabel,contentLabelTextField] )
        stackView.spacing = 5
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.alignment = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    // 웹링크
    let webLinkLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 10)
        label.text = "웹링크(모바일버전):"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let webLinkLabelTextField : UITextField = {
        let tf = UITextField()
        tf.frame.size.height = 20
        tf.textColor = .black
        tf.borderStyle = .roundedRect
        tf.autocapitalizationType = .none
        tf.autocorrectionType = .no
        tf.spellCheckingType = .no
        tf.clearsOnBeginEditing = false
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    lazy var webStackView : UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [webLinkLabel,webLinkLabelTextField] )
        stackView.spacing = 5
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.alignment = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    // 추가 버튼
    let addButton : UIButton = {
        let button = UIButton(type: .custom)
        button.backgroundColor = .systemOrange
        button.setTitle("ADD POST", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.frame.size.height = 40
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    //이 모든걸 담을 스택 뷰
    lazy var stackView: UIStackView = {
        let stView = UIStackView(arrangedSubviews: [
            imageContainView,idStackView,storeStackView,addressStackView,starStackView,tagStackView,emojiStackView,contentStackView,webStackView,addButton])
        stView.spacing = 10
        stView.axis = .vertical
        stView.distribution = .fill
        stView.alignment = .fill
        stView.translatesAutoresizingMaskIntoConstraints = false
        return stView
    }()
    
    //라벨의 넓이를 고정
    let labelWidth : CGFloat = 100
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemBackground
        setUpStackView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //뷰에서 오토레이아웃 함수 
    override func updateConstraints() {
        setConstraints()
        super.updateConstraints()
    }
    
    //스택뷰 뷰에 추가
    func setUpStackView() {
        self.addSubview(stackView)
    }
    
    //오토레이아웃
    func setConstraints() {
        NSLayoutConstraint.activate([
            foodImageView.heightAnchor.constraint(equalToConstant: 150),
            foodImageView.widthAnchor.constraint(equalToConstant: 150),
            foodImageView.centerXAnchor.constraint(equalTo: imageContainView.centerXAnchor),
            foodImageView.centerYAnchor.constraint(equalTo: imageContainView.centerYAnchor)
        ])
        
        NSLayoutConstraint.activate([
            imageContainView.heightAnchor.constraint(equalToConstant: 180)
        ])
        
        NSLayoutConstraint.activate([
            idLabel.widthAnchor.constraint(equalToConstant: labelWidth),
            storeLabel.widthAnchor.constraint(equalToConstant: labelWidth),
            addressLabel.widthAnchor.constraint(equalToConstant: labelWidth),
            starLabel.widthAnchor.constraint(equalToConstant: labelWidth),
            tagLabel.widthAnchor.constraint(equalToConstant: labelWidth),
            emojiLabel.widthAnchor.constraint(equalToConstant: labelWidth),
            contentLabel.widthAnchor.constraint(equalToConstant: labelWidth),
            webLinkLabel.widthAnchor.constraint(equalToConstant: labelWidth)
        ])
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor,constant: 10),
            stackView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 20),
            stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant: -20)
        ])
    }
    
}

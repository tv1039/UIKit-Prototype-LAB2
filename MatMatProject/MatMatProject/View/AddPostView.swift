//
//  AddPostView.swift
//  MatMatProject
//
//  Created by 정운관 on 1/18/24.
//

import UIKit


// 새로운 게시글 작성시 필요한 것들
// 사진(ImageView), 아이디(TextField), 맛집 이름(TextField) , 장소(TextField) , 맛집 추천 내용(TextField) , 별점(TextField(Double만 허용)) , 추천 태그(TextField) , 원하는 이모지 (TextField)

class AddPostView: UIView {

    //MARK: - UI
    
    let foodImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .gray
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 75
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var imageContainView : UIView = {
        let view = UIView()
        view.addSubview(foodImageView)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let idLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 10)
        label.text = "아이디:"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let storeLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 10)
        label.text = "맛집 이름:"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let contentLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 10)
        label.text = "추천 이유 및 후기:"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let starLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 10)
        label.text = "별점(5점 만점):"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let tagLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.text = "추천태그(하나만):"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
 

}

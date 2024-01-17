//
//  MapViewController.swift
//  MatMatProject
//
//  Created by 정운관 on 1/17/24.
//

import UIKit

class MapViewController: UIViewController {

    public var filter : Tag?
    private let dataManager : DataManger = DataManger()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .systemBackground
        
        if let filter {
            dataManager.filter = filter
        }
        
        self.title = "\(filter?.rawValue ?? "")"
        
        let safeArea: UILayoutGuide = view.safeAreaLayoutGuide
        let descriptionImageView = UIImageView()
        
        descriptionImageView.image = UIImage(named:"mapview_Page")
        
        
        view.addSubview(descriptionImageView)
        
        descriptionImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            descriptionImageView.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor),
            descriptionImageView.centerYAnchor.constraint(equalTo: safeArea.centerYAnchor),
            descriptionImageView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            descriptionImageView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor)
        ])
        
//        let mapImageView = UIImageView()
//        
//        mapImageView.image = UIImage(named: getImageName(tag: "\(filter?.rawValue ?? "")"))
//        
//        view.addSubview(mapImageView)
//        
//        mapImageView.translatesAutoresizingMaskIntoConstraints = false
//        
//        NSLayoutConstraint.activate([
//            mapImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            mapImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
//            
//            mapImageView.widthAnchor.constraint(equalToConstant: 400),
//            mapImageView.heightAnchor.constraint(equalToConstant: 200)
//        ])
//        
        
        
        
        
        
//        for i in 0..<dataManager.filterdFood.count {
//            print(dataManager.filterdFood[i].name)
//        }
        
        
        // Do any additional setup after loading the view.
    }
    
    func getImageName(tag : String) -> String{
        switch tag {
        case "효도별 맛집" :
            return "hydo"
        case "데이튜 맛집" :
            return "dating"
        case "애주가 맛집" :
            return "alchol"
        case "분위기 맛집" :
            return "something"
        default:
            return ""
        }
        
    }
    
    

}

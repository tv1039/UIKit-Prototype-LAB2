//
//  DetailStackViewController.swift
//  MatMatProject
//
//  Created by YUJIN JEON on 1/18/24.
//

import UIKit

class DetailStackViewController: UIViewController {
    var userData: User?
    
    private let detailView = DetailView()
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNaviBar()
        setUpdata()
        setUpButtonAction()
        self.view.backgroundColor = .systemBackground
        
    }
    
    func setupNaviBar() {        
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .white
        
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
    }
    
    private func setUpdata(){
        detailView.userData = userData
    }
    
    override func loadView() {
        view = detailView
    }
    func setUpButtonAction() {
        detailView.mapGoButton.addTarget(self, action: #selector(self.mapButtonTapped), for: .touchUpInside)
    }
   
    @objc func mapButtonTapped() {
        if let webLink = userData?.food.webLink {
            let webViewController = WebViewController()
            webViewController.webLink = webLink
            self.navigationController?.pushViewController(webViewController, animated: true)
        }
    }
    
}

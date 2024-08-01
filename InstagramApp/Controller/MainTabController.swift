//
//  MainTabController.swift
//  InstagramApp
//
//  Created by muhammed dursun on 9.05.2024.
//

import UIKit
import Firebase

class MainTabController: UITabBarController{
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureAllViewController()
        checkIsUserLoggedIn()
    }
    
    // MARK: - Assistants
    
    func configureAllViewController(){
        
        view.backgroundColor = .white
        let layout = UICollectionViewFlowLayout()
        let post = templateNavigationController(unSelectedImage: UIImage(named: "home_unselected"),selectedImage: UIImage(named: "home_selected"),
                                                rootViewController: PostController(collectionViewLayout: layout))
        let search = templateNavigationController(unSelectedImage: UIImage(named: "search_unselected"), selectedImage: UIImage(named: "search_selected"), rootViewController: SearchController())
        let photoSelector = templateNavigationController(unSelectedImage: UIImage(named: "plus_unselected"),selectedImage: UIImage(named: "plus_photo"), rootViewController: PhotoSelectorController())
        let notifation = templateNavigationController(unSelectedImage: UIImage(named: "like_unselected"), selectedImage: UIImage(named: "like_selected"), rootViewController: NotificationController())
        let profileLayout = UICollectionViewFlowLayout()
        
        let profile = templateNavigationController(unSelectedImage: UIImage(named: "profile_unselected"),selectedImage: UIImage(named: "profile_selected"), rootViewController: ProfileController(collectionViewLayout: profileLayout))
        viewControllers = [post,search,photoSelector,notifation,profile]
        tabBar.tintColor = .black
    }
    
    func templateNavigationController(unSelectedImage:UIImage?,selectedImage: UIImage?,rootViewController: UIViewController) -> UINavigationController{
        
        let navi = UINavigationController(rootViewController: rootViewController)
        navi.tabBarItem.image = unSelectedImage
        navi.tabBarItem.selectedImage = selectedImage
        navi.navigationBar.tintColor = .black
        return navi
    }
    
    // MARK: - API
    
    func checkIsUserLoggedIn(){
        
        if Auth.auth().currentUser == nil{
            DispatchQueue.main.async {
                let controller = LoginController()
                let nav = UINavigationController(rootViewController: controller)
                nav.modalPresentationStyle = .fullScreen
                self.present(nav, animated: true, completion: nil)
            }
        }
    }
      
}

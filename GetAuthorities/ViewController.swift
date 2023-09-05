//
//  ViewController.swift
//  GetAuthorities
//
//  Created by 김재훈 on 2023/08/31.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let alertController: UIAlertController = UIAlertController(title: "설정이동", message: "설정으로 이동해야 합니다", preferredStyle: .alert)
        let yesAction = UIAlertAction(title: "예", style: .default) { _ in
            //if let appSetting = URL(string: UIApplication.openSettingsURLString) {
            //    UIApplication.shared.open(appSetting, options: [:], completionHandler: nil)
            //}
            
        }
        let cancelAction = UIAlertAction(title: "아니오", style: .cancel) { _ in
            print("취소됨")
        }
        alertController.addAction(yesAction)
        alertController.addAction(cancelAction)
        present(alertController, animated: true, completion: nil)
    }
}


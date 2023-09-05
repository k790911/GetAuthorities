//
//  ThirdViewController.swift
//  GetAuthorities
//
//  Created by 김재훈 on 2023/08/31.
//

import UIKit
import AVFoundation
import Photos

class ThirdViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        AVCaptureDevice.requestAccess(for: .video) { granted in
            if granted {
                print("Camera: 권한 허용")
            } else {
                print("Camera: 권한 거부")
            }
        }
        
        PHPhotoLibrary.requestAuthorization { status in
            switch status {
            case .authorized:
                print("Album: 권한 허용")
            case .denied:
                print("Album: 권한 거부")
            case .restricted, .notDetermined:
                print("Album: 선택하지 않음")
            default:
                break
            }
        }
        
    }
    
    @IBAction func btn1(_ sender: UIButton) {
        print("카메라 접근상태 확인: ", terminator: "")
        
        switch AVCaptureDevice.authorizationStatus(for: .video) {
        case .authorized:
            print("승인됨")
        case .notDetermined:
            print("결정 안됨")
        case .denied:
            print("거부됨")
        case .restricted:
            print("제한됨")
        default:
            print("모르겠음")
        }
    }
    
    @IBAction func btn2(_ sender: UIButton) {
        print("사진앨범 접근상태 확인: ", terminator: "")
        
        // 현재 사진앨범 접근상태 확인
        switch PHPhotoLibrary.authorizationStatus() {
        case .authorized:
            print("승인됨")
        case .denied:
            print("거부됨")
            getPhotoAuthorities()
        case .limited:
            print("제한접근됨")
        case .notDetermined:
            print("결정 안됨")
        case .restricted:
            print("제한됨")
        default:
            print("모르겠음")
        }
    }
    
    func getPhotoAuthorities() {
        let alertController: UIAlertController = UIAlertController(title: "사진 권한 요청", message: "권한이 있어야 앱 사용 가능합니다", preferredStyle: .alert)
        let getAuthAction = UIAlertAction(title: "예 알겠습니다", style: .default) { _ in
            if let appSetting = URL(string: UIApplication.openSettingsURLString) {
                UIApplication.shared.open(appSetting, options: [:], completionHandler: nil)
            }
        }
        alertController.addAction(getAuthAction)
        present(alertController, animated: true, completion: nil)
    }
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}

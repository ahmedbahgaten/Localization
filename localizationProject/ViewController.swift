//
//  ViewController.swift
//  localizationProject
//
//  Created by AHMED on 1/17/20.
//  Copyright © 2020 AHMED. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var notificationView: UIView!
    @IBOutlet weak var languageView: UIView!
    @IBOutlet weak var reportView: UIView!
    @IBOutlet weak var termsView: UIView!
    @IBOutlet weak var aboutView: UIView!
    @IBOutlet weak var receiveNotificationLabel:UILabel!
    @IBOutlet weak var languageLabel:UILabel!
    @IBOutlet weak var reportProblemLabel:UILabel!
    @IBOutlet weak var aboutLabel:UILabel!
    @IBOutlet weak var termsLabel:UILabel!
    @IBOutlet weak var segmentedControl:UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        notificationView.roundedCorner()
        languageView.roundedCorner()
        reportView.roundedCorner()
        termsView.roundedCorner()
        aboutView.roundedCorner()
        notificationView.grayColor()
        languageView.grayColor()
        reportView.grayColor()
        termsView.grayColor()
        aboutView.grayColor()
        receiveNotificationLabel.text = LocalizationSystem.sharedInstance.localizedStringForKey(key: "receive_Notification", comment: "")
        languageLabel.text = LocalizationSystem.sharedInstance.localizedStringForKey(key: "language", comment: "")
        reportProblemLabel.text = LocalizationSystem.sharedInstance.localizedStringForKey(key: "report_Problem", comment: "")
        aboutLabel.text = LocalizationSystem.sharedInstance.localizedStringForKey(key: "about", comment: "")
        termsLabel.text = LocalizationSystem.sharedInstance.localizedStringForKey(key: "Terms_Policies", comment: "")
    }
    override func viewWillAppear(_ animated: Bool) {
        if "en" == LocalizationSystem.sharedInstance.getLanguage() {
            segmentedControl.selectedSegmentIndex = 0
        }
        else {
            segmentedControl.selectedSegmentIndex = 1
        }
        navigationController?.navigationBar.prefersLargeTitles = true
                 navigationController?.navigationBar.topItem?.title = LocalizationSystem.sharedInstance.localizedStringForKey(key: "navBarTitle", comment: "")
    }
    func setupArabicLanguage() {
        LocalizationSystem.sharedInstance.setLanguage(languageCode: "ar")
        UIView.appearance().semanticContentAttribute = .forceRightToLeft
        restartApplication()
    }
    func setupEnglishLanguage() {
        LocalizationSystem.sharedInstance.setLanguage(languageCode: "en")
        UIView.appearance().semanticContentAttribute = .forceLeftToRight
        restartApplication()
    }
    func restartApplication() {
        
        let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "viewController") as! ViewController
          let nav = UINavigationController.init(rootViewController: viewController)
        let window = UIApplication.shared.windows.first { $0.isKeyWindow }
        window?.rootViewController = nav
        
    }
    
    @IBAction func languageChanged(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            if "en" == LocalizationSystem.sharedInstance.getLanguage() {
                setupArabicLanguage()
            } else {
                setupEnglishLanguage()
            }
        case 1:
            if "ar" ==
                LocalizationSystem.sharedInstance.getLanguage() {
                setupEnglishLanguage()
            } else {
                setupArabicLanguage()
            }
        default:
            print("Default")
        }
    }
}
extension UIView {
    func roundedCorner() {
        self.layer.cornerRadius = 10
    }
    func grayColor() {
        self.backgroundColor = UIColor(white: 0, alpha: 0.08)
    }
}



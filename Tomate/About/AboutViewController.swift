//
//  AboutViewController.swift
//  Tomate
//
//  Created by dasdom on 15.07.15.
//  Copyright © 2015 Dominik Hauser. All rights reserved.
//

import UIKit
import SafariServices

class AboutViewController: UIViewController {

  var aboutView: AboutView {
    return view as! AboutView
  }
  
  override func loadView() {
    let contentView = AboutView(frame: CGRect.zero)
    
    title = NSLocalizedString("About", comment: "About")
    UINavigationBar.appearance().titleTextAttributes = [NSForegroundColorAttributeName: TimerStyleKit.timerColor]
    
    contentView.twitterButton.addTarget(self, action: "openTwitter", forControlEvents: .TouchUpInside)
//    contentView.adnButton.addTarget(self, action: "openADN", forControlEvents: .TouchUpInside)
    contentView.githubButton.addTarget(self, action: "openGithub", forControlEvents: .TouchUpInside)
    contentView.rateButton.addTarget(self, action: "openRating", forControlEvents: .TouchUpInside)

    view = contentView
  }
  
  override func viewWillAppear(animated: Bool) {
    super.viewWillAppear(animated)
    
    aboutView.stackView.topAnchor.constraintEqualToAnchor(topLayoutGuide.bottomAnchor, constant: 20).active = true
    
    let doneButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Done, target: self, action: "dismissAbout")
    navigationItem.rightBarButtonItem = doneButton
  }
  
  func dismissAbout() {
    dismissViewControllerAnimated(true, completion: nil)
  }
}

//MARK: - Button actions
extension AboutViewController {
  func openTwitter() {
    let safariViewController = SFSafariViewController(URL: NSURL(string: "https://twitter.com/fojusiapp")!)
    navigationController?.pushViewController(safariViewController, animated: true)
  }
  
//  func openADN() {
//    let safariViewController = SFSafariViewController(URL: NSURL(string: "https://alpha.app.net/dasdom")!)
//    navigationController?.pushViewController(safariViewController, animated: true)
//  }
  
  func openGithub() {
    let safariViewController = SFSafariViewController(URL: NSURL(string: "https://github.com/dasdom/Tomate")!)
    navigationController?.pushViewController(safariViewController, animated: true)
  }
  
  func openRating() {
//    let safariViewController = SFSafariViewController(URL: NSURL(string: "")!)
//    navigationController?.pushViewController(safariViewController, animated: true)
    UIApplication.sharedApplication().openURL(NSURL(string: "http://itunes.apple.com/WebObjects/MZStore.woa/wa/viewContentsUserReviews?type=Purple+Software&id=923044693")!)
  }
}
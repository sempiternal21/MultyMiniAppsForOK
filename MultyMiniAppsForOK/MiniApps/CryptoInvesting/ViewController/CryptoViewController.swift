//
//  ViewController.swift
//  MultyMiniAppsForOK
//
//  Created by Danil Antonov on 03.09.2024.
//

import UIKit

class CryptoViewController: UIViewController {
    var mainView: CryptoView { self.view as! CryptoView }
    let apiClient = StubAPIClient()
    var coins = UserDefaults.standard.integer(forKey: "HamsterCoinsKey")
    
    override func loadView() {
        view = CryptoView()
        title = NSLocalizedString("cryptoApp", comment: "")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainView.configure(CryptoModel(balance: coins))
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        mainView.imageView.isUserInteractionEnabled = true
        mainView.imageView.addGestureRecognizer(tapGestureRecognizer)
        
        mainView.button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }
    
    @objc func animationMoneyUp() {
        let largeConfig = UIImage.SymbolConfiguration(pointSize: 70, weight: .bold, scale: .large)
        let bubbleImage = UIImage(systemName: "dollarsign", withConfiguration: largeConfig)
        let bubbleImageView = UIImageView(image: bubbleImage)
        bubbleImageView.tintColor = UIColor(red: 60/255, green: 159/255, blue: 121/255, alpha: 1)
        let screenSize = UIScreen.main.bounds
        let bubbleWidth = Int(bubbleImage!.size.width)
        let bubbleHeight = Int(bubbleImage!.size.height)
        let randomX = arc4random_uniform(UInt32(screenSize.width))
        bubbleImageView.frame = CGRect(x: Int(randomX) - Int(Double(bubbleWidth) * 0.5), y: Int(screenSize.height) / 2 + Int.random(in: -Int(screenSize.height)/10...Int(screenSize.height)/10), width: bubbleWidth, height: bubbleHeight)
        view.addSubview(bubbleImageView)
        UIView.animate(withDuration: 3.0, animations: {
            bubbleImageView.center = CGPoint(x: bubbleImageView.center.x, y: CGFloat(-bubbleHeight))
        }) { (finished: Bool) in
            bubbleImageView.removeFromSuperview()
        }
        UIGraphicsEndImageContext()
    }
    
    @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer){
        coins += 1
        UserDefaults.standard.setValue(coins, forKey: "HamsterCoinsKey")
        mainView.configure(CryptoModel(balance: coins))
        Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(animationMoneyUp), userInfo: nil, repeats: false)
    }
    
    @objc func buttonTapped(tapGestureRecognizer: UITapGestureRecognizer){
        let alert = UIAlertController(title: NSLocalizedString("listingComing", comment: ""), message: NSLocalizedString("littleLeft", comment: ""), preferredStyle: .alert)
        let okButton = UIAlertAction(title: NSLocalizedString("continueEarning", comment: ""), style: .default)
        alert.addAction(okButton)
        self.present(alert, animated: true)
    }
}

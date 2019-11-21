//
//  MainViewController.swift
//  ios 13610326 week8 project1 xylophone
//
//  Created by ICT-MAC on 20/11/2562 BE.
//  Copyright © 2562 ictsilpakorn. All rights reserved.
//

import UIKit

class MainViewController: ViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    
    playing()
    
    
}//end viewdid



func playing() {
    
    
    
    var yourImage: UIImage = UIImage(named: "21559")!
    
    let squre3 = UIImageView(frame: CGRect(x:self.view.frame.width/2-150/2, y:-400, width: 130, height: 130))
    
    squre3.image = yourImage
    //        squre3.backgroundColor = UIColor.brown
    self.view.addSubview(squre3)
    
    squre3.slideY(y: self.view.frame.height/2-150)
    squre3.rotate(duration2:4)
    
    
    
    
}

}//end class








extension UIView{
    func rotate(duration2:Double) {
        let rotation : CABasicAnimation = CABasicAnimation(keyPath: "transform.rotation.z")
        rotation.toValue = NSNumber(value: Double.pi * 2)
        rotation.duration = duration2
        rotation.isCumulative = true
        rotation.repeatCount = Float.greatestFiniteMagnitude
        self.layer.add(rotation, forKey: "rotationAnimation")
    }
}

extension UIView {
    
    func slideX(x:CGFloat) {
        
        let yPosition = self.frame.origin.y
        
        let height = self.frame.height
        let width = self.frame.width
        
        UIView.animate(withDuration: 3.0, animations: {
            
            self.frame = CGRect(x: x, y: yPosition, width: width, height: height)
            
        })
    }
}

extension UIView {
    
    func slideY(y:CGFloat) {
        
        let xPosition = self.frame.origin.x
        
        let height = self.frame.height
        let width = self.frame.width
        
        UIView.animate(withDuration: 3.0, animations: {
            
            self.frame = CGRect(x: xPosition, y: y , width: width, height: height)
            
        })
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

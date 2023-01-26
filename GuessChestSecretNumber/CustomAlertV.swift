//
//  CustomAlertVC.swift
//  try
//
//  Created by Ran Ra on 23/03/1444 AH.
//

import Foundation

import UIKit

class CustomAlertV : UIView {
    
    @IBOutlet var view: UIView!
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    required init?(coder : NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    
    
    
    
    private func commonInit(){
        view = loadViewNib(nibName: "CustomAlertV")
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.frame = self.bounds
//        view.frame.size.height = 10
//        view.frame.size.width = 10

        addSubview(view)
        
    }
    
    func loadViewNib(nibName : String) -> UIView{
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: nibName, bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil)[0]as! UIView
    return view
    }
    
}
    
    
    
//    private func commonInit(){
//        let bundle = Bundle.init(for: CustomAlertV.self)
//        let xibView = bundle.loadNibNamed("CustomAlertV", owner: self,options: nil)![0] as! UIView
//        xibView.frame = self.bounds
//        addSubview(xibView)
//
//    }
//
//}

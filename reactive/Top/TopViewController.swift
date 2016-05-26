//
//  TopViewController.swift
//  reactive
//
//  Created by Vitaly Skorobreshchuk on 5/21/16.
//  Copyright © 2016 MEV. All rights reserved.
//

import UIKit
import Result
import ReactiveCocoa

class TopViewController: UIViewController {
    
    @IBOutlet weak var valueTextField: UITextField!
    @IBOutlet weak var valueLabel: UILabel!

    var viewModel: TopViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel = TopViewModel()

        valueTextField.rac_textSignal().toSignalProducer()
            .flatMapError { error in
                return SignalProducer<AnyObject?, NoError>.empty
            }
            .map { text in text as? String }
            .startWithNext { [weak self] text in
                self?.viewModel.didEnterValue(text!)
        }
        
        viewModel.value.producer.startWithNext { [weak self] value in
            self?.valueLabel.text = value
        }
    }
}

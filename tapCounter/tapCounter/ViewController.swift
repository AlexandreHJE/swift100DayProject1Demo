//
//  ViewController.swift
//  tapCounter
//
//  Created by Alex Hu on 2021/3/14.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var counter: UILabel!
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var resetButton: UIButton!

    let viewModel = ViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()

        counter.text = "0"
        viewModel.delegate = self
        addButton.addTarget(self, action: #selector(addNumber), for: .touchUpInside)
        resetButton.addTarget(self, action: #selector(resetNumber), for: .touchUpInside)
    }

    @objc
    func addNumber() {
        viewModel.addNumberValue()
    }

    @objc
    func resetNumber() {
        viewModel.resetNumberValue()
    }

}

extension ViewController: ViewModelDelegate {
    func viewModel(_ viewModel: ViewModel, didUpadateNumber: NumberData) {
        counter.text = String(viewModel.number.num)
    }
}

//
//  ViewModel.swift
//  tapCounter
//
//  Created by Alex Hu on 2021/3/14.
//

import Foundation

protocol ViewModelDelegate: class {
    func viewModel(_ viewModel: ViewModel, didUpadateNumber: NumberData)
}

class ViewModel: NSObject {
    weak var delegate: ViewModelDelegate?

    var number = NumberData(num: 0) {
        didSet {
            delegate?.viewModel(self, didUpadateNumber: number)
        }
    }

    func addNumberValue() {
        number.num += 1
    }

    func resetNumberValue() {
        number.num = 0
    }
}

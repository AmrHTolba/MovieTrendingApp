//
//  Observable.swift
//  Movie Trending
//
//  Created by Amr El-Fiqi on 18/07/2023.
//

import Foundation

class Observable <T> {
    
    // MARK: - Variables
    // When a change happens it will update the listener and the listener will update the value where it is called
    var value: T? {
        didSet {
            // DispatchQueue to make sure the listerner is updated in the main thread where UI is handled
            DispatchQueue.main.async {
                self.listener?(self.value)
            }
        }
    }
    // Listener to notify the binding method
    private var listener: ((T?) -> Void)?
    
    // MARK: - Initialization
    
    init(value: T?) {
        self.value = value
    }
    
    // MARK: - Class Methods
    
    func bind(_ listener: @escaping ((T?) -> Void)) {
        listener(value)
        self.listener = listener
    }
}

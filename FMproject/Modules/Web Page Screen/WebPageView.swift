//
//  WebPageView.swift
//  FMproject
//
//  Created by KL on 11/07/2021.
//

import UIKit

final class WebPageView: UIView {
    
    // MARK: - UI Components -
    
    // MARK: - Init -
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
        defineLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup -
    
    private func setup() {
        backgroundColor = .green
    }
    
    // MARK: - Layout -
    
    private func defineLayout() {
        
    }
}

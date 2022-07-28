//
//  BigHeartView.swift
//  Pulse
//
//  Created by Grekhem on 28.07.2022.
//

import Foundation
import UIKit

final class BigHeartView: UIView {
    private var onTapHandler: (() -> Void)?
    private lazy var onTap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(_:)))
    let imageView = UIImageView(image: UIImage(named: "bigHeart"))
    
    init(onTapHandler: (() -> Void)?) {
        self.onTapHandler = onTapHandler
        super.init(frame: .zero)
        self.addGestureRecognizer(onTap)
        self.configUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func handleTap(_ sender: UITapGestureRecognizer? = nil) {
        self.onTapHandler?()
    }
    private func configUI() {
        self.addSubview(imageView)
        self.imageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}

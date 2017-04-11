//
// Created by Mateusz Szklarek on 28/01/16.
// Copyright (c) 2016 EL Passion. All rights reserved.
//

import UIKit

class LogoDescriptionView: UIView {

    init() {
        super.init(frame: CGRect.zero)
        addSubviews()
        setupLayout()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: Subviews

    private let logoImageView: UIImageView = {
        let view = UIImageView(frame: CGRect.zero)
        view.image = UIImage(asset: .Elpassion)
        view.contentMode = UIViewContentMode.scaleAspectFit
        return view
    }()

    private let descriptionLabel: UILabel = {
        let label = UILabel(frame: CGRect.zero)
        label.text = infoDescription.localized
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 11)
        label.textColor = UIColor(color: .White)
        return label
    }()

    private func addSubviews() {
        addSubview(logoImageView)
        addSubview(descriptionLabel)
    }

    // MARK: Layout

    private func setupLayout() {
        logoImageView.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(0)
            make.centerX.equalTo(0)
        }
        descriptionLabel.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(logoImageView.snp.bottom).offset(25)
            make.left.equalTo(25)
            make.right.equalTo(-25)
            make.bottom.equalTo(0)
        }
    }

}

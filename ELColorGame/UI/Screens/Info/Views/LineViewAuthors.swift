//
// Created by Mateusz Szklarek on 28/01/16.
// Copyright (c) 2016 EL Passion. All rights reserved.
//

import UIKit

class LineViewAuthors: UIView {

    init() {
        super.init(frame: CGRect.zero)
        addSubviews()
        setupLayout()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: Subviews

    private let titleLabel: UILabel = {
        let label = UILabel(frame: CGRect.zero)
        label.text = authors.localized
        label.textAlignment = .center
        label.font = UIFont(name: BebasNeueBold, size: 14)
        label.textColor = UIColor(color: .White)
        return label
    }()

    private let leftLineView: UIView = {
        let view = UIView(frame: CGRect.zero)
        view.backgroundColor = UIColor(color: .White).withAlphaComponent(0.1)
        return view
    }()

    private let rightLineView: UIView = {
        let view = UIView(frame: CGRect.zero)
        view.backgroundColor = UIColor(color: .White).withAlphaComponent(0.1)
        return view
    }()

    private func addSubviews() {
        addSubview(titleLabel)
        addSubview(leftLineView)
        addSubview(rightLineView)
    }

    // MARK: Layout

    private func setupLayout() {
        titleLabel.snp.makeConstraints { (make) -> Void in
            make.top.bottom.centerX.equalTo(0)
        }
        leftLineView.snp.makeConstraints { (make) -> Void in
            make.left.equalTo(30)
            make.height.equalTo(1)
            make.centerY.equalTo(0)
            make.right.equalTo(titleLabel.snp.left).offset(-10)
        }
        rightLineView.snp.makeConstraints { (make) -> Void in
            make.right.equalTo(-30)
            make.height.equalTo(leftLineView.snp.height)
            make.left.equalTo(titleLabel.snp.right).offset(10)
            make.centerY.equalTo(titleLabel.snp.centerY)
        }
    }

}

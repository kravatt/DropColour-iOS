//
// Created by Mateusz Szklarek on 29/01/16.
// Copyright (c) 2016 EL Passion. All rights reserved.
//

import UIKit

class AuthorView: UIView {

    let author: Author

    init(author: Author) {
        self.author = author
        super.init(frame: CGRect.zero)
        addSubviews()
        setupLayout()
        applyType()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        avatarImageView.layer.cornerRadius = avatarImageView.frame.size.width / 2
    }

    private func applyType() {
        fullNameLabel.text = author.fullName
        authorTypeLabel.text = author.type.rawValue
        professionImageView.image = author.type.image
        configureImageForAvatarImageView()
        configureProfessionLoginLabel()
        configureTwitterLoginLabel()
    }

    // MARK: Configure subviews with data

    private func configureImageForAvatarImageView() {
        guard let avatarUrl = author.avatarUrl else { return }
        avatarImageView.image = UIImage(named: avatarUrl.absoluteString)
    }

    private func configureProfessionLoginLabel() {
        guard let professionUrl = author.professionUrl else { return }
        professionLoginLabel.text = author.loginFromUrl(professionUrl)
    }

    private func configureTwitterLoginLabel() {
        guard let twitterUrl = author.twitterUrl else { return }
        twitterLoginLabel.text = author.loginFromUrl(twitterUrl)
    }

    // MARK: Subviews

    private let avatarImageView: UIImageView = {
        let view = UIImageView(frame: CGRect.zero)
        view.contentMode = UIViewContentMode.scaleAspectFit
        view.clipsToBounds = true
        return view
    }()

    private let fullNameLabel: UILabel = {
        let label = UILabel(frame: CGRect.zero)
        label.font = UIFont(name: BebasNeueBold, size: 20)
        label.textColor = UIColor(color: .White)
        return label
    }()

    private let authorTypeLabel: UILabel = AuthorView.createLabel()

    private let professionImageView: UIImageView = {
        let view = UIImageView(frame: CGRect.zero)
        view.clipsToBounds = true
        view.contentMode = UIViewContentMode.scaleAspectFit
        return view
    }()

    private let professionLoginLabel = AuthorView.createLabel()

    private let twitterImageView: UIImageView = {
        let view = UIImageView(frame: CGRect.zero)
        view.image = UIImage(asset: .Twitter)
        view.contentMode = UIViewContentMode.scaleAspectFit
        return view
    }()

    private let twitterLoginLabel = AuthorView.createLabel()

    private class func createLabel() -> UILabel {
        let label = UILabel(frame: CGRect.zero)
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = UIColor(color: .White).withAlphaComponent(0.8)
        return label
    }

    private func addSubviews() {
        addSubview(avatarImageView)
        addSubview(authorTypeLabel)
        addSubview(fullNameLabel)
        addSubview(professionImageView)
        addSubview(professionLoginLabel)
        addSubview(twitterImageView)
        addSubview(twitterLoginLabel)
    }

    // MARK: Layout

    private func setupLayout() {
        avatarImageView.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(0)
            make.bottom.lessThanOrEqualTo(0)
            make.size.equalTo(CGSize(width: 80, height: 80))
            make.left.equalTo(45)
        }
        fullNameLabel.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(avatarImageView.snp.top)
            make.left.equalTo(avatarImageView.snp.right).offset(15)
            make.right.equalTo(-16)
        }
        authorTypeLabel.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(fullNameLabel.snp.bottom).offset(5)
            make.left.equalTo(fullNameLabel.snp.left)
            make.right.equalTo(-16)
        }
        professionImageView.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(authorTypeLabel.snp.bottom).offset(5)
            make.left.equalTo(authorTypeLabel.snp.left)
        }
        professionLoginLabel.snp.makeConstraints { (make) -> Void in
            make.left.equalTo(professionImageView.snp.right).offset(5)
            make.centerY.equalTo(professionImageView.snp.centerY)
        }
        twitterImageView.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(professionImageView.snp.bottom).offset(5)
            make.left.equalTo(professionImageView.snp.left)
        }
        twitterLoginLabel.snp.makeConstraints { (make) -> Void in
            make.left.equalTo(twitterImageView.snp.right).offset(5)
            make.centerY.equalTo(twitterImageView.snp.centerY)
            make.bottom.lessThanOrEqualTo(0)
        }
    }

}

private extension AuthorType {
    var image: UIImage? {
        switch self {
        case .Developer:
            return UIImage(asset: .Github)
        case .Designer:
            return UIImage(asset: .Dribbble)
        }
    }
}

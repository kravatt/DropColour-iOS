//
// Created by Mateusz Szklarek on 28/01/16.
// Copyright (c) 2016 EL Passion. All rights reserved.
//

import UIKit

protocol InfoViewDelegate: class {

    func infoViewDidTapQuit()
    func infoViewDidTapAuthor(author: Author)
    func infoViewDidTapCompanyLogo()

}

class InfoView: UIView {

    private weak var delegate: InfoViewDelegate?
    private var authorViews: [AuthorView]

    init(delegate: InfoViewDelegate?, authors: [Author]) {
        self.delegate = delegate
        self.authorViews = authors.map { AuthorView(author: $0) }
        super.init(frame: CGRect.zero)
        addSubviews()
        setupLayout()
        configureButtonActions()
        configureTapGesturesRecognizer()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        closeButtonBlur.layer.cornerRadius = closeButtonBlur.frame.width / 2
    }

    // MARK: Subviews

    private let scrollView: UIScrollView = {
        let view = UIScrollView(frame: CGRect.zero)
        view.contentInset = UIEdgeInsetsMake(80.0, 0.0, 20.0, 0.0)
        return view
    }()

    private let closeButtonBlur: UIView = {
        let view = UIView(frame: CGRect.zero)
        view.clipsToBounds = true
        let blur = UIVisualEffectView(effect: UIBlurEffect(style: UIBlurEffectStyle.dark))
        view.addSubview(blur)
        blur.snp.makeConstraints { $0.edges.equalTo(0) }
        return view
    }()

    private let blurEffectView = UIVisualEffectView(effect: UIBlurEffect(style: UIBlurEffectStyle.dark))
    private let closeButton = Button(image: UIImage(asset: .Close))
    private let logoDescriptionView = LogoDescriptionView()
    private let lineViewAuthors = LineViewAuthors()

    private func addSubviews() {
        addSubview(blurEffectView)
        addSubview(scrollView)
        scrollView.addSubview(logoDescriptionView)
        scrollView.addSubview(lineViewAuthors)
        for authorView in authorViews {
            scrollView.addSubview(authorView)
        }
        addSubview(closeButtonBlur)
        addSubview(closeButton)
    }

    // MARK: Layout

    private func setupLayout() {
        blurEffectView.snp.makeConstraints { (make) -> Void in
            make.edges.equalTo(0)
        }
        scrollView.snp.makeConstraints { (make) -> Void in
            make.edges.equalTo(0)
        }
        logoDescriptionView.snp.makeConstraints { (make) -> Void in
            make.top.left.right.centerX.equalTo(0)
        }
        lineViewAuthors.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(logoDescriptionView.snp.bottom).offset(30)
            make.left.right.equalTo(0)
        }
        for (idx, authorView) in authorViews.enumerated() {
            authorView.snp.makeConstraints {
                $0.left.right.equalTo(0)
                if authorView == authorViews.first {
                    $0.top.equalTo(lineViewAuthors.snp.bottom).offset(20)
                } else {
                    let previous = authorViews[idx - 1]
                    $0.top.equalTo(previous.snp.bottom).offset(20)
                }
                if authorView == authorViews.last {
                    $0.bottom.equalTo(0)
                }
            }
        }
        closeButton.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(30)
            make.right.equalTo(-15)
        }
        closeButtonBlur.snp.makeConstraints { (make) -> Void in
            make.center.equalTo(closeButton.snp.center)
            make.size.equalTo(closeButton.snp.size)
        }
    }

    // MARK: Button actions

    private func configureButtonActions() {
        closeButton.buttonActionClosure = { [weak self] in
            self?.delegate?.infoViewDidTapQuit()
        }
    }

    // MARK: Tap gestures

    private func configureTapGesturesRecognizer() {
        logoDescriptionView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(InfoView.tapLogoDescriptionView(_:))))
        for authorView in authorViews {
            authorView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(InfoView.tapAuthor(_:))))
        }
    }

    func tapLogoDescriptionView(sender: UITapGestureRecognizer) {
        delegate?.infoViewDidTapCompanyLogo()
    }

    func tapAuthor(sender: UITapGestureRecognizer) {
        guard let view = sender.view as? AuthorView else { return }
        delegate?.infoViewDidTapAuthor(view.author)
    }

}

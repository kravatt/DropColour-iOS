//
//  Created by Mateusz Szklarek on 26/09/15.
//  Copyright © 2015 EL Passion. All rights reserved.
//

import UIKit

class Button: UIButton {

    typealias ButtonActionClosure = () -> ()
    var buttonActionClosure: ButtonActionClosure?

    init(title: String, color: UIColor) {
        super.init(frame: CGRect.zero)

        setTitle(title, for: UIControlState())
        titleLabel?.font = UIFont(name: BebasNeueBold, size: 22)
        setTitleColor(UIColor.white, for: UIControlState())
        layer.cornerRadius = 25.0
        backgroundColor = color
        setBackgroundColor(UIColor.black.withAlphaComponent(0.25), forUIControlState: .highlighted)
        configureButtonAction()
    }

    init(image: UIImage?) {
        super.init(frame: CGRect.zero)

        setImage(image, for: UIControlState())
        configureButtonAction()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        guard var titleFrame = titleLabel?.frame else { return }
        titleFrame.size.height = bounds.height
        titleFrame.origin.y = titleEdgeInsets.top + 2.0
        titleLabel?.frame = titleFrame
        clipsToBounds = true
    }

    private func configureButtonAction() {
        addTarget(self, action: #selector(Button.didTapOnButton(_:)), for: UIControlEvents.touchUpInside)
    }

    func didTapOnButton(sender: UIButton) {
        buttonActionClosure?()
    }

}

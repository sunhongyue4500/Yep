//
//  SayHiView.swift
//  Yep
//
//  Created by NIX on 15/5/29.
//  Copyright (c) 2015年 Catch Inc. All rights reserved.
//

import UIKit

@IBDesignable
class SayHiView: UIView {

    @IBInspectable var topLineColor: UIColor = UIColor.lightGrayColor()
    @IBInspectable var topLineWidth: CGFloat = 1 / UIScreen.mainScreen().scale

    lazy var sayHiButton: UIButton = {
        let button = UIButton()
        button.titleLabel?.font = UIFont(name: "Helvetica-Regular", size: 14)
        button.setTitle(NSLocalizedString("Say Hi", comment: ""), forState: .Normal)
        button.backgroundColor = UIColor.yepTintColor()
        button.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        button.layer.cornerRadius = 5
        button.addTarget(self, action: "trySayHi", forControlEvents: UIControlEvents.TouchUpInside)
        return button
        }()

    var sayHiAction: (() -> Void)?

    override func didMoveToSuperview() {
        super.didMoveToSuperview()

        backgroundColor = UIColor.whiteColor()

        // Add sayHiButton

        self.addSubview(sayHiButton)
        sayHiButton.setTranslatesAutoresizingMaskIntoConstraints(false)

        let sayHiButtonCenterXConstraint = NSLayoutConstraint(item: sayHiButton, attribute: .CenterX, relatedBy: .Equal, toItem: self, attribute: .CenterX, multiplier: 1.0, constant: 0)

        let sayHiButtonCenterYConstraint = NSLayoutConstraint(item: sayHiButton, attribute: .CenterY, relatedBy: .Equal, toItem: self, attribute: .CenterY, multiplier: 1.0, constant: 0)

        let sayHiButtonWidthConstraint = NSLayoutConstraint(item: sayHiButton, attribute: .Width, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1.0, constant: 185)

        let sayHiButtonHeightConstraint = NSLayoutConstraint(item: sayHiButton, attribute: .Height, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1.0, constant: 30)

        NSLayoutConstraint.activateConstraints([
            sayHiButtonCenterXConstraint,
            sayHiButtonCenterYConstraint,
            sayHiButtonWidthConstraint,
            sayHiButtonHeightConstraint,
            ])
    }

    // MARK: Actions

    func trySayHi() {
        sayHiAction?()
    }

    // MARK: Draw

    override func drawRect(rect: CGRect) {
        super.drawRect(rect)

        topLineColor.setStroke()

        let context = UIGraphicsGetCurrentContext()

        CGContextSetLineWidth(context, topLineWidth)
        CGContextMoveToPoint(context, 0, 0)
        CGContextAddLineToPoint(context, CGRectGetWidth(rect), 0)
        CGContextStrokePath(context)
    }
}
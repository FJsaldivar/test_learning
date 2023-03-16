//
//  LabelTag.swift
//  UalaFareUI
//
//  Created by Luis Perez on 19/07/22.
//

import UIKit

/// A label with a tag look
@IBDesignable
public final class AbraTag: UILabel {
    
    /// Status of the tag, access this if you are using the interface builder
    @IBInspectable
    public var status: String = "new" {
        didSet {
            self.theme = AbraThemeManager.theme.tagThemedModel(status: AbraTagStatus(rawValue: status) ?? .new, size: .small)
            configureTheme()
        }
    }
    
    /// The size of the tag, use this only if you are using the interface builder
    @IBInspectable
    public var size: String? {
        didSet {
            guard let status = AbraTagStatus(rawValue: status),
                  let stringSize = size,
                  let size = ComponentSize(rawValue: stringSize) else {
                return
            }
            self.theme = AbraThemeManager.theme.tagThemedModel(status: status,
                                                                size: size)
            configureTheme()
        }
    }
    
    private var theme: AbraTagTheme = AbraThemeManager.theme.tagThemedModel(status: .new, size: .small)
    
    /**
     - Parameters:
        - status: The status of the tag
        - size: The size of the tag
        - frame: The frame of the tag, the default value is zero
     */
    public convenience init(status: AbraTagStatus, size: ComponentSize, frame: CGRect = .zero) {
        let model = AbraThemeManager.theme.tagThemedModel(status: status,
                                                          size: size)
        self.init(model: model, frame: frame)
        self.status = status.rawValue
        self.size = size.rawValue
        observeThemeUpdates()
    }
    
    /**
     - Parameters:
        - model: The themed model of the tag
        - frame: The frame of the tag, the default is zero
     */
    public init(model: AbraTagTheme, frame: CGRect = .zero) {
        self.theme = model
        super.init(frame: frame)
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        configureTheme()
    }
    
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureTheme()
    }
    
    public override func drawText(in rect: CGRect) {
        super.drawText(in: rect.inset(by: theme.edgeInsets))
        configureTheme()
    }

    public override func sizeThatFits(_ size: CGSize) -> CGSize {
        var adjSize = super.sizeThatFits(size)
        adjSize.width += theme.edgeInsets.left + theme.edgeInsets.right
        adjSize.height += theme.edgeInsets.top + theme.edgeInsets.bottom

        return adjSize
    }

    public override var intrinsicContentSize: CGSize {
        var contentSize = super.intrinsicContentSize
        contentSize.width += theme.edgeInsets.left + theme.edgeInsets.right
        contentSize.height += theme.edgeInsets.top + theme.edgeInsets.bottom

        return contentSize
    }
    
    /// Update the tag themed model
    public func configure(with model: AbraTagTheme) {
        self.theme = model
        configureTheme()
    }
    
    private func configureTheme() {
        textAlignment = .center
        applyTypography(theme.typographyStyle)
        backgroundColor = theme.backgroundColor
        textColor = theme.textColor
        layer.cornerRadius = theme.cornerRadius
        layer.masksToBounds = true
        invalidateIntrinsicContentSize()
    }
}

extension AbraTag: ThemeObserver {
    public func updateTheme() {
        guard let abraTagStatus = AbraTagStatus(rawValue: status),
              let size = ComponentSize(rawValue: size ?? "") else {
            return
        }
        self.theme = AbraThemeManager.theme.tagThemedModel(status: abraTagStatus, size: size)
        configureTheme()
    }
}

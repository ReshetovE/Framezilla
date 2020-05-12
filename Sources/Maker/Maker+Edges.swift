//
//  Copyright © 2020 Rosberry. All rights reserved.
//

import UIKit

extension Maker {

    /// Creates edge relations.
    ///
    /// It's useful method for configure some side relations in short form.
    ///
    /// ```
    /// Instead of writing:
    ///     maker.top(10).bottom(10).and.left(10)
    /// just write:
    ///     maker.edges(top:10, left:10, bottom:10) - it's more elegant.
    /// ```
    ///
    /// - parameter top:    The top inset relation relatively superview.
    /// - parameter left:   The left inset relation relatively superview.
    /// - parameter bottom: The bottom inset relation relatively superview.
    /// - parameter right:  The right inset relation relatively superview.
    ///
    /// - returns: `Maker` instance for chaining relations.

    @discardableResult public func edges(top: Number? = nil, left: Number? = nil, bottom: Number? = nil, right: Number? = nil) -> Maker {
        return apply(self.top, top).apply(self.left, left).apply(self.bottom, bottom).apply(self.right, right)
    }

    /// Creates edge relations for superview.
    ///
    /// - parameter insets: The insets for setting relations for superview.
    ///
    /// - parameter sides: The sides which will inculed from edge insets to setting relations.
    ///
    /// - returns: `Maker` instance for chaining relations.

    @discardableResult public func edges(insets: UIEdgeInsets, sides: Sides = .all) -> Maker {
        sides.forEach { side in
            switch side {
            case .bottom:
                bottom(inset: insets.bottom)
            case .left:
                left(inset: insets.left)
            case .right:
                right(inset: insets.right)
            case .top:
                top(inset: insets.top)
            default:
                return
            }
        }
        return self
    }
}

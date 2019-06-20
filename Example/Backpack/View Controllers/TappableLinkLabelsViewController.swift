/*
 * Backpack - Skyscanner's Design System
 *
 * Copyright 2018-2019 Skyscanner Ltd
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import UIKit
import Backpack

class TappableLinkLabelsViewController: UIViewController, BPKTappableLinkLabelDelegate {
    var linkCount: Int = 1
    var fontStyles = [
        BPKFontStyle.textCaps,
        BPKFontStyle.textBaseEmphasized,
        BPKFontStyle.textSm,
        BPKFontStyle.textLgEmphasized,
        BPKFontStyle.textXl,
        BPKFontStyle.textXxlEmphasized
    ]

    @IBOutlet var tappableLinks: [TappableLinkLabel]!

    override func viewDidLoad() {
        super.viewDidLoad()

        var linkIndex = 0
        for tappableLink in tappableLinks {
            tappableLink.text = "Backpack is Skyscanner's design system."
            tappableLink.fontStyle = fontStyles[linkIndex]
            tappableLink.delegate = self

            // swiftlint:disable legacy_constructor
            tappableLink.addLink(to: URL(string: "https://backpack.github.io/")!, with: NSMakeRange(0, 8))

            if linkCount > 1 {
                tappableLink.addLink(to: URL(string: "https://www.skyscanner.net/")!, with: NSMakeRange(12, 12))
            }
            // swiftlint:enable legacy_constructor
            linkIndex += 1
        }
    }

    func attributedLabel(_ label: BPKTappableLinkLabel, didSelectLinkWith url: URL) {
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }

}

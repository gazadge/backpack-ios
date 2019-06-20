# Backpack/TappableLinkLabel

## Usage

`BPKTappableLinkLabel`/`Backpack.TappableLinkLabel` is a subclass of BPKLabel with the ability to add Skyscanner style links. 

### Objective-C

```objectivec
#import <Backpack/TappableLinkLabel.h>

BPKTappableLinkLabel *tappableLinkLabel = [[BPKTappableLinkLabel alloc] initWithFontStyle:BPKFontStyleTextBase];
tappableLinkLabel.text = @“Find out more about our terms of service.”
[tappableLinkLabel setDelegate:self];

[tappableLinkLabel addLinkToURL:[NSURL URLWithString:@"http:..."] withRange:NSRange(location:24, length:16)];
// Position label with autolayout or other method

...

#pragma mark - <BPKTappableLabelDelegate>

- (void)attributedLabel:(TTTAttributedLabel *)label didSelectLinkWithURL:(NSURL *)url
{
    [_presenter urlTapped:url];
}
```

### Swift

```swift
import Backpack

let tappableLinkLabel = Backpack.TappableLinkLabel(fontStyle: .base)
tappableLinkLabel.text = “Find out more about our terms of service.”
tappableLinkLabel.delegate = self;

tappableLinkLabel.addLinkToURL(url: "https:...", withRange: Range(location:24, length:16));
// Position label with autolayout or other method

...

extension MyClass: TTTAttributedLabelDelegate {
    func attributedLabel(_ label: TTTAttributedLabel!, didSelectLinkWith url: URL!) {
        delegate?.openURL(url)
    }
}
```

### Appearance attributes
`(UIColor)linkContentColor`

`(BPKFontMapping)fontMapping`


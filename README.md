# [Let's Build YouTube](https://www.youtube.com/playlist?list=PL0dzCUj1L5JGKdVUtA5xds1zcyzsz7HLj)

## [Swift: Let's Build YouTube - Home Feed: UICollectionView, AutoLayout (Ep 1)](https://www.youtube.com/watch?v=3Xv1mJvwXok&index=1&list=PL0dzCUj1L5JGKdVUtA5xds1zcyzsz7HLj)

We're NOT going to use Storyboards

## [Swift: YouTube - Custom Navigation Bar and MVC Clean Up (Ep 2)](https://www.youtube.com/watch?v=APQVltARKF8&index=2&list=PL0dzCUj1L5JGKdVUtA5xds1zcyzsz7HLj)

## [Swift: Youtube - Custom Tab Bar / Menu Bar using UICollectionView (Ep 3)](https://www.youtube.com/watch?v=rRhJGnSmEKQ&index=3&list=PL0dzCUj1L5JGKdVUtA5xds1zcyzsz7HLj)

[Auto Layout Guide: Programmatically Creating Constraints](https://developer.apple.com/library/content/documentation/UserExperience/Conceptual/AutolayoutPG/ProgrammaticallyCreatingConstraints.html)

[NSLayoutAnchor - UIKit | Apple Developer Documentation](https://developer.apple.com/reference/uikit/nslayoutanchor)

> The NSLayoutAnchor class is a factory class for creating NSLayoutConstraint objects using a fluent API. Use these constraints to programatically define your layout using Auto Layout.


```swift
private func setupMenuBar() {
    menuBar.translatesAutoresizingMaskIntoConstraints = false
    menuBar.widthAnchor.constraint(equalToConstant: view.frame.width).isActive = true
    menuBar.heightAnchor.constraint(equalToConstant: 50).isActive = true
    view.addSubview(menuBar)
}
```

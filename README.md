# curved_labeled_gradient_navigation_bar

[pub package](https://pub.dartlang.org/packages/curved_labeled_navigation_bar)

A Flutter package for easy implementation of curved navigation bar.  
This package is a fork of the original curved_navigation_bar from https://github.com/namanh11611/curved_labeled_navigation_bar with gradient support for CurvedNavigationBar.

| Label                                                                                                                 | No Label                                                                                                                    |
| --------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------- |
| ![Label Gif](https://raw.githubusercontent.com/namanh11611/curved_labeled_navigation_bar/refs/heads/master/label.gif) | ![No Label Gif](https://raw.githubusercontent.com/namanh11611/curved_labeled_navigation_bar/refs/heads/master/no_label.gif) |

| Gradient                                                                                                                    |     |
| --------------------------------------------------------------------------------------------------------------------------- | --- |
| ![Gradient Gif](https://raw.githubusercontent.com/namanh11611/curved_labeled_navigation_bar/refs/heads/master/gradient.gif) |     |

---

### Add dependency

```yaml
dependencies:
  curved_labeled_navigation_bar: ^2.0.10 #latest version
```

---

### Easy to use

```dart
Scaffold(
  bottomNavigationBar: CurvedNavigationBar(
    backgroundColor: Colors.blueAccent,
    items: [
      CurvedNavigationBarItem(
        child: Icon(Icons.home_outlined),
        label: 'Home',
      ),
      CurvedNavigationBarItem(
        child: Icon(Icons.search),
        label: 'Search',
      ),
      CurvedNavigationBarItem(
        child: Icon(Icons.chat_bubble_outline),
        label: 'Chat',
      ),
      CurvedNavigationBarItem(
        child: Icon(Icons.newspaper),
        label: 'Feed',
      ),
      CurvedNavigationBarItem(
        child: Icon(Icons.perm_identity),
        label: 'Personal',
      ),
    ],
    onTap: (index) {
      // Handle button tap
    },
  ),
  body: Container(color: Colors.blueAccent),
)
```

---

### Attributes

#### CurvedNavigationBar

| Attribute               | Description                                                                                                         |
| ----------------------- | ------------------------------------------------------------------------------------------------------------------- |
| `items`                 | List of CurvedNavigationBarItem                                                                                     |
| `index`                 | Index of NavigationBar, can be used to change current index or to set initial index                                 |
| `color`                 | Color of NavigationBar, default Colors.white                                                                        |
| `buttonBackgroundColor` | Background color of floating button, default same as color attribute                                                |
| `backgroundColor`       | Color of NavigationBar's background, default Colors.blueAccent                                                      |
| `gradient`              | Gradient background of NavigationBar. Overrides `color` if provided.                                                |
| `buttonGradient`        | Gradient background of floating button. Overrides `buttonBackgroundColor` if provided.                              |
| `onTap`                 | Function handling taps on items                                                                                     |
| `letIndexChange`        | Function which takes page index as argument and returns bool. If false, the index does not change. Default is true. |
| `animationCurve`        | Curve of transition animation. Default is `Curves.easeOut`.                                                         |
| `animationDuration`     | Duration of transition animation. Default is `Duration(milliseconds: 600)`.                                         |
| `height`                | Height of the NavigationBar.                                                                                        |
| `maxWidth`              | Max width of NavigationBar. Can make bar width smaller than the screen width.                                       |
| `iconPadding`           | Padding around the floating icon button.                                                                            |

#### CurvedNavigationBarItem

| Attribute    | Description                     |
| ------------ | ------------------------------- |
| `child`      | Icon of CurvedNavigationBarItem |
| `label`      | Text of CurvedNavigationBarItem |
| `labelStyle` | TextStyle for label             |

---

### Change page programmatically

```dart
 // State class
  int _page = 0;
  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: CurvedNavigationBar(
        gradient: LinearGradient(
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
          colors: [Color(0xFF00E6FF), Color(0xFFAE00E9)],
          transform: GradientRotation(85.84 * math.pi / 180),
        ),
        buttonGradient: LinearGradient(
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
          colors: [Color(0xFF00E6FF), Color(0xFFAE00E9)],
          transform: GradientRotation(85.84 * math.pi / 180),
        ),
          key: _bottomNavigationKey,
          items: [
            CurvedNavigationBarItem(
              child: Icon(Icons.home_outlined),
              label: 'Home',
            ),
            CurvedNavigationBarItem(
              child: Icon(Icons.search),
              label: 'Search',
            ),
            CurvedNavigationBarItem(
              child: Icon(Icons.chat_bubble_outline),
              label: 'Chat',
            ),
            CurvedNavigationBarItem(
              child: Icon(Icons.newspaper),
              label: 'Feed',
            ),
            CurvedNavigationBarItem(
              child: Icon(Icons.perm_identity),
              label: 'Personal',
            ),
          ],
          onTap: (index) {
            setState(() {
              _page = index;
            });
          },
        ),
        body: Container(
          color: Colors.blueAccent,
          child: Center(
            child: Column(
              children: <Widget>[
                Text(_page.toString(), textScaler: TextScaler.linear(10.0)),
                ElevatedButton(
                  child: Text('Go To Page of index 1'),
                  onPressed: () {
                    final CurvedNavigationBarState? navBarState =
                        _bottomNavigationKey.currentState;
                    navBarState?.setPage(1);
                  },
                )
              ],
            ),
          ),
        ),
    );
  }
```

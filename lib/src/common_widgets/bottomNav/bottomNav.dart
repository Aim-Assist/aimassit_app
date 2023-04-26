import 'package:charts_flutter/flutter.dart';
import 'package:flutter/material.dart';
import 'package:loginsys/src/common_widgets/BarChart/bar_chart.dart';
import 'package:loginsys/src/common_widgets/LineChart/line_Chart.dart';

class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _currentIndex = 0;
  bool _isMenuOpen = false;

  void _toggleMenu() {
    setState(() {
      _isMenuOpen = !_isMenuOpen;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: CircularNotchedRectangle(),
      notchMargin: 6.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.line_style),
            onPressed: () {
              setState(() {
                _currentIndex = 0;
              });
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LineChartWidget(userData: [],)),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.add),
            onPressed: _toggleMenu,
          ),
          IconButton(
            icon: Icon(Icons.bar_chart),
            onPressed: () {
              setState(() {
                _currentIndex = 1;
              });
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Barchart(userData: [],))
              );
            },
          ),
        ],
      ),
    );
  }
}

class MenuItems extends StatefulWidget {
  final Function navigateToLineChart;
  final Function navigateToBarChart;
  final Function navigateToMixChart;
  final Function toggleMenu;
  final bool isMenuOpen;

  MenuItems({
    required this.navigateToLineChart,
    required this.navigateToBarChart,
    required this.navigateToMixChart,
    required this.toggleMenu,
    required this.isMenuOpen,
  });

  @override
  _MenuItemsState createState() => _MenuItemsState();
}

class _MenuItemsState extends State<MenuItems>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );
    _animation = Tween<double>(begin: 0.0, end: 120.0).animate(_animationController);
  }

  void _toggleMenu() {
    if (widget.isMenuOpen) {
      _animationController.reverse();
    } else {
      _animationController.forward();
    }
    widget.toggleMenu();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      height: widget.isMenuOpen ? _animation.value : 0.0,
      child: ListView(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.line_style),
            title: Text('Line Chart'),
            onTap: (){LineChartWidget(userData: [],);},
          ),
          ListTile(
            leading: Icon(Icons.bar_chart),
            title: Text('Bar Chart'),
            onTap: (){LineChartWidget(userData: [],);},
          ),
          ListTile(
            leading: Icon(Icons.show_chart),
            title: Text('Mixed Chart'),
            onTap: (){LineChartWidget(userData: [],);},
          ),
        ],
      ),
    );
  }
}

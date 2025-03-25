import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import '../solutions/mail_view_page.dart';
import '../topics/rounded_shadow.dart';
import '../topics/styles.dart';
import 'components/sprite_sheet.dart';
import 'demo_data.dart';
import 'list_model.dart';
import '../main.dart';
import 'particle_field.dart';
import 'particle_field_painter.dart';
import 'removed_swipe_item.dart';
import 'swipe_item.dart';

class ParticleSwipeDemo extends StatefulWidget {
  final List data;

  ParticleSwipeDemo() : data = DemoData().getData();

  @override
  State<StatefulWidget> createState() {
    return ParticleSwipeDemoState();
  }
}

class ParticleSwipeDemoState extends State<ParticleSwipeDemo> with SingleTickerProviderStateMixin {
  //static const double headerHeight = 80;
  GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();
  late ListModel _model;
  late SpriteSheet _spriteSheet;
  ParticleField _particleField = ParticleField();
  late Ticker _ticker = createTicker(_particleField.tick);

  @override
  void initState() {
    // Create the "sparkle" sprite sheet for the particles:
    _spriteSheet = SpriteSheet(
      imageProvider: AssetImage("images/circle_spritesheet.png", package: App.pkg),
      length: 15, // number of frames in the sprite sheet.
      frameWidth: 10,
      frameHeight: 10,
    );

    // This synchronizes the data with the animated list:
    _model = ListModel(
      initialItems: widget.data,
      listKey: _listKey, // ListModel uses this to look up the list its acting on.
      removedItemBuilder: (dynamic removedItem, BuildContext context, Animation<double> animation) =>
          RemovedSwipeItem(animation: animation),
    );
    _ticker.start();
    super.initState();
  }

  @override
  void dispose() {
    _ticker.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool isLandscape = MediaQuery.of(context).size.aspectRatio > 1;
    double headerHeight = MediaQuery.of(context).size.height * (isLandscape ? .25 : .2);
    // Draw the header and List UI with a ParticleFieldPainter layered over top:
    return Stack(children: <Widget>[
      _buildList(headerHeight),
      _buildTopBg(headerHeight),
      _buildTopContent(headerHeight),
      Positioned.fill(
          child: IgnorePointer(
        child: CustomPaint(painter: ParticleFieldPainter(field: _particleField, spriteSheet: _spriteSheet)),
      )),
    ]);
  }

  Widget _buildTopBg(double height) {
    return Container(
      alignment: Alignment.topCenter,
      height: height,
      child: RoundedShadow(
          topLeftRadius: 0,
          topRightRadius: 0,
          shadowColor: Color(0x0).withAlpha(65),
          child: Container(
            width: double.infinity,
            child: Image.asset(
              "images/Bg-Yellow.png",
              fit: BoxFit.cover,
              package: App.pkg,
            ),
          )),
    );
  }

  Widget _buildTopContent(double height) {
    return SafeArea(
      child: Align(
        alignment: Alignment.topCenter,
        child: Container(
          padding: EdgeInsets.all(height * .08),
          constraints: BoxConstraints(maxHeight: height),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text("Interview Questions", style: Styles.text(height * .13, Colors.white, true)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  // Icon(Icons.star, color: AppColors.redAccent, size: height * .2),
                  SizedBox(width: 8),
                  Text("150", style: Styles.text(height * .3, Colors.white, true)),
                ],
              ),
              Text("Your Points Balance", style: Styles.text(height * .1, Colors.white, false)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildList(double height) {
    return AnimatedList(
      padding: EdgeInsets.only(bottom: 40, top: height + 10),
      key: _listKey, // used by the ListModel to find this AnimatedList
      initialItemCount: _model.length,
      physics: ClampingScrollPhysics(),
      itemBuilder: (BuildContext context, int index, _) {
        var item = _model[index];
        return InkWell(
          onTap: (){

            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) =>  MailViewPage(id: 123,)),
            );
          },
          child: SwipeItem(
              data: item,
              isEven: index.isEven,
              onSwipe: (key, {required action}) => _performSwipeAction(item, key, action)),
        );
      },
    );
  }

  void _performSwipeAction(Email data, GlobalKey key, SwipeAction action) {
    // Get item's render box, and use it to calculate the position for the particle effect:
    final box = key.currentContext?.findRenderObject() as RenderBox?;
    if (box != null) {
      Offset position = box.localToGlobal(Offset.zero, ancestor: context.findRenderObject());
      double x = position.dx;
      double y = position.dy;
      double w = box.size.width;

      if (action == SwipeAction.remove) {
        // Delay the start of the effect a little bit, so the item is mostly closed before it begins.
        Future.delayed(Duration(milliseconds: 100)).then((_) => _particleField.lineExplosion(x, y, w));

        // Remove the item (using the ItemModel to sync everything), and redraw the UI (to update count):
        setState(() {
          _model.removeAt(_model.indexOf(data), duration: Duration(milliseconds: 200));
          widget.data.remove(data);
        });
      }
      if (action == SwipeAction.favorite) {
        data.toggleFavorite();
        if (data.isFavorite) {
          _particleField.pointExplosion(x + 60, y + 46, 100);
        }
      }
    }
  }
}

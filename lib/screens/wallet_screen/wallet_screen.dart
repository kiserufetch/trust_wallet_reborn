import 'package:flutter/material.dart';
import 'package:stylish_bottom_bar/stylish_bottom_bar.dart';
import 'package:trust_wallet_reborn/models/token_enum.dart';
import 'package:trust_wallet_reborn/uikit/buttons/ui_fab.dart';
import 'package:trust_wallet_reborn/uikit/ui_appbar.dart';
import 'package:trust_wallet_reborn/uikit/ui_theme.dart';

class WalletScreen extends StatefulWidget {
  final Token token;

  const WalletScreen({super.key, required this.token});

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UITheme.background,
      appBar: UIAppBar(
        title: 'Основной кошелек',
        centerTitle: true,
        actionIcons: [Icons.search_off_rounded],
        leadingIcons: [Icons.search_off_rounded, Icons.search_off_rounded],
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Divider(thickness: 0, color: UITheme.iconsGrey),
          StylishBottomBar(
            elevation: 0,

            backgroundColor: UITheme.background,
            items: [
              _buildBarItem(Icons.home_rounded, 'Главная'),
              _buildBarItem(Icons.trending_up_rounded, 'Популярные'),
              _buildBarItem(Icons.compare_arrows_rounded, 'Обмен'),
              _buildBarItem(Icons.attach_money_rounded, 'Заработок'),
              _buildBarItem(Icons.run_circle, 'Подробнее'),
            ],
            option: AnimatedBarOptions(padding: EdgeInsets.all(0)),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 32.0),
          Text('8, 73\$', style: TextStyle(color: UITheme.textGrey, fontSize: 40.0, fontWeight: FontWeight.bold)),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.arrow_downward, color: Colors.red, size: 16),
              SizedBox(width: 4),
              Text('0,03\$ (-0,45%)', style: TextStyle(color: Colors.red)),
            ],
          ),
          SizedBox(height: 32.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _BoxButton(icon: Icons.arrow_upward_rounded, title: 'Отправить'),
              SizedBox(width: 8.0),
              _BoxButton(icon: Icons.copy_rounded, title: 'Получить'),
              SizedBox(width: 8.0),
              _BoxButton.green(icon: Icons.auto_fix_high, title: 'Покупка'),
              SizedBox(width: 8.0),
              _BoxButton(icon: Icons.balance_rounded, title: 'Продажа'),
            ],
          ),
          SizedBox(height: 16.0),
          _Actions(),
          SizedBox(height: 16.0),
          _Tabs(),
          SizedBox(height: 16.0),
          _TokenRow(),
          SizedBox(height: 32.0),
          UIFAB.text('Управлять криптовалютами', onTap: () {}),
        ],
      ),
    );
  }
}

BottomBarItem _buildBarItem(IconData icon, String title) {
  return BottomBarItem(
    icon: Icon(icon),
    title: Text(title, style: TextStyle(fontSize: 12)),
    selectedColor: UITheme.buttonGreen,
    unSelectedColor: UITheme.textDarkGrey,
  );
}

class _TokenRow extends StatelessWidget {
  const _TokenRow();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(99.0),
            child: SizedBox(height: 38.0, width: 38.0, child: Image.asset(Token.xrp.iconPath)),
          ),
          SizedBox(width: 16.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text('XRP', style: TextStyle(color: UITheme.textGrey, fontSize: 16.0, fontWeight: FontWeight.bold)),
                  SizedBox(width: 4),
                  Container(
                    decoration: BoxDecoration(color: UITheme.buttonGrey, borderRadius: BorderRadius.circular(16.0)),
                    padding: EdgeInsets.symmetric(vertical: 1, horizontal: 8),
                    child: Text('XRP', style: TextStyle(color: UITheme.textGrey, fontSize: 10.0, fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
              Row(
                children: [
                  Text('2,20 \$', style: TextStyle(color: UITheme.textDarkGrey, fontSize: 14.0)),
                  SizedBox(width: 4),
                  Text('-0,45%', style: TextStyle(color: Colors.red, fontSize: 14.0)),
                ],
              ),
            ],
          ),
          Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text('3,960001', style: TextStyle(color: UITheme.textGrey, fontSize: 16.0, fontWeight: FontWeight.bold)),
              Text('8,73 \$', style: TextStyle(color: UITheme.textDarkGrey, fontSize: 14.0)),
            ],
          ),
        ],
      ),
    );
  }
}

class _Tabs extends StatelessWidget {
  const _Tabs();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 32.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: Text('Криптовалюта', style: TextStyle(color: UITheme.textGrey, fontSize: 16.0, fontWeight: FontWeight.bold)),
                  ),
                  Container(
                    height: 2.0,
                    width: 100.0,
                    decoration: BoxDecoration(
                      color: UITheme.buttonGreen,
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(2.0), topRight: Radius.circular(2.0)),
                    ),
                  ),
                ],
              ),
              SizedBox(width: 46.0),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Text('NFT', style: TextStyle(color: UITheme.textDarkGrey, fontSize: 16.0, fontWeight: FontWeight.bold)),
              ),
            ],
          ),
          Icon(Icons.settings, color: UITheme.pinBorder),
        ],
      ),
    );
  }
}

class _Actions extends StatelessWidget {
  const _Actions();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: UITheme.buttonGrey,
                  border: Border.all(width: 1, color: Colors.purpleAccent),
                  borderRadius: BorderRadius.circular(16.0),
                ),
                child: Row(
                  children: [
                    Padding(padding: const EdgeInsets.all(16.0), child: FlutterLogo(size: 64)),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Stablecoin Earn is here. Earn on your stablecoins in-app', style: TextStyle(color: UITheme.textGrey)),
                          SizedBox(height: 8.0),
                          Text('Get started', style: TextStyle(color: UITheme.buttonGreen)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 4.0),
                  decoration: BoxDecoration(
                    color: Colors.purpleAccent,
                    border: Border.all(width: 1, color: Colors.purpleAccent),
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(16.0), bottomRight: Radius.circular(16.0)),
                  ),
                  child: Icon(Icons.fire_extinguisher_rounded),
                ),
              ),
              Align(
                alignment: Alignment.topRight,
                child: Padding(padding: const EdgeInsets.all(8.0), child: Icon(Icons.close_rounded, color: UITheme.pinBorder)),
              ),
            ],
          ),
          SizedBox(height: 16.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 4.0,
                width: 16.0,
                decoration: BoxDecoration(color: UITheme.textGrey, borderRadius: BorderRadius.circular(2.0)),
              ),
              SizedBox(width: 8.0),
              Container(
                height: 4.0,
                width: 4.0,
                decoration: BoxDecoration(color: UITheme.pinBorder, borderRadius: BorderRadius.circular(2.0)),
              ),
              SizedBox(width: 8.0),
              Container(
                height: 4.0,
                width: 4.0,
                decoration: BoxDecoration(color: UITheme.pinBorder, borderRadius: BorderRadius.circular(2.0)),
              ),
              SizedBox(width: 8.0),
              Container(
                height: 4.0,
                width: 4.0,
                decoration: BoxDecoration(color: UITheme.pinBorder, borderRadius: BorderRadius.circular(2.0)),
              ),
              SizedBox(width: 8.0),
              Container(
                height: 4.0,
                width: 4.0,
                decoration: BoxDecoration(color: UITheme.pinBorder, borderRadius: BorderRadius.circular(2.0)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _BoxButton extends StatelessWidget {
  final IconData icon;
  final String title;

  final bool _isGreen;

  const _BoxButton({required this.icon, required this.title}) : _isGreen = false;
  const _BoxButton.green({required this.icon, required this.title}) : _isGreen = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(color: _isGreen ? UITheme.buttonGreen : UITheme.buttonGrey, borderRadius: BorderRadius.circular(16.0)),
          padding: EdgeInsets.all(16.0),
          child: Icon(icon, color: _isGreen ? UITheme.background : UITheme.textGrey),
        ),
        SizedBox(height: 8.0),
        Text(title, style: TextStyle(color: UITheme.textGrey)),
      ],
    );
  }
}

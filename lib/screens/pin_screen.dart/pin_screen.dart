import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:pin_plus_keyboard/package/controllers/pin_input_controller.dart';
import 'package:pin_plus_keyboard/package/pin_plus_keyboard_package.dart';
import 'package:pinput/pinput.dart';
import 'package:trust_wallet_reborn/screens/new_wallet_screen/new_wallet_screen.dart';
import 'package:trust_wallet_reborn/screens/pin_screen.dart/bloc/pin_screen_bloc.dart';
import 'package:trust_wallet_reborn/uikit/buttons/ui_fab.dart';
import 'package:trust_wallet_reborn/uikit/ui_theme.dart';

class PinScreen extends StatefulWidget {
  const PinScreen({super.key});

  @override
  State<PinScreen> createState() => _PinScreenState();
}

class _PinScreenState extends State<PinScreen> {
  late final PinInputController controller;
  late final TextEditingController fieldController;
  late final PinScreenBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = GetIt.I.get<PinScreenBloc>();
    controller = PinInputController(length: 6);
    fieldController = TextEditingController();
    controller.addListener(() {
      fieldController.setText(controller.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UITheme.background,
      body: SafeArea(
        child: BlocConsumer<PinScreenBloc, PinScreenState>(
          bloc: bloc,
          listener: (context, state) async {
            if (state is ShowBiometryDialogState) {
              await showDialog(
                context: context,
                builder: (context) {
                  return _BiometryDialog(
                    onTap: () {
                      bloc.add(NavigateToSelectWallet());
                    },
                  );
                },
              );
            }
            if (state is NavigateToSelectWalletState) {
              Navigator.of(context).pop();
              Navigator.of(context).pop();
              await Future.delayed(Duration(milliseconds: 200));
              Navigator.of(context).push(MaterialPageRoute<void>(builder: (BuildContext context) => const NewWalletScreen()));
            }
          },
          builder: (context, state) {
            final headerLabel = switch (state.stage) {
              PinStage.initial => 'Создайте пароль',
              PinStage.repeat => 'Подтвердите пароль',
              PinStage.submitted => 'Подтвердите пароль',
            };

            final contentLabel = switch (state.stage) {
              PinStage.initial => 'Введите пароль. Запомните его. Пароль необходим для разблокировки кошелька.',
              PinStage.repeat => 'Введите пароль еще раз. Запомните его. Пароль необходим для разблокировки кошелька.',
              PinStage.submitted => 'Введите пароль еще раз. Запомните его. Пароль необходим для разблокировки кошелька.',
            };

            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 164.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(headerLabel, style: TextStyle(color: UITheme.textGrey)),
                        SizedBox(height: 32.0),
                        Pinput(
                          onCompleted: (_) {
                            if (state.stage == PinStage.initial) {
                              controller.changeText('');
                              fieldController.clear();
                              bloc.add(NextStage());
                            } else {
                              bloc.add(ShowBiometryDialog());
                            }
                          },

                          controller: fieldController,
                          separatorBuilder: (index) => SizedBox(width: 16.0),
                          obscureText: true,
                          readOnly: true,
                          showCursor: false,
                          obscuringWidget: Container(
                            height: 12.0,
                            width: 12.0,
                            decoration: BoxDecoration(
                              color: state.stage == PinStage.submitted ? UITheme.buttonGreen : UITheme.textGrey,
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          length: 6,
                          defaultPinTheme: PinTheme(
                            width: 45,
                            height: 50,
                            textStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                            decoration: BoxDecoration(
                              border: Border.all(color: state.stage == PinStage.submitted ? UITheme.buttonGreen : UITheme.pinBorder),
                              borderRadius: BorderRadius.circular(4.0),
                            ),
                          ),
                        ),
                        SizedBox(height: 32.0),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Text(contentLabel, style: TextStyle(color: UITheme.textDarkGrey), textAlign: TextAlign.center),
                        ),
                      ],
                    ),
                  ),
                ),
                Flexible(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [Expanded(child: _Keyboard(spacing: 0, controller: fieldController))],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class _Keyboard extends StatefulWidget {
  final TextEditingController controller;
  final double spacing;

  const _Keyboard({this.spacing = 8.0, required this.controller});

  @override
  State<_Keyboard> createState() => _KeyboardState();
}

class _KeyboardState extends State<_Keyboard> {
  void updateText(String value) {
    widget.controller.setText(widget.controller.text += value);
    setState(() {});
  }

  void removeLast() {
    if (widget.controller.text.isEmpty) return;
    widget.controller.setText(widget.controller.text.substring(0, widget.controller.text.length - 1));
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _KeyboardKey('1', onTap: () => updateText('1')),
              _KeyboardKey('2', onTap: () => updateText('2')),
              _KeyboardKey('3', onTap: () => updateText('3')),
            ],
          ),
          SizedBox(height: 16.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _KeyboardKey('4', onTap: () => updateText('4')),
              _KeyboardKey('5', onTap: () => updateText('5')),
              _KeyboardKey('6', onTap: () => updateText('6')),
            ],
          ),
          SizedBox(height: 16.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _KeyboardKey('7', onTap: () => updateText('7')),
              _KeyboardKey('8', onTap: () => updateText('8')),
              _KeyboardKey('9', onTap: () => updateText('9')),
            ],
          ),
          SizedBox(height: 16.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _KeyboardKey(
                '-',
                child: Icon(Icons.fingerprint_rounded, size: 48, color: Color.fromARGB(255, 104, 108, 112)),
                onTap: () => updateText('1'),
              ),
              _KeyboardKey('0', onTap: () => updateText('0')),
              _KeyboardKey(
                '-',
                child: Icon(
                  Icons.backspace_rounded,
                  size: 32,
                  color: widget.controller.text.isEmpty ? const Color.fromARGB(255, 104, 108, 112) : const Color(0xffcac4d0),
                ),
                onTap: () => removeLast(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _KeyboardKey extends StatelessWidget {
  final String value;
  final Widget? child;
  final VoidCallback onTap;
  const _KeyboardKey(this.value, {this.child, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onTap,
      icon: SizedBox(
        height: 48.0,
        width: 48.0,

        child: Center(child: child ?? Text(value, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 30.0))),
      ),
    );
  }
}

class _BiometryDialog extends StatelessWidget {
  final VoidCallback onTap;
  const _BiometryDialog({required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Dialog.fullscreen(
      backgroundColor: Colors.black45,
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Card(
              color: UITheme.dialogBg,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(64.0)),
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(padding: const EdgeInsets.all(32.0), child: FlutterLogo(size: 64.0)),
                    SizedBox(height: 16.0),
                    Text(
                      'Вход с использованием биометрии',
                      style: TextStyle(color: UITheme.textGrey, fontSize: 18, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 16.0),
                    Text(
                      'Отсканируйте отпечаток пальца или лицо, чтобы получить безопасный и удобный доступ к своей учетной записи.',
                      style: TextStyle(color: UITheme.textDarkGrey),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 32.0),
                    Row(
                      children: [
                        Expanded(child: UIFAB.primaryDark('Отклонить', onTap: onTap)),
                        SizedBox(width: 16.0),
                        Expanded(child: UIFAB.primary('Подтвердит', onTap: onTap)),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

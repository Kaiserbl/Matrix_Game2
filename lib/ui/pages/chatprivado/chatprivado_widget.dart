import 'package:Matrix_Game2/data/models/message.dart';
import 'package:Matrix_Game2/domain/controller/auth_controller.dart';
import 'package:Matrix_Game2/domain/controller/chat_controller.dart';
import 'package:get/get.dart';
import 'package:Matrix_Game2/domain/controller/image_controller.dart';
import 'package:loggy/loggy.dart';
import 'package:flutter/material.dart';

class ChatprivadoWidget extends StatefulWidget {
  const ChatprivadoWidget({Key? key}) : super(key: key);

  @override
  _ChatprivadoWidgetState createState() => _ChatprivadoWidgetState();
}

class _ChatprivadoWidgetState extends State<ChatprivadoWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  late TextEditingController _controller;
  late ScrollController _scrollController;
  ChatController chatController = Get.find();
  AuthenticationController authenticationController = Get.find();

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    _scrollController = ScrollController();
    chatController.start();
  }

  void dispose() {
    _controller.dispose();
    _scrollController.dispose();
    chatController.stop();
    super.dispose();
  }

  Widget _item(Message element, int posicion, String uid) {
    logInfo('Current user? -> ${uid == element.user} msg -> ${element.text}');
    return Card(
      margin: EdgeInsets.all(4.0),
      color: uid == element.user ? Colors.purple[50] : Colors.grey[300],
      child: ListTile(
        onTap: () => chatController.updateMsg(element),
        onLongPress: () => chatController.deleteMsg(element, posicion),
        title: Text(
          element.text,
          textAlign: uid == element.user ? TextAlign.right : TextAlign.left,
        ),
      ),
    );
  }

  Widget _list() {
    String uid = authenticationController.getUid();
    print('Current user $uid');
    return GetX<ChatController>(builder: (controller) {
      WidgetsBinding.instance!.addPostFrameCallback((_) => _scrollToEnd());
      return ListView.builder(
        itemCount: chatController.messages.length,
        controller: _scrollController,
        itemBuilder: (context, index) {
          var element = chatController.messages[index];
          return _item(element, index, uid);
        },
      );
    });
  }

  Future<void> _sendMsg(String text) async {
    logInfo("Calling _sendMsg with $text");
    await chatController.sendMsg(text);
  }

  _scrollToEnd() async {
    _scrollController.animateTo(_scrollController.position.maxScrollExtent,
        duration: Duration(milliseconds: 200), curve: Curves.easeInOut);
  }

  Widget build(BuildContext context) {
    WidgetsBinding.instance!.addPostFrameCallback((_) => _scrollToEnd());
    Image_Control image = Get.find();

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0xFFF5F5F5),
      body: SafeArea(
        child: Stack(
          children: [
            Align(
              alignment: AlignmentDirectional(0, 0),
              child: Obx(
                () => Image.asset(
                  image.imagen,
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Align(
              alignment: AlignmentDirectional(0, -0.90),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 665),
                child: Image.asset(
                  'assets/images/cabezal.png',
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Align(
              alignment: AlignmentDirectional(-0.8, -1),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(170, 15, 0, 0),
                child: Image.asset(
                  'assets/images/Logo_2.png',
                  width: 150,
                  height: 60,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Align(
              alignment: AlignmentDirectional(-0.8, -1),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(40, 7, 0, 0),
                child: IconButton(
                  icon: Image.asset('assets/images/flecha_nueva.png'),
                  iconSize: 50,
                  onPressed: () {
                    Get.back();
                  },
                ),
              ),
            ),
            Align(
              alignment: AlignmentDirectional(0, 0),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 70, 0, 10),
                child: Container(
                    width: 360,
                    height: 700,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(children: [
                      Expanded(flex: 4, child: _list()),
                      Row(
                        children: [
                          Expanded(
                            flex: 3,
                            child: Container(
                              child: TextField(
                                key: const Key('MsgTextField'),
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Your message',
                                ),
                                onSubmitted: (value) {
                                  _sendMsg(_controller.text);
                                  _controller.clear();
                                },
                                controller: _controller,
                              ),
                            ),
                          ),
                          IconButton(
                            icon: Image.asset('assets/images/BTN_enviar.png'),
                            iconSize: 35,
                            onPressed: () {
                              _sendMsg(_controller.text);
                              _controller.clear();
                            },
                          )
                        ],
                      ),
                    ])),
              ),
            )
          ],
        ),
      ),
    );
  }
}

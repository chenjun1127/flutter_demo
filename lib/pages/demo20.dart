import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_demo/events/CustomEvent.dart';
import 'package:flutter_demo/utils/EventBusUtil.dart';

class Demo20 extends StatefulWidget {
  const Demo20({Key key}) : super(key: key);

  @override
  _Demo20State createState() => _Demo20State();
}

class _Demo20State extends State<Demo20> {
  TextEditingController _userNameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  //焦点
  FocusNode _focusNodeUserName = new FocusNode();
  FocusNode _focusNodePassWord = new FocusNode();

  GlobalKey _formKey = new GlobalKey<FormState>();
  var _nameAutoFocus = true;
  var _password = ''; //用户名
  var _username = ''; //密码
  var _isShowPwd = false; //是否显示密码
  var _isShowClear = false; //是否显示输入框尾部的清除按钮

  @override
  void initState() {
    super.initState();
    _focusNodeUserName.addListener(_focusNodeListener);
    _focusNodePassWord.addListener(_focusNodeListener);
    _userNameController.addListener(() {
      print(_userNameController.text);
      setState(() {
        _isShowClear = _userNameController.text.length > 0 ? true : false;
      });
    });
  }

  Future<Null> _focusNodeListener() async {
    if (_focusNodeUserName.hasFocus) {
      print("用户名框获取焦点");
      // 取消密码框的焦点状态
      _focusNodePassWord.unfocus();
    }
    if (_focusNodePassWord.hasFocus) {
      print("密码框获取焦点");
      // 取消用户名框焦点状态
      _focusNodeUserName.unfocus();
    }
  }

  @override
  void dispose() {
    _userNameController.dispose();
    _focusNodeUserName.removeListener(_focusNodeListener);
    _focusNodePassWord.removeListener(_focusNodeListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Demo20 page"),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                autofocus: _nameAutoFocus,
                controller: _userNameController,
                focusNode: _focusNodeUserName,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.person),
                  hintText: "请输入用户名",
                  suffixIcon: _isShowClear
                      ? IconButton(
                          icon: Icon(Icons.clear),
                          onPressed: () {
                            _userNameController.clear();
                            _passwordController.clear();
                          })
                      : null,
                ),
                onSaved: (String value) => _username = value,
                //验证用户名
                validator: validateUserName,
              ),
              TextFormField(
                controller: _passwordController,
                focusNode: _focusNodePassWord,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.lock),
                  hintText: "请输入密码",
                  suffixIcon: IconButton(
                      icon: Icon(_isShowPwd ? Icons.visibility : Icons.visibility_off),
                      onPressed: () => setState(() => _isShowPwd = !_isShowPwd)),
                ),
                onSaved: (String value) => _password = value,
                obscureText: !_isShowPwd,
                validator: validatePassWord,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 25),
                child: ConstrainedBox(
                  constraints: BoxConstraints.expand(height: 55.0),
                  child: ElevatedButton(
                    // color: Theme.of(context).primaryColor,
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.blue),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(borderRadius: BorderRadius.circular(35.0)),
                        )),
                    onPressed: _onLogin,
                    child: Text("登录"),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onLogin() {
    // 点击登录按钮，解除焦点，回收键盘
    _focusNodePassWord.unfocus();
    _focusNodeUserName.unfocus();
    setState(() {
      _nameAutoFocus = false;
    });
    var formState = (_formKey.currentState as FormState);
    if (formState.validate()) {
      //只有输入通过验证，才会执行这里
      formState.save();
      print("$_username + $_password");
      eventBus.emit(CustomEvent(1, "登录成功"));
      Navigator.pushNamed(context, "eventBusNews");
    }
  }

  /*
   * @Description 用户名验证
   * @Author chenjun
   * @Date 2021/6/3
   * @Param
   * @Return
   */
  String validateUserName(value) {
    RegExp exp = RegExp(r'^[a-zA-Z0-9_-]{4,16}$');
    if (value.isEmpty) {
      return '用户名不能为空!';
    } else if (!exp.hasMatch(value)) {
      return '请输入4到16位（字母，数字，下划线，减号）用户名！';
    }
    return null;
  }

  /*
   * @Description 密码验证
   * @Author chenjun
   * @Date 2021/6/3
   * @Param
   * @Return
   */
  String validatePassWord(value) {
    RegExp exp = RegExp(r'^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{6,20}$');
    if (value.isEmpty) {
      return '密码不能为空';
    } else if (!exp.hasMatch(value)) {
      return '密码至少包含数字和英文，长度6-20!';
    }
    return null;
  }
}

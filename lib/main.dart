import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:photo_view/photo_view.dart';
import 'package:untitled2/common_extended_imageview.dart';
import 'package:untitled2/common_resize_image_view.dart';
import 'package:untitled2/compress_utility.dart';

import 'common_image_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  Uint8List? _resizedBuf;
  static const _imagePaths = [
    'https://ff814643402182ce68d5bad95968d1c5e7fddca9745f2971db70c37-apidata.googleusercontent.com/download/storage/v1/b/powrsoft.appspot.com/o/reports%2FnMQXF9BL-D%2F2023%2F3%2F6df61633-1c6d-4b10-8f1f-5f81f2812c03%2Fimages%2Fimg_1678976994565.png?jk=AahUMluKszc5qQWxe1mMgtuk79Hhtid0XuG3owpxiDhpvD6MB2vXhA-K5XcTzNB9kr4OnfCv2XDPp2Emxm1si-H_Z_Q_8LCqVhSVn20qmI4zlbGLFTtJudXZs50IQX3beeyaCKHFzO7N61ZJIheMtSYlzcMlRgLova2Q0M-mQdIGCWCT7Ssfw41cgm4vdqKDK1Sig2jg_SqoBtPwxe2nbg7DuLXdXQ6lszJ6XLvNMUKke-UUc0-WREFrLn0VhP8RlauMpgSJSM4asMXoJ9Hb2HZXO3qlHMPq_lABxYia0vrYGP6E5i9QBiYbdVc4stEVXYuhiVxrahNLUxTmNrcQTbPS_Lu0UoCBMaGHCCprRpOpgh4JZN0yamMpXeZiF_XYfPjjM1onkckb0z2wHLmOmJd5pOg7aKxOhpJdCtdmQ14TChmpjzZHEmBIYt2E0uC-KTx8xPr_OX6BrDBta34EHoN6Rum4YY7RlNLUL00QdUPyHDqAs5w287DhlMQ7X713ew3WMquvJib200biYQPgk9GCSO9IhfPTaR8_NW5H0nln2z-ctNbIAU1CajbCbRdPspa263eG9L0rB4w21EQZedliwxnQMOJbVr4VMpn-Yn17X459wjy8A-rWAJ4Aw-dKS2drDvxl439_C7kwyUyXmbk6K_OS0EVGCoCdPPWj9aprLMnM4IkTfkk7BpnvU0PdAV4VZXS6564QrGC7cUBKzGkWczvOrD6XEMCX_DBkOSIX7tcVeGF2jWKaFho7lMxg60SF2UtQUFo9p6Dk0bGeJD5EyOQPc2pWHsWORIQO_qMNOu-gm_4bEVDgXVi-Lw6PotIdD_gvislrspSo6hdvKwEf620F2TBb486e7sflRp8n1owANH-ZImOYJzTCWRHdAdD6zrWWnN-pn0zkDPkmf-Q9cJ2yKnvnzzJW8Hw2gfEGBng84295jmSVuSnOfWYFWs0bb9qmbDkJrK0bMybDhJ9yWzi82kL0RP2ldS9Z-nt7iFtACsFFE4BcFgNMFnWpD-rT-nuGy5K0g5JIW1Oo0B8hHUzEb9m_14_JXo5Niz75o84QQwKbPIUYieao1ArF1uSif-Nv2kI4s8oSsmC9-cPa9m49s1eQuJlPyqgCZLraehyHg9PQMc6sqYA-sbDwkBWM8Qa6hkDiBEOJmRFjxdiDi_b1KzOze8rQPhMRWMXIZO7Ir6mE9a6jQnHacHq2cSCshYhYjCQh1q__QZm9I7DIcMxzLMJ5F_SGiUcPMFJd9GUUS9rQpQ4w0lAfGGN-IQtd5rAbfpIsi52QhUhbhdlzbz33&isca=1',
    'https://fffde283ee3006515ff1e55a60979592d333750374491de92043f69-apidata.googleusercontent.com/download/storage/v1/b/powrsoft.appspot.com/o/reports%2FnMQXF9BL-D%2F2023%2F3%2F6df61633-1c6d-4b10-8f1f-5f81f2812c03%2Fimages%2Fimg_1678974663913.png?jk=AahUMluVQliTevgHANj1-6fEV_cGpAHbnEjBcXIZQblnIhf97IP1craCKzXuK2YAZG9CY7C6ru6PmbF7THmj5_8Yih7NiU_GjqbDk8eAjgQl5hAIWsUsGwhAF-yJwBg9vuKn3Scv-Lvad4RUdlqnaGhbJd4fLf8CbhZ3JWDjB5PDoOMWlg9iU6Zmjmtc_HeAOmpYtEd96h01HGCl5quBIjXbjXzzZF0NuxRa13VGDjjmim_PcJGNrchg-WW-0RfT_GuiKH8ZJF7DN33ma2HQJP3HntRzNY9oORYr_na3g_5yNX0lKqrwkGnaSNRV2KSddfNL7sl2-HpxnzzHsHjysaOaT5kGJOOq0a4ti5vNBY1rs41W769OpPqoqYRxoNdTQGdkIRiBxgu5Fr7HT5jVVT0IiwgapW_BJe7LOM7g4ZykjNX6NkZLsF1W11oBjQA51EMUs53Gjkyc4Wo58BjDWM_d2yXMJz1BOhtPafYSh0DukWWbfk0xCw1sCVMONoG9IuLSgppSApCDzY27zADgzaOtMJACOzaYpec_88GmnXVut0roqHiSs62GhGXMGwqYO_FoJfFMLKaSTcTySUmZwEbiSxC7JTQCLrgLqRA5fnahNCaVGwlETxeo3n865FE75kbfbNlRXHxPCuQmpUfVYeKfgjG6pKUqlTLRuUOmIeXqmSZlkVJQvlQYXkw9XVWD_pUb-jXaR2l4UaNQf27VF1VPfvOKEnaJrG2MRJvGqCqHswr5g36oN0qmevYoIotEPnkUbxB7rWFKgP9bMi5Io3YNVGGbkPXEQuppwQEsWbrvfzBEGC5cKi_i8z_bcHEtQ5eTtZoH0wpDJo-SLPKWOZoW6ENITnI94WhGxyD1eVz8zSRFO1BLzCx4nwa9pf3OxZY2L3yaKrOFxqTh3RJbcYg9haUGB0-IQ2N7dF5uiVurKaR_ezTj-19Fd3MPajzQa8FA9ehWqf5jzPYvk53tlAXL7kxIUR7-tmkKef3WszCBUndaFrUCw-qAkN0fBxBY-coblg-p01TJ47qSQYcATmJID9recoa_3YdYQFxeN9276tRZCcXp7dWgv3jZubR8OLuINEUY9Y8_wQUBOiGwnfKFjqZRyMW6btlTa2dkKeX0y0oxxw-r1OSeoXqsbHU70REETWXAttvCRa24wkp0xiq0kOcfBPDmBtOiNl_xfGdmeTbfhty5bLd4bDqSJq1xc01GVSmXdNlI1cZQKzS3829CZyAxx-bsgbYwoouQK1CcJcWEymo144ekYIwqOqq9VCAeu6lqpKeoWlfdWiW1gLeDgSI8&isca=1'
  ];
  int _index = 0;

  void _incrementCounter() {
    setState(() {
      _index ++;

      if (_index > 1) {
        _index = 0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Container(
          child: Column(
            children: [
              Expanded(
                child: PhotoView(
                  imageProvider: AssetImage('assets/test1.png'),
                )
              ),
              Expanded(
                  child: PhotoView(
                    imageProvider: AssetImage('assets/test2.png'),
                  )
              ),
              Expanded(
                child: CommonExtendedImageView(
                  imgUrl: _imagePaths[_index],
                ),
              ),
            ],
          ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

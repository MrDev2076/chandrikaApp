import 'package:flutter/material.dart';
import '../widgets/pet_card.dart';
import 'package:pet_care_app/screens/login_page.dart'; // Replace with actual login page import

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Color _fabColor = Colors.blue; // Initial color of FABs
  bool _showFABs = true; // Whether to show FABs

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        backgroundColor: Colors.yellowAccent,
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LoginPage()),
              );
              // Navigate to login page
            },
          ),
          IconButton(
            icon: Icon(Icons.dashboard),
            onPressed: () {
              _openDashboardDrawer(context); // Open dashboard drawer
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                image: DecorationImage(
                 image: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSq7avBpWQil1KTKyugnG5T0Qmwyie-Z-sFPw&s'),
                  // image: NetworkImage(
                  //                     'data:image/webp;base64,UklGRtBFAABXRUJQVlA4IMRFAAAwcwGdASpFAkMBPkkijkUioiESST3QKASEsrbxhlXahKZeLVY3XgWQN80YofVLjWHG74D+D8QG09UNz//9Py5AHhX9Y3IP0XPP6796ClITcK7PnuzXjbsy9Z407j9qieG8OcibSo1G81/zpfYBCES0MnIbz15i5QJ+vTjUs4BOexFURdi/wC39vqP9+UpSAEryAr+E9L8elzOcxMPHQGlCXZfWz0BoJL7xQv2J9MYN7PpMQ2DIo/D3xtmuf+MtpWWrYDtVJVnJaMJkCKPS6VCcMN69B5F530IAOBUJk6xTLS7YhTCH6d+oia5n5wim1xMLe1lcEekd8bGIF/W1qmyotOgFL96GR329sgvtrTQbxUIDIk2mH8Cjker/X/P0yee7K4pwyqPmSxLHPOyH2iKl0ynrZpTUbUIhvi/FgOIyC/+/SF74erd9UpagsjVwbuVA4h0+mJ05dVpMy42Xc42cbO7D1KPzdtsHwdk3Kot0gxuVTVf6LcWcJVJOkEmiSMa3qYZjDIyNfJugajB2NvsMaVt7l2D5Zod1XL/K7g7UEpkvw97Pt/IZauwH3ABWqJQ4p/F0MjbDJILR2up29DQZ/1WrI8vI6XrIvf/8o07BGFOepEVcFs546iCAIjAwkODwe7qYbE1vmefi+2jxpTjCxryLLr6UFMIi7fZjajrfWKWUJrrZGQI+Pr7oC4GUoLwa+upaT9/T6LVnGFFbFXnmA4n1PWx1SZ+iLogA6wLhvbnyiwqGH72K7TDUN9uylXVL1KyM73G2aMLF/8k6jxoij5nXgpJt+Q4bNlN92zAmEmO+3HTVvk4VxxTlygCqNJH+hAmbj//VxHPjieIuzghL+C4Jjxa8WVHXtCCMR/WFPZ8bAEXFWhanJ2Sfmg4gHKT4cb1lYSuiKTQMB5G++Ermg12nO1LeBG3r4gH/Y1sqbNyn/Lh8iNQj4U4rzF8/FeTAk64qB9CfYDdECaoG22EGbD5zsDhPAPhQFaREZjKGMQUlaIzHqVti65aPy0GPP9+VKqtstyIo21yHZgRRq43dVXC/wgdsQLQcb4+NyA2dXeKqAc4kOu8odihSWGX7Oo1AnkWBbo6iYa2Sy/rP6M8SSZ3Z7REqvG/09qT+Az1AXTdS+GU71wQymH+o+7HWGJ2vz8EB7lnQ6FxksYx96VPbC/U2IrWm07scVUPy37HnZzhCcZH7XITMNN2atZa5C34qfMpRaQHarpcLdzMeCD8jRwWzzeaqq6bowzR6zY1CGS2vRkXhnJVy/GgWbFNsK29FGZ0bSU/+q926VbnYjJa24eInIyIYRiwxQKuzcHHfO9z4Fgs7Si+RvEI8fdIrf6DbE1v1EiDaw2ufEIiNa9EKkR12x/kAwMSYm6fozaX2PumWNUOCe9VdOdpQ3fA8zi6M7cDRN3oloCXQK0c4Sr2J6flh0aGmwEE24m94YxzZulDRW1ZT6sSfdI8ijKdZ7QSXbHSKDH75u+KSVLpF+uvKA5FTraSpZ8+hOsVcYbhRLoO4IyxGwNMC2THcxW1wXFKkhpyCpIaNA8LfRH0DFazzRusnUDyWqh5KFjSW14fhxZCei9lPMEb8yM+O5VG/SJu52IntPMhmfp4npnvvCiAz3R/Qk7LMz+t2ApnBbykRg/FHqGb9bZG6AU/AKKtSlpiIx7VzUsalFBw9VH5DFbFp3ARc9VK22F1cJy49TYhPY3neYFfzHfFJ0N4R7rLinugpEJ9vG7GAKXNsl0HEZSf1Lnj/f7oTtRk62I1Ww5bo71jipf+w4Zi8QJgugW39wfxkUE7QlcxeZRDFtO3z/6wS0JjSqw7b+cCdErFNWnZujGHnSa0epyvGeFWvPgcvhOv8fMDdrWgfTyYcAip1uwJOKwbkNyrfgyTTPuUTI7BXDRCrSkVDVsNEFGs1BDPAtInZNvmXLyq5LnNJeyMoC0VxvAArl9fR4upMC08gbluujtFvRPJxT7v3c3sCkdG7HiivKfpe1lwAqMnJBjlYMPCxuylMKXzDoyQPgLAh8wQwc2uxEYeY+3AzAXlx7aqRXWIV20uWoHtyhQNtxhZYh9Hbc51+cjSDaaM/KSFwBzYcmKoL38T2QhYhyySqfMPYlKV4TClBenDkLRPKAiTu6/E+BEE5+ZmoLjsC92Oc/Rf/UJOXdJ5uOQZadl5XrhQhWkfV+kx2tqw422ab8+PsK41mQl0e9XXhEE6N5TfP0X38RIgJLH0BqThwbLvY7gtN/DnP60m1OHqMbXOIbaaVj7HDdM8DeubghF358vInxKwJGN0NPKSLzy0x5MpqMWBkwZ8yyzc8KxUWWdFNooOpK0YcpxeqXvOQnKyFRjspwUtWLbkNwJAHjl4TBaukUdc++aZeJmeN10jOrjcE43ETcsiMLJJLOLAzaX6VVZ79PuYPs2kbjE47fVVzbX3gXYRhmVIG33p5AagoeiLJDjz939AHv04Y31KD2oDhyPT1PkjCQLzS6LnMsxhGHifXOv4O+nkn91AKFVl+Zp27lLcprwC79kCQRWxLIVB8ELCb2IUY7x3Gu7zmFzhDF5OI71wgynXkdm7kPXsjXN/ylGvmOX9YpS34xsDqwDUDkKyApHMvsk30StFQp5dkoV5t36u2FyS4hndqSxWcivHV/FTbiplW5DhNKWZ4ZowhM0NR3+qac5sADcPIB1IIhhpyztVNNq36EtTLyHCav7Py3q3bdkeNyfSt5CFSPkGPEc9KmWYiy/att8QpHD+QK28VByrs22ghtVUOBqw+PdjgBxXrC2oSX+ts5wFgh3+lL2I7k35rOA3zUS5e+Jgo3xq+7HFxHjy+HWpVIroq3yfZZsCcyDGM/raYV9xNx6QTerXj3SPNDxd811Iwqy8Nx1OPlj23r1LiTtm+xvNRJmPmPyXS8swqIXeH4RABIkCyjpaOBsbydOqQXpnw2n07PAyGLPVjCoM1a0zBkSxFCLiW8pVVgifgIVcB5+jjElzsTM3Az/imS8qLdSfN0cs3Y/I/91z12TFMgg/NEabkhX9H7V/aj1K+XhVFQNpZTS8OGgR51096hQQZ10R1HQ24HKPEwNRj1UBTRUXCwPo+peBWVUdZP/HgtRLHatMQTpU0r0tGqq1fBQG01qnv9LAV62WMeFkn9GurukZ944M0f0ACUpF8ukDPcogJq/iSmqxMZYuKGEA5aAf5C1kCpVPx9e4ZiPpV3vvGvPi8Eaqh+k0O1bUQPl5/bJO+7Ww0NygiPr3DH24CDzdPsv/zU68XHdU/q4RxtrLLg4sqm5Je0nLdwBbUrGmQfooNRxAhj3rHikU8M8g0bA7hCO0gPo9uGH77DxRX/u1/2G886D4J9D/kbFsUEx2mGRz4AkvwF1350nD0zw4ni7UIKKlnxr//vxy1XUX9e33gjGyvpkfob54DgsIRTKac8n9ZmJu/jRJunlZbnv3fDUSO3aLmHkD5o1epJfsdEzyDs7RvtybPnb/9XckVgqLDIItOwMan/Cw6r5uER+SAOJjm5S6sToQGuRiyNkTUpfwYrYVIfbxdUBNH1uL2JKblqn58zXExhlI5dAV8XLDMadViVnv4LND6LSrbkkUn5LEvKZ2B7PThTkeXYMLi1g++h/NM0lqe+/RlAkqquzz0Vsd1zRf+BfXjsFqDswmoo96Pf10PW/Hncl83MV2+H/0U7H5IfS9VpOpna4wr2lhmJsiEcyW9oyhztbcKQoaaYEdcXeCVmZ9Dmvzb9IQMX6rWMRL4RMo8J2OoMfIk2cwjOmvPIdxqQZt8Xxym/aWCi+cy88PwZVMQ7UbhJDEsm+Z2y8ykMw44LvjWtz+ueodu1hNtopvMm3xT7kjt/15YSs96R9rLsFXTij68ByeWqyJKVeMpmicoRTBttNKZ/t5Cmj71Wf3gSHcJUnQ/kfdQQ82PEE/MleCyegyD+kgJu4FGKu6u7jxlcYyyQVEKdrs3UzGgOURyvKm4cnv+4lF8gzypwAD+/FnVDKDgF7J/tiPr6a3h53+6u/sqm6RnscpzMuUyOFULmpgfA7Dggm8bGkfW6XnTx3qfeqyMFcEeoqpMRGI3yKHMSawMDuWXJQ9M5apUaTGmvpSS8hXNUSQcAMRLAsTpNcC5aTrpvxye3l4P+RKW8UU6iyplanns7wLXqdUgtmx/WFBJPoAc5JhOHjn4nOp+UdmX3AzdhaI0NMniRK05ydk/oWJbTNjv8O447cyWNkdakvVH+EGC4yQwxk+ItM2e7zbK5+LxoS32NmV1Poj5UkSsGMXxvKkjuQnD7cEN5qgqK+jMtJyMIOoTJFk4bdH0Ws4dUCa5Y4SOvXOoGjqjcoVDN4uyumLgXySgXv/vvery6Oi/rwT/DwYsjdjnhxJiefdge2GyPCVuWcpX2/am6tuQ7WRaX7o7ZRjaEL/ZuGqzlBdSXvIcn49nHEg2vktubVP++Ot/bQHwCNzEeGPk+N/EF8URSHYm4imeSShZkPSuLepznuBMih9affm4hVmJoqA/qHmS1PDtp6vzzLTRTEu1O5vybqKTd+uKgrxIsrYOYz6aTMcim/gRn0R9KOVOTA53WjkNSnHb/pz0KCgzzmwE61W02+V28pmwPO7ObugpjUpaaKowhrm13OGbRTcs4QbIweS/DphxKx02UawJfVOsozoErbpXTRMOfZ5+BWFrLtKyTfvKjVCvpFeUvPjifp+SZ2Og3De6s3s5ymkqhZMy1foCZ92tpLL94Uft/sxVbdQtE0+DJWfdRYHP5M+VqybCQNyX45IvZH6Em9DM0f7KGqMS+H6nLa5pevJS+kyG8zalamT5ng/CQ/I0A/ULHudYaDEvQqQ9mCN4sGDvHwRU14GVjZICkdoUNlAY2/yoP4CQqR0hSQiEBN0W70D2/V0yZGsRlUu5754HJ37a4zHW5rdaaDxTpRDoVZS7A4krEqUq/79deVMc9WCzr2WYZtIHSGu3cSoEy1XVHzpbpeApqnbCiO/J0xuerb4R50k5mpYcAko2kkXb+anoZ3vrOOuMEiXoTL7umJNtXdu6hvHajFwOsPwctw5/7+mLuJ2qIO8iXapz0/vPVI5ed47Gu/5ZHDAf1VjfESkI6Ia4+nanSaiuPOigQ83MBWaq8/u1Tj81kwdTygwf8/UAqJt2DmHx1S1dvKSQ02DrFCyZpL2pYGLjiUTGOWDhJc0O8BupEAleKWqYfeksi2pAp+KhEFeclzZwLKfef9bixzPNRUlhZps1z6bRO8V416hQ/T8QaRl7lvp+BZUJe52OnOublJ07gbjMhzS5f5fXSBz/eRmm+Hq8v5s5+iHGyljFM4PH3gc06Cvqw+8DfwXem3yRtu5rChmdcyHdOhf18LkCI4uJXSDJHl34ajVXGTAiEEi6Ed+mvP94Gyk9dVVONV7zg5G1YgAiavN3Q/aYACPtfuJGVcod60ApN0gCC35diKCZejGtEthIf1IXnX+Fw1wjekngHY7krijgkfpknkMAUNDOREyjbb1xzyMeRLaipGQWeAWj9zp5zx4NH6Tg1n/KgLQkMGBCsySx/7uk51G4++pCwVw3cdJyHZ8wp9RxiB04Ltv5cWy8R5C8UfrO+t53cOuVGu+/mur8f/7rt9CDRo9MmLG5q4g0R++QSjwsC1Cx9TBijDt/UtZGwEbHoyZ5wAUFOfA4j5vTZPr/NjKsQVO9tr2tjsdxmBqnk8YFXMsKSABbuuUBuBciNsM3wSnZfkog+c38dX2Ou3BitPy3jowOgDGKiTCEJh0WBkLa4CaiDw1JjO0bz0nunpnLw5PzYQx/O8CsI6qDc0wzgzIJKGI8T/8D8BrPDKvVH7EwGMAZ3iABH8t7KOA+aAVa6aOpUect3/wB2TFOJrojaBxXhc7QSsN35CaLMfVMD2sOm7CGmh56kHA4OkY1Ra5rz2k1ppBDc7eUcbX0mjPFypjcGNwcvb1oAM4YvguzQYAABWDCYDW9Pq7WaUL1AqWmuLbfvupNWyIKdF5cVN+hmQpek3CJzAralPcEjd8iAK/kK4/tkpYbQPXtIDlpjfeH/6VSht6g92uEiQ3NavQdFviKn/oXwLbVJl4OLdqc+XB5PIeEy5MVf0inQ5OteY8nVsFUYRRze9c/ZqphffNUmqx/22vpx0NPSWeFpfuY5ZTI7Ib7VS8KLWTlsR+ViUWLSp0pkX86T8Oq1sos0+dyjqZsLiRoJdCsW5hYEZziqXnlsx38adSojM0MIpJKsAd9kerDSkeb4SXe4EdvWjKM2ue+njudvVjD/4O3L4FoDFabiGJc1GRNf8LK0UQBgAAMALMSB8dXiLrDTNG2RwVfWG2aO6Dy8tsrmrcWODyRl3Q1UvxBN5Whw68QZOuAi0WLuueHIdbYKwDLMYIa4Vp0NC2JUGJM00EiI+1XZ/m1O/R7XqRqe8KWekeAPc3t5owma6TrCBq1/ZEgnxtQdhVoDT1MWZgtEk8O/wigHN9U03r677bPs6JQb6+pxNI5OLN4+djlnaffKRPc8m5qOUqQFCD4f3R/aQEdFLrFMAJZCLPAzZQUD4AB90R5tR8RyOxLqMdJTxxWLgHrM1Xpz3pDsXCwrSvARmG7yF8D55w+eckn8AuRp2kjmx6Y6PHYNGw3SMSHrVAmCdjwH/CLojtXTdizs+rhJEChwBAe7et32dkABkAfffmoULP1c3KXPF6wzbUMBRJ1+dqLy3Gus5io4bqKTBytvO5c6tEz/CIfOHGTeBJ07MbO0VHlxxFoT8FH7hu2N3OIOffsWj6lTq6h3Cx3LkKAtJuldLd/LWaVbq72vOdVmz8Pyez60ye1p75dbMAYGVOkDCGcH5yewJ/H+TaJJppZAjG+PceSGKpACXqKzCYjIgS63yfHpI1MA45LQEng2QoRyn/XNpWn4E2fzYXkLnU3WD5nOzoxiGgrrJZdazyrBK6D0MbNIX78APrVXnA/6HfZZ2MlYD/jhpjg2BTR10IM8k66TK6e96tvwdy7DJgXDFAlkklhW3PicmH+oBsNMWu+xMX5lqF0tDYxA2VqsEhvN6mLyOm26eFE8zjlgAM5ApVjO1AKHYgULaBZtks2ut2hX9MDa7zrwrCDtzIXz0gG6PqVaYWdgsDxHkBX/vf5m/hF0xM0LVIrzqYkBGKNzQItRlD7U4+YGnMqa/DXtcOJACfRbM4Mn1PrKkOPp0ETDTBJ27I2eTmWyVa0xeg/2DUo+WlGqm9X6C2bCwTHud5ignV4v+fIgQ8GFKCult/KX8vcFnFB4agaaaJSDrqh7jwzKbIDzzsZlW4R+PNnP/ce8l82wr5RppYv+QQ8Moe2eL6Tp575IFa5oJLnL/ft9kFvDriCQEL53RzZv3GAxX6uHv0FHOjHmghqVBCC8hnRaO8SyIj4uk5Lr7jwSFh2HBotCTy6BhHYoInr9ReY5wg5UcUGJxU64Oyyf6bACNyA4jsdPUUNqbqk6qn191cm9pzf9Pord52m9vkI8gQukkKzHt5tiggLngZWlGOhjepXHoCeul6IU9Po3eEXRQ3E3ROEi1+o4Qtgse1ATVhUIE6Mr4uAhF675/Dxnf/ffU+iObV5gFyvVzEjrNqQ7tRPOK+r0CGoZ0bX/mMe3oFAoh+RHFtY6b4ATeMJyEoWDGAGZPwG1IQKN7756AeqHbCn1YQB25F1fMxfAMeEQPNzKlmn4ACN9Lt7OAcl7z8vtnrT6+FIs9kF/8xoTNQUFuRzJMlEpl7FNOxQBFQy3uaBUPIyQJn4XfK+HKtBpfFy7gWWOYLwvtWb2d0NW/zeAvW9PQso07fmUQLVT6QCtbp4lvDn2/HK1Ny7T6U6ZLRkKaARmEdtMQcQ2d5EZu9sjMk2OB7QSWwzpxkroXXnbtb989TjjFN1cZsVWrm2JdFjqs0e5CKL+g7SjCbs5cYhFVYqxPos60VCuh6ThUEN2Qv153HcJgwcp1Sx55E0o4ZwnagI9GNqBtyQQXc+IE4DsDSkPC5xBILw8RvSqwBySll6aNyRZ7bUxBYgJfdRmsTr3+ewyQ3ab6mJd4U+Q4bIieJijfF/oKRCAeC3PwD2OnjPxmgBDsm0ajAxnKSLFP76i193KNROyORrI5kCKyA8ByPzA/XxYw/JAVP4CdpZGZouJDgr24Ap91mKfL/aYmQOSwwZEjYWg1hAFo5NhxB+d5EIx+y912L0Gl3HNMPTq3a4AsT6In7kRckA7clhABcEH98RInVXzO2QpUw2hiOGhpkvjxg5YDSed/Crs+ZmZvi2dh2nayAwWQRulZwGjn0ypwC6uJVirTc+KDVvAJHjSmnVX0fJsKPUDOq+nx0z4fKpgq1QJpatvKOWsZfEP4oX4RfUUtcaxrXwYWmvCBcLjuOqbiN70OisjLJTBfrQw0Apy04m/H0KfJH/Dqp56qDe0qk9dfyBm7g3OKnMxoTlSjk/4wK9I8TGTgmqx5Qjcw1Ep9MQwC7CgoaoVrOIQrmJV6lM7xW5qQkMbFi1v0upTQQqkXofrt2Q4LC7qEytaESjZVK+noEdJVbjmWatu6/ozlDBKyxJywjPgxiJVPF4AcRDuv/OGrQVSnbepo9+7dcK4rS8MoDoFA63b54lFoBx1lvzL0v5woJapGylmCV2H+CpTDrx6xHlvH9aRPD87nYniS2cDkuZbnPkBqB9kuDyKGIKDvnRn0qCzOpVxyGLMGWF4AYllW33wxNyxbhD235mLqttsWw34qxm5OR/Omyd34s3/UdTQVVtmParV2Q+AyDfryzIM/i69lcczkkEBxxQCcyB2s8FrIEkpvBP3/mBD/HCBkBY4G+BExlsXd8JAqUgDhM7VrFGqG2HIEMDHsjb3OVtE8A+8Qmxo792hdnYpoTqF5rDmLIM+nP3/oogBq8DoWpFVpQ4fN8p8eFXHp3XrOtnUi8nIcznyo2gHw4/TKG1u6dKk+sMiCXn/NSuO+w6vLncWo2eSv5HSPan5/cfTH3qCxgq3NUBhePu3r16Y48FQlbPIPNjhJELhcoVPvLDKxNEU1GA6LT/qXlawRIrX/dJpS4n6zbKKpYV4zrsayFkTL1fAu0tnmn2+IZX19OJL+sTqjDMJ09isDLTTQtrgFAEcbPNbZiYryo0Qn6ILeDjMHxXG6dEYltEr0w5Kd+3mOvnEZ+B45+xHQ81KHoyLS6AcQwrnQkIYpQF86/v5XlM1SJzRULMLHfwSUMoYVJXwQsLQ69/W5hUjU9EXlA519+JMnrPfsDKnIBGejVkKSePYHhVzIlUt7Ll1hxCexWEhG4olCcQGqouORhAwWOzWLwEEp6wN4nsSnjkvWlnDVzSMEJpVw/M949ZRCe1pbUaGGXbeMFXG9ix7/UBP5dOGsJouNSEV+BraOndOTQjF7hkSyPLid63Bvac7/IVi7H4+x3/Sl/AuG8XVtL7bu3Tj8cuZ2MyowlOm9EFfujcg7tOSIcZ8q/UT3AMvj0IDB8daHdEJw8aVbJ51CxTdGCV1aIaz+d7H8Na0saK89+m0RLvsj238gfjs/Sk7RTdD9NoED9xDelFKVBnxcho34LA/JuAxNhs8XkWyZpB/od/xrv88AUwY5YTMu7qPRqBHpk8ERBCyDswYs+SKksGYQXpfNPBa0Od5B6+1dK37dRdvoXlDKDhOaoDCVGUPWB2cvh2n2THQ/tvDMYinyy1iDzlJ5o3dg9j9fcJeHn8yTJVbtuMClroXjnCBLAx1OAcLE/dOrvRU+hlrHpJ3n5BCZE+jA0zPLoiLp+kjrmJcLIMpy4c5FszTX3L9aLExWZP8JFl+aAiZKVLdjy4H3r8jvWk8jIpDsYaAtbCEXIKyyIpob3vDCj66kQww1eHG7JfErAzR3rj8AdTuCbtQ97xXvGOPpX5ENhYWNtHR4fZKLwv2/peTN78jWs4MbO16Opdg5ss9egBg+9G/v3a3t2XqhByh4QwRd53Y4DHb3BvRQtdCe7N+woMT87IVnm7XI48eYSdVfRu/u1A73ZxhlSLFTFR7y1YIipyeEGoIl3eU+5a4kIFUw6VSwhNGSTZrlLNx03MrJH7XmzKHKc7geBAz1N3VoUfie7i7y+Qw1VlMmaTPR41lMqaYofafAsGNtPfzoxL8iCVQjRtgOT01PJLRaLbII930cN0rXdjU//A382tAqaIXTqOCmZcBPvM8JXqKKMP63H6YpdhXqvlymhmMOIAR0iADCXIwB1iPeMqoCEPwUIENjdLXPf9eliXvUT4R82ZvAi8FMfEXKWPhC+WNGhYaAI7f5PXul9+6BGJDrN6D+Uh6kWmGJ/NUz4f4L79Yli/RE2G8dOLyzRvawWADcP3qBGKrhrW5Mk7df3cN07Xxfntma3dUDPQlFqy1/638UFcNAl7AZudPYgKRMoVfq21qshTk+uubkLpxeIETBljOF18cdWmBedhWewIjN47N7Owh2nyLQKM0YisrQgbp+RYIHBsBybmyxXgbdj+OlIufiEaJ5z/lgvetOSqZYdmJvRqeylrc+4X9gfETWp27Pym8QRw/R+JGQshrsgtxXeyQjknB1omK/TCh0/PD0Un2UhIIPOz+d4KYs1x9KUszAFxuOeflcXpO8ywTDFoMgLdZKy1OoizGSrrLGgv3LYc7kjCR1NUYGMbD9+qJWnxYv8UX+/QM88B3i50jgXlEB1gLy4xfBskp8feIVgU4a3esU81OxLgFVrlR/hjxdQ82Yy6ApHTml6BxkCKxW02bakaut94pAZa/4FS4eN3eqbCiFmvNMFaIXHj3i54So/edConfNFAK5e7xWmVe7shXttumyCbGiBJ4Rl4FLV216XvVSSv6TwpzvZ0ZpY2saFY7q96edQKOYpUv471pJeI3FF4Xj9OJqK3X9YaoFEpCM5L7WPGDrPCn+NTb1OOb7KXrzRLe9buvTjOV9D6NDXj3HVt2t/BUtLUt2mbXmZKYUZpfAoxUXps5qD4MjttqthDDRuHHR1ZruMTtWRjq+CIoO3xB0l7PSTlMcn2FyX9m9fElFCW7rkwjbpmlw7+9MDVY11wE2JQ7ZoNs1BjrAm/19lDfv2JHnQbsfe85JWnft86zjEtGTH1nR5iQxc2ms+JXTrtCe/gntRKaf+dx2zrAI/AangYc9H3cVfAWKM5fPIktwc6iKSE0h6w1jk8XaZzMlL1Qz4+AaZg4V2Qtfr4rTE9hErfDZPNR87dwvAXOM0O/t2MPCX6buZ5QrArM4JJOBobrFMZUN8UIziOra3Qcc5xWVfNQlsKr6Kdcd22LxwJ+MA8yZruzeGXvwrABv8CA+JwqR2wpg/AMKWPxkjhiDL9YnNYtDvBqQiWmnRMtZa8X/5Ic8kMLcaT9l6F/tcSsoPPIRVssi6znhiOzlvUTx8upl1USGSX00vWeDTZMqkfLvqzxAkg6YpWNCSGwaIkGqk9FmXZidlOIIqDs4K4Y2ivrnx73jkgEmVsh/1FS1KjcGEpuUGxFk+BG+SEs4XyU7Y3dgHrb/TsDbWGfDJSVB06MS19rDkwe33cMhoyp6k+LH6gHH8/wsJ/6hIuHjcs9EEbH4Re+6IzqVoAnzWpEQso9c5c9oONyCSGrMrzyl+Nfj7nmSfQtIDL/wR1h6H+x1oAyIeasRpWxkmrk1rQUjWbe54ZVIrns3x3gooR0FtXVsgysxmQ37Sm9OAM/v3jUoDVrIo9N4dflb3jPutCGG3STXo/9k5LPMm43nsebBQpOPU8eGHylYOsZ2LRp37jZwxHUGWT6oVJUKUBLVaC3H48Y/KtaoBQZl7qPpHjqMyebA/cM77WRjILJkJ5GcDX0OMsi7j8qHzD5/vzE10bcP2mq/aMqduxp4HlckpiB1Snfz1QtPuBtXCxV8Y/bCPiRqH4cStR9raj74WeBJ7vAP4D6/SLYbooY1QWNx3cZaMYR78I/GC5UdWHz/NZZMHTeT8RbM5kwBPT3jcudqwwjDnTGHGSbRCmc2+chrM2loejI7glPCr4pJeVpw46JDZ3XKUzKedhnE5p/j7LRhWBSWZ3nSxozJbZxFUnj9F4MQ2H23eTATsLW7+CLF8qP2+MOQscanKghMPtOZipEuAdwycPr2mpvcpyREkQ7rURzea1ztyrfsXLpX/kFm4vDnGGjfyDVtrsib8rksLGDgIEnAQYuEAxl2+Cnk/BpJcmjhdsnYRyTHkPAZmQ8OFnJTIuHDI4SE/BWkiTeKvkKEXlD5ASEPzesVCBoitDep5a4/8BfkTPeJPenQ0xCHH4HJf1fkJKMH7m5QMSmsH8/f5/sEJGrN2ehCiYX+771A2AntTeaepxEvKt0s5/xYXDwNPpfpD4++pIhsKGVcg+dXVx3jK10e6AES4s8Mw7SqXSf0nj9ZmJP11kVecKRwK+4qrXUQ6wtc28fAep1kbO945ECU9zaW7JG5qvOg9NX7AYpqelBOdlTe5tx0X/Q7eqBcYQUJGIUM019ZO0errByLMLq6j6NEKP/UdGN1n95WN4+XPTjLEsOYSf03V+J+JKmUT9TysUPUJ1XGtJADYc4S0kDmWK02+jn0BZu4RfvdoKhJNavlV5jq+HxzGbaRdlWggromF4BQ2J8ngLDK8Ca2n9BVoDrRfuPK9IHXEesjlw7hqwF+WzfbaLei6w+1J2tvNt0LWisoxG/o9CxbaMdBCiVrzs1wkW3VUeqR3g5LS0364CV2oU9mzuKk/f/ZI+7Sa6xyJwrgCt/5oWTKt38Oz0dIGA6qB3omkogRy+4N5+euiPkDz1e6YYdF1CXyUX0bD+8a01i5EbFdGuuYnfy1ow/RpOvjM0OsSC1yAMmjTbtzPVJnjQ6wDI0xbd669lYON6LpggKfYKko3ZdysSSl+4F7RsohzlXTChJ0HstqFiyFJecP9d1TUIyElTDVQs3J4z1rL4TE9N7PbtjeTb2Fx0iPCkrZRx06vbi3w5JGe7fTMxZ9OiMrl7S5vwxFT/T6yiFBgNUfTVKk7y/ssUfET2YN8uLzl+kHP3IHGgTgmRFbzIHBBP0QmoUR2NK7uH68jKHQZiUI4wXX5hreaYdWa6tS5rwniykdkljglia6sTSzNCC3lz1Hlqlp+6QxmdAhw/jsQ16VY1ZaESODs69ueLRsWKkorl6cXdVsppaN3Vl3hdPGdVjoobYbeTK6ExzXc7N6/oCQ4cp8xKAjcwN4XkKen1SFqQmjEKJPVXnzSxLYsd/qgYe1vYAVMrKhsRvJBqIl7vabixQkCUqdlrGL+tQHTvxsBlTKcHtiY+g7eWeJDXPOLpdGxwfCeUt6bO+7mP+dVadnq3Cxq3XsP2+S5IuQqEzIYDh1ZXcvH4O3fPnuzJ/nWK9goGiWlnihGLvjAsF6uprzidQvbmR5M+xTHbv3/5xrGtRJn8yJasLhHoKf5yNlmS+8T2AFUQqyCSWdqV1hpWKugAweQ6vXHBKZITok2mKcvirpf9boHWVRAmj99t+w894567ANTZgFQkBczPVZTY5+94+b072Wjd74RObraGDMaTCrwlHonTSfbPbBL3ugzW42avBKi1O8LBW8EZK/QmrtIZiZuu5sNt5LLOGpc7zV8jEbcbJc0rXSRUnaeWwR9GDGYyPQtW5pI2SZY3Dhpmqhu/eo5VbdD3Bbg1bBAA5aHyu6FtiR+A74kzmy04IkZgae8p7/Q730XxW/JwzrnWIWSOFB85m2tSWnrZi2Taz0t/zxhN5aqHTclO/xO/pg6HAtY6eI2SC/omCmsxDuJnh4jpfBSKhR7XiyAscWOonslfhvqX5j4yXPuygv6Dk05mdgMV5Tw8Duk0G0sMG7vOCrKsy4/2u/oSmgWnnOR1OihxItrhRMElC6mbh33CpLTVwL0gKRGFbvUOXZsUzAjPqHKF43NBM7N8h4ImIKQWlQDStvzxgMEMvE4r7NBb2KDWDEZv688NsQBl8P29ck9tzMIPrUC4mtOW6daGypwAKv+vZ6gs2NWeetQQI8p+sVNe/fM9snpM0fe7AzNMnL1gAM6cJk/kMLNeueDblzmffjGp+oG1eOP+h62KjEOIPEVYdpdvyqRaRjVw+ICEmPAnV6a4fH1CGSwarHYCHx7xEiRL7VWCWmZPRFbgefc8qf+6lBHQJF0SvH1lXt19nRAEX6/gKngpR27fTRo44j1BTIxSFRSv7v7cWU1DKsHtpfdUyrnrOpWb0pNmhdmcDRQBA41PnVBMUDD7JE4QOOEEgb29hZY3Cbp+3oEDjgIom7YbpA2KZCCkoG4fD6usytkCXWz3ErQoNRbBvTmvDmeuz4dnHGLZNoFUa8auqYZ3SrTbWBBXrlXf80mG5G89k3I7cka+39TJW8pr2E2ERuLxZVw+o3KJ/lzYJw3UHPBANuenREMCatJpk1wrum78mtaiEQ1m2qY5pXRdsVy9z8wXarVXf9s4eYx7KH63yy2NSyH5/VfggmLOwk2HHYPJFzwTh1K9Jw1FGs/91V4gD2twdzS6z90ekn/a9olHIWZXR2/vXLyU95WzBVwaGuZfyS0d7P91HbMXmmRcuQ+kFw31GALKpOTBZqPoJnmO4PttXMA9OsTAZr6GaWN9ej3WvgIp704X7jJONwqmfl4/6ldy/MDLdyzNm7BRLl9Jg7HSUoNj2B64ZcadX5YJk4RKeHHF3h2hqSzcqmv34k+dRaP5GIYgFBX+ibU1fEGY834MvkBqaE1APvrPnI3LNHOBddRE12+2OYPiaUuqM33l+tGvV0zudg/nMkz8eZCXKBAdoK10cTdevlcgxLsh8+tN9+CFnLP8tbzExJjqHRf1r8V8qr0PTmGkTdM4WPTT+jXEl5tB8n8XOi8tdq1fwgjBCZDaGPFZHeH7h3CI4tZUx20D9ppO57x+2gT0oPyC00AjLFJCmyjFHDNTCiB0swhIpE2wuFadcJp4wvVPH5HhAHBx165k82v5nQQDgrMK47WPf4bViPoVYHdFLbZYtuZOdv9gzCbYAgsxo6oL567GVGYZr5AkFW3DJTDOFME3CPfBYDoYT7/D2l93a5zSzIGsHQ5rF9j/9xEF5HcVQTXVfVYgUlYWuf3mvWXLpTO3frA0Y9k86Kn+EtkkK+8ixnu52ZyYxJHNNZQZfxMfm8AN4HPLHzxEa75r5sqAxx2llmwAzpz6mgxXq+RxXseMCzOZaahafYqYhFZmoq+sxDgp4MvH+hDwE9e1shgjmvgcPckiW5w7pPGBse249/77wf5BieXW/e8NOM1R4p0+nnIazknNAMBxfHuzpmMZBtjKgOY0m8CdWv/8Z2nvzU1IWAramhhuLGnwx5vAcqrZs6CJbM1p+OPI9/HpNdc4YvQ86g4fMN6kTRkPQhQaLR2/A17J3Jm/MupR2Q5LCw5awyXy4NcTw4WlBuEElso16SXxOY2oPSByrUBjNTEcIm32usWwvZ7kil2b6HGuwGYO+1edxsuph6naNCc82uUx0av08BxFPBaAvVQpT5IB3QVsKqO45057C74epDzar+AKJiVnv9NaULkDR/NOGOCtveYdQhiYnhLYPh32bpmonDYy12ZnIlMLQx3mBlTQ7BxtxreyK3n+aR49BNfF5kzVp2UQd/x6pL3BRnF1thxVBbWU9MCNhCOY7snC1CwVqF0v5/KaMMts8udfmbWlrVwwMsVpPhr7FoFdvC9gfCrZqiPTkuydKyptTHdgPDAXZHuGhIUPovThRz8Y05WyY1/lMs5N6JBIR2NeBoypdbn6Gf2rDMH78MRTwS7bcvYbSv+cB+rGHOvj3Fq4HaO+RIpoZDKy5RZZ5wRtB4/rP55oY0mEGMb7XZadRmDKvNlgoaByPZvIDwRXWaPiejj4+QxMt3+ZJh3zdCtSCUcBYq0XA6vmk+fnNwUV3tvJJzKJvsgbwBxjR29Cpy68rcHiHy311+uvMaGAj/nUQJgluf9PooV/XqMS75bmlz6R4b7bqSlFqP3yKQMYfBhv2H5D8or6JVC//HCZAxL3nsRJ/PVgdDdgd/xPX0W4l4Lko0oKtF+GMTQJFfTFgb1ZycjqwZ8AT9U7ikWvb9G+8cTeZzN6dOSJvmc3PTXNfGVd4pIPFYCJ/aVdze7EY2U0Z21cZckKXtEm/nJbtCSG2jx4vmC/LE8yVrNkyuqx3QrPRPXlsSwOCKMfmRghGXOLdxKUsFGTEmW6Fh6ddX0TIcluJFssvwvJi9+ShX4ApN6fJwbwQ0kmpVxNt9Dimp11glRZuKdwIyKWeqonDiMcBxAYf45vC4rTkPJcRwaA2+NxR20X3T4r9yawOfvSzj7yD6LbWDKURDOkq0nZrut2Qm51PrxqH7qopiJ33VQXajbrqdMFuuOlZmbNgBNLjIzrmjyZInUpZBLiEyigr/KuP/bxRV28H2sOciJryGL9rslct7fK8cabKRc2U0XlJ9Uy40RYdF/ND2GD3jcagVhz51uJJZjhSsqCgrAmbODgQrK2dGdpuYsD+3B5LWHLhhO/pwUvLLSOBmLSyAqdIAEbSWNK7YCV81+YC0d99kTzQtcT6ftHJQyexbAkXVlKoSFrut0a5A7un0p0wfrEYVy6x9XuzPhG1Fn6jR2ZXbXScF2IALfuobQswrxtVHURcbSDljdSaY5SGz+Rww94Y7E4VLxJCwUxsST+k3Mo+YsRxkLeDd//m9RKbIwuVM+P5VmaIrXXIG7DgNS1rHPaK74CRLLOz7rq5rJyJHM15KLFaqS0vUafKAAM7vX7QxlY26Ks87ds8eLopjK0VEu5I4F8jKD79bwmr2H/uKkrjNRfe/FZxSmy9G8FwahNPEKXGcUg8jf8iSk0FcXXE1rmcSfVJyBbuwcwi0vzPgLNhKDhjwyjeFs+yt3tx0MMTbcDCAdNhchzbdTTyVTSk00jatYcF1ibVhqRwC3f0IdFdlWaO4FJYD9nJfITuVUUzXrKBOVaO9yH6r0/R6Q2cLCLzyGdsqdIVArqbKyfOvuVyNJzgDcJQuE8dG5dSifDs5bHGyYZiMZdvo0E8p4ckjLkXvYSSuFhgV1cgtwd9h3WRl/QKr0Y1zPXdcS5R6dGcCojmbA8GCHoReZsk4SD6gJDUdSdVjjtBdT5IV+bq6RkU7hZbkx+jgK/B+E3vb/qI/E7qlZ1eMRwBP0KGPqbGohemRcHYRVskVTN/jQ1NsoYRqQ4Ad4zLJTPWAs9QV/JPB5N7swehjXEcQRx7LtDbByNEOoa7UYLbEN4utcOplxmc2mTEDh8h55ydcECnqg4/JXd+s8Ey67/M+yg7fIKefnRHh+ohsPT51CD/y+kvBU5JIxwoy4GVF/f2A07Zii9aU8FWQOfigRF9oKs6yqcGJBHngu+yf2B8yRT5/mQw8D0aHk5eaBzjDv+ehw2izkJHpi1EnpvZkrRhBxWj8EKvmOrHTZw4TmVE0HsnUQI6iLEBHTr5RzCMEO0r1figRXFGYnUPUJRzCV9jmmupSj0WiqZaOF4Xo9H49gzIJBgnjc2NVl/kdfuzVRy6SKQydsz3l0Xq7vNJktnSIxTI1FrohefQkaSLXP9FgfW0ECPWNkI1NUesLAh1xMqfbezyCZuA4qO2Rk5XsF9/udgVaIh7MmyPY3nmAY1BzgHRhvQ8avLltLuPotWqP3+JrULzHmQ8gaWd8kWGSVF0VINWiM8axn6k+D89emzfethVVxKzVCRZU90JiA8o21gyTPTq5+WLSziaSR+kV78yew1P7tBVUEtWm+hTZ0Kz8NJnlyqfPy2yIL7664fe6sRUbi4VSj2//xyjK3jVzVuC7OOaAAK1gkBzRDYo8N44PJF4I3k2P6RExrd13qZPPgJMQer3D3/OtCJeKxbvGBxc5PwSAVtZLsiYqRvRnVb8DTZNojpt6hEx1xy3+FSoXQOl6P77LzKEnzm2K2SHm5rBLTjBjlcl+RBH++U954y+B6h879WyFHpWHpORgbVH6whyt8Ohy5cpHRj+CEMgzZJJ6xcB/hRNurNdkGFoDGPpCcFLvmjaV0FpRcvh3Rf0cFnxfT7eTnfvH8c5Z6uAlrZg5v2yNxoRydFV3zWo32M/vFNpGNKyErMsdvRwLpHhYUfXfXRYX0noK7uPcXqLYGmlk+MeQ2W6LAfVoWyccZeN55G7BYQ3pAIJb9ItG6gV7OggpsnNI+FLxkiSwJQ66dgc1q4NWDKfR4O3VWq2kFqXTmyi7EvNlxmJB242wR/dEYwpVSlkCyCS5fRkdBTjm8xK3/bXovRq2qeK99t/f6Owjnx6qW9TB/PGKKelU9l2Y/R11IAxRtwRp81M/ndsx7W6ppnPxb2ivOqmCHLLm2W/2UQM+Pfg2UGqeNkF5LS26UkIoHYW4/iFnbcvzXsYsfZoggy0LzGpa1jNkPOQ7VRZIM/F/fa5Ibk5bDhLzEZhbeTzQc3nedHH1ZH8QZyRiYNChYtf9q2CfxlIfr3idmiFwZeyAlzmNKu+XbWp0eHmsGJY+e89nKcktSTSIIqxyhn2JWeRKkiuSeulDWEMuz7sSziLqF9e09DQX/vYy9RLtjOMFrbAETRENC/Y99+ho9rIkCON6dJYnnw4Z02Q8Y5jPF0kH6SxBZXbnwKDPERlkuyvbJ51xZPfOX7ryk9s/7ThzU3KF4eyumM+BomMuf5D51m2BTg3UgNCCvZiYDunsqe/nDJeK6DcZOR4irotrktX1nvC9kTZ46NYMxodGpA4vHaByQLpQpHWrCp1Z/3uMqom5Legbtc25zXH1PWbYVRE/lLCPm1LLuGi0ctH1gBauTZxuLlpPhcFwU8GzpVGkv5dIMcPuEhi1fH3udWjGatKxkvbIv4hqmhDaaWjALIyxxwtYYbg3pNi6M8AzSqivFSjnmeCWmem+qOsOnzvOa7dLyifmouPqRlqvGZpHPuun0fKUSEB1Q5Lnb1kDp7ZQqw8ilWRqxa/B21cZdBkzR5eCPfOHyz16g8eGF+mJ+k9BtIEzqnTw5/3VHul18Urpvg8iDuodPYrlkkSg25xBmr9gQMIysKx5yo4fwCzdP7J+kOb6YC2+T6rjjlZO7PQYhilIWpssjBCvdN96Sm0AWL8RLYUXbSAKvimStVsl0YUW2xDvZB9i8I/lh+U5nYst3XF66EGKFV8Lh4Hq8SFhd+lIHJ7reC+nYsmUlCk1wcORXh3PQxxIQyeSTDGOZ04rqqI3TCSXIgNuxnFhTakQAH9H2hc+DmkpxwxhtSeBWSP9gwzueC9ob9xmk8zyrkTjTUbXvfuRmDM4f7zyyW7Jz1HReOZGlqdvMRvtOTM8iXI7oHYLQdMBzsYUC/1srGunbuuLX34jykDYE/EpcFlRdVNZ0mJ6ygG+Q3gJpEdctyEAU7Bn3/sc0O9tU/wcjZUrY+T8072KeItPLw2dW6mBH6fYRMxDgL3XcO+pVck4ba6ajnJqzQQU7BX5UFT2YxjXWP4x1YOMghIf9462pjtNpnxQx9MnyIEPPVBJ/GuI610nSkjNopzXuHvi+CyinxYoT/5Op3TmmZuhLhlWWnukG1BqgI9xiZFjUtZnqEvUKU2aJzlayW5ZPlZsrk4dO5cC3FJk9PIu1blLRe9ktIA1tHN5TT7JQQih29W25MD34t3SKkDpEmITMjRZYPgTU+VmxW/0V5E1UXl8GriPe2PGiRszzdIno4MYx1aA2Ei6Bmkd8cpm4RjW2QU2U+XyS7evqNaAB/XsG6Sl7qUZx7pa5NEr9WvvpVN6qBy+Kz0gDx4RN+nMCSE2X13pLr3g4m5F9cb/YYX+hR6VBOPcIE8r43NEVbg3a4XEmIFKqJcfLYRL8mrHNbPzV3VqslaiJcgMU9FO9o+mf8LkNatAFBU+VlJxAN5aGYy8IHBl1Wm7l+oBCy0XwKuXabgja27UCWO1wMyA1JnTkk0hyB8qTGFBJ8lrvVzInJcPPXvxsxIjjiUOZuIOeh+ZGyllCgjwBJsjdloI35PanL9QxGxpHPG6YGu4tgpdbOdUNUhSDDkXnRlfqzp2wspBskEo45+gQCrC39FXEJxle7+WjCUaKbSUhEmTpTnNASBKBxh2Z+GOQ0zVYj/hCH82FfcbbZcm5f06dNUVMpcAXGnMLosy4DNAdoQvzO53TKXJkI45nbHNRkyyirY5E13D53mpV/GwqfS2SDMOAxVdAQH8CnAKzw7e7uqUI72T0ZBuYpSmanZXnq1/QpIsaREF2SGEiujil/8RW6FSyO4X0zUt4G+W06qQb23udPHpfuh/Al9IaEkR9u82IgTxAE3eqH6ceV+fO0l4CewhibyjSjwg0ZkgJTuiHTFxim0Y5WMLrOiBbSVfu9zNAbvBIQRpNcTNYB5TuFxs8h/x6h/8ePbQq6x1qjIUcWWuyLw4Z75WqBZTGV9s2xp+TItHNyQvQwEW/p6I373WkIgUP2+xpQyfvpSglCicik82CYDisYDqZSAJSEspo1XGW0waAsbJ9NqlvV1gATgLylg8EnO2hgQgQlJpYAnHcnTZQQg6K9M+t19Jw61QzDNRG6blrRvuRAzyCvK8PIV1CowhLgNIMAp+xPQiCtnzv40IBecudIKlyEjKLQNGbHbLaTlwb9jNC1wXB9v8iYUlonCWWVv0nNMRennUmj/lMBv0+P88SrFI2wboRn6JouFB8IQi/uAHBDeo23ht1ggyeOvmsC5wRZ9aBTiHuPsKgvPGBQXAvIw0mKtXpNlzvS6etkkQXdgVO3kUFnJjsE5l5ngoDIX6fx5z+quwjeblFpiCr3oEuWTvcnZUiYLv2egkj/OmlJ1cuQ5uHazdo7QEkVzojzQadmMaLwwz/ocWvUey4EYXU7L5XONPas3pS+dR8grss/774lOpHwmy2k8V+/sPh98geJnvqE02P1yVs7wI45z88PPXYIf41J1fetVSDktnzVWj1JUuYoIsHqYtPQrsvjoeFiPT67hgl0zzIyeVe4p3qGnXv1AkpBXpsE7g34cAR22tfnziJdsf7h0XCjflUvfg+9ZXUwbDBDG8gbPYsJvTiyIIlVFHIquX/QOd2y2kj1m7u9Ah3Uslw8v7G3KzjBlwxwkn4RLMjM4hYY5oj4WUgpUhVyC9w+wNu0D0VciGoorO+GfQGeUvQeVD1eg9w658W23Pi+xwTwZ74yTYSKluXJlhC/8smsZD0o+GLUZAx6jHBnC91CiMUv9d2bgbpTzQyl6MHB2H88kqoM6pHdsqBGJjLGtr3RpqDIhKOzFZOtr4XoR6/SpizhWwQjyFu76GPwYEH85KsqzYkSj4dtBHSyQiQL0sUPxjrwEFS4QJVA781ugPQ1l44Rdr7bPmGlKe6JUUcFg0HeYK61dMKHbUbIiScfrFhyCGLTiThNC096ij/45xz67UdqlHw5JepOyWiiqPjsX+7cMXPJNpZ+4h7iOTK5GsZ9gHhhZwhZ7BbVj4m5TEs9DTlWDfp4HOkPEwcHSbQ0yrev1rP/XTSYPc6n8FuNvITJnBxILCpG6Ww2RRQR4WrN+DFbPGAEmvq0TVIMdMmVslzb4G1VypoaoGkAA++iWYY6bfsEey8zKw/wgvTNeT6sUZ8TV2Mbak2yj2L2pUyVdGchYpV04RjJiTAUaQzpMZgFtbJm5g0vukgwdPxXISXdNU9H4DHd3+dCPosqwHjz1LAgOxnUBF8kSbl05jn4CKgFi+f2PFa5sutADcjWWFkHIlxOSt78e1IPP5X0c/YDhWpM/F/qaEefqv9wCZiAYxMe3g5wkIOvHNqWJeApvDH8G1dbrd3xcA3KahiQbtmxaa60rDoIc7M0NZTWliMk34+MyqFYP0M+7oVf1Mkkz/yXCe3k0psujwnjB7CCrtKCJq1BCNf1SpiCyOZxS8VI4I7nqIojDbzggrgkmey5CC3QH3pwxh6SP4XyKdQuwIQGmjpi7ot42gouDZ5srnXPDVXHwU+uTYgEqaNucA72sevuRx6j7iVETkQNjnn3CW7YbgZdxFi3EXgB/q2Df3izj5CEppXREd/IfWWI6LCVIzGTQHK/N8+MX2XZKPOZTIwvOTi/RlVSasrF6NtKdyUvCK40+xG51BHfEpSxRDaL3p69DEs6MrVSZdqoQ4F5gDRLE6B2/yKwUYjk0pB8zDbsUmXNxyXeetzckC6sjnJwmIgQ46OP6+bmTcodY4GATLOkNc1Yl+nC6S++IopY7hO4S/1LjnCvx30thKlzmMrimxh/3Qpytj8z+s7won1r1jJpok5zfgeR54fIcF6wpR84nkhpHJg7nfynLXBg8Vbeb6lATv+4RKdSxOVQ9HmyWc3yfXb8Ktur+WtRbca/u9SYTlILTPEdqMjR9Ltq+ZFW13kmY0X/UmwgxXwNORqR/qrJAAgs5EKyrGHrGUAHhZplBSPk2PcaBFlFRtRTbtADKrtk6tOQo0NqZiCjh+3i2UpOOdYngVWEsCyASzmexU+x2Adpfg1Kau6oaUsBYASEVaFsLUtrfuhXI9J1mdL/GNP3rB8EefSPy2iVLjJ7MockYfNsJNt2e9Shk4O5vv2WZnSy0Yu2Qq8IviT4f6yITFK5PAeX88bXGF0DN4OZhM8t8pmJxD8V+BOiQuqpvPgVeWZ3ZPqD9r1Asz5B2upKzvfNjlP1DpAXNOAvrQD3dNreRSMb4OPyD2dUCBz59Aihm6aI5F0/SSSXPDfucaEMedz0se+f0Iumduq7LhBdGqrX0B0mXsf3pMikEpwvgSrVq8/k0w1DWTnrFwcKDVezjv3O1ZNG46A2X3S+Yo9jN1jZByxhZFffK8/BCBNAexSeEykav+HqvVExJ0cjtCZ7CYm7BnhAZkMFy4rUA8nKMjEYqupR2yL6ysP+3MRkeQ7bC0p08jJvPWpVH3s47cONg2PM4GkXGt+LkEQHyEYIsuzL4MIah7MJYZ2bXTwzj3AhTzRw9zo1s50cv2/jvF1I0wlry83OMnEGVrIzWBbKRYP0ZWqEXCm6gYZuUHAoHZbfqHHPtP7jA6H0zi5Vuz7teuplPeezWmAhfYI2N9bcuJ5WfcZj1OXvxahL7TSPFof4Tezntl7hs3I5+XjOe25DelYIW2yVVwpzjRldCbh2aNLMoj8ubt1V9mjg7OMaJX4i6/5rDgKz11zRGpNlDWixa07g8q6gGaCke6x4PnYFAVQXo2pNM/zGL+jHN+JVBI3LUvhp+CjOPGPcp1uK8T2UYZ2JrZCFLafSR7hmAmYvhWwLeAL0d/c+HlJsTkzAyq7GTWbRx2dPvqKDl+3Oklb9WMTg6RVfEJMeC2m0dP7Ddm+liOvc/CqeMufN5MtxrZ9AquA+g+NNKMPRyXWu6PofjjVsix8m0nOL6TR4qNRMX/o/5rBTAZZ5nI0cmd13yhXAO/VdBmWeprc9Zrt28KEMFlqTzthZ5z86R4jxNsfSX3dhWLAZGa226NfSnaqcyw9xxOVjVT93VmkaVZEjxcJkCEX34CIBSvRqcVh6FvCEKWjFzoMD7sjIEY5X92UESydubm8OvoAa6PfYgFQbXXZVuaIe2yInkEQuYZmNbFBIBQG9ZAMLi1/ZHUIMBFolGAXysLeIRTCJ/TZ1dB+sS9/oLP6yQNV/uXx3CroOlXl6Gu4jbgxpp6p537dODMTDE+QK9TGQb45zdTsv58+cX1rS9irR9oY4mPChOrM8BEcnYyR0i+ywYqwgwcg7h3QN+JRbuXIkr5I5pPGVCUMYPG75KARQNQdcGdtMSPvD9Hlt8RgVRRcZOYszk91Ax8uoLf/977llCyodIw5ZdMghvS2ownHwHJQ7xk4Aqfdh82z0FvAqVTlXoaeaPQrareiIETmr6QXpHGrBVfVBvs08rKQaXtYS+gHMKfjbQ9cJe06fDNa1j07pX1Xng+pazRBhD5H/fbaF6wtv9v1b0sPZQ+uR8HdCVr/I0EAbB19jY7zpVgdBfHq+lvwcZUrrzBArShS0f9kREaBCjhsdLr4KNIIy+nrlXXHoGF5PlQfi6sLxdi63gAAA',
                  //                   ),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: NetworkImage(
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSKv7oKuOiDR8fgp54munlYmioZBsM2G4mEBf-9OZqNCmd_lnQ_60t0Qm7VPxLLr8QRKuE&usqp=CAU',
                    ),
                    backgroundColor: Colors.white, // Border color
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Samantha', // Replace with actual username
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.account_circle),
              title: Text('My Account'),
              onTap: () {
                Navigator.pop(context); // Close drawer
                // Navigate to my account page
                // Navigator.pushNamed(context, '/myaccount');
              },
            ),
            ListTile(
              leading: Icon(Icons.pets_rounded),
              title: Text('My Pets'),
              onTap: () {
                Navigator.pop(context); // Close drawer
                // Navigate to my account page
                // Navigator.pushNamed(context, '/myaccount');
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: () {
                Navigator.pop(context); // Close drawer
                // Navigate to settings page
                // Navigator.pushNamed(context, '/settings');
              },
            ),
          ],
        ),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        children: <Widget>[
          // Replace PetCard with your actual implementation
          PetCard(
            'https://images.pexels.com/photos/45201/kitty-cat-kitten-pet-45201.jpeg?cs=srgb&dl=pexels-pixabay-45201.jpg&fm=jpg',
            'Cat',
          ),
          PetCard(
            'https://hips.hearstapps.com/hmg-prod/images/small-fluffy-dog-breeds-maltipoo-66300ad363389.jpg?crop=0.668xw:1.00xh;0.151xw,0&resize=640:*',
            'Dog',
          ),
          PetCard(
            'https://t3.ftcdn.net/jpg/05/60/78/76/360_F_560787605_eBclcOUNK5i19dYBHW6iYV20x4jHwMLS.jpg',
            'Bird',
          ),
          PetCard(
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRYGsPyo0sOeTDONgHF5YzKh_iDk0AROK31yin99UR_UtBRHWFtQ6UzThnaeOBjH4cmhik&usqp=CAU',
            'Rabbit',
          ),
        ],
      ),
      floatingActionButton: Visibility(
        visible: _showFABs,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            _buildFAB(Icons.local_hospital, '/consult', 'Consult a Doctor', Colors.blue),
            SizedBox(height: 10),
            _buildFAB(Icons.vaccines, '/vaccines', 'Vaccines', Colors.green),
            SizedBox(height: 10),
            _buildFAB(Icons.notifications, '/reminders', 'Reminders', Colors.orange),
            SizedBox(height: 10),
            _buildFAB(Icons.contact_mail, '/contact', 'Contact Us', Colors.red),
          ],
        ),
      ),
    );
  }

  Widget _buildFAB(IconData icon, String route, String tooltip, Color color) {
    return FloatingActionButton(
      onPressed: () {
        setState(() {
          _fabColor = color;
          _showFABs = false; // Hide FABs when clicked
        });
        Navigator.pushNamed(context, route).then((_) {
          setState(() {
            _showFABs = true; // Show FABs when returning to home page
          });
        });
      },
      heroTag: null,
      child: Icon(icon),
      backgroundColor: _fabColor,
      tooltip: tooltip,
    );
  }

  void _openDashboardDrawer(BuildContext context) {
    // Implement opening the dashboard drawer here
    Scaffold.of(context).openDrawer();
  }
}

// ignore_for_file: prefer_const_constructors, duplicate_ignore, prefer_const_literals_to_create_immutables, avoid_web_libraries_in_flutter, unused_import, camel_case_types, use_key_in_widget_constructors, non_constant_identifier_names

import 'dart:convert';
import 'dart:html';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(Principal());
}

class Principal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplicação com API',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController controleTexto = TextEditingController();
  String conteudo = '';
  String imagem = '';
  Future<void> buscar() async {
    String entrada = controleTexto.text;
    // ignore: unused_local_variable
    String url = 'http://pt.wikipedia.org/api/rest_v1/page/summary/$entrada';
    final resposta = await http.get(Uri.parse(url));
    if (resposta.statusCode == 200) {
      Map<String, dynamic> dado = json.decode(resposta.body);
      setState(() {
        conteudo = dado['extract'];
        imagem = dado['originalimage']['source'];
      });
    } else {
      conteudo = 'nada foi encontrado';
      imagem = '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Aplicativo com API',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.indigo,
      ),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                    'data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wCEAAoHCBUVFRgWFRUYGBgYGhgaGBgYGBgaGh4dHBwZGRwcGhgcIS4lHCMrHxoYJjgmKy8xNTU1GiQ7QDs0Py40NTEBDAwMEA8QHhISHjErJCs0NjQxNDg2NDg0NDQxNDQ0NDQxNDE0NDExNjQxNDExNDQ0NDQ0NDQ0NDQ0NjU0NTQ0NP/AABEIALcBEwMBIgACEQEDEQH/xAAaAAACAwEBAAAAAAAAAAAAAAADBAABAgUG/8QAQxAAAgECBAIGBgcGBQQDAAAAAQIRAAMEEiExQVEFEyJhcZEyUoGhsfAGFEJiwdHhI1OCkqLSFTOTlNNUY3LxQ1Wj/8QAGAEBAQEBAQAAAAAAAAAAAAAAAAECAwT/xAApEQEBAAICAQIFAwUAAAAAAAAAAQIRITFBAxITUWFxsSKR8QQUQoGh/9oADAMBAAIRAxEAPwDxwWsstbtIQIYyecRUZaqOX0phsyZhuvvHEfjXPw2KOxpzpnEQMg3OreHAe2uMGIOm9B3UeaHdUO2XgNW8eA/HypC1ducMtdHBbEH0plu+ePzyoN5AP/ZpcyrRwbbuI4fPfTbCsRQCNBvNA03Ogpo0hdlW2kEad3MfCgy2GXlWRh+QphXrUigytuK0RFHxV43GznssQuaI1IABY/eMSY4knjS7oY3J7tNe6gyiTqRv8OE1tkBEVoGdaomgyjc9xoautKtaoLfBnq+sbRS4VPvGGLEdw7IJ+8KU6sCmcTiHYIrMSqAhR6sksY8T86Cl81W35JJfJrGXFdEygAqGz8O0WJkDllyx4GkGxRGkAxxp3C4Zitx9lRRJ5sxhV8TqfYa5nU99W88sYSS2TwOt52BgbbnXSdKi2xypkXotLaCgdsuzzq7RCA6aBQXgccx7qyErNbmwGSNQNt/CiCtNoKVXNwgDgDRTJMUNLc6kb/DhQXZhGaInWKcFAM2V5VpGnxGhrVB1LGDEaE/PL8aA1BYZjHAb+NayH1vcKlnaOI3/ADoK6ocqpVgxwO35UahXttN+FBuKlL9vmKlB697ciPgSD5jauHicLdDHI7FRzdpnl38K7JxiHRTLHQCDuedFW0AI+TzPnQeQuYW4SS2p4kkk0vZQmvYvbHKuFj7It3A/2X37jz+e+grC4emXtkEFRrtHMURL9uPTX+YUZIIkGQdiKBR3f1P6hW50o7rSeJcoCQJjgaDTGqArnt0g3q/GugjhgCONBVLX9COR+PL8aboF68qsoZcwmWHd3d/5VZN0vDKvV5qvpDC9U8TKMA6N6yHY6e0eIpfPy3pZZwkss3BAYmNddto41l3b1ffWkECrYVFERwQCONXQEVlV2A7IK+bT+VD+tn1R51dVNwXEOBC8T8/GgrPdUZDnadwSPIxRQtRXW6S6QttZtYeyCFQZ7hYAM91pBJieyq6Lr9pq5QSrKbRv8a2ENXVvLMkxmg3XQ8O+qVmj0ffXVu4Lq7Id17V0kWxpARILuY4klVA5Zz6tc+lmll30DeWQveTI8IjXjOvl31aiiMs0APG9RUuqCIoWGcns8uPdVX34DjRcKBGntoDZazkA2rdRjpQYmhXWykECTtHdUFwd/katROtBj6wfUNbQzrzrdCVspg7HUfiKAsVKzmFXQewu2gwIPH5BHfQbbyNfSGjePPwIg+2jO8CuNYtdezXGLBT2UAYrIE9oxzJNB0nNeYvub92B6K6Dw5+38q7F7oxYIDvqD9tj7p1rndDEKzIwhgfOg6KYJAPQXyFZVQjQNFbbuPEe38Dzp00C9bDaESKAT0neGZsvBYLePAfj5Uw2ET1fjQAuRo+y23c3Ee0D3Ggw9oGhsxQaCe6Y/Cm2FBu8uJ0FAsmLY/Y9/wClDymSzeP6V0L2Icmc0GANFUaDYQBW8L22yXW7L6BzHYb7LacJgN90niAa6y4Tre3O+7zrTkoSTJpiy2Vg0BoIOU7GOB7jtRLmGZGKMIZSVYHgQYI86tLZJAAknQAbk8AK57u9t8a+hnpPBrbcFCTbdQ9pjvkJIyt95WDI3eppVUnQak7AV6rH9KnC2reEVLbMs3LrOueGfKQq66QBrzkcjKNj6SOrKWtWSAwJAQAkAgkAzoSONb9uMurefs4T1PUs3jJZ4trlY20FOQa5fTM6F9Z7oWco8CeNKdUK7X0gwC2rs29bVwC5Zbmj6gHvXVSO6uS1Zy7dsLLJWFWKuKtBOvlRKy0LZyqjOfSaUQctAXcjwIUf+TH7NL1VwaaUMNQFkxHDeO+pTvROHRi73P8AKtLneDGbWEQHgXaB4ZjwppfpJc/d2PAWxHxrcks/Vdf6cssspdYzfz5cgW2IYgSFiTwEmBPtrLmTJ4+z3Dau9e6XbE2zaZLaFe2uRAkwDIPM6k+08q4JFMsdYyzqnp53K2ZTVn4K4hJoNi5lOvgaeeI1pdbE6kb1h1b+tJz9xrReRpQ/qq8qJb79xoaCAVVEihEZjHAb+NBZNAtjM08BtTHVjlWFGUxwO3jyoCVKupQb6Uxd5S1tnkcDABKnbUeXnXR6O6QVlAAiABHKOFLfSN17C/aEmeSngfE/A1xsPcZT2ffQezLTXGNgXbxZTlCQCw4t+g0qkvXypyquxgyZ9ldDo5FVFC6iJnmTuT7aCzaf1/6RQsPcJlW9JTr3g7H2j4GnGNcvpK+EKvx9GOY/Tf8A90DbUljRIC8WIy90az7N6z9cc7Wm/mFXYJYlmEHYKeA/U/Cgo229c/yrWSoBBJJJ0BgQOPDYmPd5smg3BINCoRVqkmAJJ0A5k8Ka6m1+9IEcUM+Bgx7a6nQODTM7o3Wvats62ypUsVHCSc0bwNeVbxw3ea45+prG6l2N0lewaZEvWrr31RRddHAWcoABB3IULr5yZrXQd/Am/bCo6MWhXuMHVWOillESM0eG9eWLliWY5mYli3MkyTUNX4ll4k/Zn+3lx1lbeOeeB+ksLct3biXp6xXYPOstOpniDuDxBBpWvUdM4i1ibWHu3bhTEdWUc5C/WKhy27hIIhoDKZ3yg7RPMw2Bw7OitiYVmUE9WwgEgE5idNOPCsOvuk+f7DNiVXB20uJnY3HeyCSpS2ZVjI4O4MDmjniK5LXk/df1vTPSzubzh1yFWKZBsgTsBB3KFA74mkGFPdZ/CY4TW75+prGujOXRcqNqix6I2ynmQdJ478aXo2Fw7FLjbIgVi3JmYIoA4ltdOSE8KXzD1v6D+dbsmXM0S+3i74GtoNWb0VEtG/IKO8kgd2p4GhLet/uh/O9M9K2kVbYtsXRlDlyMuZxKsI4BdgNfSJntABALWOceGprKbdLF4xXsBLaC2quXdQzOXJAVXJbWB2ljYZ++uaKb6PtM7oiLmLkJl2nNoQTw334b8K6n+B4b/wCws/6d0+8b01axcscOLv8ALkYRGZ1CtlMzmMwoGpYwCYAkmAfbtVYxVztkdivBioBPMxrEmdK9C+GtWMNdNq6mIdyqM6oyhEOpADayxjXuHI15utZS44yXzynp5TPK2eOAHtmNyeMQPwogNboCkiQokTziO6sOwhpZiS3ZMQNT8BRHdoPZ9/6VnDAZRHHU+NBWR/WHlV4dtI4jfxojNSr3IaRx3HwoHKDeOw4k6fnWEvEmAKP1YmaAeQ+t7hUosVKBHE3y7sx3Y+XIezaj4OxJFG6awmVsw9FtfBuI/HzoOAuwaD0WGSBQusFtyD6LywgEwftCBwMz50S1dETNYw3aJc/a0Ucl4ee/lyoNNjE5n+Vvyrkupu3c2mVdtQfMcD+ldpq5GKQ27gcei+jdx5/PfQdALAoN3Ttct/Dj891FzgihMZMcOP4Cghcd/kaE6MYMEJJloMEiOyPMHyoxNBuA6Eb8uYqxOVmj4LFvadLiGGRgV/LwIkeBpd9CQdCNCKic6nMpZMpq9U30wbbXWewCEeHykRkZtWXvAaYI0ggcKro7o17uZvsIC90qVzKiiWYJMmRIBgid4pej4DGNZdXXdeHAg6Mp5gjSKuOrlyzlLjhqc2QDFYku5YgCYhRsqgAKo7gAB7KHRemcKtpwU/yrgz2jyU7qTzUyvhB40pbJJAGpJAAG5J0AA50ssuquNlxlnTv3MO+JtLdQS6Zbd2WAzCD1TyxEkqjIdZ/Zg/aNJ/4Pe9Uf6lv+6p0k4QLYUgi2SXI2a6dG14hYCD/xY/apEGrdM/qs3Na+zrdNJ1QXDAa2zmun1rzCG8Qi9gfxkelXHy108R+1tC59u2FS53p6Nt/ZGQ+CetXPqWNY3g1gLZuTZAJLmUjWHA+DKCD/AAnYVf8Ag971B/Pb/uots9VZLbPeBVOa2vRdv4yCg7lfnXNJq7mptme7duOtOndsNhrZZwBduSiAMrZEgZ2lSQCQQgGhgseVccU3hxnBt+sZTufYDwYdnxynhSYJ5HvEGpWsZq3fZzo7F9WxzDMjqVdeYOx8Qfx509f+jWLSZsPA1mViN/SmJp76CdCm7ca+8hLEMsjRrm6DXfLox/h51v6U9NYo3WR77ZYIygwCNthXfHHfp7y6lePP1tf1Hw/T1vXO+v5eVeY0GtRFgRRKy4rzvcwaWJysdCQdYHA8aOWrCCdTx+HCgA96eB8qAvOmri0sRBoG8Io1PGmKQsvlM8ONPdYOY8xQXUqsw5jzqUGemcVmbID2V3724+W3nSNhJNOXOjSJMkneOdMYbCjRhsdqA9jCIRqopnC3TBVvSXQ944H2j3zVolDu2ZIIYqYiQBqO+aBhnpO7Dtl3VdW7zwH4+Vc+5inRyGJMHuEjyrdrHjWFy6zvO/fxoOxhMQ1rW2cngB+NCxuNd3DXGzSMoMAREmDA13O/5Uul8GqvQRHP3RrNXm8JZJzoQ1h3iBzMR8fdXY6JxWEQft8O90917IPJUn31rpm9hLiKcNYay6E5wzm5mUgQQxEjKRsPWPIU1zwz7+OZrwRTpe+ghbjActD8RStzEM7FnMsdzprAjh3CsGhtS23tqSTqDUK88DTc6CjWMUFHaso/ezXgf6HUe6s4nFIykDD20aIDK98kc4D3CsxpqKTW+S70XTG3AuRXcIDOUMYni0d9Es464rKyuwKkMDMwQZGh31FLKtailytpJJNHMbbEh0EI4JUD7LDR0/hO33WU8aAK6GBvpat/tbYurcaUQs6xlzKXzIwbUysTByNPoiijH4b/AKFP9xiv76inMHfbB4frlgX8RK2pUNktKwz3CrAgl3UIsjZXI3FCH0uxv75f9DD/ANlV9Ku29vEJ/lXradUo2ti2qo1gcshHtDKeNcSruxmY43mx6LpW4cVYXE73LeW3iIgTv1dyBoMw7JgbjlXnGNei+i7C2t7EXBmsrbNtkJgXXcdlO6NGJGo050i2Pw3/AEKf7jE/31cudVz9Li3GdS/kp0VYDvL+gnaediAdF/iOnhPKul0x9JMRiGJa4wXNKqsIBw+yBPtoNu8ly062kFoqcxRWdpWAJzMS2h4feHfXMBrrlJPTmvPdYx/X6tuXjiQf63c/eP8Azt+dL375lc2o2k+6aujYPGmy6XAquVM5HEqw2IYciCRXKZWcO2WM7k5ArLtFb6RxxuEsLdtNZy20yj40uDNSxrG2zmaDNpeVaQzvuN63WAJJjwmorRWhMgJjhxouU8/hUQcPnxoBfV15VETKY4Hbx5UesXVkfCguKlCyP63uFSg9AwFJWyQzBQCsiTMQTqQBGvA+2o+OEdmSToJVgJOmpI2otpMqx5nmTufOgLNZJrOaslxzoEelUEBuIMeIrlzrTONvF20mBoPxNBtWzvQN4Rh9sso+6oc+RdfjXcxHUCxb6s5nZnLs3ZZQPRXIGYAHeZO3DauEi0VtNeXwqysZY71d9cms1M9F4pUuo7KGUMA6kSCp0aRx0mt9H9F9aJ67D29J/a3Mh/lAJ91AxGHyOy50eNM6Esh0nskgTy24Um5dpbjnLjv7uhiMHhJJTE3AsnKv1bMQOALG6JgcYE1zselhQMl53aR2Ws9WANdc2d51gRpvWKXxdvMJ4j4cass+S6s81YcVCaGcM6AZxlkAjMVBIOxykyPaK2iE7x5g/CpZZ3GpZeqwUbgJHiKu2hzDOIWRmIIJAnUgeFM1moqYu/mdpGWIVVmQqqIVQeMADXjvxoYNMJ0e1xSy5ewVQlnRJDBikF2AJAVh4AVB0Zd/7f8AuMP/AMlauN8MzOTi2bdboa5baxet4gsLAKXFdApdb05RkVoDZkDhhOyA/Z10MN0d+/xX+jb/AL6R6ZU2iMN+6nOeDXGALsOaxlVTxVQftVzgaXhJLedu70/dUW7NuwScOqsyMwhnfMQ7OODAwI4KV1giuC1dPov9oGw7EDPLIx2W4qnc8FZRlJ4dknRaD/hlz/tf7jD/APJSy3mM42YcW/X77J4a8bbq4+ydRzB0KnxEiiYt7YZihcqWMB0Uaa6yGPdpArF60VMGOfZZXH8yEisRT3WY+2t6ly90V1vcaw5k1tkmjW8I5UNKe27aU6fdZwR5VNLbJ2Wit21TKe2+aT2Qilf5y4P9JiqvKRtBJ2hlYe3KTVIkCKHfQTM3qjz/AAiiIBAj5761FDVspjhuPxFRRKxc01G9a6wfINZmaAedvV9/6VpHzCaJSzMFbub40DNSlvrS1KDsGKmahl6yyBvSAPKaAjPQLImXPHbuXh571Dhk9UeVSy/2TuvvHA/PfQW9sUqUyt3N8f1p0mguuYxwHxoMBardo4DU+PAfj5VvqV9UeQqguU9x9x/WgJWkbhVUTD2wzAEwNSTyVRLHTkPjVk3dJbqbVTvRmHVi7v8A5dpc7nnrCqDzZoAFIYq/ndnVQik9lF0CgCAPHST3k1q3iXy9W7t1ZOqycobcNHMHjykVcbJdsZy5Y6nG+y2LxDXHZ29JjJjYcAB3AAAdwFSy0HxqPaKkgiCDB9latWWZgqgszEKqjckmAAOZJAqXdvLc1JqdC1KY6TtJbcojZ8gCu+4Zxo5TQdgNIB4gTxpRLjKQwiQQRIkaGdRxHdUPAFxyT3D5mrFN9IYdQwdBCXAWQeqdnT+FtPAqeNKgVbNVJdzbr3f2+HD/APyYZVR/vWZC23/gYhD3Nb5GuWCOY869Z0CPqWGbFsP2t2Uw6mfRmWYjvK+S/erA+nOM52/5D/dWvbNbtef4ueVs9PHcl1vfnzpw07FvN9u4CF7k2Zv4iCo7g3OlJr130hufX8MuOAAvWStrFIsxlJPVXVWdAZKnvHITXkKlu3fGa3b2lWa1bHE7DU/gPb+dYcySTqSSSe86k01xyu+WXaPGsItN273YdGEhtV+642I7iJU+M8BSympolRhVlSNGEH2EeII0Psod14HwqltAgZgCfCnhdciM0Vi2PtHc+4cBVNYXkKlt9IO40P51FboTuAau48Uk7SaobN0c6WQZmk7D4UW1hQRJoqWQuxNQay1Kk1VUbbDEahmJGsFtD3UyjggEcayWpNrxUnKJB13jXjUD5al37TaGIEEiOOsa/OtKti25Dz/SiWbggR886A/Vt67eS/lW7W0cRv8AnWUeqY6iN/w+fjQGoV/aOJ2/P2b1qTyHn+lYT0jO428P/fwoILZ9c+S/lRrQut+zVtHMsNBmjYEjccgdJ1rM1auVII3Goq42SzfTOUtx47YWi2LDO6oi5mchVA4kmAK7d+70e/ay4gO2rQ1rLPGAQTrvvxoP1vD2gWw63esKsqtcZYQMMrMmUA5spYA8MxO4Fbvp/WOU9a3/ABsv/Gelb1lW6tLaP1YVDeLXJdlADNCuFCzIXScqrJpbB4wI4KoqNDAOpeUzArmGZjETvvy1pGpWZlY38Oa8/ut0KkqRBGhHKKqupjsMi2rLO7LddMxUIGBSYtuxLDKxAOkGVyHSdVMKlougd2yZlz9gDsyM2ufTSdae3d4X3am7+Dr3Fs4VEdFd7ri6iPmhUUMmbsMrS54TEIDxFIfXF/cWv/3/AOWmfpLbcYm7nic3Yy6LkgdXk+6Fyj2RXNqXcukwks3vvl676a3euTDYi2AuHe2LaoogW3QQ1s+wCOYXurydej6Cu5cFiVvEiw7IEgAt1w1zWxImFjNrqIHOuT1WH/fXP9Bf+WtWW8sYZ447xkvF8T5nfo/i2tC9cOtrq2t3EOzlwQieObtTwCtzrlLiE/dJ/Nc/vrodNqgtWFsktZIdi5GVmvBofOgJylU6uBJ7LAyZNcYU3qajUx3blfP4dW6UuWZRFR7Zl1UucyNlUP22J7LQpG3bB51zaLhMSUcMBO4ZTsysCrKe4gkVl1STDvEmOwCY4a5xPkKa902s4ugiaK2JZpLBGY7syKWPeSRqe+tdWmQsHOcEdgqFkGdVYMcxmNIEd9LTU5i6l78MXRsdCR3AT7BpNEDSJqpoKkiYAInnHjwqNSDzQSsmQY4ePz+dUXb1R5z7oranTTaihXEPM+78qXQCYPPWm2NJ3N6Do1KBh7umvCidYPkGg3UoWapQNFAdxQ7tgFSAIPCi1VQcgipbeDRMWwzGPb41m0nGqGbd7x8j+VMWzOvP4cKXSiK0HxqBiaHc9bl8ONZNyhtckxwGp/AUBevHJv5W/KqDZiBrA1MgieW/ztWg1U/Mbj4cRQEmpNZzCorrInUSJAMEjjrw041Uot+yyKjOIzrmWNSVkgEqNVBgxIE7iRrQVvLIkEiRI7SyOInhTGKxLXHZ2gFjsBAAACqqjgFUBQOAApdhIih4MYrEtcdnf0mMmNB3ADgAIAHAAChTWUmNRzE8DEbeY86haimsTiS9sZ2lreVUncpMZf4SZHi3OkUYkgQRJAkjQTxPdWk5nc/MVc1bd9szHU1DuNxUhbatNtNEE6SYzt3ktOtJk1iYPcfjVk1Ld1ZJJqDjGFbbodVYq0cmWQGHflZlPOe4Un9YXn7jVspLCQYGuvHl7KJRRbmHdVRyIS4GKGQZykK2x0IJ1Bg7abSGaL15CMhEqSGH3XXSR4qSCOOh+yKVDzSpPqt20oX1jnWbpqrdvMQPkczRRFvg6TrRloH1Y8/dWwpG5mgJQwYMcNxV5qtfj8/PtoBXXoAEnxpphNLAlWmgdRMoitVkGdaugzkqVc1KAr3ABJqmclezudppdsNpuTxgnSmEaRNQKfVwO+onLlTTCl2WW00jj+FBBVOGPAx4GjWLcakk+VHoOWyxwqW3g+NO4m3mHeNq55E1Q9betO3Abn5ml1U8z7vyo1lY4ye+oNHDqdx76Hdt5e0vDfwpiajkRrtxqjKXJE1qaB1ZIGXs6bfn886xcRgJmQNxQN3HDACNBsDz4nx/CKEba8h5VSXJFWzUSTSK/Pcb1OspV3M6eFYznnRTZM6cONTq19UeVBs3OFHBoNm6TAJJgQD3bx7zVzQX4Dj861sk0STS2MUAWxyFadjIn5NaAooNwQNNuXxo2HAAkcfhy8/wqmrNtcvt91AeqZZEGpVMaAJtDkKu23PcVdYiToYjSgNQyoNTIfWPu/KpbPDiPmaDSCNKhfWI3rVYYTp86UF1KzkPrH3flUoGaEgMsF27zGvGpUoLZjGw8z+VVbAyiPGpUoCqa1UqUA7rwJpK2mpnepUoDCtZo15VKlAQOKwxzEDhufwq6lASqNSpQKqCpIG06a1pi0bDz/SpUoNWrQjWt9UvKpUoFrq5W041sFuQ8/0qVKDVo6md6LNSpQZcSKyrHlUqUFFtQD7PGiVKlBKHsTxqVKDFxyBMVtRppUqUGqy41BG/4VKlBMzch5/pVo2/P5iqqUBKlSpQf//Z'), // Adicione a URL da imagem aqui
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Center(
              child: Card(
                elevation: 5.0,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: TextField(
                              controller: controleTexto,
                              // ignore: prefer_const_constructors
                              decoration: InputDecoration(
                                labelText: 'Digite o texto',
                              ),
                            ),
                          ),
                          ElevatedButton(
                            onPressed: buscar,
                            // ignore: sort_child_properties_last
                            child: Icon(Icons.search, color: Colors.white),
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.indigo)),
                          ),
                        ],
                      ), // Corrigi "mudo" para "mundo"

                      // ignore: unnecessary_const
                      const SizedBox(height: 20.0),

                      // ignore: unnecessary_const
                      const SizedBox(height: 20.0),

                      // ignore: unnecessary_const
                      const Text(
                        'resolvido',
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      // ignore: prefer_const_constructors
                      SizedBox(height: 10.0),
                      if (imagem.isNotEmpty)
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    ImagemTelaInteira(ImagemParemetro: imagem),
                              ),
                            );
                          },
                       
                      child:Center(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(25.0),
                          child: Image.network(imagem, height: 150),
                        ),
                      ),
                       ),

                      // ignore: prefer_const_constructors
                      Text(conteudo, style: TextStyle(fontSize: 16.0)),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  text(String s) {}
}

imagemTelaInteira({required String imagemParanetro}) {}

class ImagemTelaInteira extends StatelessWidget {
  // ignore: non_constant_identifier_names
  final String ImagemParemetro;
  // ignore: prefer_const_constructors_in_immutables
  ImagemTelaInteira({required this.ImagemParemetro});

  get image => null;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child:
            Hero(tag: ImagemParemetro, child: image.network(ImagemParemetro)),
      ),
    );
  }
}

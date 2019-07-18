import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '导航控制 Demo',
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
      ),
//      home: ProductListPage(
//          productsList: List.generate(20,(i) => Product('商品$i', '这是一个商品详情编号:$i')),
         home: FirstPage(),

//      ),
    );
  }
}


class Product {

  final String title;//商品标题
  final String description;//商品描述
  Product(this.title,this.description);

}

class ProductListPage extends StatelessWidget{

  final List <Product> productsList;
  ProductListPage({Key key,@required this.productsList}):super(key:key);

   @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(

      appBar: AppBar(
        title: Text(
          '导航传参',
        ),
      ),
      body: ListView.builder(
          itemCount: productsList.length,
          itemBuilder: (BuildContext context,int index){

            return ListTile(
              
              title: Text(productsList[index].title),
              onTap: (){
               Navigator.push(
                   
                   context,
                   MaterialPageRoute(builder: (BuildContext context){
                     
                     return  ProductDetail(
                       product: productsList[index],
                     );
                     
                   },));


              },
              
              
            );

          },
      ),
    );
  }

}

class ProductDetail extends StatelessWidget{
  
  
  final Product product;
  
  ProductDetail({Key key,this.product}):super(key:key);
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      
      
      appBar: AppBar(
        title: Text('${product.title}'),
      ),
      body: Center(
        child: Text(

          '${product.description}'

        ),
      ),
      
    );
  }
  
}





/***************************************************************/
//简单跳转
class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '路由导航跳转',
        ),
      ),
      body: Center(
        child: RouteButton(),
      ),
    );
  }
}

class RouteButton extends StatelessWidget{


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return RaisedButton(
        child: Text('查看商品详情页!'),
        onPressed: () {
//               Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: null), predicate)
//              Navigator.push(
//                  context,
//                  MaterialPageRoute(
//                      builder: (BuildContext context) => SecondPage()));
          _navigateRoute(context);//111
        }
        );
  }

  //返回传参
  _navigateRoute(BuildContext context)async{

    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SecondPage()),
    );

//    Scaffold.of(context).showSnackBar(SnackBar(content: Text('1111')));

    Scaffold.of(context).showSnackBar(

        SnackBar(content:Text('$result'))
    );


  }

}

//简单跳转
class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      
      appBar: AppBar(
        title: Text('第二页'),
      ),
      
      body: Center(

        child: Column(
          children: <Widget>[
          RaisedButton(
            child: Text('返回'),

            onPressed: (){

              Navigator.pop(context,'哈哈哈');

        }),

            RaisedButton(
                child: Text('返回'),

                onPressed: (){

                  Navigator.pop(context,'呵呵呵');

                }),

          ],
        ),
//        child: RaisedButton(
//            child: Text('返回'),
//
//            onPressed: (){
//
//              Navigator.pop(context);
//
//        }),
      ),
    );
  }
}

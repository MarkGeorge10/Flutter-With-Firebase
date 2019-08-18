import 'package:flutter/material.dart';

import 'crud.dart';



class PostPage extends StatefulWidget {
  @override
  _PostPageState createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  final _formKey = GlobalKey<FormState>();
  bool hidePass = true;

  String phoneString;
  String title;

  var category = [];

  List types = [
    "Laptops",
    "Mobiles",
    "Clothes",
    "Cars",
    "Accessories",
    "Books",
  ];

  List<DropdownMenuItem<String>> _dropDownMenuItems;
  String _category;
  CRUD crud = new CRUD();

  @override
  void initState() {
    _dropDownMenuItems = getDropDownMenuItems();
    _category = _dropDownMenuItems[0].value;
    super.initState();
  }

  List<DropdownMenuItem<String>> getDropDownMenuItems() {
    List<DropdownMenuItem<String>> items = new List();
    for (String city in types) {
      // here we are creating the drop down menu items, you can customize the item right here
      // but I'll just use a simple text for this
      items.add(new DropdownMenuItem(value: city, child: new Text(city)));
    }
    return items;
  }

  void changedDropDownItem(String selectedCity) {
    print("Selected city $selectedCity, we are going to refresh the UI");
    setState(() {
      _category = selectedCity;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text("Your Advertist Post"),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              InkWell(
                onTap: () {},
                child: Container(
                  width: MediaQuery.of(context).size.width / 4,
                  height: MediaQuery.of(context).size.width / 4,
                  decoration:
                  BoxDecoration(border: Border.all(color: Colors.black)),
                  child: Container(
                    color: Color.fromRGBO(0, 0, 0, 0.4),
                    child: Center(
                      child: Container(
                        child: GridTile(
                          child: Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                          footer: Center(
                            child: Text(
                              "Upload Photo",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(
                              width: 2,
                              color: Colors.white,
                              style: BorderStyle.solid),
                        ),
                      ),
                    ),
                  ),
                  margin: EdgeInsets.only(
                      bottom: MediaQuery.of(context).size.height / 45.0,
                      left: MediaQuery.of(context).size.width / 45.0,
                      top: MediaQuery.of(context).size.height / 35.0),
                ),
              ),

              ListTile(
                title: TextFormField(
                    obscureText: false,

                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      hintText: "Title",
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return "Title field cannot be empty";
                      }
                      else{
                        title = value;
                      }
                      return null;
                    },
                  onSaved: (input) => title = input
                ),
              ),

              // categories field

              ListTile(
                title: new DropdownButton(
                  value: _category,
                  items: _dropDownMenuItems,
                  onChanged: changedDropDownItem,
                ),
              ),

              /*ListTile(
                title: new DropdownButton(
                  value: subCategory,
                  items: _dropDownMenuItems,
                  onChanged: changedDropDownSubItem,
                ),
              ),*/

             /* ListTile(
                title: TextFormField(
                  obscureText: false,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    hintText: "Simple description",
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return "The Description field cannot be empty";
                    }
                    return null;
                  },
                ),
              ),*/
              //-----------------------------------------------------------

              // ----------------------------------------------------------------------
              SizedBox(
                height: MediaQuery.of(context).size.height / 50,
              ),

              Container(
                margin: EdgeInsets.all(20.0),
                height: MediaQuery.of(context).size.height / 15,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.lightBlue[600],
                  borderRadius: BorderRadius.all(Radius.circular(32)),
                ),
                child: FlatButton(
                  onPressed: () {
                    validateForm();
                  },
                  child: Center(
                    child: Text(
                      'POST',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
              //------------------------------Phone------------------------------
            ],
          ),
        ),
      ),
    );
  }

  Future<void> validateForm() async {
    FormState formState = _formKey.currentState;

    // ignore: unused_local_variable
    Map<String,dynamic> postData = {
      'category': this._category,
      'name': this.title
    };

    crud.addData(postData).then((result){
      print("done");
    }).catchError((e){
      print(e);
    });

    if (formState.validate()) {
      formState.reset();
    }
  }
}
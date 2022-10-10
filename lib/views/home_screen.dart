import 'package:flutter/material.dart';
import 'package:mvvm/res/text_styles.dart';
import 'package:mvvm/utils/utils.dart';
import 'package:mvvm/view_model/home_view_model.dart';
import 'package:mvvm/view_model/user_view_model.dart';
import 'package:provider/provider.dart';

import '../data/response/status.dart';
import '../utils/routes/routes_name.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeViewModel homeViewModel=HomeViewModel();
  @override
  void initState() {
    // TODO: implement initState
    homeViewModel.fetchUserListApi();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final userPreferences=Provider.of<UserViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          Center(
            child: GestureDetector(
                onTap: (){
                  userPreferences.removeUser().then((value){
                    Navigator.pushNamed(context, RoutesName.loginscreen);
                  });
                },
                child: Text('Logout')),
          ),
          SizedBox(width: 20,),
        ],
      ),
      body: ChangeNotifierProvider(create: (BuildContext context)=>homeViewModel,
        child: Consumer<HomeViewModel>(
            builder: (context,value,_){
              switch(value.userList.status!){
                case Status.LOADING:
                  return CircularProgressIndicator();
                case Status.ERROR:
                  return Utils.flushBarErrorMessage('Unable to Fetch Data', context);
                case Status.COMPLETED:
                  return ListView.builder(
                      itemCount: value.userList.data!.data!.length,
                      itemBuilder: (context,index){
                    return ListTile(
                      title: Text(value.userList.data!.data![index].firstName.toString()+' '+value.userList.data!.data![index].lastName.toString(),
                      style: RoundedButtonTextstyle.copyWith(
                        color: Colors.black
                      ),
                      ),
                      trailing: Text(value.userList.data!.data![index].id.toString()),
                      subtitle: Text(value.userList.data!.data![index].email.toString()),
                      leading: CircleAvatar(
                        radius: 30,
                          backgroundImage: NetworkImage(value.userList.data!.data![index].avatar.toString(),),
                      ),
                    );
                  });
              }
            }),
      ),
    );
  }
}

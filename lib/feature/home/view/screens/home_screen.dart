import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/feature/home/view/widgets/image_item_widget.dart';
import 'package:news_app/feature/home/view_model/home_cubit.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const routeName = 'HomeScreen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final HomeCubit _cubit;
  @override
  void initState() {
    super.initState();
    _cubit = HomeCubit();
    _cubit.getNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff202020),
      appBar: AppBar(
        backgroundColor: Color(0xff1877F2),
        title: Text('News App', style: Theme.of(context).textTheme.bodyLarge),
        centerTitle: true,
      ),
      body: BlocBuilder<HomeCubit, HomeState>(
        bloc: _cubit,
        builder: (context, state) {
          if (state is Homeloading) {
            return Center(child: CircularProgressIndicator());
          }
          if (state is HomeSuccess) {
            return ListView.builder(
              itemBuilder: (context, index) {
                return ImageItemWidget(
                  image: _cubit.articles[index].urlToImage ?? dummyImage,
                  title: _cubit.articles[index].title ?? "",
                  onTap: () {},
                );
              },
              itemCount: _cubit.articles.length,
            );
          }

          if (state is HomeError) {
            return Center(
              child: Text(
                state.error,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: .w400,
                  color: Color(0xffFFFFFF),
                ),
              ),
            );
          }
          return SizedBox.shrink();
        },
      ),
    );
  }
}

String dummyImage =
    'https://images.theconversation.com/files/651621/original/file-20250226-32-jxjhmy.jpg?ixlib=rb-4.1.0&rect=0%2C0%2C5991%2C3997&q=20&auto=format&w=320&fit=clip&dpr=2&usm=12&cs=strip';

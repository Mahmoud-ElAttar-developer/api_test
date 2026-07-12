import 'package:api_test/api_services.dart';
import 'package:flutter/material.dart';

class PostsView extends StatefulWidget {
  const PostsView({super.key});

  @override
  State<PostsView> createState() => _PostsViewState();
}

class _PostsViewState extends State<PostsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: const Text('Posts')),
      body: FutureBuilder(
        future:
            ApiServices.getPosts(), // تأكد إذا كانت الدالة تحتاج () للكلاس أم لا حسب تصميمك
        builder: (context, snapshot) {
          // 1. إذا كان التطبيق ما زال يحمل البيانات
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          // 2. إذا حدث خطأ (سيظهر لك النص هنا بدلاً من الدوران المستمر)
          if (snapshot.hasError) {
            return Center(child: Text('حدث خطأ: ${snapshot.error}'));
          }

          // 3. إذا رجعت البيانات بنجاح
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(snapshot.data![index].title ?? ''),
                  subtitle: Text(snapshot.data![index].body ?? ''),
                );
              },
            );
          } else {
            // 4. حالة احتياطية إذا لم يتوفر أي مما سبق

            return Center(
              child: Text(
                snapshot.hasError
                    ? 'الخطأ: ${snapshot.error}'
                    : 'لا توجد بيانات، الحالة: ${snapshot.connectionState}',
                style: const TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
            );
          }
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:news_app/sources/data/data_source/sources_Api_dataSourse.dart';
import 'package:news_app/sources/view/widgets/Sources_Tabs.dart';
import 'package:news_app/sources/view_model/sources_view_model.dart';
import 'package:news_app/shared/Error_widget.dart';
import 'package:news_app/shared/Loading_Indicator.dart';
import 'package:provider/provider.dart';

class CategoryDetails extends StatefulWidget {
  const CategoryDetails(this.Id, {super.key});
  final String Id;

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  @override
  void initState() {
    super.initState();
    viewModel.getSources(widget.Id);
  }

  final viewModel = SourcesViewModel();
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => viewModel,
        child: Consumer<SourcesViewModel>(builder: (_, viewmodel, __) {
          if (viewmodel.isloading) {
            return const LoadinIndicator();
          } else if (viewmodel.errormessage != null) {
            return ErrorIndicator();
          } else {
            return SourcesTabs(viewModel.sources);
          }
        }));
  }
}

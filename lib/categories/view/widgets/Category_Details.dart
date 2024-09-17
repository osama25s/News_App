import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/sources/data/data_source/sources_Api_dataSourse.dart';
import 'package:news_app/sources/view/widgets/Sources_Tabs.dart';
import 'package:news_app/sources/view_model/sources_states.dart';
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
    return BlocProvider(
        create: (_) => viewModel,
        child: BlocBuilder<SourcesViewModel, SourcesStates>(
            builder: (context, state) {
          if (state is LoadingGetSources) {
            return const LoadinIndicator();
          } else if (state is ErrorGetSources) {
            return ErrorIndicator();
          } else if (state is SuccessGetSources) {
            return SourcesTabs(state.sources);
          } else {
            return const SizedBox();
          }
        }));
  }
}

import 'package:bloc/bloc.dart';
import 'package:pattern_bloc/data/repositories/product_repo.dart';

import 'product_event.dart';
import 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductRepo? productRepo;

  ProductBloc({required this.productRepo}) : super(ProductInitialState());

  @override
  ProductState get initialState => ProductInitialState();

  @override
  Stream<ProductState> mapEventToState(ProductEvent event) async* {
    if (event is FetchEvent) {
      yield ProductLoadinglState();
      try {
        var products = await productRepo!.getProducts();
        yield ProductLoadedState(product: products);
      } catch (e) {
        yield ProductErrorState(message: e.toString());
      }
    }
  }
}

import 'package:bloc/bloc.dart';
import 'package:details_page/bloc/product_event.dart';
import 'package:details_page/bloc/product_state.dart';
import 'package:details_page/data/repositories/product_repo.dart';

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

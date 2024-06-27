import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tik_tok/Repositry/Api/Tik_tok/tik_tok_api.dart';
import 'package:tik_tok/Repositry/Model/tik_tok_model.dart';

part 'tiktok_event.dart';
part 'tiktok_state.dart';

class TiktokBloc extends Bloc<TiktokEvent, TiktokState> {
  late Tiktokmodel tiktokmodel;
  TiktokApi tiktokApi = TiktokApi();
  TiktokBloc() : super(TiktokInitial()) {
    on<TiktokEvent>((event, emit)async {
   emit(TiktokIblocloading());
   try {
     tiktokmodel= await tiktokApi.getTiktok();
     emit(Tiktokblocloaded());
   } catch (e) {
     print(e);
     emit(Tiktokblocerror());
   }
    });
  }
}

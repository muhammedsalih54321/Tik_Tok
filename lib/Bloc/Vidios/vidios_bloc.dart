import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tik_tok/Repositry/Api/Tik_tok/tik_tok_api.dart';
import 'package:tik_tok/Repositry/Model/Vidios_model.dart';

part 'vidios_event.dart';
part 'vidios_state.dart';

class VidiosBloc extends Bloc<VidiosEvent, VidiosState> {
  late VideoModel videoModel;
  TiktokApi vidioapi =TiktokApi();
  VidiosBloc() : super(VidiosInitial()) {
    on<fetchvideoevent>((event, emit)async {
     emit(Vidiosblocloading());
     try {
       videoModel=await vidioapi.getVidios(event.name);
       emit(Vidiosblocloaded());
     } catch (e) {
       print(e);
       emit(Vidiosblocerror());
     }
    });
  }
}

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';
import 'package:sira/data/services/firebase_api_services.dart';

part 'job_bloc_event.dart';
part 'job_bloc_state.dart';

class JobBlocBloc extends Bloc<JobBlocEvent, JobBlocState> {
  final _firebaseApiServices = FirebaseApiServices();

  JobBlocBloc() : super(JobBlocInitial()) {
    List jobsList;
    on<PostedJobsFetchEvent>((event, emit) async {
      emit(JobListBlocLoadingState());
      jobsList = await _firebaseApiServices.getJobsByPoster();
      emit(JobListBlocSuccessState(jobs: jobsList));
    });

    on<SearchedJobsFetchEvent>((event, emit) async {
      emit(JobListBlocLoadingState());
      jobsList = await _firebaseApiServices.getFilteredJobs(event.searchVal);
      print(jobsList);
      emit(JobSearchListBlocSuccessState(jobs: jobsList));
    });

    on<AvailableJobsFetchEvent>((event, emit) async {
      emit(JobListBlocLoadingState());
      jobsList = await _firebaseApiServices.getJobs();
      emit(JobListBlocSuccessState(jobs: jobsList));
    });

    on<AvailableSearchedJobsFetchEvent>((event, emit) async {
      emit(JobListBlocLoadingState());
      jobsList = await _firebaseApiServices.getAllFilteredJobs(event.searchVal);
      print(jobsList);
      emit(JobSearchListBlocSuccessState(jobs: jobsList));
    });
  }
}

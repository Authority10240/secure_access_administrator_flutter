part of 'dashboard_bloc.dart';
@immutable
sealed  class DashboardPageState extends BaseState {

  DashboardPageState({
    this.fiveDaysBackVisitations,
    this.fourDaysBackVisitations,
    this.sixDaysBackVisitations,
    this.threeDaysBackVisitations,
    this.twoDaysBackVisitations,
    this.yesterdaysVisitations,
    this.calenderDayVisitations,
    this.todaysVisitations, super.errorCode, super.errorMessage});

  Stream<QuerySnapshot<DashboardGetVisitationsModel?>>? todaysVisitations;
  Stream<QuerySnapshot<DashboardGetVisitationsModel?>>? yesterdaysVisitations;
  Stream<QuerySnapshot<DashboardGetVisitationsModel?>>? twoDaysBackVisitations;
  Stream<QuerySnapshot<DashboardGetVisitationsModel?>>? threeDaysBackVisitations;
  Stream<QuerySnapshot<DashboardGetVisitationsModel?>>? fourDaysBackVisitations;
  Stream<QuerySnapshot<DashboardGetVisitationsModel?>>? fiveDaysBackVisitations;
  Stream<QuerySnapshot<DashboardGetVisitationsModel?>>? sixDaysBackVisitations;
  Stream<QuerySnapshot<DashboardGetVisitationsModel?>>? calenderDayVisitations;
}

class DashboardPageInitState extends DashboardPageState {}

class DashboardPageGetVisitationState extends DashboardPageState{
  DashboardPageGetVisitationState({
    super.calenderDayVisitations,
    super.fiveDaysBackVisitations,
    super.fourDaysBackVisitations,
    super.sixDaysBackVisitations,
    super.threeDaysBackVisitations,
    super.todaysVisitations,
    super.twoDaysBackVisitations,
    super.yesterdaysVisitations,
    super.errorCode,
    super.errorMessage
  });
}

class DashBoardCalendarDateSelectedState extends DashboardPageState{

  DashBoardCalendarDateSelectedState({
    super.calenderDayVisitations,
    super.fiveDaysBackVisitations,
    super.fourDaysBackVisitations,
    super.sixDaysBackVisitations,
    super.threeDaysBackVisitations,
    super.todaysVisitations,
    super.twoDaysBackVisitations,
    super.yesterdaysVisitations,
    super.errorCode,
    super.errorMessage
});

}

class DashBoardCalendarChangedState extends DashboardPageState{

  DashBoardCalendarChangedState({
    super.calenderDayVisitations,
    super.fiveDaysBackVisitations,
    super.fourDaysBackVisitations,
    super.sixDaysBackVisitations,
    super.threeDaysBackVisitations,
    super.todaysVisitations,
    super.twoDaysBackVisitations,
    super.yesterdaysVisitations,
    super.errorCode,
    super.errorMessage
  });

}




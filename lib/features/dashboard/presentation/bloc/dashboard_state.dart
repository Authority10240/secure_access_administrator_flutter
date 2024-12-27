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

  Stream<QuerySnapshot<SecureAccessVisitationsModel?>>? todaysVisitations;
  Stream<QuerySnapshot<SecureAccessVisitationsModel?>>? yesterdaysVisitations;
  Stream<QuerySnapshot<SecureAccessVisitationsModel?>>? twoDaysBackVisitations;
  Stream<QuerySnapshot<SecureAccessVisitationsModel?>>? threeDaysBackVisitations;
  Stream<QuerySnapshot<SecureAccessVisitationsModel?>>? fourDaysBackVisitations;
  Stream<QuerySnapshot<SecureAccessVisitationsModel?>>? fiveDaysBackVisitations;
  Stream<QuerySnapshot<SecureAccessVisitationsModel?>>? sixDaysBackVisitations;
  Stream<QuerySnapshot<SecureAccessVisitationsModel?>>? calenderDayVisitations;
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




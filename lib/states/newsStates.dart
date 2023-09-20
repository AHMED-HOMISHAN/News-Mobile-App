// ignore_for_file: file_names

abstract class NewsStates {}

// ----------- Main App States ------------

class NewsInitialState extends NewsStates {}

class NewsLoadingState extends NewsStates {}

class NewsbottomNavgaitionState extends NewsStates {}

// ----------- Business States ------------
class NewsBusinessSuccessState extends NewsStates {}

class NewsBusinessErrorState extends NewsStates {}

// ----------- Sport States ------------
class NewsSportSuccessState extends NewsStates {}

class NewsSportErrorState extends NewsStates {}

// ----------- Science States ------------
class NewsScienceSuccessState extends NewsStates {}

class NewsScienceErrorState extends NewsStates {}

// ----------- Search States ------------

class NewsSerachLoadingState extends NewsStates {}

class NewsSearchSuccessState extends NewsStates {}

class NewsSearchErrorState extends NewsStates {}

// ----------- Brightness States ------------

class NewsThemeModeState extends NewsStates {}

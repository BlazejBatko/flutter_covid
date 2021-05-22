void main() {
  List<int> cases = [1, 2, 3, 4, 5, 6, 7];

  List<int> casesSub = [];

  for (int i = 0; i < cases.length - 1; i++) {
    casesSub.add(cases[i + 1] - cases[i]);
  }

  print('cases sub $casesSub');
}

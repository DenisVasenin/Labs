#define BOOST_TEST_DYN_LINK
#define BOOST_TEST_MODULE Test

#include "../libs/functions.hpp"
#include <boost/test/unit_test.hpp>
#include <set>

// =============================================================================

BOOST_AUTO_TEST_SUITE(GetNTest)

struct GetNData {
  char N_1[4] = "abc";
  char N_2[3] = "-5";
  char N_3[2] = "0";
  char N_4[2] = "2";
  char N_5[3] = "13";
  int expectedN_1_2_3 = -1;
  int expectedN_4 = 2;
  int expectedN_5 = 13;
};

BOOST_FIXTURE_TEST_CASE(test_case_1, GetNData) {
  int N = GetN(Mts::CharToWide(N_1));
  BOOST_CHECK(N == expectedN_1_2_3);
}

BOOST_FIXTURE_TEST_CASE(test_case_2, GetNData) {
  int N = GetN(Mts::CharToWide(N_2));
  BOOST_CHECK(N == expectedN_1_2_3);
}

BOOST_FIXTURE_TEST_CASE(test_case_3, GetNData) {
  int N = GetN(Mts::CharToWide(N_3));
  BOOST_CHECK(N == expectedN_1_2_3);
}

BOOST_FIXTURE_TEST_CASE(test_case_4, GetNData) {
  int N = GetN(Mts::CharToWide(N_4));
  BOOST_CHECK(N == expectedN_4);
}

BOOST_FIXTURE_TEST_CASE(test_case_5, GetNData) {
  int N = GetN(Mts::CharToWide(N_5));
  BOOST_CHECK(N == expectedN_5);
}

BOOST_AUTO_TEST_SUITE_END()

// ============================================================================

BOOST_AUTO_TEST_SUITE(MakeFirstSetTest)

struct MakeFirstSetData {
  int N_1 = 2, N_2 = 4, N_3 = 10, N_4 = 11, N_5 = 17, N_6 = 29;
  std::set<int> expectedSet_1 = {1, 2};
  std::set<int> expectedSet_2 = {1, 2, 3, 4};
  std::set<int> expectedSet_3 = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10};
  std::set<int> expectedSet_4 = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10};
  std::set<int> expectedSet_5 = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 12};
  std::set<int> expectedSet_6 = {1, 2,  3,  4,  5,  6,  7,  8,
                                 9, 10, 12, 18, 20, 21, 24, 27};
};

BOOST_FIXTURE_TEST_CASE(test_case_1, MakeFirstSetData) {
  std::set<int> s = MakeFirstSet(N_1);
  BOOST_CHECK(s == expectedSet_1);
}

BOOST_FIXTURE_TEST_CASE(test_case_2, MakeFirstSetData) {
  std::set<int> s = MakeFirstSet(N_2);
  BOOST_CHECK(s == expectedSet_2);
}

BOOST_FIXTURE_TEST_CASE(test_case_3, MakeFirstSetData) {
  std::set<int> s = MakeFirstSet(N_3);
  BOOST_CHECK(s == expectedSet_3);
}

BOOST_FIXTURE_TEST_CASE(test_case_4, MakeFirstSetData) {
  std::set<int> s = MakeFirstSet(N_4);
  BOOST_CHECK(s == expectedSet_4);
}

BOOST_FIXTURE_TEST_CASE(test_case_5, MakeFirstSetData) {
  std::set<int> s = MakeFirstSet(N_5);
  BOOST_CHECK(s == expectedSet_5);
}

BOOST_FIXTURE_TEST_CASE(test_case_6, MakeFirstSetData) {
  std::set<int> s = MakeFirstSet(N_6);
  BOOST_CHECK(s == expectedSet_6);
}

BOOST_AUTO_TEST_SUITE_END()

// ============================================================================

BOOST_AUTO_TEST_SUITE(MakeSecondSetTest)

struct MakeSecondSetData {
  int N_1 = 2, N_2 = 4, N_3 = 10, N_4 = 11, N_5 = 17, N_6 = 29;
  std::set<int> expectedSet_1 = {2};
  std::set<int> expectedSet_2 = {2, 4};
  std::set<int> expectedSet_3 = {2, 4, 6, 8};
  std::set<int> expectedSet_4 = {2, 4, 6, 8, 11};
  std::set<int> expectedSet_5 = {2, 4, 6, 8, 11, 13, 15, 17};
  std::set<int> expectedSet_6 = {2,  4,  6,  8,  11, 13, 15,
                                 17, 19, 20, 22, 24, 26, 28};
};

BOOST_FIXTURE_TEST_CASE(test_case_1, MakeSecondSetData) {
  std::set<int> s = MakeSecondSet(N_1);
  BOOST_CHECK(s == expectedSet_1);
}

BOOST_FIXTURE_TEST_CASE(test_case_2, MakeSecondSetData) {
  std::set<int> s = MakeSecondSet(N_2);
  BOOST_CHECK(s == expectedSet_2);
}

BOOST_FIXTURE_TEST_CASE(test_case_3, MakeSecondSetData) {
  std::set<int> s = MakeSecondSet(N_3);
  BOOST_CHECK(s == expectedSet_3);
}

BOOST_FIXTURE_TEST_CASE(test_case_4, MakeSecondSetData) {
  std::set<int> s = MakeSecondSet(N_4);
  BOOST_CHECK(s == expectedSet_4);
}

BOOST_FIXTURE_TEST_CASE(test_case_5, MakeSecondSetData) {
  std::set<int> s = MakeSecondSet(N_5);
  BOOST_CHECK(s == expectedSet_5);
}

BOOST_FIXTURE_TEST_CASE(test_case_6, MakeSecondSetData) {
  std::set<int> s = MakeSecondSet(N_6);
  BOOST_CHECK(s == expectedSet_6);
}

BOOST_AUTO_TEST_SUITE_END()

// ============================================================================

BOOST_AUTO_TEST_SUITE(CrossSetTest)

struct CrossSetData {
  std::set<int> set_1_1 = {2};
  std::set<int> set_1_2 = {2, 4};
  std::set<int> expectedSet_1 = {2};

  std::set<int> set_2_1 = {2, 4, 6, 8, 11, 45, 3, 12};
  std::set<int> set_2_2 = {2, 6, 8, 16, 12, 15, 96};
  std::set<int> expectedSet_2 = {2, 6, 8, 12};
};

BOOST_FIXTURE_TEST_CASE(test_case_1, CrossSetData) {
  std::set<int> s = CrossSet(set_1_1, set_1_2);
  BOOST_CHECK(s == expectedSet_1);
}

BOOST_FIXTURE_TEST_CASE(test_case_2, CrossSetData) {
  std::set<int> s = CrossSet(set_2_1, set_2_2);
  BOOST_CHECK(s == expectedSet_2);
}

BOOST_AUTO_TEST_SUITE_END()

// ============================================================================
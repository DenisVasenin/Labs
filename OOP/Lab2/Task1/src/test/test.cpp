#define BOOST_TEST_DYN_LINK
#define BOOST_TEST_MODULE Test

#include "../libs/functions.hpp"
#include <algorithm>
#include <boost/test/unit_test.hpp>
#include <vector>

// TEST GetVectorFromIstream ==================================================

BOOST_AUTO_TEST_SUITE(get_vector_from_istream)

	struct GetVectorFromIstreamData
	{
		std::vector<double> v;
		int expectedErrorCode = 0;
	};

	BOOST_FIXTURE_TEST_CASE(test_case_1, GetVectorFromIstreamData)
	{
		Mts::SetLocale("ru");
		bool isError;
		std::wcout << L"Enter double massive: ";
		v = GetVectorFromIstream(std::wcin, isError);
		BOOST_CHECK(!isError);
		// PrintVector(v);
	}

BOOST_AUTO_TEST_SUITE_END()

// TEST GetMaxValue ===========================================================

BOOST_AUTO_TEST_SUITE(get_max_value)

	struct TestMaxValueData
	{
		std::vector<double> v = { 0, 3.7, 6, 18, 2 };
		double expectedResult = 18;
	};

	BOOST_FIXTURE_TEST_CASE(test_case_1, TestMaxValueData)
	{
		BOOST_CHECK(GetMaxValue(v) == expectedResult);
	}

BOOST_AUTO_TEST_SUITE_END()

// TEST VectorProcessing ======================================================

BOOST_AUTO_TEST_SUITE(vector_processing)

	struct TestVectorProcessingData
	{
		std::vector<double> v = { 0 };
		std::vector<double> expectedResult = { 0 };
		double maxValue = 0;
		// std::vector<double> v = { 0, 6, 4, 8, 2 };
		// std::vector<double> expectedResult = { 0, 0.5, 1, 1.5, 2 };
		// double maxValue = 8;

		bool VectorCmp(std::vector<double> v, std::vector<double> e)
		{
			for (int i = 0; i < v.size(); i++)
			{
				if (v.at(i) != e.at(i))
					return false;
			}
			return true;
		}
	};

	BOOST_FIXTURE_TEST_CASE(test_case_1, TestVectorProcessingData)
	{
		bool execCode = VectorProcessing(v, maxValue);
		BOOST_CHECK(!execCode);
		BOOST_CHECK(VectorCmp(v, expectedResult));
	}

BOOST_AUTO_TEST_SUITE_END()

// ============================================================================
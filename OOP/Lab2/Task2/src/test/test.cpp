#define BOOST_TEST_DYN_LINK
#define BOOST_TEST_MODULE Test

#include "../libs/functions.hpp"
#include <boost/test/unit_test.hpp>
#include <string>

// TEST HtmlEncode ============================================================

BOOST_AUTO_TEST_SUITE(html_encode)

	struct HtmlEncodeData
	{
		std::wstring inputStr1 = L"Cat <says> \"Meow\". M&M's";
		std::wstring inputStr2 = L"<\"Cat\" & <says> & 'Meow'>";
		std::wstring inputStr3;
		std::wstring expectedStr1 = L"Cat &lt;says&gt; &quot;Meow&quot;. M&amp;M&apos;s";
		std::wstring expectedStr2 = L"&lt;&quot;Cat&quot; &amp; &lt;says&gt; &amp; &apos;Meow&apos;&gt;";
		std::wstring expectedStr3 = L"";
	};

	BOOST_FIXTURE_TEST_CASE(test_case_1, HtmlEncodeData)
	{
		std::wstring encodedStr = HtmlEncode(inputStr1);
		BOOST_CHECK(encodedStr == expectedStr1);
	}

	BOOST_FIXTURE_TEST_CASE(test_case_2, HtmlEncodeData)
	{
		std::wstring encodedStr = HtmlEncode(inputStr2);
		BOOST_CHECK(encodedStr == expectedStr2);
	}

	BOOST_FIXTURE_TEST_CASE(test_case_3, HtmlEncodeData)
	{
		std::wstring encodedStr = HtmlEncode(inputStr3);
		BOOST_CHECK(encodedStr == expectedStr3);
	}

BOOST_AUTO_TEST_SUITE_END()

// ============================================================================
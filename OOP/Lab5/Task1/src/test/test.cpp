#define BOOST_TEST_DYN_LINK
#define BOOST_TEST_MODULE Test

#include "../libs/CComplex.hpp"
#include <boost/test/unit_test.hpp>

BOOST_AUTO_TEST_SUITE(test)

	struct TestData
	{
		double epsilon = 0.01;
	};

	BOOST_FIXTURE_TEST_CASE(test_case_1, TestData)
	{
		std::cout << "==================== TEST Re()/Im() ====================";

		std::cout << std::endl
				  << std::endl;

		std::cout << "Test: real = 0, image = 0" << std::endl;
		CComplex complex1;
		std::cout << "Re : " << complex1.Re();
		std::cout << "  Expected Re: " << 0 << std::endl;
		BOOST_CHECK(complex1.Re() == 0);
		std::cout << "Im : " << complex1.Im();
		std::cout << "  Expected Im: " << 0 << std::endl;
		BOOST_CHECK(complex1.Im() == 0);

		std::cout << std::endl
				  << std::endl;

		std::cout << "Test: real = 10, image = 5.5" << std::endl;
		CComplex complex2(10, 5.5);
		std::cout << "Re : " << complex2.Re();
		std::cout << "  Expected Re: " << 10 << std::endl;
		BOOST_CHECK(complex2.Re() == 10);
		std::cout << "Im : " << complex2.Im();
		std::cout << "  Expected Im: " << 5.5 << std::endl;
		BOOST_CHECK(complex2.Im() == 5.5);

		std::cout << std::endl
				  << std::endl;

		std::cout << "Test: real = -10, image = -5.5" << std::endl;
		CComplex complex3(-10, -5.5);
		std::cout << "Re : " << complex3.Re();
		std::cout << "  Expected Re: " << -10 << std::endl;
		BOOST_CHECK(complex3.Re() == -10);
		std::cout << "Im : " << complex3.Im();
		std::cout << "  Expected Im: " << -5.5 << std::endl;
		BOOST_CHECK(complex3.Im() == -5.5);

		std::cout << std::endl
				  << std::endl;
	}

	BOOST_FIXTURE_TEST_CASE(test_case_2, TestData)
	{
		std::cout << "==================== TEST GetMagnitude() ====================";

		std::cout << std::endl
				  << std::endl;

		std::cout << "Test: real = 0, image = 0" << std::endl;
		CComplex complex1;
		std::cout << "Magnitude : " << complex1.GetMagnitude();
		std::cout << "  Expected magnitude: " << 0 << std::endl;
		BOOST_CHECK(complex1.GetMagnitude() == 0);

		std::cout << std::endl
				  << std::endl;

		std::cout << "Test: real = 1, image = 1" << std::endl;
		CComplex complex2(1, 1);
		std::cout << "Magnitude : " << complex2.GetMagnitude();
		std::cout << "  Expected magnitude: " << sqrt(2) << std::endl;
		BOOST_CHECK(complex2.GetMagnitude() == sqrt(2));

		std::cout << std::endl
				  << std::endl;

		std::cout << "Test: real = -3, image = 7" << std::endl;
		CComplex complex3(-3, 7);
		std::cout << "Magnitude : " << complex3.GetMagnitude();
		std::cout << "  Expected magnitude: " << 7.615 << std::endl;
		BOOST_CHECK(std::abs(complex3.GetMagnitude() - 7.615) < epsilon);

		std::cout << std::endl
				  << std::endl;

		std::cout << "Test: real = 2, image = 19" << std::endl;
		CComplex complex4(2, 19);
		std::cout << "Magnitude : " << complex4.GetMagnitude();
		std::cout << "  Expected magnitude: " << 19.104 << std::endl;
		BOOST_CHECK(std::abs(complex4.GetMagnitude() - 19.104) < epsilon);

		std::cout << std::endl
				  << std::endl;

		std::cout << "Test: real = D_MAX, image = D_MAX" << std::endl;
		CComplex complex5(D_MAX, D_MAX);
		std::cout << "Expected: overflow" << std::endl;
		BOOST_CHECK_THROW(complex5.GetMagnitude(), std::exception);

		std::cout << std::endl
				  << std::endl;
	}

	BOOST_FIXTURE_TEST_CASE(test_case_3, TestData)
	{
		std::cout << "==================== TEST GetArgument() ====================";

		std::cout << std::endl
				  << std::endl;

		std::cout << "Test: real = 0, image = 0" << std::endl;
		CComplex complex1(0, 0);
		std::cout << "Argument : " << complex1.GetArgument();
		std::cout << "  Expected argument: " << 0 << std::endl;
		BOOST_CHECK(complex1.GetArgument() == 0);

		std::cout << std::endl
				  << std::endl;

		std::cout << "Test: real = 1, image = 1" << std::endl;
		CComplex complex2(1, 1);
		std::cout << "Argument : " << complex2.GetArgument();
		std::cout << "  Expected argument: " << 45 << std::endl;
		BOOST_CHECK(complex2.GetArgument() == 45);

		std::cout << std::endl
				  << std::endl;

		std::cout << "Test: real = 0, image = 1" << std::endl;
		CComplex complex3(0, 1);
		std::cout << "Argument : " << complex3.GetArgument();
		std::cout << "  Expected argument: " << 90 << std::endl;
		BOOST_CHECK(complex3.GetArgument() == 90);

		std::cout << std::endl
				  << std::endl;

		std::cout << "Test: real = -1, image = 1" << std::endl;
		CComplex complex4(-1, 1);
		std::cout << "Argument : " << complex4.GetArgument();
		std::cout << "  Expected argument: " << 135 << std::endl;
		BOOST_CHECK(complex4.GetArgument() == 135);

		std::cout << std::endl
				  << std::endl;

		std::cout << "Test: real = -1, image = 0" << std::endl;
		CComplex complex5(-1, 0);
		std::cout << "Argument : " << complex5.GetArgument();
		std::cout << "  Expected argument: " << 180 << std::endl;
		BOOST_CHECK(complex5.GetArgument() == 180);

		std::cout << std::endl
				  << std::endl;

		std::cout << "Test: real = -1, image = -1" << std::endl;
		CComplex complex6(-1, -1);
		std::cout << "Argument : " << complex6.GetArgument();
		std::cout << "  Expected argument: " << -135 << std::endl;
		BOOST_CHECK(complex6.GetArgument() == -135);

		std::cout << std::endl
				  << std::endl;

		std::cout << "Test: real = 0, image = -1" << std::endl;
		CComplex complex7(0, -1);
		std::cout << "Argument : " << complex7.GetArgument();
		std::cout << "  Expected argument: " << -90 << std::endl;
		BOOST_CHECK(complex7.GetArgument() == -90);

		std::cout << std::endl
				  << std::endl;

		std::cout << "Test: real = 1, image = -1" << std::endl;
		CComplex complex8(1, -1);
		std::cout << "Argument : " << complex8.GetArgument();
		std::cout << "  Expected argument: " << -45 << std::endl;
		BOOST_CHECK(complex8.GetArgument() == -45);

		std::cout << std::endl
				  << std::endl;

		std::cout << "Test: real = -1, image = -1" << std::endl;
		CComplex complex9(1, 0);
		std::cout << "Argument : " << complex9.GetArgument();
		std::cout << "  Expected argument: " << 0 << std::endl;
		BOOST_CHECK(complex9.GetArgument() == 0);

		std::cout << std::endl
				  << std::endl;
	}

	BOOST_FIXTURE_TEST_CASE(test_case_4, TestData)
	{
		std::cout << "==================== TEST operator + ====================";

		std::cout << std::endl
				  << std::endl;

		CComplex complexTest;
		CComplex complex1;
		CComplex complex2(1, 12);
		CComplex complex3(-3, 9);
		CComplex complex4(D_MAX, D_MAX);
		double num = 5;

		std::cout << "Complex1: re = 0, im = 0" << std::endl;
		std::cout << "Complex2: re = 1, im = 12" << std::endl;
		std::cout << "Complex3: re = -3, im = 9" << std::endl;
		std::cout << "Complex4: re = D_MAX, im = D_MAX" << std::endl;
		std::cout << "num = 5";

		std::cout << std::endl
				  << std::endl;

		std::cout << "Test: complex1 + complex1" << std::endl;
		complexTest = complex1 + complex1;
		std::cout << "Magnitude : " << complexTest.GetMagnitude();
		std::cout << "  Expected magnitude: " << 0 << std::endl;
		BOOST_CHECK(complexTest.GetMagnitude() == 0);

		std::cout << std::endl
				  << std::endl;

		std::cout << "Test: complex1 + complex2" << std::endl;
		complexTest = complex1 + complex2;
		std::cout << "Magnitude : " << complexTest.GetMagnitude();
		std::cout << "  Expected magnitude: " << 12.041 << std::endl;
		BOOST_CHECK(std::abs(complexTest.GetMagnitude() - 12.041) < epsilon);

		std::cout << std::endl
				  << std::endl;

		std::cout << "Test: 5 + complex1" << std::endl;
		complexTest = num + complex1;
		std::cout << "Magnitude : " << complexTest.GetMagnitude();
		std::cout << "  Expected magnitude: " << 5 << std::endl;
		BOOST_CHECK(std::abs(complexTest.GetMagnitude() - 5) < epsilon);

		std::cout << std::endl
				  << std::endl;

		std::cout << "Test: complex2 + complex3" << std::endl;
		complexTest = complex2 + complex3;
		std::cout << "Magnitude : " << complexTest.GetMagnitude();
		std::cout << "  Expected magnitude: " << 21.095 << std::endl;
		BOOST_CHECK(std::abs(complexTest.GetMagnitude() - 21.095) < epsilon);

		std::cout << std::endl
				  << std::endl;

		std::cout << "Test: complex2 + 5" << std::endl;
		complexTest = complex2 + num;
		std::cout << "Magnitude : " << complexTest.GetMagnitude();
		std::cout << "  Expected magnitude: " << 13.416 << std::endl;
		BOOST_CHECK(std::abs(complexTest.GetMagnitude() - 13.416) < epsilon);

		std::cout << std::endl
				  << std::endl;

		std::cout << "Test: complex4 + complex4" << std::endl;
		std::cout << "Expected: overflow" << std::endl;
		BOOST_CHECK_THROW(complex4 + complex4, std::exception);

		std::cout << std::endl
				  << std::endl;
	}

	BOOST_FIXTURE_TEST_CASE(test_case_5, TestData)
	{
		std::cout << "==================== TEST operator - ====================";

		std::cout << std::endl
				  << std::endl;

		CComplex complexTest;
		CComplex complex1;
		CComplex complex2(12, 1);
		CComplex complex3(-3, -6);
		CComplex complex4(D_MAX, D_MAX);
		double num = 2;

		std::cout << "Complex1: re = 0, im = 0" << std::endl;
		std::cout << "Complex2: re = 12, im = 1" << std::endl;
		std::cout << "Complex3: re = -3, im = -6" << std::endl;
		std::cout << "Complex4: re = D_MAX, im = D_MAX" << std::endl;
		std::cout << "num = 2";

		std::cout << std::endl
				  << std::endl;

		std::cout << "Test: complex1 - complex1" << std::endl;
		complexTest = complex1 - complex1;
		std::cout << "Magnitude : " << complexTest.GetMagnitude();
		std::cout << "  Expected magnitude: " << 0 << std::endl;
		BOOST_CHECK(complexTest.GetMagnitude() == 0);

		std::cout << std::endl
				  << std::endl;

		std::cout << "Test: complex1 - complex2" << std::endl;
		complexTest = complex1 - complex2;
		std::cout << "Magnitude : " << complexTest.GetMagnitude();
		std::cout << "  Expected magnitude: " << 12.041 << std::endl;
		BOOST_CHECK(std::abs(complexTest.GetMagnitude() - 12.041) < epsilon);

		std::cout << std::endl
				  << std::endl;

		std::cout << "Test: 2 - complex1" << std::endl;
		complexTest = num - complex1;
		std::cout << "Magnitude : " << complexTest.GetMagnitude();
		std::cout << "  Expected magnitude: " << 2 << std::endl;
		BOOST_CHECK(complexTest.GetMagnitude() == 2);

		std::cout << std::endl
				  << std::endl;

		std::cout << "Test: complex2 - complex3" << std::endl;
		complexTest = complex2 - complex3;
		std::cout << "Magnitude : " << complexTest.GetMagnitude();
		std::cout << "  Expected magnitude: " << 16.552 << std::endl;
		BOOST_CHECK(std::abs(complexTest.GetMagnitude() - 16.552) < epsilon);

		std::cout << std::endl
				  << std::endl;

		std::cout << "Test: complex2 - 2" << std::endl;
		complexTest = complex2 - num;
		std::cout << "Magnitude : " << complexTest.GetMagnitude();
		std::cout << "  Expected magnitude: " << 10.049 << std::endl;
		BOOST_CHECK(std::abs(complexTest.GetMagnitude() - 10.049) < epsilon);

		std::cout << std::endl
				  << std::endl;
	}

	BOOST_FIXTURE_TEST_CASE(test_case_6, TestData)
	{
		std::cout << "==================== TEST operator * ====================";

		std::cout << std::endl
				  << std::endl;

		CComplex complexTest;
		CComplex complex1;
		CComplex complex2(5, -7);
		CComplex complex3(1, 4);
		CComplex complex4(D_MAX, D_MAX);
		double num = 10;

		std::cout << "Complex1: re = 0, im = 0" << std::endl;
		std::cout << "Complex2: re = 5, im = -7" << std::endl;
		std::cout << "Complex3: re = 1, im = 4" << std::endl;
		std::cout << "Complex4: re = D_MAX, im = D_MAX" << std::endl;
		std::cout << "num = 10";

		std::cout << std::endl
				  << std::endl;

		std::cout << "Test: complex1 * complex1" << std::endl;
		complexTest = complex1 * complex1;
		std::cout << "Magnitude : " << complexTest.GetMagnitude();
		std::cout << "  Expected magnitude: " << 0 << std::endl;
		BOOST_CHECK(complexTest.GetMagnitude() == 0);

		std::cout << std::endl
				  << std::endl;

		std::cout << "Test: complex1 * complex2" << std::endl;
		complexTest = complex1 * complex2;
		std::cout << "Magnitude : " << complexTest.GetMagnitude();
		std::cout << "  Expected magnitude: " << 0 << std::endl;
		BOOST_CHECK(complexTest.GetMagnitude() == 0);

		std::cout << std::endl
				  << std::endl;

		std::cout << "Test: 10 * complex2" << std::endl;
		complexTest = num * complex2;
		std::cout << "Magnitude : " << complexTest.GetMagnitude();
		std::cout << "  Expected magnitude: " << 86.023 << std::endl;
		BOOST_CHECK(std::abs(complexTest.GetMagnitude() - 86.023) < epsilon);

		std::cout << std::endl
				  << std::endl;

		std::cout << "Test: complex2 * complex3" << std::endl;
		complexTest = complex2 * complex3;
		std::cout << "Magnitude : " << complexTest.GetMagnitude();
		std::cout << "  Expected magnitude: " << 35.468 << std::endl;
		BOOST_CHECK(std::abs(complexTest.GetMagnitude() - 35.468) < epsilon);

		std::cout << std::endl
				  << std::endl;

		std::cout << "Test: complex1 * 10" << std::endl;
		complexTest = complex1 * num;
		std::cout << "Magnitude : " << complexTest.GetMagnitude();
		std::cout << "  Expected magnitude: " << 0 << std::endl;
		BOOST_CHECK(complexTest.GetMagnitude() == 0);

		std::cout << std::endl
				  << std::endl;

		std::cout << "Test: complex4 * complex2" << std::endl;
		std::cout << "Expected: overflow" << std::endl;
		BOOST_CHECK_THROW(complex4 * complex2, std::exception);

		std::cout << std::endl
				  << std::endl;
	}

	BOOST_FIXTURE_TEST_CASE(test_case_7, TestData)
	{
		std::cout << "==================== TEST operator / ====================";

		std::cout << std::endl
				  << std::endl;

		CComplex complexTest;
		CComplex complex1;
		CComplex complex2(12, -6);
		CComplex complex3(6, -3);
		CComplex complex4(D_MAX, D_MAX);
		double num = 6;

		std::cout << "Complex1: re = 0, im = 0" << std::endl;
		std::cout << "Complex2: re = 12, im = -6" << std::endl;
		std::cout << "Complex3: re = 6, im = -3" << std::endl;
		std::cout << "Complex4: re = D_MAX, im = D_MAX" << std::endl;
		std::cout << "num = 6";

		std::cout << std::endl
				  << std::endl;

		std::cout << "Test: complex1 / complex1" << std::endl;
		std::cout << "Expected: division by zero" << std::endl;
		BOOST_CHECK_THROW(complex1 / complex1, std::exception);

		std::cout << std::endl
				  << std::endl;

		std::cout << "Test: complex1 / complex2" << std::endl;
		complexTest = complex1 / complex2;
		std::cout << "Magnitude : " << complexTest.GetMagnitude();
		std::cout << "  Expected magnitude: " << 0 << std::endl;
		BOOST_CHECK(complexTest.GetMagnitude() == 0);

		std::cout << std::endl
				  << std::endl;

		std::cout << "Test: 6 / complex2" << std::endl;
		complexTest = num / complex2;
		std::cout << "Magnitude : " << complexTest.GetMagnitude();
		std::cout << "  Expected magnitude: " << 0.447 << std::endl;
		BOOST_CHECK(std::abs(complexTest.GetMagnitude() - 0.447) < epsilon);

		std::cout << std::endl
				  << std::endl;

		std::cout << "Test: complex2 / complex3" << std::endl;
		complexTest = complex2 / complex3;
		std::cout << "Magnitude : " << complexTest.GetMagnitude();
		std::cout << "  Expected magnitude: " << 2 << std::endl;
		BOOST_CHECK(std::abs(complexTest.GetMagnitude() - 2) < epsilon);

		std::cout << std::endl
				  << std::endl;

		std::cout << "Test: complex1 / 6" << std::endl;
		complexTest = complex1 / num;
		std::cout << "Magnitude : " << complexTest.GetMagnitude();
		std::cout << "  Expected magnitude: " << 0 << std::endl;
		BOOST_CHECK(complexTest.GetMagnitude() == 0);

		std::cout << std::endl
				  << std::endl;

		std::cout << "Test: complex4 / complex2" << std::endl;
		std::cout << "Expected: overflow" << std::endl;
		BOOST_CHECK_THROW(complex4 / complex2, std::exception);

		std::cout << std::endl
				  << std::endl;
	}

	BOOST_FIXTURE_TEST_CASE(test_case_8, TestData)
	{
		std::cout << "==================== TEST operator unar + ====================";

		std::cout << std::endl
				  << std::endl;

		CComplex complex1;
		CComplex plusComplex1 = +complex1;
		CComplex complex2(12, -6);
		CComplex plusComplex2 = +complex2;

		std::cout << "Complex1: real=" << complex1.Re() << ",  image=" << complex1.Im() << std::endl;
		std::cout << "+Complex1: real=" << plusComplex1.Re() << ",  image=" << plusComplex1.Im() << std::endl;
		BOOST_CHECK(complex1.Re() == plusComplex1.Re());
		BOOST_CHECK(complex1.Im() == plusComplex1.Im());

		std::cout << "Complex2: real=" << complex2.Re() << ",  image=" << complex2.Im() << std::endl;
		std::cout << "+Complex2: real=" << plusComplex2.Re() << ",  image=" << plusComplex2.Im() << std::endl;
		BOOST_CHECK(complex2.Re() == plusComplex2.Re());
		BOOST_CHECK(complex2.Im() == plusComplex2.Im());

		std::cout << std::endl
				  << std::endl;
	}

	BOOST_FIXTURE_TEST_CASE(test_case_9, TestData)
	{
		std::cout << "==================== TEST operator unar - ====================";

		std::cout << std::endl
				  << std::endl;

		CComplex plusComplex1;
		CComplex minusComplex1 = -plusComplex1;
		CComplex plusComplex2(12, -6);
		CComplex minusComplex2 = -plusComplex2;

		std::cout << "Complex1: real=" << plusComplex1.Re() << ",  image=" << plusComplex1.Im() << std::endl;
		std::cout << "-Complex1: real=" << minusComplex1.Re() << ",  image=" << minusComplex1.Im() << std::endl;
		BOOST_CHECK(plusComplex1.Re() == -minusComplex1.Re());
		BOOST_CHECK(plusComplex1.Im() == -minusComplex1.Im());

		std::cout << "Complex2: real=" << plusComplex2.Re() << ",  image=" << plusComplex2.Im() << std::endl;
		std::cout << "-Complex2: real=" << minusComplex2.Re() << ",  image=" << minusComplex2.Im() << std::endl;
		BOOST_CHECK(plusComplex2.Re() == -minusComplex2.Re());
		BOOST_CHECK(plusComplex2.Im() == -minusComplex2.Im());

		std::cout << std::endl
				  << std::endl;
	}

	BOOST_FIXTURE_TEST_CASE(test_case_10, TestData)
	{
		std::cout << "==================== TEST operator += ====================";

		std::cout << std::endl
				  << std::endl;

		CComplex complex1;
		CComplex complex2(1, 12);
		CComplex complex3(-3, 9);
		CComplex complex4(D_MAX, D_MAX);
		double num = 5;

		std::cout << "Complex1: re = 0, im = 0" << std::endl;
		std::cout << "Complex2: re = 1, im = 12" << std::endl;
		std::cout << "Complex3: re = -3, im = 9" << std::endl;
		std::cout << "Complex4: re = D_MAX, im = D_MAX" << std::endl;
		std::cout << "num = 5";

		std::cout << std::endl
				  << std::endl;

		std::cout << "Test: complex1 += complex1" << std::endl;
		complex1 += complex1;
		std::cout << "Magnitude : " << complex1.GetMagnitude();
		std::cout << "  Expected magnitude: " << 0 << std::endl;
		BOOST_CHECK(complex1.GetMagnitude() == 0);

		std::cout << std::endl
				  << std::endl;

		std::cout << "Test: complex1 += complex2" << std::endl;
		complex1 += complex2;
		std::cout << "Magnitude : " << complex1.GetMagnitude();
		std::cout << "  Expected magnitude: " << 12.041 << std::endl;
		BOOST_CHECK(std::abs(complex1.GetMagnitude() - 12.041) < epsilon);

		std::cout << std::endl
				  << std::endl;

		std::cout << "Test: complex1 += 5" << std::endl;
		complex1 += num;
		std::cout << "Magnitude : " << complex1.GetMagnitude();
		std::cout << "  Expected magnitude: " << 13.416 << std::endl;
		BOOST_CHECK(std::abs(complex1.GetMagnitude() - 13.416) < epsilon);

		std::cout << std::endl
				  << std::endl;

		std::cout << "Test: complex2 += complex3" << std::endl;
		complex2 += complex3;
		std::cout << "Magnitude : " << complex2.GetMagnitude();
		std::cout << "  Expected magnitude: " << 21.095 << std::endl;
		BOOST_CHECK(std::abs(complex2.GetMagnitude() - 21.095) < epsilon);

		std::cout << std::endl
				  << std::endl;

		std::cout << "Test: complex2 += 5" << std::endl;
		complex2 += num;
		std::cout << "Magnitude : " << complex2.GetMagnitude();
		std::cout << "  Expected magnitude: " << 21.213 << std::endl;
		BOOST_CHECK(std::abs(complex2.GetMagnitude() - 21.213) < epsilon);

		std::cout << std::endl
				  << std::endl;

		std::cout << "Test: complex4 += complex4" << std::endl;
		std::cout << "Expected: overflow" << std::endl;
		BOOST_CHECK_THROW(complex4 += complex4, std::exception);

		std::cout << std::endl
				  << std::endl;
	}

	BOOST_FIXTURE_TEST_CASE(test_case_11, TestData)
	{
		std::cout << "==================== TEST operator -= ====================";

		std::cout << std::endl
				  << std::endl;

		CComplex complexTest;
		CComplex complex1;
		CComplex complex2(12, 1);
		CComplex complex3(-3, -6);
		CComplex complex4(D_MAX, D_MAX);
		double num = 2;

		std::cout << "Complex1: re = 0, im = 0" << std::endl;
		std::cout << "Complex2: re = 12, im = 1" << std::endl;
		std::cout << "Complex3: re = -3, im = -6" << std::endl;
		std::cout << "Complex4: re = D_MAX, im = D_MAX" << std::endl;
		std::cout << "num = 2";

		std::cout << std::endl
				  << std::endl;

		std::cout << "Test: complex1 -= complex1" << std::endl;
		complex1 -= complex1;
		std::cout << "Magnitude : " << complex1.GetMagnitude();
		std::cout << "  Expected magnitude: " << 0 << std::endl;
		BOOST_CHECK(complex1.GetMagnitude() == 0);

		std::cout << std::endl
				  << std::endl;

		std::cout << "Test: complex1 - complex2" << std::endl;
		complex1 -= complex2;
		std::cout << "Magnitude : " << complex1.GetMagnitude();
		std::cout << "  Expected magnitude: " << 12.041 << std::endl;
		BOOST_CHECK(std::abs(complex1.GetMagnitude() - 12.041) < epsilon);

		std::cout << std::endl
				  << std::endl;

		std::cout << "Test: complex1 -= 2" << std::endl;
		complex1 -= num;
		std::cout << "Magnitude : " << complex1.GetMagnitude();
		std::cout << "  Expected magnitude: " << 14.035 << std::endl;
		BOOST_CHECK(std::abs(complex1.GetMagnitude() - 14.035) < epsilon);

		std::cout << std::endl
				  << std::endl;

		std::cout << "Test: complex2 -= complex3" << std::endl;
		complex2 -= complex3;
		std::cout << "Magnitude : " << complex2.GetMagnitude();
		std::cout << "  Expected magnitude: " << 16.552 << std::endl;
		BOOST_CHECK(std::abs(complex2.GetMagnitude() - 16.552) < epsilon);

		std::cout << std::endl
				  << std::endl;

		std::cout << "Test: complex2 -= 2" << std::endl;
		complex2 -= num;
		std::cout << "Magnitude : " << complex2.GetMagnitude();
		std::cout << "  Expected magnitude: " << 14.764 << std::endl;
		BOOST_CHECK(std::abs(complex2.GetMagnitude() - 14.764) < epsilon);

		std::cout << std::endl
				  << std::endl;
	}

	BOOST_FIXTURE_TEST_CASE(test_case_12, TestData)
	{
		std::cout << "==================== TEST operator *= ====================";

		std::cout << std::endl
				  << std::endl;

		CComplex complex1;
		CComplex complex2(5, -7);
		CComplex complex3(1, 4);
		CComplex complex4(D_MAX, D_MAX);
		double num = 10;

		std::cout << "Complex1: re = 0, im = 0" << std::endl;
		std::cout << "Complex2: re = 5, im = -7" << std::endl;
		std::cout << "Complex3: re = 1, im = 4" << std::endl;
		std::cout << "Complex4: re = D_MAX, im = D_MAX" << std::endl;
		std::cout << "num = 10";

		std::cout << std::endl
				  << std::endl;

		std::cout << "Test: complex1 *= complex1" << std::endl;
		complex1 *= complex1;
		std::cout << "Magnitude : " << complex1.GetMagnitude();
		std::cout << "  Expected magnitude: " << 0 << std::endl;
		BOOST_CHECK(complex1.GetMagnitude() == 0);

		std::cout << std::endl
				  << std::endl;

		std::cout << "Test: complex1 *= complex2" << std::endl;
		complex1 *= complex2;
		std::cout << "Magnitude : " << complex1.GetMagnitude();
		std::cout << "  Expected magnitude: " << 0 << std::endl;
		BOOST_CHECK(complex1.GetMagnitude() == 0);

		std::cout << std::endl
				  << std::endl;

		std::cout << "Test: complex2 *= 10" << std::endl;
		complex2 *= num;
		std::cout << "Magnitude : " << complex2.GetMagnitude();
		std::cout << "  Expected magnitude: " << 86.023 << std::endl;
		BOOST_CHECK(std::abs(complex2.GetMagnitude() - 86.023) < epsilon);

		std::cout << std::endl
				  << std::endl;

		std::cout << "Test: complex2 *= complex3" << std::endl;
		complex2 *= complex3;
		std::cout << "Magnitude : " << complex2.GetMagnitude();
		std::cout << "  Expected magnitude: " << 354.682 << std::endl;
		BOOST_CHECK(std::abs(complex2.GetMagnitude() - 354.682) < epsilon);

		std::cout << std::endl
				  << std::endl;

		std::cout << "Test: complex1 *= 10" << std::endl;
		complex1 *= num;
		std::cout << "Magnitude : " << complex1.GetMagnitude();
		std::cout << "  Expected magnitude: " << 0 << std::endl;
		BOOST_CHECK(complex1.GetMagnitude() == 0);

		std::cout << std::endl
				  << std::endl;

		std::cout << "Test: complex4 *= complex2" << std::endl;
		std::cout << "Expected: overflow" << std::endl;
		BOOST_CHECK_THROW(complex4 *= complex2, std::exception);

		std::cout << std::endl
				  << std::endl;
	}

	BOOST_FIXTURE_TEST_CASE(test_case_13, TestData)
	{
		std::cout << "==================== TEST operator /= ====================";

		std::cout << std::endl
				  << std::endl;

		CComplex complexTest;
		CComplex complex1;
		CComplex complex2(12, -6);
		CComplex complex3(6, -2);
		CComplex complex4(D_MAX, D_MAX);
		double num = 6;

		std::cout << "Complex1: re = 0, im = 0" << std::endl;
		std::cout << "Complex2: re = 12, im = -6" << std::endl;
		std::cout << "Complex3: re = 6, im = -2" << std::endl;
		std::cout << "Complex4: re = D_MAX, im = D_MAX" << std::endl;
		std::cout << "num = 6";

		std::cout << std::endl
				  << std::endl;

		std::cout << "Test: complex1 /= complex1" << std::endl;
		std::cout << "Expected: division by zero" << std::endl;
		BOOST_CHECK_THROW(complex1 /= complex1, std::exception);

		std::cout << std::endl
				  << std::endl;

		std::cout << "Test: complex1 /= complex2" << std::endl;
		complex1 /= complex2;
		std::cout << "Magnitude : " << complex1.GetMagnitude();
		std::cout << "  Expected magnitude: " << 0 << std::endl;
		BOOST_CHECK(complex1.GetMagnitude() == 0);

		std::cout << std::endl
				  << std::endl;

		std::cout << "Test: complex2 /= 6" << std::endl;
		complex2 /= num;
		std::cout << "Magnitude : " << complex2.GetMagnitude();
		std::cout << "  Expected magnitude: " << 2.236 << std::endl;
		BOOST_CHECK(std::abs(complex2.GetMagnitude() - 2.236) < epsilon);

		std::cout << std::endl
				  << std::endl;

		std::cout << "Test: complex2 /= complex3" << std::endl;
		complex2 /= complex3;
		std::cout << "Magnitude : " << complex2.GetMagnitude();
		std::cout << "  Expected magnitude: " << 0.353 << std::endl;
		BOOST_CHECK(std::abs(complex2.GetMagnitude() - 0.353) < epsilon);

		std::cout << std::endl
				  << std::endl;

		std::cout << "Test: complex1 /= 6" << std::endl;
		complex1 /= num;
		std::cout << "Magnitude : " << complex1.GetMagnitude();
		std::cout << "  Expected magnitude: " << 0 << std::endl;
		BOOST_CHECK(complex1.GetMagnitude() == 0);

		std::cout << std::endl
				  << std::endl;

		std::cout << "Test: complex4 /= complex2" << std::endl;
		std::cout << "Expected: overflow" << std::endl;
		BOOST_CHECK_THROW(complex4 /= complex2, std::exception);

		std::cout << std::endl
				  << std::endl;
	}

	BOOST_FIXTURE_TEST_CASE(test_case_14, TestData)
	{
		std::cout << "==================== TEST operators == and != ====================";

		std::cout << std::endl
				  << std::endl;

		CComplex complex1(2, -3);
		CComplex complex2(2, -3);
		CComplex complex3(2, 0);
		double num = 2;

		std::cout << "Complex1: re = 2, im = -3" << std::endl;
		std::cout << "Complex2: re = 2, im = -3" << std::endl;
		std::cout << "Complex3: re = 2, im = 0" << std::endl;
		std::cout << "num = 2";

		std::cout << std::endl
				  << std::endl;

		std::cout << "Test: complex1 == complex1" << std::endl;
		std::cout << (complex1 == complex1) << std::endl;
		std::cout << "Expected: true" << std::endl;
		BOOST_CHECK(complex1 == complex1);

		std::cout << std::endl
				  << std::endl;

		std::cout << "Test: complex1 != complex1" << std::endl;
		std::cout << (complex1 != complex1) << std::endl;
		std::cout << "Expected: false" << std::endl;
		BOOST_CHECK(!(complex1 != complex1));

		std::cout << std::endl
				  << std::endl;

		std::cout << "Test: complex1 == complex2" << std::endl;
		std::cout << (complex1 == complex2) << std::endl;
		std::cout << "Expected: true" << std::endl;
		BOOST_CHECK(complex1 == complex2);

		std::cout << std::endl
				  << std::endl;

		std::cout << "Test: complex1 != complex2" << std::endl;
		std::cout << (complex1 != complex2) << std::endl;
		std::cout << "Expected: false" << std::endl;
		BOOST_CHECK(!(complex1 != complex2));

		std::cout << std::endl
				  << std::endl;

		std::cout << "Test: complex2 == complex3" << std::endl;
		std::cout << (complex2 == complex3) << std::endl;
		std::cout << "Expected: false" << std::endl;
		BOOST_CHECK(!(complex2 == complex3));

		std::cout << std::endl
				  << std::endl;

		std::cout << "Test: complex2 != complex3" << std::endl;
		std::cout << (complex2 != complex2) << std::endl;
		std::cout << "Expected: true" << std::endl;
		BOOST_CHECK(complex2 != complex3);

		std::cout << std::endl
				  << std::endl;

		std::cout << "Test: complex3 == num" << std::endl;
		std::cout << (complex3 == num) << std::endl;
		std::cout << "Expected: true" << std::endl;
		BOOST_CHECK(complex3 == num);

		std::cout << std::endl
				  << std::endl;

		std::cout << "Test: complex3 != num" << std::endl;
		std::cout << (complex3 != num) << std::endl;
		std::cout << "Expected: false" << std::endl;
		BOOST_CHECK(!(complex3 != num));

		std::cout << std::endl
				  << std::endl;
	}

	BOOST_FIXTURE_TEST_CASE(test_case_15, TestData)
	{
		std::cout << "==================== TEST operators << and >> ====================";

		std::cout << std::endl
				  << std::endl;

		CComplex complex;

		std::cout << "Test: cout << complex" << std::endl;
		std::cout << complex << std::endl;

		std::ifstream testFile("./data/input1", std::ios::in);
		if (!testFile.is_open())
			std::cout << "FILE WAS NOT OPENED." << std::endl;
		else
		{
			BOOST_CHECK_NO_THROW(testFile >> complex);
			std::cout << complex << std::endl;
			BOOST_CHECK_NO_THROW(testFile >> complex);
			std::cout << complex << std::endl;
			BOOST_CHECK_NO_THROW(testFile >> complex);
			std::cout << complex << std::endl;
			BOOST_CHECK_NO_THROW(testFile >> complex);
			std::cout << complex << std::endl;
			BOOST_CHECK_THROW(testFile >> complex, std::invalid_argument);
		}

		std::cout << std::endl
				  << std::endl;
	}

BOOST_AUTO_TEST_SUITE_END()

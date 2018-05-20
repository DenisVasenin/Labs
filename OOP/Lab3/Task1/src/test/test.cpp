#define BOOST_TEST_DYN_LINK
#define BOOST_TEST_MODULE Test

#include "../libs/CCar.hpp"
#include "../libs/functions.hpp"
#include <boost/test/unit_test.hpp>

// TEST turnOnEngine ===========================================================

BOOST_AUTO_TEST_SUITE(turnOnEngineTest)

	struct turnOnEngineData
	{
		CCar car;
	};

	BOOST_FIXTURE_TEST_CASE(test_case_1, turnOnEngineData)
	{
		std::cout << "============= TEST TURNONENGINE() =============" << std::endl;

		std::cout << "Test: Turn ON engine if: engine OFF." << std::endl;
		BOOST_CHECK(car.turnOnEngine() == true);
		BOOST_CHECK(car.checkEngineOn() == true);

		std::cout << "Test: Turn ON engine if: engine ON." << std::endl;
		BOOST_CHECK(car.turnOnEngine() == false);
		BOOST_CHECK(car.checkEngineOn() == true);
	}

BOOST_AUTO_TEST_SUITE_END()

// TEST setGear ==========================================================

BOOST_AUTO_TEST_SUITE(setGearTest)

	struct setGearData
	{
		CCar car;
	};

	BOOST_FIXTURE_TEST_CASE(test_case_3, setGearData)
	{
		std::cout << "=============== TEST SETGEAR() ===============" << std::endl;

		std::cout << "Test: Set gear 1 if: engine OFF." << std::endl;
		BOOST_CHECK(car.setGear(1) == false);
		BOOST_CHECK(car.checkGear() == 0);

		std::cout << "Test: Set gear 55 if: engine ON / gear 0 / speed 0." << std::endl;
		car.turnOnEngine();
		BOOST_CHECK(car.setGear(55) == false);
		BOOST_CHECK(car.checkGear() == 0);

		std::cout << "Test: Set gear -2 if: engine ON / gear 0 / speed 0." << std::endl;
		BOOST_CHECK(car.setGear(-2) == false);
		BOOST_CHECK(car.checkGear() == 0);

		std::cout << "Test: Set gear 2 if: engine ON / gear 0 / speed 0." << std::endl;
		BOOST_CHECK(car.setGear(2) == false);
		BOOST_CHECK(car.checkGear() == 0);

		std::cout << "Test: Set gear 1 if: engine ON / gear 0 / speed 0." << std::endl;
		BOOST_CHECK(car.setGear(1) == true);
		BOOST_CHECK(car.checkGear() == 1);

		std::cout << "Test: Set gear -1 if: engine ON / gear 1 / speed 0." << std::endl;
		BOOST_CHECK(car.setGear(-1) == true);
		BOOST_CHECK(car.checkGear() == -1);

		std::cout << "Test: Set gear 1 if: engine ON / gear -1 / speed 10." << std::endl;
		car.setSpeed(10);
		BOOST_CHECK(car.setGear(1) == false);
		BOOST_CHECK(car.checkGear() == -1);

		std::cout << "Test: Set gear 1 if: engine ON / gear -1 / speed 0." << std::endl;
		car.setSpeed(0);
		BOOST_CHECK(car.setGear(1) == true);
		BOOST_CHECK(car.checkGear() == 1);

		std::cout << "Test: Set gear -1 if: engine ON / gear 1 / speed 10." << std::endl;
		car.setSpeed(10);
		BOOST_CHECK(car.setGear(-1) == false);
		BOOST_CHECK(car.checkGear() == 1);

		std::cout << "Test: Set gear 2 if: engine ON / gear 1 / speed 10." << std::endl;
		BOOST_CHECK(car.setGear(2) == false);
		BOOST_CHECK(car.checkGear() == 1);

		std::cout << "Test: Set gear 2 if: engine ON / gear 1 / speed 20." << std::endl;
		car.setSpeed(20);
		BOOST_CHECK(car.setGear(2) == true);
		BOOST_CHECK(car.checkGear() == 2);
	}

BOOST_AUTO_TEST_SUITE_END()

// TEST setSpeed ==========================================================

BOOST_AUTO_TEST_SUITE(setSpeedTest)

	struct setSpeedData
	{
		CCar car;
	};

	BOOST_FIXTURE_TEST_CASE(test_case_4, setSpeedData)
	{
		std::cout << "=============== TEST SETSPEED() ===============" << std::endl;

		std::cout << "Test: Set speed 10 if: engine OFF." << std::endl;
		BOOST_CHECK(car.setSpeed(10) == false);
		BOOST_CHECK(car.checkSpeed() == 0);

		std::cout << "Test: Set speed 10 if: engine ON / gear 0 / speed 0." << std::endl;
		car.turnOnEngine();
		BOOST_CHECK(car.setSpeed(10) == false);
		BOOST_CHECK(car.checkSpeed() == 0);

		std::cout << "Test: Set speed -10 if: engine ON / gear 1 / speed 0." << std::endl;
		car.setGear(1);
		BOOST_CHECK(car.setSpeed(-10) == false);
		BOOST_CHECK(car.checkSpeed() == 0);

		std::cout << "Test: Set speed 25 if: engine ON / gear 1 / speed 0." << std::endl;
		BOOST_CHECK(car.setSpeed(25) == true);
		BOOST_CHECK(car.checkSpeed() == 25);

		std::cout << "Test: Set speed 50 if: engine ON / gear 1 / speed 25." << std::endl;
		BOOST_CHECK(car.setSpeed(50) == false);
		BOOST_CHECK(car.checkSpeed() == 25);

		std::cout << "Test: Set speed 50 if: engine ON / gear 2 / speed 25." << std::endl;
		car.setGear(2);
		BOOST_CHECK(car.setSpeed(50) == true);
		BOOST_CHECK(car.checkSpeed() == 50);

		std::cout << "Test: Set speed 0 if: engine ON / gear 2 / speed 50." << std::endl;
		BOOST_CHECK(car.setSpeed(0) == false);
		BOOST_CHECK(car.checkSpeed() == 50);

		std::cout << "Test: Set speed 0 if: engine ON / gear 0 / speed 20." << std::endl;
		car.setGear(0);
		BOOST_CHECK(car.setSpeed(0) == true);
		BOOST_CHECK(car.checkSpeed() == 0);

		std::cout << "Test: Set speed 30 if: engine ON / gear -1 / speed 0." << std::endl;
		car.setGear(-1);
		BOOST_CHECK(car.setSpeed(30) == false);
		BOOST_CHECK(car.checkSpeed() == 0);

		std::cout << "Test: Set speed 20 if: engine ON / gear -1 / speed 0." << std::endl;
		BOOST_CHECK(car.setSpeed(20) == true);
		BOOST_CHECK(car.checkSpeed() == 20);
	}

BOOST_AUTO_TEST_SUITE_END()

// TEST turnOffEngine ==========================================================

BOOST_AUTO_TEST_SUITE(turnOffEngineTest)

	struct turnOffEngineData
	{
		CCar car;
	};

	BOOST_FIXTURE_TEST_CASE(test_case_2, turnOffEngineData)
	{
		std::cout << "============ TEST TURNOFFENGINE() ============" << std::endl;

		std::cout << "Test: Turn OFF engine if: engine OFF." << std::endl;
		BOOST_CHECK(car.turnOffEngine() == false);
		BOOST_CHECK(car.checkEngineOn() == false);

		std::cout << "Test: Turn OFF engine if: engine ON." << std::endl;
		car.turnOnEngine();
		BOOST_CHECK(car.turnOffEngine() == true);
		BOOST_CHECK(car.checkEngineOn() == false);

		std::cout << "Test: Turn OFF engine if: engine ON / gear 1 / speed 0." << std::endl;
		car.turnOnEngine();
		car.setGear(1);
		BOOST_CHECK(car.turnOffEngine() == false);
		BOOST_CHECK(car.checkEngineOn() == true);

		std::cout << "Test: Turn OFF engine if: engine ON / gear 1 / speed 10." << std::endl;
		car.setSpeed(10);
		BOOST_CHECK(car.turnOffEngine() == false);
		BOOST_CHECK(car.checkEngineOn() == true);

		std::cout << "Test: Turn OFF engine if: engine ON / gear 0 / speed 10." << std::endl;
		car.setGear(0);
		BOOST_CHECK(car.turnOffEngine() == false);
		BOOST_CHECK(car.checkEngineOn() == true);

		std::cout << "Test: Turn OFF engine if: engine ON / gear 0 / speed 0." << std::endl;
		car.setSpeed(0);
		BOOST_CHECK(car.turnOffEngine() == true);
		BOOST_CHECK(car.checkEngineOn() == false);
	}

BOOST_AUTO_TEST_SUITE_END()
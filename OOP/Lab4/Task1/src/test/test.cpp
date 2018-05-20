#define BOOST_TEST_DYN_LINK
#define BOOST_TEST_MODULE Test

#include "../libs/CBodiesController.hpp"
#include <boost/test/unit_test.hpp>

BOOST_AUTO_TEST_SUITE(cbodies_test)

	struct TestData
	{
		double radius = 2, density = 5, width = 4, height = 6, depth = 11;
		double epsilon = 0.1;
		double sphere_volume = 33.510, sphere_mass = 167.551;
		double cylinder_volume = 75.398, cylinder_mass = 376.991;
		double cone_volume = 25.132, cone_mass = 125.663;
		double paralellepiped_volume = 264, paralellepiped_mass = 1320;
		double compound_volume = sphere_volume + cylinder_volume + paralellepiped_volume;
		double compound_mass = cylinder_mass + paralellepiped_mass + sphere_mass;
		double compound_density = compound_mass / compound_volume;
		bool isAdded = false;
		bool isContain = false;
	};

	BOOST_FIXTURE_TEST_CASE(csphere_test, TestData)
	{
		CSphere sphere(density, radius);
		std::cout << "===== TEST SPHERE =====" << std::endl;

		std::cout << "Test: getDensity()" << std::endl;
		std::cout << "Sphere density: " << sphere.getDensity();
		std::cout << "  Expected density: " << density << std::endl;
		BOOST_CHECK(sphere.getDensity() == density);
		std::cout << "Test: getRadius()" << std::endl;
		std::cout << "Sphere radius: " << sphere.getRadius();
		std::cout << "  Expected radius: " << radius << std::endl;
		BOOST_CHECK(sphere.getRadius() == radius);
		std::cout << "Test: getVolume()" << std::endl;
		std::cout << "Sphere volume: " << sphere.getVolume();
		std::cout << "  Expected volume: " << sphere_volume << std::endl;
		BOOST_CHECK(sphere.getVolume() - sphere_volume < epsilon);
		std::cout << "Test: getMass()" << std::endl;
		std::cout << "Sphere mass: " << sphere.getMass();
		std::cout << "  Expected mass: " << sphere_mass << std::endl;
		BOOST_CHECK(sphere.getMass() - sphere_mass < epsilon);

		std::cout << std::endl;
	}

	BOOST_FIXTURE_TEST_CASE(ccylinder_test, TestData)
	{
		CCylinder cylinder(density, radius, height);
		std::cout << "===== TEST CYLINDER =====" << std::endl;

		std::cout << "Test: getDensity()" << std::endl;
		std::cout << "Cylinder density: " << cylinder.getDensity();
		std::cout << "  Expected density: " << density << std::endl;
		BOOST_CHECK(cylinder.getDensity() == density);

		std::cout << "Test: getBaseRadius()" << std::endl;
		std::cout << "Cylinder base radius: " << cylinder.getBaseRadius();
		std::cout << "  Expected base radius: " << radius << std::endl;
		BOOST_CHECK(cylinder.getBaseRadius() == radius);

		std::cout << "Test: getHeight()" << std::endl;
		std::cout << "Cylinder height: " << cylinder.getHeight();
		std::cout << "  Expected height: " << height << std::endl;
		BOOST_CHECK(cylinder.getHeight() == height);

		std::cout << "Test: getVolume()" << std::endl;
		std::cout << "Cylinder volume: " << cylinder.getVolume();
		std::cout << "  Expected volume: " << cylinder_volume << std::endl;
		BOOST_CHECK(cylinder.getVolume() - cylinder_volume < epsilon);

		std::cout << "Test: getMass()" << std::endl;
		std::cout << "Cylinder mass: " << cylinder.getMass();
		std::cout << "  Expected mass: " << cylinder_mass << std::endl;
		BOOST_CHECK(cylinder.getMass() - cylinder_mass < epsilon);

		std::cout << std::endl;
	}

	BOOST_FIXTURE_TEST_CASE(ccone_test, TestData)
	{
		CCone cone(density, radius, height);
		std::cout << "===== TEST CONE =====" << std::endl;

		std::cout << "Test: getDensity()" << std::endl;
		std::cout << "Cone density: " << cone.getDensity();
		std::cout << "  Expected density: " << density << std::endl;
		BOOST_CHECK(cone.getDensity() == density);

		std::cout << "Test: getBaseRadius()" << std::endl;
		std::cout << "Cone base radius: " << cone.getBaseRadius();
		std::cout << "  Expected base radius: " << radius << std::endl;
		BOOST_CHECK(cone.getBaseRadius() == radius);

		std::cout << "Test: getHeight()" << std::endl;
		std::cout << "Cone height: " << cone.getHeight();
		std::cout << "  Expected height: " << height << std::endl;
		BOOST_CHECK(cone.getHeight() == height);

		std::cout << "Test: getVolume()" << std::endl;
		std::cout << "Cone volume: " << cone.getVolume();
		std::cout << "  Expected volume: " << cone_volume << std::endl;
		BOOST_CHECK(cone.getVolume() - cone_volume < epsilon);

		std::cout << "Test: getMass()" << std::endl;
		std::cout << "Cone mass: " << cone.getMass();
		std::cout << "  Expected mass: " << cone_mass << std::endl;
		BOOST_CHECK(cone.getMass() - cone_mass < epsilon);

		std::cout << std::endl;
	}

	BOOST_FIXTURE_TEST_CASE(cparalellepiped_test, TestData)
	{
		CParalellepiped paralellepiped(density, width, height, depth);
		std::cout << "===== TEST CPARALELLEPIPED =====" << std::endl;

		std::cout << "Test: getDensity()" << std::endl;
		std::cout << "Paralellepiped density: " << paralellepiped.getDensity();
		std::cout << "  Expected density: " << density << std::endl;
		BOOST_CHECK(paralellepiped.getDensity() == density);

		std::cout << "Test: getWidth()" << std::endl;
		std::cout << "Paralellepiped width: " << paralellepiped.getWidth();
		std::cout << "  Expected width: " << width << std::endl;
		BOOST_CHECK(paralellepiped.getWidth() == width);

		std::cout << "Test: getHeight()" << std::endl;
		std::cout << "Paralellepiped height: " << paralellepiped.getHeight();
		std::cout << "  Expected height: " << height << std::endl;
		BOOST_CHECK(paralellepiped.getHeight() == height);

		std::cout << "Test: getDepth()" << std::endl;
		std::cout << "Paralellepiped depth: " << paralellepiped.getDepth();
		std::cout << "  Expected depth: " << depth << std::endl;
		BOOST_CHECK(paralellepiped.getDepth() == depth);

		std::cout << "Test: getVolume()" << std::endl;
		std::cout << "Paralellepiped volume: " << paralellepiped.getVolume();
		std::cout << "  Expected volume: " << paralellepiped_volume << std::endl;
		BOOST_CHECK(paralellepiped.getVolume() - paralellepiped_volume < epsilon);

		std::cout << "Test: getMass()" << std::endl;
		std::cout << "Paralellepiped mass: " << paralellepiped.getMass();
		std::cout << "  Expected mass: " << paralellepiped_mass << std::endl;
		BOOST_CHECK(paralellepiped.getMass() - paralellepiped_mass < epsilon);

		std::cout << std::endl;
	}

	BOOST_FIXTURE_TEST_CASE(ccompound_test, TestData)
	{
		CSphere sphere(density, radius);
		CCylinder cylinder(density, radius, height);
		CCone cone(density, radius, height);
		CParalellepiped paralellepiped(density, width, height, depth);
		CCompound compound1;
		CCompound compound2;
		CCompound compound3;
		std::cout << "===== TEST CCOMPOUND =====" << std::endl;

		std::cout << "Test: addChildBody()" << std::endl;

		isAdded = compound1.addChildBody(cylinder);
		BOOST_CHECK(isAdded == true);
		std::cout << "Add cylinder to compound1: " << isAdded << std::endl;

		isAdded = compound1.addChildBody(paralellepiped);
		BOOST_CHECK(isAdded == true);
		std::cout << "Add paralellepiped to compound1: " << isAdded << std::endl;

		isAdded = compound1.addChildBody(sphere);
		BOOST_CHECK(isAdded == true);
		std::cout << "Add sphere to compound1: " << isAdded << std::endl;

		isAdded = compound1.addChildBody(cylinder);
		BOOST_CHECK(isAdded == false);
		std::cout << "Add cylinder to compound1: " << isAdded << std::endl;

		isAdded = compound2.addChildBody(compound1);
		BOOST_CHECK(isAdded == true);
		std::cout << "Add compound1 to compound2: " << isAdded << std::endl;

		isAdded = compound2.addChildBody(compound1);
		BOOST_CHECK(isAdded == false);
		std::cout << "Add compound1 to compound2: " << isAdded << std::endl;

		isAdded = compound1.addChildBody(compound2);
		BOOST_CHECK(isAdded == false);
		std::cout << "Add compound2 to compound1: " << isAdded << std::endl;

		isAdded = compound3.addChildBody(cone);
		BOOST_CHECK(isAdded == true);
		std::cout << "Add cone to compound3: " << isAdded << std::endl;

		isAdded = compound3.addChildBody(compound2);
		BOOST_CHECK(isAdded == true);
		std::cout << "Add compound2 to compound3: " << isAdded << std::endl;

		isAdded = compound1.addChildBody(compound3);
		BOOST_CHECK(isAdded == false);
		std::cout << "Add compound3 to compound1: " << isAdded << std::endl;

		isAdded = compound1.addChildBody(compound1);
		BOOST_CHECK(isAdded == false);
		std::cout << "Add compound1 to compound1: " << isAdded << std::endl;

		std::cout << std::endl;

		std::cout << "Test: isAlreadyContainBody()" << std::endl;

		isContain = compound2.isAlreadyContainBody(compound1, 0);
		BOOST_CHECK(isContain == true);
		std::cout << "Is compound2 contain compound1: " << isContain << std::endl;

		isContain = compound2.isAlreadyContainBody(cylinder, 0);
		BOOST_CHECK(isContain == true);
		std::cout << "Is compound2 contain cylinder: " << isContain << std::endl;

		isContain = compound2.isAlreadyContainBody(cone, 0);
		BOOST_CHECK(isContain == false);
		std::cout << "Is compound2 contain cone: " << isContain << std::endl;

		std::cout << std::endl;

		std::cout << "Test: getVolume()" << std::endl;
		std::cout << "Compound1 volume: " << compound1.getVolume();
		std::cout << "  Expected volume: " << compound_volume << std::endl;
		BOOST_CHECK(compound1.getVolume() - compound_volume < epsilon);

		std::cout << std::endl;

		std::cout << "Test: getMass()" << std::endl;
		std::cout << "Compound1 mass: " << compound1.getMass();
		std::cout << "  Expected mass: " << compound_mass << std::endl;
		BOOST_CHECK(compound1.getMass() - compound_mass < epsilon);

		std::cout << std::endl;

		std::cout << "Test: getDensity()" << std::endl;
		std::cout << "Compound1 density: " << compound1.getDensity();
		std::cout << "  Expected density: " << compound_density << std::endl;
		BOOST_CHECK(compound1.getDensity() - compound_density < epsilon);

		std::cout << std::endl;
	}

	BOOST_FIXTURE_TEST_CASE(cbodiescontroller_test, TestData)
	{
		std::cout << "===== TEST CBodiesController =====" << std::endl;

		CBodiesController controller1;
		std::ifstream inFile2("./data/input2");
		controller1.ReadBodiesFromIstream(inFile2);

		CBodiesController controller2;
		std::ifstream inFile3("./data/input3");
		controller2.ReadBodiesFromIstream(inFile3);

		std::cout << "Test: PrintBodyWithMaxMass()" << std::endl;

		std::cout << "Cone1 mass = 50 ; Cone2 mass = 33 ; Cone3 mass = 16" << std::endl;
		std::cout << "Expected cone with density = 50" << std::endl;
		controller1.PrintBodyWithMaxMass();

		std::cout << "Compound1 mass = 16 ; Compound2 mass = 49 ; Compound3 mass = 100" << std::endl;
		std::cout << "Expected compound with mass = 100" << std::endl;
		controller2.PrintBodyWithMaxMass();

		std::cout << "Test: PrintBodyWithMinWeightInWater()" << std::endl;

		std::cout << "Cone1 density = 6 ; Cone2 density = 4 ; Cone3 density = 2" << std::endl;
		std::cout << "Expected cone with density = 2" << std::endl;
		controller1.PrintBodyWithMinWeightInWater();

		std::cout << std::endl;
	}

BOOST_AUTO_TEST_SUITE_END()

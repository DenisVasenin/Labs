#define BOOST_TEST_DYN_LINK
#define BOOST_TEST_MODULE Test

#include "../libs/CHttpUrl.hpp"
#include <boost/test/unit_test.hpp>

BOOST_AUTO_TEST_SUITE(test)

	struct TestData
	{
		// DOMAINS ================================================================
		std::vector<std::string> validDomains = {
			"www.google.com",
			"goo-gle.com",
			"1go2og3le4.r5",
			"12.34.56",
			"googlecom",
			"g"
		};

		std::vector<std::string> invalidDomains = {
			"www..google.com",
			"google.com.",
			".google.com",
			"goo_gle.com",
			"google-.com",
			"-google.com",
			""
		};

		// DOCUMENTS ==============================================================
		std::vector<std::string> validDocuments = {
			"/index/php",
			"/index.php",
			"in-dex",
			"/",
			"",
			"-._~"
		};

		std::vector<std::string> invalidDocuments = {
			"/in\\dex/php",
			"/index/",
			"//in-dex",
			"/$",
			"\\",
			"//"
		};

		// PORTS ==================================================================
		std::vector<unsigned short> validPorts = {
			0,
			80,
			222,
			443,
			65535
		};

		// PROTOCOLS ==============================================================
		std::vector<Protocol> validProtocols = {
			Protocol::HTTP,
			Protocol::HTTPS
		};

		std::vector<Protocol> invalidProtocols = {
			Protocol::FTP
		};

		// URLs ===================================================================

		std::vector<std::string> validUrls = {
			"http://google.com/index.php",
			"http://google.com:80/index.php",
			"https://google.com:400/index.php",
			"google.com:65535/index/php",
			"https://google.com:80/",
			"http://google.com",
			"google.com:900",
			"google"
		};

		std::vector<std::string> invalidUrls = {
			"jy87yn8&$jnj_klkl.lll",
			"http:/google.com/index.php",
			"http://google.com:/index.php",
			"https://_/index.php",
			"http://google.com:-1/index/php",
			"google.com:65536/index/php",
			"http://google.com:80/index/",
			"ftp://google.com",
			"google.com:",
			"://http://google.com:80/index/",
			"http://http://google.com",
			"http://google.com:aaa/index",
			"http://",
			""
		};
	};

	// TEST FIRST CONSTRUCTOR ====================================================

	BOOST_FIXTURE_TEST_CASE(test_case_11, TestData)
	{
		std::cout << std::endl
				  << "TEST: VALID URL =====================================" << std::endl
				  << std::endl;
		for (size_t url_i = 0; url_i < validUrls.size(); url_i++)
		{
			std::string url = validUrls[url_i];
			std::cout << "Test ==================================" << std::endl;
			std::cout << "URL: " << url << std::endl;
			CHttpUrl* objPtr = nullptr;
			BOOST_CHECK_NO_THROW(objPtr = new CHttpUrl(url));
			std::string result = "fail";
			if (objPtr)
				result = objPtr->GetURL();
			if (objPtr)
				delete objPtr;
			std::cout << "Result: " << result << std::endl;
		}

		std::cout << std::endl
				  << std::endl;
	}

	BOOST_FIXTURE_TEST_CASE(test_case_12, TestData)
	{
		std::cout << std::endl
				  << "TEST: INVALID URL =====================================" << std::endl
				  << std::endl;
		for (size_t url_i = 0; url_i < invalidUrls.size(); url_i++)
		{
			std::string url = invalidUrls[url_i];
			std::cout << "Test ==================================" << std::endl;
			std::cout << "URL: " << url << std::endl;
			CHttpUrl* objPtr = nullptr;
			BOOST_CHECK_THROW(objPtr = new CHttpUrl(url), std::exception);
			std::string result = "fail";
			if (objPtr)
				result = objPtr->GetURL();
			if (objPtr)
				delete objPtr;
			std::cout << "Result: " << result << std::endl;
		}

		std::cout << std::endl
				  << std::endl;
	}

	// TEST SECOND CONSTRUCTOR ===================================================

	BOOST_FIXTURE_TEST_CASE(test_case_21, TestData)
	{
		std::cout << "TEST: VALID PROTOCOL, VALID DOMAIN, VALID DOCUMENT ===================" << std::endl
				  << std::endl;
		for (size_t prot_i = 0; prot_i < validProtocols.size(); prot_i++)
		{
			Protocol protocol = validProtocols[prot_i];
			for (size_t dom_i = 0; dom_i < validDomains.size(); dom_i++)
			{
				std::string domain = validDomains[dom_i];
				for (size_t doc_i = 0; doc_i < validDocuments.size(); doc_i++)
				{
					std::string document = validDocuments[doc_i];
					std::string result = "fail";
					std::cout << "Test ==================================" << std::endl;
					std::cout << "Protocol: " << PROTOCOL_DESCRIPTION[protocol].protToStr << std::endl;
					std::cout << "Domain: " << domain << std::endl;
					std::cout << "Document: " << document << std::endl;
					CHttpUrl* objPtr = nullptr;
					BOOST_CHECK_NO_THROW(objPtr = new CHttpUrl(domain, document, protocol));
					if (objPtr)
						result = objPtr->GetURL();
					if (objPtr)
						delete objPtr;
					std::cout << "Result: " << result << std::endl;
				}
			}
		}
		std::cout << std::endl
				  << std::endl;
	}

	BOOST_FIXTURE_TEST_CASE(test_case_22, TestData)
	{
		std::cout << "TEST: INVALID PROTOCOL, VALID DOMAIN, VALID DOCUMENT ===================" << std::endl
				  << std::endl;
		for (size_t prot_i = 0; prot_i < invalidProtocols.size(); prot_i++)
		{
			Protocol protocol = invalidProtocols[prot_i];
			for (size_t dom_i = 0; dom_i < validDomains.size(); dom_i++)
			{
				std::string domain = validDomains[dom_i];
				for (size_t doc_i = 0; doc_i < validDocuments.size(); doc_i++)
				{
					std::string document = validDocuments[doc_i];
					std::string result = "fail";
					std::cout << "Test ==================================" << std::endl;
					std::cout << "Protocol: ftp" << std::endl;
					std::cout << "Domain: " << domain << std::endl;
					std::cout << "Document: " << document << std::endl;
					CHttpUrl* objPtr = nullptr;
					BOOST_CHECK_THROW(objPtr = new CHttpUrl(domain, document, protocol), std::invalid_argument);
					if (objPtr)
						result = objPtr->GetURL();
					if (objPtr)
						delete objPtr;
					std::cout << "Result: " << result << std::endl;
				}
			}
		}
		std::cout << std::endl
				  << std::endl;
	}

	BOOST_FIXTURE_TEST_CASE(test_case_23, TestData)
	{
		std::cout << "TEST: VALID PROTOCOL, INVALID DOMAIN, VALID DOCUMENT ===================" << std::endl
				  << std::endl;
		for (size_t prot_i = 0; prot_i < validProtocols.size(); prot_i++)
		{
			Protocol protocol = validProtocols[prot_i];
			for (size_t dom_i = 0; dom_i < invalidDomains.size(); dom_i++)
			{
				std::string domain = invalidDomains[dom_i];
				for (size_t doc_i = 0; doc_i < validDocuments.size(); doc_i++)
				{
					std::string document = validDocuments[doc_i];
					std::string result = "fail";
					std::cout << "Test ==================================" << std::endl;
					std::cout << "Protocol: " << PROTOCOL_DESCRIPTION[protocol].protToStr << std::endl;
					std::cout << "Domain: " << domain << std::endl;
					std::cout << "Document: " << document << std::endl;
					CHttpUrl* objPtr = nullptr;
					BOOST_CHECK_THROW(objPtr = new CHttpUrl(domain, document, protocol), std::invalid_argument);
					if (objPtr)
						result = objPtr->GetURL();
					if (objPtr)
						delete objPtr;
					std::cout << "Result: " << result << std::endl;
				}
			}
		}
		std::cout << std::endl
				  << std::endl;
	}

	BOOST_FIXTURE_TEST_CASE(test_case_24, TestData)
	{
		std::cout << "TEST: VALID PROTOCOL, VALID DOMAIN, INVALID DOCUMENT ===================" << std::endl
				  << std::endl;
		for (size_t prot_i = 0; prot_i < validProtocols.size(); prot_i++)
		{
			Protocol protocol = validProtocols[prot_i];
			for (size_t dom_i = 0; dom_i < validDomains.size(); dom_i++)
			{
				std::string domain = validDomains[dom_i];
				for (size_t doc_i = 0; doc_i < invalidDocuments.size(); doc_i++)
				{
					std::string document = invalidDocuments[doc_i];
					std::string result = "fail";
					std::cout << "Test ==================================" << std::endl;
					std::cout << "Protocol: " << PROTOCOL_DESCRIPTION[protocol].protToStr << std::endl;
					std::cout << "Domain: " << domain << std::endl;
					std::cout << "Document: " << document << std::endl;
					CHttpUrl* objPtr = nullptr;
					BOOST_CHECK_THROW(objPtr = new CHttpUrl(domain, document, protocol), std::invalid_argument);
					if (objPtr)
						result = objPtr->GetURL();
					if (objPtr)
						delete objPtr;
					std::cout << "Result: " << result << std::endl;
				}
			}
		}
		std::cout << std::endl
				  << std::endl;
	}

	// TEST THIRD CONSTRUCTOR =====================================================

	BOOST_FIXTURE_TEST_CASE(test_case_31, TestData)
	{
		std::cout << "TEST VALID PROTOCOL, VALID DOMAIN, VALID PORT, VALID DOCUMENT ===================" << std::endl
				  << std::endl;
		for (size_t prot_i = 0; prot_i < validProtocols.size(); prot_i++)
		{
			Protocol protocol = validProtocols[prot_i];
			for (size_t dom_i = 0; dom_i < validDomains.size(); dom_i++)
			{
				std::string domain = validDomains[dom_i];
				for (size_t port_i = 0; port_i < validPorts.size(); port_i++)
				{
					unsigned short port = validPorts[port_i];
					for (size_t doc_i = 0; doc_i < validDocuments.size(); doc_i++)
					{
						std::string document = validDocuments[doc_i];
						std::string result = "fail";
						std::cout << "Test ==================================" << std::endl;
						std::cout << "Protocol: " << PROTOCOL_DESCRIPTION[protocol].protToStr << std::endl;
						std::cout << "Domain: " << domain << std::endl;
						std::cout << "Port: " << port << std::endl;
						std::cout << "Document: " << document << std::endl;
						CHttpUrl* objPtr = nullptr;
						BOOST_CHECK_NO_THROW(objPtr = new CHttpUrl(domain, document, protocol, port));
						if (objPtr)
							result = objPtr->GetURL();
						if (objPtr)
							delete objPtr;
						std::cout << "Result: " << result << std::endl;
					}
				}
			}
		}
	}

	BOOST_FIXTURE_TEST_CASE(test_case_32, TestData)
	{
		std::cout << "TEST INVALID PROTOCOL, VALID DOMAIN, VALID PORT, VALID DOCUMENT ===================" << std::endl
				  << std::endl;
		for (size_t prot_i = 0; prot_i < invalidProtocols.size(); prot_i++)
		{
			Protocol protocol = invalidProtocols[prot_i];
			for (size_t dom_i = 0; dom_i < validDomains.size(); dom_i++)
			{
				std::string domain = validDomains[dom_i];
				for (size_t port_i = 0; port_i < validPorts.size(); port_i++)
				{
					unsigned short port = validPorts[port_i];
					for (size_t doc_i = 0; doc_i < validDocuments.size(); doc_i++)
					{
						std::string document = validDocuments[doc_i];
						std::string result = "fail";
						std::cout << "Test ==================================" << std::endl;
						std::cout << "Protocol: ftp" << std::endl;
						std::cout << "Domain: " << domain << std::endl;
						std::cout << "Port: " << port << std::endl;
						std::cout << "Document: " << document << std::endl;
						CHttpUrl* objPtr = nullptr;
						BOOST_CHECK_THROW(objPtr = new CHttpUrl(domain, document, protocol, port), std::invalid_argument);
						if (objPtr)
							result = objPtr->GetURL();
						if (objPtr)
							delete objPtr;
						std::cout << "Result: " << result << std::endl;
					}
				}
			}
		}
	}

	BOOST_FIXTURE_TEST_CASE(test_case_33, TestData)
	{
		std::cout << "TEST VALID PROTOCOL, INVALID DOMAIN, VALID PORT, VALID DOCUMENT ===================" << std::endl
				  << std::endl;
		for (size_t prot_i = 0; prot_i < validProtocols.size(); prot_i++)
		{
			Protocol protocol = validProtocols[prot_i];
			for (size_t dom_i = 0; dom_i < invalidDomains.size(); dom_i++)
			{
				std::string domain = invalidDomains[dom_i];
				for (size_t port_i = 0; port_i < validPorts.size(); port_i++)
				{
					unsigned short port = validPorts[port_i];
					for (size_t doc_i = 0; doc_i < validDocuments.size(); doc_i++)
					{
						std::string document = validDocuments[doc_i];
						std::string result = "fail";
						std::cout << "Test ==================================" << std::endl;
						std::cout << "Protocol: " << PROTOCOL_DESCRIPTION[protocol].protToStr << std::endl;
						std::cout << "Domain: " << domain << std::endl;
						std::cout << "Port: " << port << std::endl;
						std::cout << "Document: " << document << std::endl;
						CHttpUrl* objPtr = nullptr;
						BOOST_CHECK_THROW(objPtr = new CHttpUrl(domain, document, protocol, port), std::invalid_argument);
						if (objPtr)
							result = objPtr->GetURL();
						if (objPtr)
							delete objPtr;
						std::cout << "Result: " << result << std::endl;
					}
				}
			}
		}
	}

	BOOST_FIXTURE_TEST_CASE(test_case_34, TestData)
	{
		std::cout << "TEST VALID PROTOCOL, VALID DOMAIN, VALID PORT, INVALID DOCUMENT ===================" << std::endl
				  << std::endl;
		for (size_t prot_i = 0; prot_i < validProtocols.size(); prot_i++)
		{
			Protocol protocol = validProtocols[prot_i];
			for (size_t dom_i = 0; dom_i < validDomains.size(); dom_i++)
			{
				std::string domain = validDomains[dom_i];
				for (size_t port_i = 0; port_i < validPorts.size(); port_i++)
				{
					unsigned short port = validPorts[port_i];
					for (size_t doc_i = 0; doc_i < invalidDocuments.size(); doc_i++)
					{
						std::string document = invalidDocuments[doc_i];
						std::string result = "fail";
						std::cout << "Test ==================================" << std::endl;
						std::cout << "Protocol: " << PROTOCOL_DESCRIPTION[protocol].protToStr << std::endl;
						std::cout << "Domain: " << domain << std::endl;
						std::cout << "Port: " << port << std::endl;
						std::cout << "Document: " << document << std::endl;
						CHttpUrl* objPtr = nullptr;
						BOOST_CHECK_THROW(objPtr = new CHttpUrl(domain, document, protocol, port), std::invalid_argument);
						if (objPtr)
							result = objPtr->GetURL();
						if (objPtr)
							delete objPtr;
						std::cout << "Result: " << result << std::endl;
					}
				}
			}
		}
	}

BOOST_AUTO_TEST_SUITE_END()

// clang++

// .h

// enum Protocol { HTTP, HTTPS, FTP };

// struct ProtocolParameters {
// 	std::string protToStr;
// 	unsigned short defaultPort;
// };

// extern ProtocolParameters HTTP_PARMS;
// extern ProtocolParameters HTTPS_PARMS;
// extern std::map<Protocol, ProtocolParameters> PROTOCOL_DESCRIPTION;

// .cpp

// ProtocolParameters HTTP_PARMS = {"http", 80};
// ProtocolParameters HTTPS_PARMS = {"https", 443};

// std::map<Protocol, ProtocolParameters> PROTOCOL_DESCRIPTION {
// 	{ HTTP, HTTP_PARMS },
// 	{ HTTPS, HTTPS_PARMS } // ТУТ НЕТ FTP!!!
// };

std::cout << "|";
for (auto it = PROTOCOL_DESCRIPTION.begin(); it != PROTOCOL_DESCRIPTION.end(); it++)
{
	std::cout << it->second.protToStr << "|"; // ВЫВОДИТ 3 ПРОТОКОЛА!!!
}
std::cout << std::endl;

// std::cout << PROTOCOL_DESCRIPTION.count(Protocol::HTTP) << std::endl;
// std::cout << PROTOCOL_DESCRIPTION.count(Protocol::HTTPS) << std::endl;

// if (PROTOCOL_DESCRIPTION.find(Protocol::HTTP) != PROTOCOL_DESCRIPTION.end()) {
// 	std::cout << "HTTP WAS FINDED" << std::endl;
// }
// if (PROTOCOL_DESCRIPTION.find(Protocol::HTTPS) != PROTOCOL_DESCRIPTION.end()) {
// 	std::cout << "HTTPS WAS FINDED" << std::endl;
// }

// count == 1. ПОЧЕМУ???
std::cout << PROTOCOL_DESCRIPTION.count(FTP) << std::endl;

// FTP найден в PROTOCOL_DESCRIPTION. ПОЧЕМУ???
if (PROTOCOL_DESCRIPTION.find(FTP) != PROTOCOL_DESCRIPTION.end())
{
	std::cout << "FTP WAS FINDED" << std::endl;
}

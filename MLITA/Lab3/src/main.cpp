#include "stdafx.h"
#include "info.hpp"
#include "field.hpp"


// относительный путь до папки с файлами ввода-вывода
const char DATA_PATH[] = "data/";


int main(int argc, char* argv[])
{
	PrintTaskInfo();

	int exitCode = 0;

	std::fstream inFile;
	std::fstream outFile;
	if (argc < 2) {
		exitCode = 1;
	} else {
		std::string path(DATA_PATH + std::string(argv[1]));
		inFile.open(path.c_str(), std::ios::in);
		if (!inFile.is_open()) {
			exitCode = 2;
		} else {
			std::string path(DATA_PATH + std::string("output"));
			outFile.open(path.c_str(), std::ios::out);
			if (!outFile.is_open()) {
				exitCode = 3;
			} else {
				Field field;
				if (!field.getFieldFromFile(inFile)) {
					exitCode = 4;
				} else {
					// int fenceCount = field.buildFence();
					// if (fenceCount == 0) {
					// 	exitCode = 5;
					// } else {
					// 	std::cout << "Fence count: " << fenceCount << std::endl;
					// }
				}
			}
		}
	}

	inFile.close();
	outFile.close();

	PrintExitInfo(exitCode);
	
	return 0;
}

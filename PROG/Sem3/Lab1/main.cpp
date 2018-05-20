#include <QApplication>
#include "mainwindow.h"
#include "zastavka.h"

int main(int argc, char *argv[])
{
	QApplication app(argc, argv);
	MainWindow m;
	Zastavka zs;
	zs.exec();
	m.show();
	return app.exec();
}

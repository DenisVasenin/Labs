#include <QApplication>
#include "mainwindow.h"
#include "zastavka.h"

int main(int argc, char *argv[])
{
	QApplication app(argc, argv);
	MainWindow m;
	Zastavka zs;

//	QFile style("style.qss");
//	style.open(QIODevice::ReadOnly);
//	QString qssStr = style.readAll();
//	qApp->setStyleSheet(qssStr);

	zs.exec();
	m.show();
	return app.exec();
}

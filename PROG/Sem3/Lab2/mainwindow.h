#ifndef MAINWINDOW_H
#define MAINWINDOW_H

#include <QMainWindow>
#include <QCloseEvent>
#include <QTranslator>
#include <QFileDialog>
#include <QFile>
#include <QTextStream>
#include <QDateTime>
#include <QRegExp>

#include "abprogram.h"
#include "abauthor.h"
#include "warning.h"

namespace Ui
{
	class MainWindow;
}

class MainWindow : public QMainWindow
{
		Q_OBJECT

	public:
		explicit MainWindow(QWidget *parent = 0);
		~MainWindow();

	signals:
		void sigText(QString);

	protected:
		void changeEvent(QEvent *event);
		void closeEvent(QCloseEvent *event);

	private slots:
		void SetLang(QAction*);
		void on_toolButton_clicked();
		void on_pushButton_clicked();

	private:
		Ui::MainWindow *ui;
		QTranslator l_translator;
		Abprogram *ap;
		Abauthor *au;
		Warning *wr;
		QString str, str1, str2;
		QString date;
		QFile log;
		QFile file;
		QTextStream stream;
		QStringList list;
		QRegExp reg, reg1, reg2;
		int pos, pos1, count, lcount;
};

#endif // MAINWINDOW_H

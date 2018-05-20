#ifndef MAINWINDOW_H
#define MAINWINDOW_H

#include <QMainWindow>
#include <QTranslator>
#include "about.h"
#include "author.h"

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

	private slots:
		void changeEvent(QEvent *event);
		void closeEvent(QCloseEvent *event);
		void SetLang(QAction*);
		void on_act_author_triggered();
		void on_act_about_triggered();
		void on_pushButton_clicked();

	private:
		Ui::MainWindow *ui;
		QTranslator l_translator;
		About *ab;
		Author *au;

};

#endif // MAINWINDOW_H

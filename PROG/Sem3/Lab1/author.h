#ifndef AUTHOR_H
#define AUTHOR_H

#include <QDialog>

namespace Ui {
		class Author;
	}

class Author : public QDialog
{
		Q_OBJECT

	public:
		explicit Author(QWidget *parent = 0);
		~Author();

	protected:
		void changeEvent(QEvent *e);

	private slots:
		void on_pushButton_clicked();

	private:
		Ui::Author *ui;
};

#endif // AUTHOR_H

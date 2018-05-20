#ifndef ABAUTHOR_H
#define ABAUTHOR_H

#include <QDialog>

namespace Ui {
		class Abauthor;
	}

class Abauthor : public QDialog
{
		Q_OBJECT

	public:
		explicit Abauthor(QWidget *parent = 0);
		~Abauthor();

	protected:
		void changeEvent(QEvent *e);

	private:
		Ui::Abauthor *ui;
};

#endif // ABAUTHOR_H

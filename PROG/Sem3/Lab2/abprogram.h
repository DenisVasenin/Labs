#ifndef ABPROGRAM_H
#define ABPROGRAM_H

#include <QDialog>

namespace Ui {
		class Abprogram;
	}

class Abprogram : public QDialog
{
		Q_OBJECT

	public:
		explicit Abprogram(QWidget *parent = 0);
		~Abprogram();

	protected:
		void changeEvent(QEvent *e);

	private:
		Ui::Abprogram *ui;
};

#endif // ABPROGRAM_H

#ifndef ZASTAVKA_H
#define ZASTAVKA_H

#include <QDialog>

namespace Ui {
		class Zastavka;
	}

class Zastavka : public QDialog
{
		Q_OBJECT

	public:
		explicit Zastavka(QWidget *parent = 0);
		~Zastavka();

	protected:
		void changeEvent(QEvent *e);

	private slots:
		void on_pushButton_clicked();

	private:
		Ui::Zastavka *ui;
};

#endif // ZASTAVKA_H

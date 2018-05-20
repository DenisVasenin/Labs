#include "author.h"
#include "ui_author.h"

Author::Author(QWidget *parent) :
	QDialog(parent),
	ui(new Ui::Author)
{
	ui->setupUi(this);
}

Author::~Author()
{
	delete ui;
}

void Author::changeEvent(QEvent *e)
{
	QDialog::changeEvent(e);
	switch (e->type()) {
		case QEvent::LanguageChange:
			ui->retranslateUi(this);
			break;
		default:
			break;
	}
}

void Author::on_pushButton_clicked()
{
	Author::accept();
}

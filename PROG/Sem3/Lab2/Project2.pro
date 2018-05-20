#-------------------------------------------------
#
# Project created by QtCreator 2016-09-10T23:12:11
#
#-------------------------------------------------

QT       += core gui

greaterThan(QT_MAJOR_VERSION, 4): QT += widgets

TARGET = Project2
TEMPLATE = app


SOURCES += main.cpp \
	mainwindow.cpp \
	abauthor.cpp \
	abprogram.cpp \
	warning.cpp \
    zastavka.cpp

HEADERS  += mainwindow.h \
	abprogram.h \
	abauthor.h \
	warning.h \
    zastavka.h

FORMS    += mainwindow.ui \
	abauthor.ui \
	abprogram.ui \
	warning.ui \
    zastavka.ui

TRANSLATIONS += ru.ts en.ts

CODEC += UTF-8

RESOURCES += res.qrc

#ifndef MAINWINDOW_H
#define MAINWINDOW_H

#include <QMainWindow>
#include <QVBoxLayout>
#include <QPushButton>
#include <QCheckBox>

class MainWindow : public QMainWindow
{
    Q_OBJECT

public:
    MainWindow(QWidget *parent = 0);
    ~MainWindow();
private slots:
    void handleQPointerButton();
    void handleQScopedPointerButton();
private:
    QPushButton *m_qpointerButton;
    QPushButton *m_qscopedPointerButton;
    QCheckBox *m_doNotPopupCheck;
    QCheckBox *m_exceptionalReturnCheck;
};

#endif // MAINWINDOW_H

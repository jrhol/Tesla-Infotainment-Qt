#ifndef SYSTEM_H
#define SYSTEM_H

#include <QObject>
#include <QTimer>

class System : public QObject
{
    Q_OBJECT
    Q_PROPERTY(bool carLocked READ carLocked WRITE setcarLocked NOTIFY carLockedChanged FINAL)
    Q_PROPERTY(int outdoorTemp READ outdoorTemp WRITE setoutdoorTemp NOTIFY outdoorTempChanged FINAL)
    Q_PROPERTY(QString userName READ userName WRITE setuserName NOTIFY userNameChanged FINAL)
    Q_PROPERTY(QString currentTime READ currentTime WRITE setcurrentTime NOTIFY currentTimeChanged FINAL)

public:
    explicit System(QObject *parent = nullptr);

    bool carLocked() const;
    int outdoorTemp() const;
    QString userName() const;
    QString currentTime() const;

public slots:
    void setcarLocked(bool newCarLocked);
    void setoutdoorTemp(int newOutdoorTemp);
    void setuserName(const QString &newUserName);
    void setcurrentTime(const QString &newCurrentTime);

    void currentTimeTimerTimout();

signals:
    void carLockedChanged(bool carLocked);
    void outdoorTempChanged(int outdoorTemp);
    void userNameChanged(QString userName);
    void currentTimeChanged(QString currentTime);

private:
    bool m_carLocked;
    int m_outdoorTemp;
    QString m_userName;
    QString m_currentTime;
    QTimer * m_currentTimeTimer;
};

#endif // SYSTEM_H

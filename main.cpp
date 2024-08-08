#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>

#include <Controllers/system.h>
#include <Controllers/hvachandler.h>
#include <Controllers/audiocontroller.h>

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    System m_systemHandler;
    HVACHandler m_driverHVACHandler;
    HVACHandler m_passengerHVACHandler;
    AudioController m_audioController;


    QQmlApplicationEngine engine;

    QQmlContext * context ( engine.rootContext() );
    context->setContextProperty("systemHandler",&m_systemHandler);

    context->setContextProperty("driverHVAC",&m_driverHVACHandler);
    context->setContextProperty("passengerHVAC",&m_passengerHVACHandler);

    context->setContextProperty("audioController",&m_audioController);

    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreationFailed,
        &app,
        []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);
    engine.loadFromModule("TeslaInfotainment", "Main");



    return app.exec();
}

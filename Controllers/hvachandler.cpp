#include "hvachandler.h"

HVACHandler::HVACHandler(QObject *parent)
    : QObject{parent}
    , m_targetTemperature(20)
{

}

int HVACHandler::targetTemperature() const
{
    return m_targetTemperature;
}

void HVACHandler::setTargetTemperature(int newTargetTemperature)
{
    if (m_targetTemperature == newTargetTemperature)
        return;
    m_targetTemperature = newTargetTemperature;
    emit targetTemperatureChanged(m_targetTemperature);
}

void HVACHandler::incrementTargetTemperature(const int &val)
{
    int newTargetTemp = m_targetTemperature + val; //+1 increases, -1 decreases
    setTargetTemperature(newTargetTemp);
}

#include "audiocontroller.h"

AudioController::AudioController(QObject *parent)
    : QObject{parent}
    ,m_volumeLevel(0)
{

}

int AudioController::volumeLevel() const
{
    return m_volumeLevel;
}

void AudioController::incrementVolume(const int &val)
{
    int newVolume = m_volumeLevel + val;

    if(newVolume <= 0)
        newVolume = 0;

    if(newVolume >= 100)
        newVolume = 100;

    setVolumeLevel(newVolume);
}

void AudioController::setVolumeLevel(int newVolumeLevel)
{
    if (m_volumeLevel == newVolumeLevel)
        return;
    m_volumeLevel = newVolumeLevel;
    emit volumeLevelChanged(m_volumeLevel);
}

/*
 * Copyright (c) 2014 The CyanogenMod Project
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#include <errno.h>
#include <string.h>
#include <fcntl.h>
#include <pthread.h>

#define LOG_TAG "PowerHAL_KS01_Ext"
#include <utils/Log.h>

#define TOUCHKEY_POWER "/sys/class/input/input2/enabled"
#define TSP_POWER "/sys/class/input/input3/enabled"

static pthread_once_t g_init = PTHREAD_ONCE_INIT;
static pthread_mutex_t g_lock = PTHREAD_MUTEX_INITIALIZER;

void init_g_lock(void)
{
    pthread_mutex_init(&g_lock, NULL);
}

void *input_onoff(void *arg) {
    char buf[80];
    int len;
    char *onoff=(char*) arg;
    char *path = TOUCHKEY_POWER;

    pthread_mutex_lock(&g_lock);

    int fd = open(path, O_WRONLY);

    if (fd < 0) {
        strerror_r(errno, buf, sizeof(buf));
        ALOGE("Error opening %s: %s\n", path, buf);
    } else 
        len = write(fd, onoff, 1);

    if (len < 0) {
        strerror_r(errno, buf, sizeof(buf));
        ALOGE("Error writing to %s: %s\n", path, buf);
    }

    close(fd);

    path = TSP_POWER;
    fd = open(path, O_WRONLY);

    if (fd < 0) {
        strerror_r(errno, buf, sizeof(buf));
        ALOGE("Error opening %s: %s\n", path, buf);
    } else
        len = write(fd, onoff, 1);

    if (len < 0) {
        strerror_r(errno, buf, sizeof(buf));
        ALOGE("Error writing to %s: %s\n", path, buf);
    }

    close(fd);

    pthread_mutex_unlock(&g_lock);

    return NULL;
}

void cm_power_set_interactive_ext(int on) {
    ALOGD("%s: %s input devices", __func__, on ? "enabling" : "disabling");
    pthread_t pth;
    pthread_attr_t threadAttr;
    pthread_attr_init(&threadAttr); 
    pthread_attr_setdetachstate(&threadAttr, PTHREAD_CREATE_DETACHED); 
    pthread_once(&g_init, init_g_lock);
    pthread_create(&pth,&threadAttr,input_onoff, (void*) on ? "1" : "0");
    pthread_attr_destroy(&threadAttr);
}



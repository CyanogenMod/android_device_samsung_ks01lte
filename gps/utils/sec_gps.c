#include <stdint.h>
#include <loc_cfg.h>

/* secgps.conf parameters */
static uint8_t SSL = 1;
static uint8_t SSL_TYPE = 0;
static uint8_t POSITION_MODE = 7;
static uint8_t OPERATION_TEST_MODE = 0;
static uint32_t ACCURACY = 50;
static uint8_t SESSION_TYPE = 1;
static uint8_t SERVER_MODE = 0;
static char* ENABLE_NMEA = "FALSE";
static char* START_MODE = "WARM";
static uint8_t GPS_LOGGING = 0;
static uint8_t AGPS_MODE = 0;
static uint8_t DYNAMIC_ACCURACY = 1;
static uint8_t ADDRESS_MODE = 1;
static uint32_t TIME_BTW_FIX = 2000;
static char* OPERATION_MODE = "MSBASED";
static char* USE_DEFAULT = "TRUE";
static uint32_t DYNAMIC_ACCURACY_VALUE = 50;
static uint32_t SUPL_PORT = 7276;
static uint8_t ENABLE_XTRA = 1;
static char* SUPL_HOST = "supl.google.com";
static uint32_t NUM_OF_FIX = 999999999;
static uint32_t TIMEOUT = 3600;

/* secgps stubs */
int loc_secgps_param_num = 18;
loc_param_s_type sec_gps_conf[] =
{
    {"SSL",    &SSL, NULL,     'n'},
    {"SSL_TYPE",       &SSL_TYPE,      NULL,   'n'},
    {"POSITION_MODE",  &POSITION_MODE, NULL,   'n'},
    {"OPERATION_TEST_MODE",    &OPERATION_TEST_MODE,   NULL,   'n'},
    {"ACCURACY",       &ACCURACY,      NULL,   'n'},
    {"SESSION_TYPE",   &SESSION_TYPE,  NULL,   'n'},
    {"SERVER_MODE",    &SERVER_MODE,   NULL,   'n'},
    {"ENABLE_NMEA",    &ENABLE_NMEA,   NULL,   's'},
    {"START_MODE",     &START_MODE,    NULL,   's'},
    {"GPS_LOGGING",    &GPS_LOGGING,   NULL,   'n'},
    {"AGPS_MODE",      &AGPS_MODE,     NULL,   'n'},
    {"DYNAMIC_ACCURACY",       &DYNAMIC_ACCURACY,      NULL,   'n'},
    {"ADDRESS_MODE",   &ADDRESS_MODE,  NULL,   'n'},
    {"TIME_BTW_FIX",   &TIME_BTW_FIX,  NULL,   'n'},
    {"OPERATION_MODE", &OPERATION_MODE,        NULL,   's'},
    {"USE_DEFAULT",    &USE_DEFAULT,   NULL,   's'},
    {"DYNAMIC_ACCURACY_VALUE", &DYNAMIC_ACCURACY_VALUE,        NULL,   'n'},
    {"SUPL_PORT",      &SUPL_PORT,     NULL,   'n'},
    {"ENABLE_XTRA",    &ENABLE_XTRA,   NULL,   'n'},
    {"SUPL_HOST",      &SUPL_HOST,     NULL,   's'},
    {"NUM_OF_FIX",     &NUM_OF_FIX,    NULL,   'n'},
    {"TIMEOUT",        &TIMEOUT,       NULL,   'n'},
};
int Sec_Configuration = 1;

void loc_read_sec_gps_conf(const char* conf_file_name, loc_param_s_type* config_table,
                   uint32_t table_length)
{
    /* Stub for libloc_api_v2 blob. */
}

/*
 *  ======== HDC2080.h ========
 *  HDC2080 Interface
 */
#ifndef ti_sensors_HDC2080__include
#define ti_sensors_HDC2080__include 1

#include <stdint.h>

/* support C++ sources */
#ifdef __cplusplus
extern "C" {
#endif

#define HDC2080_TEMP_LOW 0x00U
#define HDC2080_TEMP_HIGH 0x01U
#define HDC2080_HUM_LOW 0x02U
#define HDC2080_HUM_HIGH 0x03U
#define HDC2080_INT_DRDY 0x04U
#define HDC2080_INT_DRDY_DRDY_STAT_ENABLE 0x80U
#define HDC2080_INT_DRDY_DRDY_STAT_DISABLE 0x00U
#define HDC2080_INT_DRDY_TH_STAT_ENABLE 0x40U
#define HDC2080_INT_DRDY_TH_STAT_DISABLE 0x00U
#define HDC2080_INT_DRDY_TL_STAT_ENABLE 0x20U
#define HDC2080_INT_DRDY_TL_STAT_DISABLE 0x00U
#define HDC2080_INT_DRDY_HH_STAT_ENABLE 0x10U
#define HDC2080_INT_DRDY_HH_STAT_DISABLE 0x00U
#define HDC2080_INT_DRDY_HL_STAT_ENABLE 0x08U
#define HDC2080_INT_DRDY_HL_STAT_DISABLE 0x00U
#define HDC2080_INT_CONFIG 0x07U
#define HDC2080_INT_CONFIG_DRDY_EN_ENABLE 0x80U
#define HDC2080_INT_CONFIG_DRDY_EN_DISABLE 0x00U
#define HDC2080_INT_CONFIG_TH_EN_ENABLE 0x40U
#define HDC2080_INT_CONFIG_TH_EN_DISABLE 0x00U
#define HDC2080_INT_CONFIG_TL_EN_ENABLE 0x20U
#define HDC2080_INT_CONFIG_TL_EN_DISABLE 0x00U
#define HDC2080_INT_CONFIG_HH_EN_ENABLE 0x10U
#define HDC2080_INT_CONFIG_HH_EN_DISABLE 0x00U
#define HDC2080_INT_CONFIG_HL_EN_ENABLE 0x08U
#define HDC2080_INT_CONFIG_HL_EN_DISABLE 0x00U
#define HDC2080_TEMP_OFFSET 0x08U
#define HDC2080_HUM_OFFSET 0x09U
#define HDC2080_TEMP_THRES_LOW 0x0AU
#define HDC2080_TEMP_THRES_HIGH 0x0BU
#define HDC2080_HUM_THRES_LOW 0x0CU
#define HDC2080_HUM_THRES_HIGH 0x0DU
#define HDC2080_CONFIG 0x0EU
#define HDC2080_CONFIG_SOFT_RES_ENABLE 0x80U
#define HDC2080_CONFIG_SOFT_RES_DISABLE 0x00U
#define HDC2080_CONFIG_AMM_DISABLED 0x00U
#define HDC2080_CONFIG_AMM_1SP2M 0x10U
#define HDC2080_CONFIG_AMM_1SPM 0x20U
#define HDC2080_CONFIG_AMM_1SP10S 0x30U
#define HDC2080_CONFIG_AMM_1SP5S 0x40U
#define HDC2080_CONFIG_AMM_1SPS 0x50U
#define HDC2080_CONFIG_AMM_2SPS 0x60U
#define HDC2080_CONFIG_AMM_5SPS 0x70U
#define HDC2080_CONFIG_HEAT_EN_ENABLE 0x08U
#define HDC2080_CONFIG_HEAT_EN_DISABLE 0x00U
#define HDC2080_CONFIG_DRDY_INT_EN_ENABLE 0x04U
#define HDC2080_CONFIG_DRDY_INT_EN_DISABLE 0x00U
#define HDC2080_CONFIG_INT_POL_LOW 0x00U
#define HDC2080_CONFIG_INT_POL_HIGH 0x02U
#define HDC2080_CONFIG_INT_MODE_LEVEL 0x00U
#define HDC2080_CONFIG_INT_MODE_COMP 0x01U
#define HDC2080_MEAS_CONFIG 0x0FU
#define HDC2080_MEAS_CONFIG_TRES_14BIT 0x00U
#define HDC2080_MEAS_CONFIG_TRES_11BIT 0x40U
#define HDC2080_MEAS_CONFIG_TRES_9BIT 0x80U
#define HDC2080_MEAS_CONFIG_HRES_14BIT 0x00U
#define HDC2080_MEAS_CONFIG_HRES_11BIT 0x10U
#define HDC2080_MEAS_CONFIG_HRES_9BIT 0x20U
#define HDC2080_MEAS_CONFIG_RES_ENABLE 0x08U
#define HDC2080_MEAS_CONFIG_RES_DISABLE 0x00U
#define HDC2080_MEAS_CONFIG_MEAS_CONF_HT 0x00U
#define HDC2080_MEAS_CONFIG_MEAS_CONF_T 0x02U
#define HDC2080_MEAS_CONFIG_MEAS_TRIG_NA 0x00U
#define HDC2080_MEAS_CONFIG_MEAS_TRIG_START 0x01U
#define HDC2080_TEMP_MAX 0x05U
#define HDC2080_HUM_MAX 0x06U
#define HDC2080_MANUF_ID_LOW 0xFCU
#define HDC2080_MANUF_ID_HIGH 0xFDU
#define HDC2080_DEVID_LOW 0xFEU
#define HDC2080_DEVID_HIGH 0xFFU

#define HDC2080_CONFIG_AMM_MASK 0x70U
/*
 *  ======== HDC2080_State ========
 *  Initial configuration state for a HDC2080 sensor
 *
 *  Device Registers
 *      ADDRESS NAME                RESET 
 *      0x00    TEMPERATURE LOW     00000000 R
 *      0x01    TEMPERATURE HIGH    00000000 R
 *      0x02    HUMIDITY LOW        00000000 R
 *      0x03    HUMIDITY HIGH       00000000 R
 *      0x04    DRDY/INT STATUS     00000000 (clear on read)
 *      0x05    TEMPERATURE MAX     00000000 R/W
 *      0x06    HUMIDITY MAX        00000000 R/W
 *
 *      0x07    INTERRUPT CONFIG    00000000 R/W (enable just 1 interrupt)
 *      0x08    TEMP_OFFSET_ADJUST  00000000 R/W
 *      0x09    HUM_OFFSET_ADJUST   00000000 R/W
 *      0x0A    TEMP THRESHOLD LOW  00000000 R/W
 *      0x0B    TEMP THRESHOLD HIGH 11111111 R/W
 *      0x0C    RH THRESHOLD LOW    00000000 R/W
 *      0x0D    RH THRESHOLD HIGH   11111111 R/W
 *      0x0E    RESET&DRDY/INT CONF 00000000 R/W (interrupt polarity & mode)
 *      0x0F    MEASUREMENT CONF    00000000 R/W
 */
typedef struct HDC2080_State {

    uint8_t intConfig;     /* INT_CONFIG      (0x07) */
    uint8_t tOffset;       /* TEMP_OFFSET     (0x08) */
    uint8_t hOffset;       /* HUM_OFFSET      (0x09) */
    uint8_t tThresHigh;    /* TEMP_THRES_HIGH (0x0A) */
    uint8_t tThresLow;     /* TEMP_THRES_LOW  (0x0B) */
    uint8_t hThresHigh;    /* HUM_THRES_HIGH  (0x0C) */
    uint8_t hThresLow;     /* HUM_THRES_LOW   (0x0D) */
    uint8_t config;        /* CONFIG          (0x0E) */
    uint8_t measConfig;    /* MEAS_CONFIG     (0x0F) */

    uint8_t busId;         /* I2C bus id */
    uint8_t devAddr;       /* Sensor address on the I2C bus */

    uint16_t convWaitTemp; /* Conversion time for temperature (in ms)  */
    uint16_t convWaitHum;  /* Conversion time for humidity (in ms)  */

} HDC2080_State;

#define HDC2080_INT_CONFIG_VALUE (HDC2080_INT_CONFIG_DRDY_EN_ENABLE | \
                                  HDC2080_INT_CONFIG_TH_EN_ENABLE |   \
                                  HDC2080_INT_CONFIG_TL_EN_ENABLE |   \
                                  HDC2080_INT_CONFIG_HH_EN_ENABLE |   \
                                  HDC2080_INT_CONFIG_HL_EN_ENABLE)
#define HDC2080_TEMP_OFFSET_VALUE 0x00U
#define HDC2080_HUM_OFFSET_VALUE 0x00U
#define HDC2080_TEMP_THRES_LOW_VALUE 0x00U
#define HDC2080_TEMP_THRES_HIGH_VALUE 0xFFU
#define HDC2080_HUM_THRES_LOW_VALUE 0x00U
#define HDC2080_HUM_THRES_HIGH_VALUE 0xFFU
#define HDC2080_CONFIG_VALUE (HDC2080_CONFIG_SOFT_RES_ENABLE |    \
                              HDC2080_CONFIG_AMM_DISABLED |       \
                              HDC2080_CONFIG_HEAT_EN_DISABLE |    \
                              HDC2080_CONFIG_DRDY_INT_EN_ENABLE | \
                              HDC2080_CONFIG_INT_POL_LOW |        \
                              HDC2080_CONFIG_INT_MODE_LEVEL)
#define HDC2080_MEAS_CONFIG_VALUE (HDC2080_MEAS_CONFIG_TRES_14BIT |   \
                                   HDC2080_MEAS_CONFIG_HRES_14BIT |   \
                                   HDC2080_MEAS_CONFIG_MEAS_CONF_HT | \
                                   HDC2080_MEAS_CONFIG_MEAS_TRIG_NA)

static HDC2080_State HDC2080_state = {

    HDC2080_CONFIG_VALUE,
    HDC2080_MEAS_CONFIG_VALUE,
    HDC2080_INT_CONFIG_VALUE,
    HDC2080_TEMP_THRES_HIGH_VALUE,
    HDC2080_TEMP_THRES_LOW_VALUE,
    HDC2080_HUM_THRES_HIGH_VALUE,
    HDC2080_HUM_THRES_LOW_VALUE,
    HDC2080_TEMP_OFFSET_VALUE,
    HDC2080_HUM_OFFSET_VALUE,

    /* I2C bus ID */
    0, 

    /* Sensor address on the I2C bus */
    0x40U, 

    /* Conversion time for temperature (in ms)  */
    1,

    /* Conversion time for humidity (in ms)  */
    1
};


/*
 *  ======== HDC2080_Handle ========
 *  First argument to all HDC2080 methods
 */
typedef HDC2080_State *HDC2080_Handle;

/*
 *  ======== HDC2080_config ========
 *  Configure device with the sensor's current settings
 */
extern void HDC2080_config(HDC2080_Handle sensor);

/*
 *  ======== HDC2080_read ========
 *  Read raw humididty register from a sensor
 *
 *  Conversion functions are provided to convert a raw value returned by this
 *  function to value in "natural" units.
 *
 *  For example, HDC2080_humToIntRelative(value) converts a raw
 *  humidity value into an integral relative humidity value as a percentage.
 *
 *  @param sensor  handle to a HDC2080 state object
 *  @param result  Returns two 16-bit unsigned values representing
 *                 temperature in result[0] and humidity in result[1].
 */
extern void HDC2080_read(HDC2080_Handle sensor, uint32_t result[]);

/*
 *  ======== HDC2080_humRead ========
 *  Read raw humididty register from a sensor
 *
 *  Conversion functions are provided to convert a raw value returned by this
 *  function to value in "natural" units.
 *
 *  For example, HDC2080_humToIntRelative(value) converts a raw
 *  humidity value into an integral relative humidity value as a percentage.
 *
 *  @param sensor  handle to a HDC2080 state object
 *  @returns       16-bit unsigned value in units of 0.001525 of a percent.
 *                 This value has a 9, 11, or 14-bit resolution that's defined
 *                 by the Measurement Configuration register.  Conversion to
 *                 relative humidity can  be done as follows:
 *                     % relative humidity = (hum / 2^16) * 100
 *                 where hum is the return value
 */
extern uint16_t HDC2080_humRead(HDC2080_Handle sensor);

/*
 *  ======== HDC2080_humToFloatRelative ========
 *  Convert raw humidity register value to relative humidity as a percentage
 *
 *  @param raw  a raw register value returned by HDC2080_humRead
 *  @returns    single-precision floating point representation of the relative
 *              humidity as a percentage
 */
extern float HDC2080_humToFloatRelative(uint16_t raw);

/*
 *  ======== HDC2080_humToIntRelative ========
 *  Convert raw humidity register value to relative humidity as an integral
 *  percentage
 *
 *  @param raw  a raw register value returned by HDC2080_humRead
 *  @returns    integral relative humidity as a percentage rounded
 *              to the nearest whole number; a range of 0 to 100.
 */
extern uint32_t HDC2080_humToIntRelative(uint16_t raw);

/*
 *  ======== HDC2080_humToPermille ========
 *  Convert raw humidity register value to 10 times the relative humidity
 *
 *  This function is similar to HDC2080_humToIntRelative except that,
 *  rather than rounding to the nearest whole percentage point, it simply
 *  returns 10 times the percentage relative humidity before truncating to
 *  an integral value - making it slightly smaller and more accurate.
 *
 *  @param raw  a raw register value returned by HDC2080_humRead
 *  @returns    integral relative humidity as a truncated permille; a range of
 *              0 to 1000.
 */
extern uint32_t HDC2080_humToPermille(uint16_t raw);

/*
 *  ======== HDC2080_tempRead ========
 *  Read raw temperature register from a sensor
 *
 *  Conversion functions are provided to convert a raw value returned by this
 *  function to value in "natural" units.
 *
 *  For example, HDC2080_tempToMilliCelsius(value) converts a raw
 *  temperature value into an integral temperature value in units of
 *  milli-degrees Celsius.
 *
 *  @param sensor  handle to a HDC2080 state object
 *  @returns       16-bit signed value in units of 0.0025177 degrees C with
 *                 constant offset of +40.  This value has a 9, 11, or 14-bit
 *                 resolution that's defined by the Measurement Configuration
 *                 register.  Conversion to degrees Celsius can be done as
 *                 follows:
 *                     degrees C = (temp / 2^16) * 165 - 40
 *                 where temp is the return value.
 */
extern uint16_t HDC2080_tempRead(HDC2080_Handle sensor);

/*
 *  ======== HDC2080_tempToFloatCelsius ========
 *  Convert raw temperature register value to degrees Celsius
 *
 *  @param raw  a value returned by HDC2080_tempRead
 *  @returns    single-precision floating point temperature value in units of
 *              degrees Celsius
 */
extern float HDC2080_tempToFloatCelsius(uint16_t raw);

/*
 *  ======== HDC2080_tempToIntCelsius ========
 *  Convert raw temperature register value to whole degrees Celsius
 *
 *  This function rounds to the nearest whole number.
 *
 *  @param raw  a value returned by HDC2080_tempRead
 *  @returns    signed 32-bit integer representation of temperature in units
 *              of degrees Celsius
 */
extern int32_t HDC2080_tempToIntCelsius(uint16_t raw);

/*
 *  ======== HDC2080_tempToMilliCelsius ========
 *  Convert raw temperature register value to milli-degrees Celsius
 *
 *  This function truncates rather than rounds values.
 *
 *  @param raw  a value returned by HDC2080_tempRead
 *  @returns    signed 32-bit integer representation of temperature in units
 *              of milli-degrees Celsius
 */
extern int32_t HDC2080_tempToMilliCelsius(uint16_t raw);

/* support C++ sources */
#ifdef __cplusplus
}
#endif

#endif

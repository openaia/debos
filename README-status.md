## Status

- done: working as expected
- not: not working
- okay: works with intermediate hardware fix
- errata: hardware bug

   |                          | Neu6Bv1 | Neu6Av2 | Neu6Bv2 | Notes      |
   |--------------------------|---------|-------- |---------|------------|
   | PMIC (rk806)             | done    |         | done    |
   | eMMC                     | done    |         | done    |
   | LPDDR4/4X		      | done    |	  | done    |
   | OTP                      | done    |         | done    |
   | Intel 8260DW	      |         |         | -NA-    |
   | RTL8852BE 	              |         |         | done    |
   | CAM0		      |         |         | done    | Object detect
   | CAM1		      |         |         | done    | Object detect
   |			      |         |         |         |
   | DEBUG UART		      | done    |         | done    |
   | VDD_NPU                  | errata  |         | done    |
   | SD Card                  | done    |         | done    |
   | PWM FAN		      | done    |         | done    |
   | RTC		      | done    |         | done    |
   | RS232		      | done    |         | done    |
   | RS485		      | done    |         | done    |
   | CAN 		      |	done    |         | done    |
   | Buttons		      |         |         |         |
   | - Recovery		      | done    |         | done    | read value /sys/bus/iio/devices/iio:device0# before and after key press
   | - Reset		      | done    |         | done    | short press to reset the device
   | - Power		      | done    |         | done    | short press to power off the device and short press to power on the device
   | LEDS: Green, RED	      |         |         | done    |
   | POE             	      | errata  |         | done    |
   | 40PIN Header             | untest  |         |         |
   | Schematic                |         |         |         |
   | - Title editable format  |  --     |         |         |
   |			      |	        |         |         |
   | USB 2.0		      | done    |         | done    |
   | USB 3.0		      | done    |         | done    |
   | USB 3.0 OTG	      | done    |         | done    |
   | 2.5G ETH		      | done    |         | done    |
   | Headphone Playback       |	done    |         | done    |
   | Headphone Record         |	errata  |         | done    |
   | SATA		      | done    |         | done    |
   | M.2 M-Key		      |	done    |         | done    |
   | M.2 E-Key (WiFi5/6)      | untest  |         | done    |
   | M.2 B-Key (4G)	      | untest  |         | done    |
   | M.2 B-Key (5G)	      | untest  |         |         |
   | 			      |         |         |         |
   | Display Controller       |         |         |         |
   | - eDP 		      | done    |         |         |
   | - HDMI                   | okay    |         | done    | kernel panic with HDMI, DP connected together
   | - DP0		      | okay    |         | done    |
   | - DP1                    | okay    |         | done    |
   | - DSI0                   |         |         |         |
   |   - 10" LCD + TP         | okay    |         | done    |
   |   - 8" LCD + TP          | okay    |         |         |
   | - DSI1                   |         |         |         |
   |   - 10" LCD + TP         | okay    |         | done    |
   |   - 8" LCD + TP          | okay    |         |         |
   |			      |	        |         |         |
   | Camera		      |         |         |         |
   | - CAM2		      |         |         | done    | Object detect
   | - CAM3		      |         |         | done    | Object detect
   | - CAM4		      |         |         | done    | Object detect
   | - CAM5		      |         |         | done    | Object detect
   |                          |         |         |         |
   | HDMI Input               | errate  |         | done    |

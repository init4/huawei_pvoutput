#!/usr/local/bin/python3
#
# 'input_power': Result(value=82, unit='W') 
# 'daily_yield_energy': Result(value=0.12, unit='kWh') 
# 'line_voltage_A_B': Result(value=233.4, unit='V')
# 'phase_A_voltage': Result(value=247.2, unit='V')
# 'internal_temperature': Result(value=24.4, unit='°C')
#

from huawei_solar import HuaweiSolar

c = HuaweiSolar(host="10.0.0.100")

model_name = c.get("model_name")
input_power = c.get("input_power")
print(str(input_power.value) if input_power else "0")


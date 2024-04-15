function [tempMosfet,tempMotor,avgMotorCurrent,avgInputCurrent,avg_id,avg_iq,dutyCycleNow,rpm,inpVoltage,ampHours,ampHoursCharged,wattHours,wattHoursCharged,tachometer,tachometerAbs,error,pidPos,id] = simulink_get_rt_data(rt_String)

rt_String = uint32(rt_String);

tempMosfet          = single(typecast(uint16(bitshift(rt_String(4),8)+rt_String(5)),'int16')); % 4 & 5
tempMosfet          = tempMosfet(1)/10;
tempMotor           = single(typecast(uint16(bitshift(rt_String(6),8)+rt_String(7)),'int16')); % 6 & 7
tempMotor           = tempMotor(1)/10;
avgMotorCurrent     = single(typecast(uint32(bitshift(rt_String(8),24)+bitshift(rt_String(9),16)+bitshift(rt_String(10),8)+rt_String(11)),'int32')); % 8,9,10 & 11
avgMotorCurrent     = avgMotorCurrent(1)/100;
avgInputCurrent     = single(typecast(uint32(bitshift(rt_String(12),24)+bitshift(rt_String(13),16)+bitshift(rt_String(14),8)+rt_String(15)),'int32')); % 12,13,14 & 15
avgInputCurrent     = avgInputCurrent(1)/100;
avg_id              = single(typecast(bitshift(rt_String(16),24)+bitshift(rt_String(17),16)+bitshift(rt_String(18),8)+rt_String(19),'int32')); % 16,17,18 & 19
avg_id              = avg_id(1)/100;
avg_iq              = single(typecast(bitshift(rt_String(20),24)+bitshift(rt_String(21),16)+bitshift(rt_String(22),8)+rt_String(23),'int32')); % 20,21,22 & 23
avg_iq              = avg_iq(1)/100;
dutyCycleNow        = single(typecast(uint16(bitshift(rt_String(24),8)+rt_String(25)),'int16')); % 24 & 25
dutyCycleNow        = dutyCycleNow(1)/1000;
rpm                 = typecast(bitshift(rt_String(26),24)+bitshift(rt_String(27),16)+bitshift(rt_String(28),8)+rt_String(29),'int32'); % 26,27,28 & 29
rpm                 = rpm(1);
inpVoltage          = single(typecast(uint16(bitshift(rt_String(30),8)+rt_String(31)),'int16')); % 30 & 31
inpVoltage          = inpVoltage(1)/10;
ampHours            = single(typecast(bitshift(rt_String(32),24)+bitshift(rt_String(33),16)+bitshift(rt_String(34),8)+rt_String(35),'int32')); % 32,33,34 & 35
ampHours            = ampHours(1)/10000;
ampHoursCharged     = single(typecast(bitshift(rt_String(36),24)+bitshift(rt_String(37),16)+bitshift(rt_String(38),8)+rt_String(39),'int32')); % 36,37,38 & 39
ampHoursCharged     = ampHoursCharged(1)/10000;
wattHours           = single(typecast(bitshift(rt_String(40),24)+bitshift(rt_String(41),16)+bitshift(rt_String(42),8)+rt_String(43),'int32')); % 40,41,42 & 43
wattHours           = wattHours(1)/10000;
wattHoursCharged    = single(typecast(bitshift(rt_String(44),24)+bitshift(rt_String(45),16)+bitshift(rt_String(46),8)+rt_String(47),'int32')); % 44,45,46 & 47
wattHoursCharged    = wattHoursCharged(1)/10000;
tachometer          = typecast(bitshift(rt_String(48),24)+bitshift(rt_String(49),16)+bitshift(rt_String(50),8)+rt_String(51),'int32'); % 48,49,50 & 51
tachometer          = tachometer(1);
tachometerAbs       = typecast(bitshift(rt_String(52),24)+bitshift(rt_String(53),16)+bitshift(rt_String(54),8)+rt_String(55),'int32'); % 52,53,54 & 55
tachometerAbs       = tachometerAbs(1);
error               = rt_String(56); % 56
pidPos              = single(typecast(bitshift(rt_String(57),24)+bitshift(rt_String(58),16)+bitshift(rt_String(59),8)+rt_String(60),'int32')); % 57,58,59 & 60
pidPos              = pidPos(1)/1000000;
id                  = rt_String(61);

end
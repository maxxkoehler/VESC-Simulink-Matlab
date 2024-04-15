function outstr = set_duty(my_duty_raw)

my_duty = int32(my_duty_raw * 100000);

my_duty = typecast(my_duty,'uint32');

my_duty_str1=2;
my_duty_str2=5;
my_duty_str3=5;

my_duty_str7 = bitand(my_duty, 0x000000FF);
my_duty_str6 = bitshift(bitand(my_duty, 0x0000FF00), -8);
my_duty_str5 = bitshift(bitand(my_duty, 0x00FF0000), -16);
my_duty_str4 = bitshift(bitand(my_duty, 0xFF000000), -24);

my_duty_str10 = 3;

cksum = crc_16(double([my_duty_str1,my_duty_str2,my_duty_str3,my_duty_str4,my_duty_str5,my_duty_str6,my_duty_str7]));

my_duty_str8 = bitshift(cksum, -8);
my_duty_str9 = bitand(cksum, 0x00FF);

outstr = double([my_duty_str1, my_duty_str2, my_duty_str3, my_duty_str4, my_duty_str5, my_duty_str6, my_duty_str7, my_duty_str8, my_duty_str9, my_duty_str10]);

end
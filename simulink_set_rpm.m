function outstr = set_rpm(my_rpm_raw)

my_rpm = int32(my_rpm_raw);

my_rpm = typecast(my_rpm,'uint32');

my_rpm_str1=2;
my_rpm_str2=5;
my_rpm_str3=8;

my_rpm_str7 = bitand(my_rpm, 0x000000FF);
my_rpm_str6 = bitshift(bitand(my_rpm, 0x0000FF00), -8);
my_rpm_str5 = bitshift(bitand(my_rpm, 0x00FF0000), -16);
my_rpm_str4 = bitshift(bitand(my_rpm, 0xFF000000), -24);

my_rpm_str10 = 3;

cksum = crc_16(double([my_rpm_str1,my_rpm_str2,my_rpm_str3,my_rpm_str4,my_rpm_str5,my_rpm_str6,my_rpm_str7]));

my_rpm_str8 = bitshift(cksum, -8);
my_rpm_str9 = bitand(cksum, 0x00FF);

outstr = double([my_rpm_str1, my_rpm_str2, my_rpm_str3, my_rpm_str4, my_rpm_str5, my_rpm_str6, my_rpm_str7, my_rpm_str8, my_rpm_str9, my_rpm_str10]);

end
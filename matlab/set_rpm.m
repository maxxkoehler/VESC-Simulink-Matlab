function my_rpm_str = set_rpm(my_rpm_raw)

my_rpm = uint32(my_rpm_raw);

my_rpm = typecast(my_rpm,'uint32');

my_rpm_str(1:10)=zeros;
my_rpm_str(1)=2;
my_rpm_str(2)=5;
my_rpm_str(3)=8;

my_rpm_str(7) = bitand(my_rpm, 0x000000FF);
my_rpm_str(6) = bitshift(bitand(my_rpm, 0x0000FF00), -8);
my_rpm_str(5) = bitshift(bitand(my_rpm, 0x00FF0000), -16);
my_rpm_str(4) = bitshift(bitand(my_rpm, 0xFF000000), -24);

my_rpm_str(10) = 3;

cksum = crc_16(my_rpm_str);

my_rpm_str(8) = bitshift(cksum, -8);
my_rpm_str(9) = bitand(cksum, 0x00FF);

end
function my_duty_str = set_duty(my_duty_raw)

my_duty = int32(my_duty_raw * 100000);

my_duty = typecast(my_duty,'uint32');

my_duty_str(1:10)=zeros;
my_duty_str(1)=2;
my_duty_str(2)=5;
my_duty_str(3)=8;

my_duty_str(7) = bitand(my_duty, 0x000000FF);
my_duty_str(6) = bitshift(bitand(my_duty, 0x0000FF00), -8);
my_duty_str(5) = bitshift(bitand(my_duty, 0x00FF0000), -16);
my_duty_str(4) = bitshift(bitand(my_duty, 0xFF000000), -24);

my_duty_str(10) = 3;

cksum = crc_16(my_duty_str);

my_duty_str(8) = bitshift(cksum, -8);
my_duty_str(9) = bitand(cksum, 0x00FF);

end
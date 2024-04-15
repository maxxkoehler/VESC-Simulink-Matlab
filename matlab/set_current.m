function my_cur_str = set_current(my_cur_raw)

my_cur = int32(my_cur_raw * 1000);

my_cur = typecast(my_cur,'uint32');

my_cur_str(1:10)=zeros;
my_cur_str(1)=2;
my_cur_str(2)=5;
my_cur_str(3)=6;

my_cur_str(7) = bitand(my_cur, 0x000000FF);
my_cur_str(6) = bitshift(bitand(my_cur, 0x0000FF00), -8);
my_cur_str(5) = bitshift(bitand(my_cur, 0x00FF0000), -16);
my_cur_str(4) = bitshift(bitand(my_cur, 0xFF000000), -24);

my_cur_str(10) = 3;

cksum = crc_16(my_cur_str);

my_cur_str(8) = bitshift(cksum, -8);
my_cur_str(9) = bitand(cksum, 0x00FF);

end
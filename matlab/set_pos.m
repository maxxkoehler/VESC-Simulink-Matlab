function my_pos_str = set_pos(my_pos_raw)

my_pos = int32(my_pos_raw * 1000000);

my_pos = typecast(my_pos,'uint32');

my_pos_str(1:10)=zeros;
my_pos_str(1)=2;
my_pos_str(2)=5;
my_pos_str(3)=9;

my_pos_str(7) = bitand(my_pos, 0x000000FF);
my_pos_str(6) = bitshift(bitand(my_pos, 0x0000FF00), -8);
my_pos_str(5) = bitshift(bitand(my_pos, 0x00FF0000), -16);
my_pos_str(4) = bitshift(bitand(my_pos, 0xFF000000), -24);

my_pos_str(10) = 3;

cksum = crc_16(my_pos_str);

my_pos_str(8) = bitshift(cksum, -8);
my_pos_str(9) = bitand(cksum, 0x00FF);

end
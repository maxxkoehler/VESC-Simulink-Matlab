function outstr = set_pos(my_pos_raw)

my_pos = int32(my_pos_raw * 1000000);

my_pos = typecast(my_pos,'uint32');

my_pos_str1=2;
my_pos_str2=5;
my_pos_str3=9;

my_pos_str7 = bitand(my_pos, 0x000000FF);
my_pos_str6 = bitshift(bitand(my_pos, 0x0000FF00), -8);
my_pos_str5 = bitshift(bitand(my_pos, 0x00FF0000), -16);
my_pos_str4 = bitshift(bitand(my_pos, 0xFF000000), -24);

my_pos_str10 = 3;

cksum = crc_16(double([my_pos_str1,my_pos_str2,my_pos_str3,my_pos_str4,my_pos_str5,my_pos_str6,my_pos_str7]));

my_pos_str8 = bitshift(cksum, -8);
my_pos_str9 = bitand(cksum, 0x00FF);

outstr = double([my_pos_str1, my_pos_str2, my_pos_str3, my_pos_str4, my_pos_str5, my_pos_str6, my_pos_str7, my_pos_str8, my_pos_str9, my_pos_str10]);

end
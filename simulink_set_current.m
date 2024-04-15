function outstr = set_current(my_cur_raw)

my_cur = int32(my_cur_raw * 1000);

my_cur = typecast(my_cur,'uint32');

my_cur_str1=2;
my_cur_str2=5;
my_cur_str3=6;

my_cur_str7 = bitand(my_cur, 0x000000FF);
my_cur_str6 = bitshift(bitand(my_cur, 0x0000FF00), -8);
my_cur_str5 = bitshift(bitand(my_cur, 0x00FF0000), -16);
my_cur_str4 = bitshift(bitand(my_cur, 0xFF000000), -24);

my_cur_str10 = 3;

cksum = crc_16(double([my_cur_str1,my_cur_str2,my_cur_str3,my_cur_str4,my_cur_str5,my_cur_str6,my_cur_str7]));

my_cur_str8 = bitshift(cksum, -8);
my_cur_str9 = bitand(cksum, 0x00FF);

outstr = double([my_cur_str1, my_cur_str2, my_cur_str3, my_cur_str4, my_cur_str5, my_cur_str6, my_cur_str7, my_cur_str8, my_cur_str9, my_cur_str10]);

end
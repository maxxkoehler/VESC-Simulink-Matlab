function my_ka_str = keep_alive()

my_ka_str(1:10)=zeros;
my_ka_str(1)=2;
my_ka_str(2)=1;
my_ka_str(3)=30;

cksum = crc_16(my_ka_str);

my_ka_str(4) = bitshift(cksum, -8);
my_ka_str(5) = bitand(cksum, 0x00FF);

my_ka_str(6) = 3;

end
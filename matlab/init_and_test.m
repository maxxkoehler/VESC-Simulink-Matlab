%%

spl = serialportlist("available");

vesc_device = serialport(spl(1),115200);

%%

data = get_rt_data(vesc_device);

%% set current

write(vesc_device,set_current(1.5),"uint8")

%% set RPM

write(vesc_device,set_rpm(3000),"uint8")

%% set duty

write(vesc_device,set_duty(.1),"uint8")

%% set position

write(vesc_device,set_pos(90),"uint8")

%% keep alive

write(vesc_device,keep_alive,"uint8")

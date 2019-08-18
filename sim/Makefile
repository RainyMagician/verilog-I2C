CC = iverilog
OBJ = test_rtl
FLAGS = -Wanachronisms -Winfloop
SOURCE = ../scripts/source.f
TOP = tb_i2c

all:
	$(CC) $(FLAGS) -f $(SOURCE) -s $(TOP) -o $(OBJ)
	vvp $(OBJ)
clean:
	rm $(OBJ)*
wave:
	gtkwave $(OBJ).vpd config.gtkw &

CC=gcc
CFLAGS=
OBJ = ffi_nif.o
TARGET = ffi_nif.so
LIBS += -ldl -lffi
ERTS_INCLUDE_PATH=/home/josh/Playground/erlangs/erts-6.0/include
DIR=c_src

$(DIR)/%.o: $(DIR)/%.c $(DEPS)
	$(CC) -c -o $@ $< $(CFLAGS) -I$(ERTS_INCLUDE_PATH)

$(TARGET): $(DIR)/$(OBJ)
	$(CC) -shared -o $@ $^ $(CFLAGS) $(LIBS)

.PHONY : $(TARGET)

clean :
	$(RM) $(DIR)/*.o *.so

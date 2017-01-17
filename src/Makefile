include ../make.vars

SUBDIR=.
SRC=$(foreach DIR, $(SUBDIR), $(wildcard ${DIR}/*.cpp ))
OBJ=$(patsubst %.cpp, %.o, $(SRC))
TARGET=libprivate.a

$(TARGET): $(OBJ)
	$(AR) $@ $(OBJ)

$(OBJ): %.o:%.cpp
	$(CXX) $(CXXFLAGS) -c $^ -o $@

clean:
	@rm -rf *.o
	@rm -rf $(TARGET)

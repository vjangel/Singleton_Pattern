##################################################################
#
# file: Makefile
#
# e-mail: q963561129@outlook.com
# 
# xxx:VJ
##################################################################

# 当前目录的绝对路径
TOP_DIR=$(PWD)
# 可执行程序目录
BIN_DIR=${TOP_DIR}/bin
# 二进制文件目录
OBJ_DIR=${TOP_DIR}/obj
# 源程序文件目录
SRC_DIR=${TOP_DIR}/src
# 
INC_DIR=${TOP_DIR}/inc

SRC=${wildcard  ${SRC_DIR}/*.cpp}

OBJ=${patsubst %.cpp, ${OBJ_DIR}/%.o, ${notdir ${SRC}}}

# 指定编译器
CC=g++

# 编译选项
CFLAGS=-Wall -g -O2 -I${INC_DIR} 
# 
C11= -std=c++11

TARGET=app
BIN_TARGET=${BIN_DIR}/${TARGET}

# 
${BIN_TARGET}:${OBJ}
	${CC} ${OBJ} -o $@
	@echo "-----------------\033[42;37m【编译成功】\033[0m--------------------"

${OBJ_DIR}/%.o:${SRC_DIR}/%.cpp
	${CC} ${CFLAGS} ${C11} -c $< -o $@



.PHONY:clean
clean:
	find $(OBJ_DIR) -name *.o -exec rm -rvf {} \;
	@echo "-----------------\033[42;37m【清理完成】\033[0m--------------------"

# 测试数值
test:
	@echo "-----------------\033[42;37m【测试】\033[0m------------------------"
	@echo "SRC: ${SRC}"
	@echo "OBJ: ${OBJ}"
	@echo "当前绝对路径：${TOP_DIR}"
	@echo "INC目录绝对路径：${INC_DIR}"
	@echo "SRC目录绝对路径：${SRC_DIR}"
	@echo "OBJ目录绝对路径：${OBJ_DIR}"
	@echo "BIN目录绝对路径：${BIN_DIR}"
	@echo "可执行文件：${TARGET}"
	@echo "-----------------\033[42;37m【END】\033[0m-------------------------"



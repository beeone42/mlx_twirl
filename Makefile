
SRCS	= app.c

OBJS	= ${SRCS:.c=.o}

NAME	= app

CFLAGS	= -I/usr/X11/include

UNAME_S := $(shell uname -s)

ifeq ($(UNAME_S),Darwin)
	CFLAGS += -D OSX
	LDFLAGS	= -L/usr/X11/lib -lm -lmlx -framework OpenGL -framework AppKit
else
	LDFLAGS	= -L/usr/X11/lib -lm -lmlx -lX11 -lXext
endif

CC	= cc
RM	= rm -f

${NAME}:	${OBJS}
		${CC} -o ${NAME} ${OBJS} ${LDFLAGS}

all:		${NAME}

clean:
		${RM} ${OBJS}

fclean:		clean
		${RM} ${NAME}

re:		fclean all

.PHONY:		all clean fclean re

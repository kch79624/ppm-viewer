# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: jleem <jleem@student.42seoul.kr>           +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/01/29 06:11:41 by jleem             #+#    #+#              #
#    Updated: 2021/02/14 17:45:00 by jleem            ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

CC			= clang
CFLAGS		= -Wall -Wextra -Werror -O3 -I$(INCDIR)
LIBFLAGS	= -lmlx -lXext -lX11

NAME		= ppm-viewer

SRCDIR		= srcs
INCDIR		= includes
SRCS		= $(wildcard $(SRCDIR)/*.c)
OBJS		= $(SRCS:.c=.o)

LIBFTDIR	= 42seoul-Libft
LIBFT		= $(LIBFTDIR)/libft.a

GNLDIR		= 42seoul-get_next_line
GNL			= $(GNLDIR)/get_next_line.a

all			: $(NAME)

$(NAME)		: $(OBJS) $(LIBFT) $(GNL)
	$(CC) $(CFLAGS) -o $(NAME) $^ $(LIBFLAGS)

$(LIBFT)	:
	$(MAKE) -C $(LIBFTDIR) CC='$(CC)' CFLAGS=-O3 bonus

$(GNL)		:
	$(MAKE) -C $(GNLDIR) CC='$(CC)' CFLAGS=-O3

clean		:
	rm -f $(OBJS)

fclean		: clean
	$(MAKE) -C $(LIBFTDIR) fclean
	$(MAKE) -C $(GNLDIR) fclean
	rm -f $(NAME)

re			: fclean all

.PHONY		: all clean fclean re

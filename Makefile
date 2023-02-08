# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: madavid <madavid@student.42.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/11/20 21:49:59 by madavid           #+#    #+#              #
#    Updated: 2022/12/18 21:19:08 by madavid          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#variables

NAME = libft.a #nom del'exectable que je veux generer

CC = gcc #compilteur
FLAGS = -Wall -Wextra -Werror #Flags

SRCS = ft_bzero.c \
	ft_isalpha.c \
	ft_isascii.c \
	ft_isdigit.c \
	ft_isalnum.c \
	ft_isprint.c \
	ft_memcpy.c \
	ft_memmove.c \
	ft_memset.c \
	ft_strlcpy.c \
	ft_strlen.c \
	ft_strlcat.c \
	ft_toupper.c \
	ft_tolower.c \
	ft_strchr.c \
	ft_strrchr.c \
	ft_strncmp.c \
	ft_memchr.c \
	ft_memcmp.c \
	ft_strnstr.c \
	ft_atoi.c \
	ft_calloc.c \
	ft_strdup.c \
	ft_substr.c \
	ft_strjoin.c \
	ft_strtrim.c \
	ft_split.c \
	ft_itoa.c \
	ft_putchar_fd.c \
	ft_putstr_fd.c \
	ft_putendl_fd.c \
	ft_putnbr_fd.c \
	ft_strmapi.c \
	ft_striteri.c \

SRCS_BONUS = ft_lstnew.c\
	ft_lstadd_front.c \
	ft_lstsize.c \
	ft_lstlast.c \
	ft_lstadd_back.c \
	ft_lstdelone.c \
	ft_lstclear.c \
	ft_lstiter.c \
	ft_lstmap.c \
	

OBJS = $(SRCS:.c=.o) #transforme le nom des sources de .c a .o
OBJS_BONUS = $(SRCS_BONUS:.c=.o)

#regles

.c.o:
	${CC} ${FLAGS} -c $< -o ${<:.c=.o}

all: $(NAME)

$(NAME): $(OBJS)
	ar -rcs $(NAME) $(OBJS) 
#ar rcs pour me prendre tous les .o et creer le .a

clean : #supprimer tous les fichiers objets generes par la compilation(nettoie les .o mais garde les executables)
	rm -f $(OBJS) $(OBJS_BONUS)
	
fclean : clean #appelle clean d'abord puis supprime l'executable genere 
	rm -f $(NAME)

#so:
#	@$(CC) -fPIC $(CFLAGS) $(SRCS)
#	@gcc -shared -o libft.so $(OBJS)
	
# so:
# 	$(CC) -nostartfiles -fPIC $(FLAGS) $(SRCS)
# 	gcc -nostartfiles -shared -o libft.so $(OBJS) $(OBJS_BONUS)

re : fclean all #reset la compilation pour reprendre a zero

bonus : $(OBJS) $(OBJS_BONUS)
	ar -rcs $(NAME) $(OBJS) $(OBJS_BONUS) 

.PHONY : all clean fclean re bonus #si fichier sappelle comme regle de makefile alors faire regle de makefile ou erreur

#define START 1
#define END 2
#define MAIN 3
#define MOVE 4
#define TO 5
#define ADD 6
#define INPUT 7
#define PRINT 8
#define SEMICOLON 9
#define INTEGER 10
#define TEXT 11
#define DECLARATION 12
#define IDENTIFIER 13

typedef union YYSTYPE
{
  int integer;
  char *text;
} YYSTYPE;
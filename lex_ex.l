%{
#include <stdio.h>
#include <stdlib.h>
int total_score = 0;
%}

%%
[a-zA-Z]+ {
    printf("\nName:%s\n", yytext);
    
}
[1-9][0-9]* {
    printf("\nScore:%s\n", yytext);
    total_score = total_score + atoi(yytext);
}
\n {
    printf("\n Total Score:%d\n", total_score);
    total_score = 0;
}
.
%%

int yywrap(){
    return(1);
}

int main(int argc, char *argv[]){
    if (argc == 2){
        yyin = fopen(argv[1], "r");
        if (yyin == NULL){
            printf("Error\n");
            return(1);
        }
    }
    yylex();
    return(0);
}

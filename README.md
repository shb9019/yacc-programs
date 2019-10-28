# YACC Programs

## Executing

```
    git clone https://github.com/shb9019/yacc-programs.git
    cd yacc-programs
    # Make sure you have flex ('sudo apt install flex')
    cd <Problem Directory>
    lex file.l
    yacc file.y -d
    gcc lex.yy.c y.tab.c -ll
    ./a.out < input.txt
```

## Contributing

Feel free to raise an issue if you find a bug or some case the code breaks for
or create a PR to solve some of the existing issues.
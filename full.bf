[Setup:
  - use https://tinyurl.com/brainfcompiler for its memory access
    - or you can check the printed character's ascii value using something like python's ord() function
  - set 16+ bit cell size
  - input should be in the format:
    '{Choice 1}{spacing char}{Choice 2}{spacing char}...'
    - optionally, you can just ctrl-a the input page and paste into this compiler
  - to get answer, check memory at the current index
]
--->>->->>>>>>>>>> >>-->--<<<,  setup

beg null end end 0 0 0 0 0 0 counter temp1 temp2 char1 char2 fin fin

[   -------- -------- -------- --------
    -------- -------- -------- --------
>,, -------- -------- -------- --------
    -------- -------- -------- -------- 
    -------- -------- -------   input
input is good

[-<<+<<+>>>>] add right
<<[->>+<<]    restore right
<<+>>         plus 1
                                                                    V
beg    null   end   end   num   num   num   num   num   num   count;char2;1   temp1   temp2   char1   char2   fin   fin
                                                                    ^
<<[<+>-]>> add curr to total

>>[-<<+<+>>>]  char2 copy to temp2/temp1
<<[->>+<<]<+   restore char2
     add right plus 1

                                                                 V
beg    null   end   end   num   num   num   num   num   num   count;char2;1   temp1;char2;1   temp2   char1   char2   fin   fin
                                                                 ^
>>[-<+<->>]<[->+<]<              subtract left

                                                                                  V
beg    null   end   end   num   num   num   num   num   num   count;char2;1   temp1;char2;1=char1   temp2   char1   char2   fin   fin
                                                                                  ^
>[-]>[-]<<

#
+[-           is not negative 1?
  [-            subtract 1?
    [>+<-         subtract 2?
      [->[-]         reset temp2
        +++[---<+++]---  seek beg
        >>>[-]-<[-]-<[-] restore null & ends
      ]
  # 
      >+          restore temp1
      [           not at null?
        ++[-->++]-- seek fin1
        <<<[<+>-]   transfer temp2 to temp1
        <+[-<+]-[<] seek null
        >>[-]-<[-]  restore ends
        <           seek null
      ]
      +++[---<+++]---  seek beg
      >>>[-]-<[-]-<[-] restore null & ends
    ]
  #
    >+          restore temp1
    [           not at null?
      ++[-->++]-- seek fin1
      <<<[<+>-]   transfer temp2 to temp1
      <+[-<+]-[<] seek null
      >>[-]-<[-]  restore ends
      <           seek null
    ]
    +++[---<+++]---  seek beg
    >>>[-]-<[-]-<[-] restore null & ends
  ]
  +++[---<+++]--->   seek null
]++
<
+++[---<+++]---    seek beg
>[-]>[-]->[-]-
>>>>>>>>         seek temp1
#
                                                             V
null   end   end   num   num   num   num   num   num   count;char2;1   temp1;char2;1=char1   temp2   char1   char2   fin   fin
                                                             ^

counting algo
[-<<+++>>]<<->>
~

(at temp1)
[-]>
>,,
]
<<<<.

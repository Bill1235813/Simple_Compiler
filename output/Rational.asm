        Jump         $$main                    
        DLabel       $eat-location-zero        
        DataZ        8                         
        DLabel       $print-format-integer     
        DataC        37                        %% "%d"
        DataC        100                       
        DataC        0                         
        DLabel       $print-format-floating    
        DataC        37                        %% "%g"
        DataC        103                       
        DataC        0                         
        DLabel       $print-format-character   
        DataC        37                        %% "%c"
        DataC        99                        
        DataC        0                         
        DLabel       $print-format-string      
        DataC        37                        %% "%s"
        DataC        115                       
        DataC        0                         
        DLabel       $print-format-boolean     
        DataC        37                        %% "%s"
        DataC        115                       
        DataC        0                         
        DLabel       $print-format-rational-no-frac 
        DataC        37                        %% "%d"
        DataC        100                       
        DataC        0                         
        DLabel       $print-format-rational-no-int-pos 
        DataC        95                        %% "_%d/%d"
        DataC        37                        
        DataC        100                       
        DataC        47                        
        DataC        37                        
        DataC        100                       
        DataC        0                         
        DLabel       $print-format-rantional-no-int-neg 
        DataC        45                        %% "-_%d/%d"
        DataC        95                        
        DataC        37                        
        DataC        100                       
        DataC        47                        
        DataC        37                        
        DataC        100                       
        DataC        0                         
        DLabel       $print-format-rational-original 
        DataC        37                        %% "%d_%d/%d"
        DataC        100                       
        DataC        95                        
        DataC        37                        
        DataC        100                       
        DataC        47                        
        DataC        37                        
        DataC        100                       
        DataC        0                         
        DLabel       $print-format-newline     
        DataC        10                        %% "\n"
        DataC        0                         
        DLabel       $print-format-tab         
        DataC        9                         %% "\t"
        DataC        0                         
        DLabel       $print-format-space       
        DataC        32                        %% " "
        DataC        0                         
        DLabel       $boolean-true-string      
        DataC        116                       %% "true"
        DataC        114                       
        DataC        117                       
        DataC        101                       
        DataC        0                         
        DLabel       $boolean-false-string     
        DataC        102                       %% "false"
        DataC        97                        
        DataC        108                       
        DataC        115                       
        DataC        101                       
        DataC        0                         
        DLabel       $errors-general-message   
        DataC        82                        %% "Runtime error: %s\n"
        DataC        117                       
        DataC        110                       
        DataC        116                       
        DataC        105                       
        DataC        109                       
        DataC        101                       
        DataC        32                        
        DataC        101                       
        DataC        114                       
        DataC        114                       
        DataC        111                       
        DataC        114                       
        DataC        58                        
        DataC        32                        
        DataC        37                        
        DataC        115                       
        DataC        10                        
        DataC        0                         
        Label        $$general-runtime-error   
        PushD        $errors-general-message   
        Printf                                 
        Halt                                   
        DLabel       $errors-int-divide-by-zero 
        DataC        105                       %% "integer divide by zero"
        DataC        110                       
        DataC        116                       
        DataC        101                       
        DataC        103                       
        DataC        101                       
        DataC        114                       
        DataC        32                        
        DataC        100                       
        DataC        105                       
        DataC        118                       
        DataC        105                       
        DataC        100                       
        DataC        101                       
        DataC        32                        
        DataC        98                        
        DataC        121                       
        DataC        32                        
        DataC        122                       
        DataC        101                       
        DataC        114                       
        DataC        111                       
        DataC        0                         
        Label        $$i-divide-by-zero        
        PushD        $errors-int-divide-by-zero 
        Jump         $$general-runtime-error   
        DLabel       $errors-float-divide-by-zero 
        DataC        102                       %% "floating divide by zero"
        DataC        108                       
        DataC        111                       
        DataC        97                        
        DataC        116                       
        DataC        105                       
        DataC        110                       
        DataC        103                       
        DataC        32                        
        DataC        100                       
        DataC        105                       
        DataC        118                       
        DataC        105                       
        DataC        100                       
        DataC        101                       
        DataC        32                        
        DataC        98                        
        DataC        121                       
        DataC        32                        
        DataC        122                       
        DataC        101                       
        DataC        114                       
        DataC        111                       
        DataC        0                         
        Label        $$f-divide-by-zero        
        PushD        $errors-float-divide-by-zero 
        Jump         $$general-runtime-error   
        DLabel       $errors-rat-divide-by-zero 
        DataC        114                       %% "rational divide by zero"
        DataC        97                        
        DataC        116                       
        DataC        105                       
        DataC        111                       
        DataC        110                       
        DataC        97                        
        DataC        108                       
        DataC        32                        
        DataC        100                       
        DataC        105                       
        DataC        118                       
        DataC        105                       
        DataC        100                       
        DataC        101                       
        DataC        32                        
        DataC        98                        
        DataC        121                       
        DataC        32                        
        DataC        122                       
        DataC        101                       
        DataC        114                       
        DataC        111                       
        DataC        0                         
        Label        $$r-divide-by-zero        
        PushD        $errors-rat-divide-by-zero 
        Jump         $$general-runtime-error   
        DLabel       $a-indexing-array         
        DataZ        4                         
        DLabel       $a-indexing-index         
        DataZ        4                         
        DLabel       $first-numerator          
        DataZ        4                         
        DLabel       $second-numerator         
        DataZ        4                         
        DLabel       $first-denominator        
        DataZ        4                         
        DLabel       $second-denominator       
        DataZ        4                         
        DLabel       $return-for-runtime-func  
        DataZ        4                         
        DLabel       $gcd-temp-numerator       
        DataZ        4                         
        DLabel       $gcd-temp-denominator     
        DataZ        4                         
        DLabel       $print-temp               
        DataZ        4                         
        DLabel       $express-over-denominator 
        DataZ        4                         
        Label        $$convert-to-lowest-terms 
        PushD        $return-for-runtime-func  
        Exchange                               
        StoreI                                 
        Duplicate                              
        JumpFalse    $$r-divide-by-zero        
        Duplicate                              
        PushD        $first-denominator        
        Exchange                               
        StoreI                                 
        PushD        $gcd-temp-denominator     
        Exchange                               
        StoreI                                 
        Duplicate                              
        PushD        $first-numerator          
        Exchange                               
        StoreI                                 
        PushD        $gcd-temp-numerator       
        Exchange                               
        StoreI                                 
        Label        -$function-1-loop-continue 
        PushD        $gcd-temp-numerator       
        LoadI                                  
        PushD        $gcd-temp-denominator     
        LoadI                                  
        Remainder                              
        Duplicate                              
        JumpFalse    -$function-1-loop-end     
        PushD        $gcd-temp-denominator     
        LoadI                                  
        PushD        $gcd-temp-numerator       
        Exchange                               
        StoreI                                 
        PushD        $gcd-temp-denominator     
        Exchange                               
        StoreI                                 
        Jump         -$function-1-loop-continue 
        Label        -$function-1-loop-end     
        Pop                                    
        PushD        $first-numerator          
        LoadI                                  
        PushD        $gcd-temp-denominator     
        LoadI                                  
        Divide                                 
        PushD        $first-denominator        
        LoadI                                  
        PushD        $gcd-temp-denominator     
        LoadI                                  
        Divide                                 
        PushD        $return-for-runtime-func  
        LoadI                                  
        Return                                 
        DLabel       $usable-memory-start      
        DLabel       $global-memory-block      
        DataZ        160                       
        Label        $$main                    
        PushD        $global-memory-block      
        PushI        0                         
        Add                                    %% r
        Duplicate                              
        PushI        6                         
        PushI        8                         
        Call         $$convert-to-lowest-terms 
        PushD        $first-denominator        
        Exchange                               
        StoreI                                 
        StoreI                                 
        PushI        4                         
        Add                                    
        PushD        $first-denominator        
        LoadI                                  
        StoreI                                 
        PushD        $global-memory-block      
        PushI        8                         
        Add                                    %% r2
        Duplicate                              
        PushI        8                         
        PushI        6                         
        Call         $$convert-to-lowest-terms 
        PushD        $first-denominator        
        Exchange                               
        StoreI                                 
        StoreI                                 
        PushI        4                         
        Add                                    
        PushD        $first-denominator        
        LoadI                                  
        StoreI                                 
        PushD        $global-memory-block      
        PushI        16                        
        Add                                    %% r3
        Duplicate                              
        PushI        25                        
        PushI        5                         
        Duplicate                              
        JumpFalse    $$i-divide-by-zero        
        Divide                                 
        PushI        5                         
        Call         $$convert-to-lowest-terms 
        PushD        $first-denominator        
        Exchange                               
        StoreI                                 
        StoreI                                 
        PushI        4                         
        Add                                    
        PushD        $first-denominator        
        LoadI                                  
        StoreI                                 
        PushD        $global-memory-block      
        PushI        24                        
        Add                                    %% r4
        Duplicate                              
        PushI        -40                       
        PushI        13                        
        Call         $$convert-to-lowest-terms 
        PushD        $first-denominator        
        Exchange                               
        StoreI                                 
        StoreI                                 
        PushI        4                         
        Add                                    
        PushD        $first-denominator        
        LoadI                                  
        StoreI                                 
        PushD        $global-memory-block      
        PushI        32                        
        Add                                    %% r5
        Duplicate                              
        PushI        -40                       
        PushI        -13                       
        Call         $$convert-to-lowest-terms 
        PushD        $first-denominator        
        Exchange                               
        StoreI                                 
        StoreI                                 
        PushI        4                         
        Add                                    
        PushD        $first-denominator        
        LoadI                                  
        StoreI                                 
        PushD        $global-memory-block      
        PushI        40                        
        Add                                    %% r6
        Duplicate                              
        PushI        44                        
        PushI        4                         
        Call         $$convert-to-lowest-terms 
        PushD        $first-denominator        
        Exchange                               
        StoreI                                 
        StoreI                                 
        PushI        4                         
        Add                                    
        PushD        $first-denominator        
        LoadI                                  
        StoreI                                 
        PushD        $global-memory-block      
        PushI        48                        
        Add                                    %% r7
        Duplicate                              
        PushI        -7                        
        PushI        8                         
        Call         $$convert-to-lowest-terms 
        PushD        $first-denominator        
        Exchange                               
        StoreI                                 
        StoreI                                 
        PushI        4                         
        Add                                    
        PushD        $first-denominator        
        LoadI                                  
        StoreI                                 
        PushD        $global-memory-block      
        PushI        56                        
        Add                                    %% r8
        Duplicate                              
        PushI        7                         
        PushI        8                         
        Call         $$convert-to-lowest-terms 
        PushD        $first-denominator        
        Exchange                               
        StoreI                                 
        StoreI                                 
        PushI        4                         
        Add                                    
        PushD        $first-denominator        
        LoadI                                  
        StoreI                                 
        PushD        $global-memory-block      
        PushI        64                        
        Add                                    %% r9
        Duplicate                              
        PushI        0                         
        PushI        10                        
        Call         $$convert-to-lowest-terms 
        PushD        $first-denominator        
        Exchange                               
        StoreI                                 
        StoreI                                 
        PushI        4                         
        Add                                    
        PushD        $first-denominator        
        LoadI                                  
        StoreI                                 
        PushD        $global-memory-block      
        PushI        72                        
        Add                                    %% r10
        Duplicate                              
        PushD        $global-memory-block      
        PushI        48                        
        Add                                    %% r7
        Duplicate                              
        LoadI                                  
        Exchange                               
        PushI        4                         
        Add                                    
        LoadI                                  
        PushD        $global-memory-block      
        PushI        56                        
        Add                                    %% r8
        Duplicate                              
        LoadI                                  
        Exchange                               
        PushI        4                         
        Add                                    
        LoadI                                  
        PushD        $second-denominator       
        Exchange                               
        StoreI                                 
        PushD        $second-numerator         
        Exchange                               
        StoreI                                 
        PushD        $first-denominator        
        Exchange                               
        StoreI                                 
        PushD        $first-numerator          
        Exchange                               
        StoreI                                 
        PushD        $first-numerator          
        LoadI                                  
        PushD        $second-denominator       
        LoadI                                  
        Multiply                               
        PushD        $first-denominator        
        LoadI                                  
        PushD        $second-numerator         
        LoadI                                  
        Multiply                               
        Add                                    
        PushD        $first-denominator        
        LoadI                                  
        PushD        $second-denominator       
        LoadI                                  
        Multiply                               
        Call         $$convert-to-lowest-terms 
        PushD        $first-denominator        
        Exchange                               
        StoreI                                 
        StoreI                                 
        PushI        4                         
        Add                                    
        PushD        $first-denominator        
        LoadI                                  
        StoreI                                 
        PushD        $global-memory-block      
        PushI        80                        
        Add                                    %% r11
        Duplicate                              
        PushD        $global-memory-block      
        PushI        48                        
        Add                                    %% r7
        Duplicate                              
        LoadI                                  
        Exchange                               
        PushI        4                         
        Add                                    
        LoadI                                  
        PushD        $global-memory-block      
        PushI        56                        
        Add                                    %% r8
        Duplicate                              
        LoadI                                  
        Exchange                               
        PushI        4                         
        Add                                    
        LoadI                                  
        PushD        $second-denominator       
        Exchange                               
        StoreI                                 
        PushD        $second-numerator         
        Exchange                               
        StoreI                                 
        PushD        $first-denominator        
        Exchange                               
        StoreI                                 
        PushD        $first-numerator          
        Exchange                               
        StoreI                                 
        PushD        $first-numerator          
        LoadI                                  
        PushD        $second-denominator       
        LoadI                                  
        Multiply                               
        PushD        $first-denominator        
        LoadI                                  
        PushD        $second-numerator         
        LoadI                                  
        Multiply                               
        Subtract                               
        PushD        $first-denominator        
        LoadI                                  
        PushD        $second-denominator       
        LoadI                                  
        Multiply                               
        Call         $$convert-to-lowest-terms 
        PushD        $first-denominator        
        Exchange                               
        StoreI                                 
        StoreI                                 
        PushI        4                         
        Add                                    
        PushD        $first-denominator        
        LoadI                                  
        StoreI                                 
        PushD        $global-memory-block      
        PushI        88                        
        Add                                    %% r12
        Duplicate                              
        PushD        $global-memory-block      
        PushI        32                        
        Add                                    %% r5
        Duplicate                              
        LoadI                                  
        Exchange                               
        PushI        4                         
        Add                                    
        LoadI                                  
        PushD        $global-memory-block      
        PushI        40                        
        Add                                    %% r6
        Duplicate                              
        LoadI                                  
        Exchange                               
        PushI        4                         
        Add                                    
        LoadI                                  
        PushD        $second-denominator       
        Exchange                               
        StoreI                                 
        PushD        $second-numerator         
        Exchange                               
        StoreI                                 
        PushD        $first-denominator        
        Exchange                               
        StoreI                                 
        PushD        $first-numerator          
        Exchange                               
        StoreI                                 
        PushD        $first-numerator          
        LoadI                                  
        PushD        $second-numerator         
        LoadI                                  
        Multiply                               
        PushD        $first-denominator        
        LoadI                                  
        PushD        $second-denominator       
        LoadI                                  
        Multiply                               
        Call         $$convert-to-lowest-terms 
        PushD        $first-denominator        
        Exchange                               
        StoreI                                 
        StoreI                                 
        PushI        4                         
        Add                                    
        PushD        $first-denominator        
        LoadI                                  
        StoreI                                 
        PushD        $global-memory-block      
        PushI        96                        
        Add                                    %% r13
        Duplicate                              
        PushD        $global-memory-block      
        PushI        32                        
        Add                                    %% r5
        Duplicate                              
        LoadI                                  
        Exchange                               
        PushI        4                         
        Add                                    
        LoadI                                  
        PushD        $global-memory-block      
        PushI        56                        
        Add                                    %% r8
        Duplicate                              
        LoadI                                  
        Exchange                               
        PushI        4                         
        Add                                    
        LoadI                                  
        PushD        $second-denominator       
        Exchange                               
        StoreI                                 
        PushD        $second-numerator         
        Exchange                               
        StoreI                                 
        PushD        $first-denominator        
        Exchange                               
        StoreI                                 
        PushD        $first-numerator          
        Exchange                               
        StoreI                                 
        PushD        $first-numerator          
        LoadI                                  
        PushD        $second-numerator         
        LoadI                                  
        Multiply                               
        PushD        $first-denominator        
        LoadI                                  
        PushD        $second-denominator       
        LoadI                                  
        Multiply                               
        Call         $$convert-to-lowest-terms 
        PushD        $first-denominator        
        Exchange                               
        StoreI                                 
        StoreI                                 
        PushI        4                         
        Add                                    
        PushD        $first-denominator        
        LoadI                                  
        StoreI                                 
        PushD        $global-memory-block      
        PushI        104                       
        Add                                    %% r14
        Duplicate                              
        PushD        $global-memory-block      
        PushI        56                        
        Add                                    %% r8
        Duplicate                              
        LoadI                                  
        Exchange                               
        PushI        4                         
        Add                                    
        LoadI                                  
        PushD        $global-memory-block      
        PushI        0                         
        Add                                    %% r
        Duplicate                              
        LoadI                                  
        Exchange                               
        PushI        4                         
        Add                                    
        LoadI                                  
        PushD        $second-denominator       
        Exchange                               
        StoreI                                 
        PushD        $second-numerator         
        Exchange                               
        StoreI                                 
        PushD        $first-denominator        
        Exchange                               
        StoreI                                 
        PushD        $first-numerator          
        Exchange                               
        StoreI                                 
        PushD        $first-numerator          
        LoadI                                  
        PushD        $second-denominator       
        LoadI                                  
        Multiply                               
        PushD        $first-denominator        
        LoadI                                  
        PushD        $second-numerator         
        LoadI                                  
        Multiply                               
        Call         $$convert-to-lowest-terms 
        PushD        $first-denominator        
        Exchange                               
        StoreI                                 
        StoreI                                 
        PushI        4                         
        Add                                    
        PushD        $first-denominator        
        LoadI                                  
        StoreI                                 
        PushD        $global-memory-block      
        PushI        112                       
        Add                                    %% i1
        PushD        $global-memory-block      
        PushI        104                       
        Add                                    %% r14
        Duplicate                              
        LoadI                                  
        Exchange                               
        PushI        4                         
        Add                                    
        LoadI                                  
        PushI        3                         
        Duplicate                              
        JumpFalse    $$r-divide-by-zero        
        PushD        $express-over-denominator 
        Exchange                               
        StoreI                                 
        PushD        $first-denominator        
        Exchange                               
        StoreI                                 
        PushD        $first-numerator          
        Exchange                               
        StoreI                                 
        PushD        $first-numerator          
        LoadI                                  
        PushD        $express-over-denominator 
        LoadI                                  
        Multiply                               
        PushD        $first-denominator        
        LoadI                                  
        Divide                                 
        StoreI                                 
        PushD        $global-memory-block      
        PushI        116                       
        Add                                    %% i2
        PushF        13.300000                 
        PushI        3                         
        Duplicate                              
        JumpFalse    $$f-divide-by-zero        
        ConvertF                               
        FMultiply                              
        ConvertI                               
        StoreI                                 
        PushD        $global-memory-block      
        PushI        120                       
        Add                                    %% r15
        Duplicate                              
        PushD        $global-memory-block      
        PushI        96                        
        Add                                    %% r13
        Duplicate                              
        LoadI                                  
        Exchange                               
        PushI        4                         
        Add                                    
        LoadI                                  
        PushI        6                         
        Duplicate                              
        JumpFalse    $$r-divide-by-zero        
        PushD        $express-over-denominator 
        Exchange                               
        StoreI                                 
        PushD        $first-denominator        
        Exchange                               
        StoreI                                 
        PushD        $first-numerator          
        Exchange                               
        StoreI                                 
        PushD        $first-numerator          
        LoadI                                  
        PushD        $express-over-denominator 
        LoadI                                  
        Multiply                               
        PushD        $first-denominator        
        LoadI                                  
        Divide                                 
        PushD        $express-over-denominator 
        LoadI                                  
        Call         $$convert-to-lowest-terms 
        PushD        $first-denominator        
        Exchange                               
        StoreI                                 
        StoreI                                 
        PushI        4                         
        Add                                    
        PushD        $first-denominator        
        LoadI                                  
        StoreI                                 
        PushD        $global-memory-block      
        PushI        128                       
        Add                                    %% r16
        Duplicate                              
        PushI        1                         
        PushI        3                         
        Call         $$convert-to-lowest-terms 
        PushI        4                         
        Duplicate                              
        JumpFalse    $$r-divide-by-zero        
        PushD        $express-over-denominator 
        Exchange                               
        StoreI                                 
        PushD        $first-denominator        
        Exchange                               
        StoreI                                 
        PushD        $first-numerator          
        Exchange                               
        StoreI                                 
        PushD        $first-numerator          
        LoadI                                  
        PushD        $express-over-denominator 
        LoadI                                  
        Multiply                               
        PushD        $first-denominator        
        LoadI                                  
        Divide                                 
        PushD        $express-over-denominator 
        LoadI                                  
        Call         $$convert-to-lowest-terms 
        PushD        $first-denominator        
        Exchange                               
        StoreI                                 
        StoreI                                 
        PushI        4                         
        Add                                    
        PushD        $first-denominator        
        LoadI                                  
        StoreI                                 
        PushD        $global-memory-block      
        PushI        136                       
        Add                                    %% r17
        Duplicate                              
        PushI        1                         
        PushI        4                         
        Call         $$convert-to-lowest-terms 
        PushI        3                         
        Duplicate                              
        JumpFalse    $$r-divide-by-zero        
        PushD        $express-over-denominator 
        Exchange                               
        StoreI                                 
        PushD        $first-denominator        
        Exchange                               
        StoreI                                 
        PushD        $first-numerator          
        Exchange                               
        StoreI                                 
        PushD        $first-numerator          
        LoadI                                  
        PushD        $express-over-denominator 
        LoadI                                  
        Multiply                               
        PushD        $first-denominator        
        LoadI                                  
        Divide                                 
        PushD        $express-over-denominator 
        LoadI                                  
        Call         $$convert-to-lowest-terms 
        Nop                                    
        PushD        $first-denominator        
        Exchange                               
        StoreI                                 
        StoreI                                 
        PushI        4                         
        Add                                    
        PushD        $first-denominator        
        LoadI                                  
        StoreI                                 
        PushD        $global-memory-block      
        PushI        144                       
        Add                                    %% r18
        Duplicate                              
        PushF        0.400000                  
        PushI        3                         
        Duplicate                              
        JumpFalse    $$f-divide-by-zero        
        Duplicate                              
        PushD        $express-over-denominator 
        Exchange                               
        StoreI                                 
        ConvertF                               
        FMultiply                              
        ConvertI                               
        PushD        $express-over-denominator 
        LoadI                                  
        Call         $$convert-to-lowest-terms 
        PushD        $first-denominator        
        Exchange                               
        StoreI                                 
        StoreI                                 
        PushI        4                         
        Add                                    
        PushD        $first-denominator        
        LoadI                                  
        StoreI                                 
        PushD        $global-memory-block      
        PushI        0                         
        Add                                    %% r
        Duplicate                              
        LoadI                                  
        Exchange                               
        PushI        4                         
        Add                                    
        LoadI                                  
        Duplicate                              
        JumpPos      -print-rational-2-positive2 
        Negate                                 
        Exchange                               
        Negate                                 
        Exchange                               
        Label        -print-rational-2-positive2 
        PushD        $first-denominator        
        Exchange                               
        StoreI                                 
        PushD        $first-numerator          
        Exchange                               
        StoreI                                 
        PushD        $first-numerator          
        LoadI                                  
        PushD        $first-denominator        
        LoadI                                  
        Divide                                 
        Duplicate                              
        PushD        $first-denominator        
        LoadI                                  
        Multiply                               
        PushD        $first-numerator          
        LoadI                                  
        Exchange                               
        Subtract                               
        Duplicate                              
        JumpFalse    -print-rational-2-end-with-no-fraction 
        PushD        $first-numerator          
        Exchange                               
        StoreI                                 
        Duplicate                              
        PushD        $print-temp               
        Exchange                               
        StoreI                                 
        JumpFalse    -print-rational-2-end-with-no-int 
        PushD        $first-numerator          
        LoadI                                  
        Duplicate                              
        JumpPos      -print-rational-2-positive1 
        Negate                                 
        Label        -print-rational-2-positive1 
        PushD        $first-denominator        
        LoadI                                  
        Exchange                               
        PushD        $print-temp               
        LoadI                                  
        Jump         -print-rational-2-end-with-original 
        Label        -print-rational-2-end-with-no-fraction 
        Pop                                    
        PushD        $print-format-rational-no-frac 
        Jump         -print-rational-2-end-join 
        Label        -print-rational-2-end-with-no-int 
        PushD        $first-numerator          
        LoadI                                  
        Duplicate                              
        JumpPos      -print-rational-2-end-with-no-int-pos 
        Negate                                 
        Jump         -print-rational-2-end-with-no-int-neg 
        Label        -print-rational-2-end-with-no-int-pos 
        PushD        $first-denominator        
        LoadI                                  
        Exchange                               
        PushD        $print-format-rational-no-int-pos 
        Jump         -print-rational-2-end-join 
        Label        -print-rational-2-end-with-no-int-neg 
        PushD        $first-denominator        
        LoadI                                  
        Exchange                               
        PushD        $print-format-rantional-no-int-neg 
        Jump         -print-rational-2-end-join 
        Label        -print-rational-2-end-with-original 
        PushD        $print-format-rational-original 
        Jump         -print-rational-2-end-join 
        Label        -print-rational-2-end-join 
        Printf                                 
        PushD        $print-format-space       
        Printf                                 
        PushD        $global-memory-block      
        PushI        8                         
        Add                                    %% r2
        Duplicate                              
        LoadI                                  
        Exchange                               
        PushI        4                         
        Add                                    
        LoadI                                  
        Duplicate                              
        JumpPos      -print-rational-3-positive2 
        Negate                                 
        Exchange                               
        Negate                                 
        Exchange                               
        Label        -print-rational-3-positive2 
        PushD        $first-denominator        
        Exchange                               
        StoreI                                 
        PushD        $first-numerator          
        Exchange                               
        StoreI                                 
        PushD        $first-numerator          
        LoadI                                  
        PushD        $first-denominator        
        LoadI                                  
        Divide                                 
        Duplicate                              
        PushD        $first-denominator        
        LoadI                                  
        Multiply                               
        PushD        $first-numerator          
        LoadI                                  
        Exchange                               
        Subtract                               
        Duplicate                              
        JumpFalse    -print-rational-3-end-with-no-fraction 
        PushD        $first-numerator          
        Exchange                               
        StoreI                                 
        Duplicate                              
        PushD        $print-temp               
        Exchange                               
        StoreI                                 
        JumpFalse    -print-rational-3-end-with-no-int 
        PushD        $first-numerator          
        LoadI                                  
        Duplicate                              
        JumpPos      -print-rational-3-positive1 
        Negate                                 
        Label        -print-rational-3-positive1 
        PushD        $first-denominator        
        LoadI                                  
        Exchange                               
        PushD        $print-temp               
        LoadI                                  
        Jump         -print-rational-3-end-with-original 
        Label        -print-rational-3-end-with-no-fraction 
        Pop                                    
        PushD        $print-format-rational-no-frac 
        Jump         -print-rational-3-end-join 
        Label        -print-rational-3-end-with-no-int 
        PushD        $first-numerator          
        LoadI                                  
        Duplicate                              
        JumpPos      -print-rational-3-end-with-no-int-pos 
        Negate                                 
        Jump         -print-rational-3-end-with-no-int-neg 
        Label        -print-rational-3-end-with-no-int-pos 
        PushD        $first-denominator        
        LoadI                                  
        Exchange                               
        PushD        $print-format-rational-no-int-pos 
        Jump         -print-rational-3-end-join 
        Label        -print-rational-3-end-with-no-int-neg 
        PushD        $first-denominator        
        LoadI                                  
        Exchange                               
        PushD        $print-format-rantional-no-int-neg 
        Jump         -print-rational-3-end-join 
        Label        -print-rational-3-end-with-original 
        PushD        $print-format-rational-original 
        Jump         -print-rational-3-end-join 
        Label        -print-rational-3-end-join 
        Printf                                 
        PushD        $print-format-space       
        Printf                                 
        PushD        $global-memory-block      
        PushI        16                        
        Add                                    %% r3
        Duplicate                              
        LoadI                                  
        Exchange                               
        PushI        4                         
        Add                                    
        LoadI                                  
        Duplicate                              
        JumpPos      -print-rational-4-positive2 
        Negate                                 
        Exchange                               
        Negate                                 
        Exchange                               
        Label        -print-rational-4-positive2 
        PushD        $first-denominator        
        Exchange                               
        StoreI                                 
        PushD        $first-numerator          
        Exchange                               
        StoreI                                 
        PushD        $first-numerator          
        LoadI                                  
        PushD        $first-denominator        
        LoadI                                  
        Divide                                 
        Duplicate                              
        PushD        $first-denominator        
        LoadI                                  
        Multiply                               
        PushD        $first-numerator          
        LoadI                                  
        Exchange                               
        Subtract                               
        Duplicate                              
        JumpFalse    -print-rational-4-end-with-no-fraction 
        PushD        $first-numerator          
        Exchange                               
        StoreI                                 
        Duplicate                              
        PushD        $print-temp               
        Exchange                               
        StoreI                                 
        JumpFalse    -print-rational-4-end-with-no-int 
        PushD        $first-numerator          
        LoadI                                  
        Duplicate                              
        JumpPos      -print-rational-4-positive1 
        Negate                                 
        Label        -print-rational-4-positive1 
        PushD        $first-denominator        
        LoadI                                  
        Exchange                               
        PushD        $print-temp               
        LoadI                                  
        Jump         -print-rational-4-end-with-original 
        Label        -print-rational-4-end-with-no-fraction 
        Pop                                    
        PushD        $print-format-rational-no-frac 
        Jump         -print-rational-4-end-join 
        Label        -print-rational-4-end-with-no-int 
        PushD        $first-numerator          
        LoadI                                  
        Duplicate                              
        JumpPos      -print-rational-4-end-with-no-int-pos 
        Negate                                 
        Jump         -print-rational-4-end-with-no-int-neg 
        Label        -print-rational-4-end-with-no-int-pos 
        PushD        $first-denominator        
        LoadI                                  
        Exchange                               
        PushD        $print-format-rational-no-int-pos 
        Jump         -print-rational-4-end-join 
        Label        -print-rational-4-end-with-no-int-neg 
        PushD        $first-denominator        
        LoadI                                  
        Exchange                               
        PushD        $print-format-rantional-no-int-neg 
        Jump         -print-rational-4-end-join 
        Label        -print-rational-4-end-with-original 
        PushD        $print-format-rational-original 
        Jump         -print-rational-4-end-join 
        Label        -print-rational-4-end-join 
        Printf                                 
        PushD        $print-format-space       
        Printf                                 
        PushD        $global-memory-block      
        PushI        24                        
        Add                                    %% r4
        Duplicate                              
        LoadI                                  
        Exchange                               
        PushI        4                         
        Add                                    
        LoadI                                  
        Duplicate                              
        JumpPos      -print-rational-5-positive2 
        Negate                                 
        Exchange                               
        Negate                                 
        Exchange                               
        Label        -print-rational-5-positive2 
        PushD        $first-denominator        
        Exchange                               
        StoreI                                 
        PushD        $first-numerator          
        Exchange                               
        StoreI                                 
        PushD        $first-numerator          
        LoadI                                  
        PushD        $first-denominator        
        LoadI                                  
        Divide                                 
        Duplicate                              
        PushD        $first-denominator        
        LoadI                                  
        Multiply                               
        PushD        $first-numerator          
        LoadI                                  
        Exchange                               
        Subtract                               
        Duplicate                              
        JumpFalse    -print-rational-5-end-with-no-fraction 
        PushD        $first-numerator          
        Exchange                               
        StoreI                                 
        Duplicate                              
        PushD        $print-temp               
        Exchange                               
        StoreI                                 
        JumpFalse    -print-rational-5-end-with-no-int 
        PushD        $first-numerator          
        LoadI                                  
        Duplicate                              
        JumpPos      -print-rational-5-positive1 
        Negate                                 
        Label        -print-rational-5-positive1 
        PushD        $first-denominator        
        LoadI                                  
        Exchange                               
        PushD        $print-temp               
        LoadI                                  
        Jump         -print-rational-5-end-with-original 
        Label        -print-rational-5-end-with-no-fraction 
        Pop                                    
        PushD        $print-format-rational-no-frac 
        Jump         -print-rational-5-end-join 
        Label        -print-rational-5-end-with-no-int 
        PushD        $first-numerator          
        LoadI                                  
        Duplicate                              
        JumpPos      -print-rational-5-end-with-no-int-pos 
        Negate                                 
        Jump         -print-rational-5-end-with-no-int-neg 
        Label        -print-rational-5-end-with-no-int-pos 
        PushD        $first-denominator        
        LoadI                                  
        Exchange                               
        PushD        $print-format-rational-no-int-pos 
        Jump         -print-rational-5-end-join 
        Label        -print-rational-5-end-with-no-int-neg 
        PushD        $first-denominator        
        LoadI                                  
        Exchange                               
        PushD        $print-format-rantional-no-int-neg 
        Jump         -print-rational-5-end-join 
        Label        -print-rational-5-end-with-original 
        PushD        $print-format-rational-original 
        Jump         -print-rational-5-end-join 
        Label        -print-rational-5-end-join 
        Printf                                 
        PushD        $print-format-space       
        Printf                                 
        PushD        $global-memory-block      
        PushI        32                        
        Add                                    %% r5
        Duplicate                              
        LoadI                                  
        Exchange                               
        PushI        4                         
        Add                                    
        LoadI                                  
        Duplicate                              
        JumpPos      -print-rational-6-positive2 
        Negate                                 
        Exchange                               
        Negate                                 
        Exchange                               
        Label        -print-rational-6-positive2 
        PushD        $first-denominator        
        Exchange                               
        StoreI                                 
        PushD        $first-numerator          
        Exchange                               
        StoreI                                 
        PushD        $first-numerator          
        LoadI                                  
        PushD        $first-denominator        
        LoadI                                  
        Divide                                 
        Duplicate                              
        PushD        $first-denominator        
        LoadI                                  
        Multiply                               
        PushD        $first-numerator          
        LoadI                                  
        Exchange                               
        Subtract                               
        Duplicate                              
        JumpFalse    -print-rational-6-end-with-no-fraction 
        PushD        $first-numerator          
        Exchange                               
        StoreI                                 
        Duplicate                              
        PushD        $print-temp               
        Exchange                               
        StoreI                                 
        JumpFalse    -print-rational-6-end-with-no-int 
        PushD        $first-numerator          
        LoadI                                  
        Duplicate                              
        JumpPos      -print-rational-6-positive1 
        Negate                                 
        Label        -print-rational-6-positive1 
        PushD        $first-denominator        
        LoadI                                  
        Exchange                               
        PushD        $print-temp               
        LoadI                                  
        Jump         -print-rational-6-end-with-original 
        Label        -print-rational-6-end-with-no-fraction 
        Pop                                    
        PushD        $print-format-rational-no-frac 
        Jump         -print-rational-6-end-join 
        Label        -print-rational-6-end-with-no-int 
        PushD        $first-numerator          
        LoadI                                  
        Duplicate                              
        JumpPos      -print-rational-6-end-with-no-int-pos 
        Negate                                 
        Jump         -print-rational-6-end-with-no-int-neg 
        Label        -print-rational-6-end-with-no-int-pos 
        PushD        $first-denominator        
        LoadI                                  
        Exchange                               
        PushD        $print-format-rational-no-int-pos 
        Jump         -print-rational-6-end-join 
        Label        -print-rational-6-end-with-no-int-neg 
        PushD        $first-denominator        
        LoadI                                  
        Exchange                               
        PushD        $print-format-rantional-no-int-neg 
        Jump         -print-rational-6-end-join 
        Label        -print-rational-6-end-with-original 
        PushD        $print-format-rational-original 
        Jump         -print-rational-6-end-join 
        Label        -print-rational-6-end-join 
        Printf                                 
        PushD        $print-format-space       
        Printf                                 
        PushD        $global-memory-block      
        PushI        40                        
        Add                                    %% r6
        Duplicate                              
        LoadI                                  
        Exchange                               
        PushI        4                         
        Add                                    
        LoadI                                  
        Duplicate                              
        JumpPos      -print-rational-7-positive2 
        Negate                                 
        Exchange                               
        Negate                                 
        Exchange                               
        Label        -print-rational-7-positive2 
        PushD        $first-denominator        
        Exchange                               
        StoreI                                 
        PushD        $first-numerator          
        Exchange                               
        StoreI                                 
        PushD        $first-numerator          
        LoadI                                  
        PushD        $first-denominator        
        LoadI                                  
        Divide                                 
        Duplicate                              
        PushD        $first-denominator        
        LoadI                                  
        Multiply                               
        PushD        $first-numerator          
        LoadI                                  
        Exchange                               
        Subtract                               
        Duplicate                              
        JumpFalse    -print-rational-7-end-with-no-fraction 
        PushD        $first-numerator          
        Exchange                               
        StoreI                                 
        Duplicate                              
        PushD        $print-temp               
        Exchange                               
        StoreI                                 
        JumpFalse    -print-rational-7-end-with-no-int 
        PushD        $first-numerator          
        LoadI                                  
        Duplicate                              
        JumpPos      -print-rational-7-positive1 
        Negate                                 
        Label        -print-rational-7-positive1 
        PushD        $first-denominator        
        LoadI                                  
        Exchange                               
        PushD        $print-temp               
        LoadI                                  
        Jump         -print-rational-7-end-with-original 
        Label        -print-rational-7-end-with-no-fraction 
        Pop                                    
        PushD        $print-format-rational-no-frac 
        Jump         -print-rational-7-end-join 
        Label        -print-rational-7-end-with-no-int 
        PushD        $first-numerator          
        LoadI                                  
        Duplicate                              
        JumpPos      -print-rational-7-end-with-no-int-pos 
        Negate                                 
        Jump         -print-rational-7-end-with-no-int-neg 
        Label        -print-rational-7-end-with-no-int-pos 
        PushD        $first-denominator        
        LoadI                                  
        Exchange                               
        PushD        $print-format-rational-no-int-pos 
        Jump         -print-rational-7-end-join 
        Label        -print-rational-7-end-with-no-int-neg 
        PushD        $first-denominator        
        LoadI                                  
        Exchange                               
        PushD        $print-format-rantional-no-int-neg 
        Jump         -print-rational-7-end-join 
        Label        -print-rational-7-end-with-original 
        PushD        $print-format-rational-original 
        Jump         -print-rational-7-end-join 
        Label        -print-rational-7-end-join 
        Printf                                 
        PushD        $print-format-space       
        Printf                                 
        PushD        $global-memory-block      
        PushI        48                        
        Add                                    %% r7
        Duplicate                              
        LoadI                                  
        Exchange                               
        PushI        4                         
        Add                                    
        LoadI                                  
        Duplicate                              
        JumpPos      -print-rational-8-positive2 
        Negate                                 
        Exchange                               
        Negate                                 
        Exchange                               
        Label        -print-rational-8-positive2 
        PushD        $first-denominator        
        Exchange                               
        StoreI                                 
        PushD        $first-numerator          
        Exchange                               
        StoreI                                 
        PushD        $first-numerator          
        LoadI                                  
        PushD        $first-denominator        
        LoadI                                  
        Divide                                 
        Duplicate                              
        PushD        $first-denominator        
        LoadI                                  
        Multiply                               
        PushD        $first-numerator          
        LoadI                                  
        Exchange                               
        Subtract                               
        Duplicate                              
        JumpFalse    -print-rational-8-end-with-no-fraction 
        PushD        $first-numerator          
        Exchange                               
        StoreI                                 
        Duplicate                              
        PushD        $print-temp               
        Exchange                               
        StoreI                                 
        JumpFalse    -print-rational-8-end-with-no-int 
        PushD        $first-numerator          
        LoadI                                  
        Duplicate                              
        JumpPos      -print-rational-8-positive1 
        Negate                                 
        Label        -print-rational-8-positive1 
        PushD        $first-denominator        
        LoadI                                  
        Exchange                               
        PushD        $print-temp               
        LoadI                                  
        Jump         -print-rational-8-end-with-original 
        Label        -print-rational-8-end-with-no-fraction 
        Pop                                    
        PushD        $print-format-rational-no-frac 
        Jump         -print-rational-8-end-join 
        Label        -print-rational-8-end-with-no-int 
        PushD        $first-numerator          
        LoadI                                  
        Duplicate                              
        JumpPos      -print-rational-8-end-with-no-int-pos 
        Negate                                 
        Jump         -print-rational-8-end-with-no-int-neg 
        Label        -print-rational-8-end-with-no-int-pos 
        PushD        $first-denominator        
        LoadI                                  
        Exchange                               
        PushD        $print-format-rational-no-int-pos 
        Jump         -print-rational-8-end-join 
        Label        -print-rational-8-end-with-no-int-neg 
        PushD        $first-denominator        
        LoadI                                  
        Exchange                               
        PushD        $print-format-rantional-no-int-neg 
        Jump         -print-rational-8-end-join 
        Label        -print-rational-8-end-with-original 
        PushD        $print-format-rational-original 
        Jump         -print-rational-8-end-join 
        Label        -print-rational-8-end-join 
        Printf                                 
        PushD        $print-format-space       
        Printf                                 
        PushD        $global-memory-block      
        PushI        56                        
        Add                                    %% r8
        Duplicate                              
        LoadI                                  
        Exchange                               
        PushI        4                         
        Add                                    
        LoadI                                  
        Duplicate                              
        JumpPos      -print-rational-9-positive2 
        Negate                                 
        Exchange                               
        Negate                                 
        Exchange                               
        Label        -print-rational-9-positive2 
        PushD        $first-denominator        
        Exchange                               
        StoreI                                 
        PushD        $first-numerator          
        Exchange                               
        StoreI                                 
        PushD        $first-numerator          
        LoadI                                  
        PushD        $first-denominator        
        LoadI                                  
        Divide                                 
        Duplicate                              
        PushD        $first-denominator        
        LoadI                                  
        Multiply                               
        PushD        $first-numerator          
        LoadI                                  
        Exchange                               
        Subtract                               
        Duplicate                              
        JumpFalse    -print-rational-9-end-with-no-fraction 
        PushD        $first-numerator          
        Exchange                               
        StoreI                                 
        Duplicate                              
        PushD        $print-temp               
        Exchange                               
        StoreI                                 
        JumpFalse    -print-rational-9-end-with-no-int 
        PushD        $first-numerator          
        LoadI                                  
        Duplicate                              
        JumpPos      -print-rational-9-positive1 
        Negate                                 
        Label        -print-rational-9-positive1 
        PushD        $first-denominator        
        LoadI                                  
        Exchange                               
        PushD        $print-temp               
        LoadI                                  
        Jump         -print-rational-9-end-with-original 
        Label        -print-rational-9-end-with-no-fraction 
        Pop                                    
        PushD        $print-format-rational-no-frac 
        Jump         -print-rational-9-end-join 
        Label        -print-rational-9-end-with-no-int 
        PushD        $first-numerator          
        LoadI                                  
        Duplicate                              
        JumpPos      -print-rational-9-end-with-no-int-pos 
        Negate                                 
        Jump         -print-rational-9-end-with-no-int-neg 
        Label        -print-rational-9-end-with-no-int-pos 
        PushD        $first-denominator        
        LoadI                                  
        Exchange                               
        PushD        $print-format-rational-no-int-pos 
        Jump         -print-rational-9-end-join 
        Label        -print-rational-9-end-with-no-int-neg 
        PushD        $first-denominator        
        LoadI                                  
        Exchange                               
        PushD        $print-format-rantional-no-int-neg 
        Jump         -print-rational-9-end-join 
        Label        -print-rational-9-end-with-original 
        PushD        $print-format-rational-original 
        Jump         -print-rational-9-end-join 
        Label        -print-rational-9-end-join 
        Printf                                 
        PushD        $print-format-space       
        Printf                                 
        PushD        $global-memory-block      
        PushI        64                        
        Add                                    %% r9
        Duplicate                              
        LoadI                                  
        Exchange                               
        PushI        4                         
        Add                                    
        LoadI                                  
        Duplicate                              
        JumpPos      -print-rational-10-positive2 
        Negate                                 
        Exchange                               
        Negate                                 
        Exchange                               
        Label        -print-rational-10-positive2 
        PushD        $first-denominator        
        Exchange                               
        StoreI                                 
        PushD        $first-numerator          
        Exchange                               
        StoreI                                 
        PushD        $first-numerator          
        LoadI                                  
        PushD        $first-denominator        
        LoadI                                  
        Divide                                 
        Duplicate                              
        PushD        $first-denominator        
        LoadI                                  
        Multiply                               
        PushD        $first-numerator          
        LoadI                                  
        Exchange                               
        Subtract                               
        Duplicate                              
        JumpFalse    -print-rational-10-end-with-no-fraction 
        PushD        $first-numerator          
        Exchange                               
        StoreI                                 
        Duplicate                              
        PushD        $print-temp               
        Exchange                               
        StoreI                                 
        JumpFalse    -print-rational-10-end-with-no-int 
        PushD        $first-numerator          
        LoadI                                  
        Duplicate                              
        JumpPos      -print-rational-10-positive1 
        Negate                                 
        Label        -print-rational-10-positive1 
        PushD        $first-denominator        
        LoadI                                  
        Exchange                               
        PushD        $print-temp               
        LoadI                                  
        Jump         -print-rational-10-end-with-original 
        Label        -print-rational-10-end-with-no-fraction 
        Pop                                    
        PushD        $print-format-rational-no-frac 
        Jump         -print-rational-10-end-join 
        Label        -print-rational-10-end-with-no-int 
        PushD        $first-numerator          
        LoadI                                  
        Duplicate                              
        JumpPos      -print-rational-10-end-with-no-int-pos 
        Negate                                 
        Jump         -print-rational-10-end-with-no-int-neg 
        Label        -print-rational-10-end-with-no-int-pos 
        PushD        $first-denominator        
        LoadI                                  
        Exchange                               
        PushD        $print-format-rational-no-int-pos 
        Jump         -print-rational-10-end-join 
        Label        -print-rational-10-end-with-no-int-neg 
        PushD        $first-denominator        
        LoadI                                  
        Exchange                               
        PushD        $print-format-rantional-no-int-neg 
        Jump         -print-rational-10-end-join 
        Label        -print-rational-10-end-with-original 
        PushD        $print-format-rational-original 
        Jump         -print-rational-10-end-join 
        Label        -print-rational-10-end-join 
        Printf                                 
        PushD        $print-format-space       
        Printf                                 
        PushD        $global-memory-block      
        PushI        72                        
        Add                                    %% r10
        Duplicate                              
        LoadI                                  
        Exchange                               
        PushI        4                         
        Add                                    
        LoadI                                  
        Duplicate                              
        JumpPos      -print-rational-11-positive2 
        Negate                                 
        Exchange                               
        Negate                                 
        Exchange                               
        Label        -print-rational-11-positive2 
        PushD        $first-denominator        
        Exchange                               
        StoreI                                 
        PushD        $first-numerator          
        Exchange                               
        StoreI                                 
        PushD        $first-numerator          
        LoadI                                  
        PushD        $first-denominator        
        LoadI                                  
        Divide                                 
        Duplicate                              
        PushD        $first-denominator        
        LoadI                                  
        Multiply                               
        PushD        $first-numerator          
        LoadI                                  
        Exchange                               
        Subtract                               
        Duplicate                              
        JumpFalse    -print-rational-11-end-with-no-fraction 
        PushD        $first-numerator          
        Exchange                               
        StoreI                                 
        Duplicate                              
        PushD        $print-temp               
        Exchange                               
        StoreI                                 
        JumpFalse    -print-rational-11-end-with-no-int 
        PushD        $first-numerator          
        LoadI                                  
        Duplicate                              
        JumpPos      -print-rational-11-positive1 
        Negate                                 
        Label        -print-rational-11-positive1 
        PushD        $first-denominator        
        LoadI                                  
        Exchange                               
        PushD        $print-temp               
        LoadI                                  
        Jump         -print-rational-11-end-with-original 
        Label        -print-rational-11-end-with-no-fraction 
        Pop                                    
        PushD        $print-format-rational-no-frac 
        Jump         -print-rational-11-end-join 
        Label        -print-rational-11-end-with-no-int 
        PushD        $first-numerator          
        LoadI                                  
        Duplicate                              
        JumpPos      -print-rational-11-end-with-no-int-pos 
        Negate                                 
        Jump         -print-rational-11-end-with-no-int-neg 
        Label        -print-rational-11-end-with-no-int-pos 
        PushD        $first-denominator        
        LoadI                                  
        Exchange                               
        PushD        $print-format-rational-no-int-pos 
        Jump         -print-rational-11-end-join 
        Label        -print-rational-11-end-with-no-int-neg 
        PushD        $first-denominator        
        LoadI                                  
        Exchange                               
        PushD        $print-format-rantional-no-int-neg 
        Jump         -print-rational-11-end-join 
        Label        -print-rational-11-end-with-original 
        PushD        $print-format-rational-original 
        Jump         -print-rational-11-end-join 
        Label        -print-rational-11-end-join 
        Printf                                 
        PushD        $print-format-space       
        Printf                                 
        PushD        $global-memory-block      
        PushI        80                        
        Add                                    %% r11
        Duplicate                              
        LoadI                                  
        Exchange                               
        PushI        4                         
        Add                                    
        LoadI                                  
        Duplicate                              
        JumpPos      -print-rational-12-positive2 
        Negate                                 
        Exchange                               
        Negate                                 
        Exchange                               
        Label        -print-rational-12-positive2 
        PushD        $first-denominator        
        Exchange                               
        StoreI                                 
        PushD        $first-numerator          
        Exchange                               
        StoreI                                 
        PushD        $first-numerator          
        LoadI                                  
        PushD        $first-denominator        
        LoadI                                  
        Divide                                 
        Duplicate                              
        PushD        $first-denominator        
        LoadI                                  
        Multiply                               
        PushD        $first-numerator          
        LoadI                                  
        Exchange                               
        Subtract                               
        Duplicate                              
        JumpFalse    -print-rational-12-end-with-no-fraction 
        PushD        $first-numerator          
        Exchange                               
        StoreI                                 
        Duplicate                              
        PushD        $print-temp               
        Exchange                               
        StoreI                                 
        JumpFalse    -print-rational-12-end-with-no-int 
        PushD        $first-numerator          
        LoadI                                  
        Duplicate                              
        JumpPos      -print-rational-12-positive1 
        Negate                                 
        Label        -print-rational-12-positive1 
        PushD        $first-denominator        
        LoadI                                  
        Exchange                               
        PushD        $print-temp               
        LoadI                                  
        Jump         -print-rational-12-end-with-original 
        Label        -print-rational-12-end-with-no-fraction 
        Pop                                    
        PushD        $print-format-rational-no-frac 
        Jump         -print-rational-12-end-join 
        Label        -print-rational-12-end-with-no-int 
        PushD        $first-numerator          
        LoadI                                  
        Duplicate                              
        JumpPos      -print-rational-12-end-with-no-int-pos 
        Negate                                 
        Jump         -print-rational-12-end-with-no-int-neg 
        Label        -print-rational-12-end-with-no-int-pos 
        PushD        $first-denominator        
        LoadI                                  
        Exchange                               
        PushD        $print-format-rational-no-int-pos 
        Jump         -print-rational-12-end-join 
        Label        -print-rational-12-end-with-no-int-neg 
        PushD        $first-denominator        
        LoadI                                  
        Exchange                               
        PushD        $print-format-rantional-no-int-neg 
        Jump         -print-rational-12-end-join 
        Label        -print-rational-12-end-with-original 
        PushD        $print-format-rational-original 
        Jump         -print-rational-12-end-join 
        Label        -print-rational-12-end-join 
        Printf                                 
        PushD        $print-format-space       
        Printf                                 
        PushD        $global-memory-block      
        PushI        88                        
        Add                                    %% r12
        Duplicate                              
        LoadI                                  
        Exchange                               
        PushI        4                         
        Add                                    
        LoadI                                  
        Duplicate                              
        JumpPos      -print-rational-13-positive2 
        Negate                                 
        Exchange                               
        Negate                                 
        Exchange                               
        Label        -print-rational-13-positive2 
        PushD        $first-denominator        
        Exchange                               
        StoreI                                 
        PushD        $first-numerator          
        Exchange                               
        StoreI                                 
        PushD        $first-numerator          
        LoadI                                  
        PushD        $first-denominator        
        LoadI                                  
        Divide                                 
        Duplicate                              
        PushD        $first-denominator        
        LoadI                                  
        Multiply                               
        PushD        $first-numerator          
        LoadI                                  
        Exchange                               
        Subtract                               
        Duplicate                              
        JumpFalse    -print-rational-13-end-with-no-fraction 
        PushD        $first-numerator          
        Exchange                               
        StoreI                                 
        Duplicate                              
        PushD        $print-temp               
        Exchange                               
        StoreI                                 
        JumpFalse    -print-rational-13-end-with-no-int 
        PushD        $first-numerator          
        LoadI                                  
        Duplicate                              
        JumpPos      -print-rational-13-positive1 
        Negate                                 
        Label        -print-rational-13-positive1 
        PushD        $first-denominator        
        LoadI                                  
        Exchange                               
        PushD        $print-temp               
        LoadI                                  
        Jump         -print-rational-13-end-with-original 
        Label        -print-rational-13-end-with-no-fraction 
        Pop                                    
        PushD        $print-format-rational-no-frac 
        Jump         -print-rational-13-end-join 
        Label        -print-rational-13-end-with-no-int 
        PushD        $first-numerator          
        LoadI                                  
        Duplicate                              
        JumpPos      -print-rational-13-end-with-no-int-pos 
        Negate                                 
        Jump         -print-rational-13-end-with-no-int-neg 
        Label        -print-rational-13-end-with-no-int-pos 
        PushD        $first-denominator        
        LoadI                                  
        Exchange                               
        PushD        $print-format-rational-no-int-pos 
        Jump         -print-rational-13-end-join 
        Label        -print-rational-13-end-with-no-int-neg 
        PushD        $first-denominator        
        LoadI                                  
        Exchange                               
        PushD        $print-format-rantional-no-int-neg 
        Jump         -print-rational-13-end-join 
        Label        -print-rational-13-end-with-original 
        PushD        $print-format-rational-original 
        Jump         -print-rational-13-end-join 
        Label        -print-rational-13-end-join 
        Printf                                 
        PushD        $print-format-space       
        Printf                                 
        PushD        $global-memory-block      
        PushI        96                        
        Add                                    %% r13
        Duplicate                              
        LoadI                                  
        Exchange                               
        PushI        4                         
        Add                                    
        LoadI                                  
        Duplicate                              
        JumpPos      -print-rational-14-positive2 
        Negate                                 
        Exchange                               
        Negate                                 
        Exchange                               
        Label        -print-rational-14-positive2 
        PushD        $first-denominator        
        Exchange                               
        StoreI                                 
        PushD        $first-numerator          
        Exchange                               
        StoreI                                 
        PushD        $first-numerator          
        LoadI                                  
        PushD        $first-denominator        
        LoadI                                  
        Divide                                 
        Duplicate                              
        PushD        $first-denominator        
        LoadI                                  
        Multiply                               
        PushD        $first-numerator          
        LoadI                                  
        Exchange                               
        Subtract                               
        Duplicate                              
        JumpFalse    -print-rational-14-end-with-no-fraction 
        PushD        $first-numerator          
        Exchange                               
        StoreI                                 
        Duplicate                              
        PushD        $print-temp               
        Exchange                               
        StoreI                                 
        JumpFalse    -print-rational-14-end-with-no-int 
        PushD        $first-numerator          
        LoadI                                  
        Duplicate                              
        JumpPos      -print-rational-14-positive1 
        Negate                                 
        Label        -print-rational-14-positive1 
        PushD        $first-denominator        
        LoadI                                  
        Exchange                               
        PushD        $print-temp               
        LoadI                                  
        Jump         -print-rational-14-end-with-original 
        Label        -print-rational-14-end-with-no-fraction 
        Pop                                    
        PushD        $print-format-rational-no-frac 
        Jump         -print-rational-14-end-join 
        Label        -print-rational-14-end-with-no-int 
        PushD        $first-numerator          
        LoadI                                  
        Duplicate                              
        JumpPos      -print-rational-14-end-with-no-int-pos 
        Negate                                 
        Jump         -print-rational-14-end-with-no-int-neg 
        Label        -print-rational-14-end-with-no-int-pos 
        PushD        $first-denominator        
        LoadI                                  
        Exchange                               
        PushD        $print-format-rational-no-int-pos 
        Jump         -print-rational-14-end-join 
        Label        -print-rational-14-end-with-no-int-neg 
        PushD        $first-denominator        
        LoadI                                  
        Exchange                               
        PushD        $print-format-rantional-no-int-neg 
        Jump         -print-rational-14-end-join 
        Label        -print-rational-14-end-with-original 
        PushD        $print-format-rational-original 
        Jump         -print-rational-14-end-join 
        Label        -print-rational-14-end-join 
        Printf                                 
        PushD        $print-format-space       
        Printf                                 
        PushD        $global-memory-block      
        PushI        104                       
        Add                                    %% r14
        Duplicate                              
        LoadI                                  
        Exchange                               
        PushI        4                         
        Add                                    
        LoadI                                  
        Duplicate                              
        JumpPos      -print-rational-15-positive2 
        Negate                                 
        Exchange                               
        Negate                                 
        Exchange                               
        Label        -print-rational-15-positive2 
        PushD        $first-denominator        
        Exchange                               
        StoreI                                 
        PushD        $first-numerator          
        Exchange                               
        StoreI                                 
        PushD        $first-numerator          
        LoadI                                  
        PushD        $first-denominator        
        LoadI                                  
        Divide                                 
        Duplicate                              
        PushD        $first-denominator        
        LoadI                                  
        Multiply                               
        PushD        $first-numerator          
        LoadI                                  
        Exchange                               
        Subtract                               
        Duplicate                              
        JumpFalse    -print-rational-15-end-with-no-fraction 
        PushD        $first-numerator          
        Exchange                               
        StoreI                                 
        Duplicate                              
        PushD        $print-temp               
        Exchange                               
        StoreI                                 
        JumpFalse    -print-rational-15-end-with-no-int 
        PushD        $first-numerator          
        LoadI                                  
        Duplicate                              
        JumpPos      -print-rational-15-positive1 
        Negate                                 
        Label        -print-rational-15-positive1 
        PushD        $first-denominator        
        LoadI                                  
        Exchange                               
        PushD        $print-temp               
        LoadI                                  
        Jump         -print-rational-15-end-with-original 
        Label        -print-rational-15-end-with-no-fraction 
        Pop                                    
        PushD        $print-format-rational-no-frac 
        Jump         -print-rational-15-end-join 
        Label        -print-rational-15-end-with-no-int 
        PushD        $first-numerator          
        LoadI                                  
        Duplicate                              
        JumpPos      -print-rational-15-end-with-no-int-pos 
        Negate                                 
        Jump         -print-rational-15-end-with-no-int-neg 
        Label        -print-rational-15-end-with-no-int-pos 
        PushD        $first-denominator        
        LoadI                                  
        Exchange                               
        PushD        $print-format-rational-no-int-pos 
        Jump         -print-rational-15-end-join 
        Label        -print-rational-15-end-with-no-int-neg 
        PushD        $first-denominator        
        LoadI                                  
        Exchange                               
        PushD        $print-format-rantional-no-int-neg 
        Jump         -print-rational-15-end-join 
        Label        -print-rational-15-end-with-original 
        PushD        $print-format-rational-original 
        Jump         -print-rational-15-end-join 
        Label        -print-rational-15-end-join 
        Printf                                 
        PushD        $print-format-space       
        Printf                                 
        PushD        $global-memory-block      
        PushI        120                       
        Add                                    %% r15
        Duplicate                              
        LoadI                                  
        Exchange                               
        PushI        4                         
        Add                                    
        LoadI                                  
        Duplicate                              
        JumpPos      -print-rational-16-positive2 
        Negate                                 
        Exchange                               
        Negate                                 
        Exchange                               
        Label        -print-rational-16-positive2 
        PushD        $first-denominator        
        Exchange                               
        StoreI                                 
        PushD        $first-numerator          
        Exchange                               
        StoreI                                 
        PushD        $first-numerator          
        LoadI                                  
        PushD        $first-denominator        
        LoadI                                  
        Divide                                 
        Duplicate                              
        PushD        $first-denominator        
        LoadI                                  
        Multiply                               
        PushD        $first-numerator          
        LoadI                                  
        Exchange                               
        Subtract                               
        Duplicate                              
        JumpFalse    -print-rational-16-end-with-no-fraction 
        PushD        $first-numerator          
        Exchange                               
        StoreI                                 
        Duplicate                              
        PushD        $print-temp               
        Exchange                               
        StoreI                                 
        JumpFalse    -print-rational-16-end-with-no-int 
        PushD        $first-numerator          
        LoadI                                  
        Duplicate                              
        JumpPos      -print-rational-16-positive1 
        Negate                                 
        Label        -print-rational-16-positive1 
        PushD        $first-denominator        
        LoadI                                  
        Exchange                               
        PushD        $print-temp               
        LoadI                                  
        Jump         -print-rational-16-end-with-original 
        Label        -print-rational-16-end-with-no-fraction 
        Pop                                    
        PushD        $print-format-rational-no-frac 
        Jump         -print-rational-16-end-join 
        Label        -print-rational-16-end-with-no-int 
        PushD        $first-numerator          
        LoadI                                  
        Duplicate                              
        JumpPos      -print-rational-16-end-with-no-int-pos 
        Negate                                 
        Jump         -print-rational-16-end-with-no-int-neg 
        Label        -print-rational-16-end-with-no-int-pos 
        PushD        $first-denominator        
        LoadI                                  
        Exchange                               
        PushD        $print-format-rational-no-int-pos 
        Jump         -print-rational-16-end-join 
        Label        -print-rational-16-end-with-no-int-neg 
        PushD        $first-denominator        
        LoadI                                  
        Exchange                               
        PushD        $print-format-rantional-no-int-neg 
        Jump         -print-rational-16-end-join 
        Label        -print-rational-16-end-with-original 
        PushD        $print-format-rational-original 
        Jump         -print-rational-16-end-join 
        Label        -print-rational-16-end-join 
        Printf                                 
        PushD        $print-format-space       
        Printf                                 
        PushD        $global-memory-block      
        PushI        128                       
        Add                                    %% r16
        Duplicate                              
        LoadI                                  
        Exchange                               
        PushI        4                         
        Add                                    
        LoadI                                  
        Duplicate                              
        JumpPos      -print-rational-17-positive2 
        Negate                                 
        Exchange                               
        Negate                                 
        Exchange                               
        Label        -print-rational-17-positive2 
        PushD        $first-denominator        
        Exchange                               
        StoreI                                 
        PushD        $first-numerator          
        Exchange                               
        StoreI                                 
        PushD        $first-numerator          
        LoadI                                  
        PushD        $first-denominator        
        LoadI                                  
        Divide                                 
        Duplicate                              
        PushD        $first-denominator        
        LoadI                                  
        Multiply                               
        PushD        $first-numerator          
        LoadI                                  
        Exchange                               
        Subtract                               
        Duplicate                              
        JumpFalse    -print-rational-17-end-with-no-fraction 
        PushD        $first-numerator          
        Exchange                               
        StoreI                                 
        Duplicate                              
        PushD        $print-temp               
        Exchange                               
        StoreI                                 
        JumpFalse    -print-rational-17-end-with-no-int 
        PushD        $first-numerator          
        LoadI                                  
        Duplicate                              
        JumpPos      -print-rational-17-positive1 
        Negate                                 
        Label        -print-rational-17-positive1 
        PushD        $first-denominator        
        LoadI                                  
        Exchange                               
        PushD        $print-temp               
        LoadI                                  
        Jump         -print-rational-17-end-with-original 
        Label        -print-rational-17-end-with-no-fraction 
        Pop                                    
        PushD        $print-format-rational-no-frac 
        Jump         -print-rational-17-end-join 
        Label        -print-rational-17-end-with-no-int 
        PushD        $first-numerator          
        LoadI                                  
        Duplicate                              
        JumpPos      -print-rational-17-end-with-no-int-pos 
        Negate                                 
        Jump         -print-rational-17-end-with-no-int-neg 
        Label        -print-rational-17-end-with-no-int-pos 
        PushD        $first-denominator        
        LoadI                                  
        Exchange                               
        PushD        $print-format-rational-no-int-pos 
        Jump         -print-rational-17-end-join 
        Label        -print-rational-17-end-with-no-int-neg 
        PushD        $first-denominator        
        LoadI                                  
        Exchange                               
        PushD        $print-format-rantional-no-int-neg 
        Jump         -print-rational-17-end-join 
        Label        -print-rational-17-end-with-original 
        PushD        $print-format-rational-original 
        Jump         -print-rational-17-end-join 
        Label        -print-rational-17-end-join 
        Printf                                 
        PushD        $print-format-space       
        Printf                                 
        PushD        $global-memory-block      
        PushI        136                       
        Add                                    %% r17
        Duplicate                              
        LoadI                                  
        Exchange                               
        PushI        4                         
        Add                                    
        LoadI                                  
        Duplicate                              
        JumpPos      -print-rational-18-positive2 
        Negate                                 
        Exchange                               
        Negate                                 
        Exchange                               
        Label        -print-rational-18-positive2 
        PushD        $first-denominator        
        Exchange                               
        StoreI                                 
        PushD        $first-numerator          
        Exchange                               
        StoreI                                 
        PushD        $first-numerator          
        LoadI                                  
        PushD        $first-denominator        
        LoadI                                  
        Divide                                 
        Duplicate                              
        PushD        $first-denominator        
        LoadI                                  
        Multiply                               
        PushD        $first-numerator          
        LoadI                                  
        Exchange                               
        Subtract                               
        Duplicate                              
        JumpFalse    -print-rational-18-end-with-no-fraction 
        PushD        $first-numerator          
        Exchange                               
        StoreI                                 
        Duplicate                              
        PushD        $print-temp               
        Exchange                               
        StoreI                                 
        JumpFalse    -print-rational-18-end-with-no-int 
        PushD        $first-numerator          
        LoadI                                  
        Duplicate                              
        JumpPos      -print-rational-18-positive1 
        Negate                                 
        Label        -print-rational-18-positive1 
        PushD        $first-denominator        
        LoadI                                  
        Exchange                               
        PushD        $print-temp               
        LoadI                                  
        Jump         -print-rational-18-end-with-original 
        Label        -print-rational-18-end-with-no-fraction 
        Pop                                    
        PushD        $print-format-rational-no-frac 
        Jump         -print-rational-18-end-join 
        Label        -print-rational-18-end-with-no-int 
        PushD        $first-numerator          
        LoadI                                  
        Duplicate                              
        JumpPos      -print-rational-18-end-with-no-int-pos 
        Negate                                 
        Jump         -print-rational-18-end-with-no-int-neg 
        Label        -print-rational-18-end-with-no-int-pos 
        PushD        $first-denominator        
        LoadI                                  
        Exchange                               
        PushD        $print-format-rational-no-int-pos 
        Jump         -print-rational-18-end-join 
        Label        -print-rational-18-end-with-no-int-neg 
        PushD        $first-denominator        
        LoadI                                  
        Exchange                               
        PushD        $print-format-rantional-no-int-neg 
        Jump         -print-rational-18-end-join 
        Label        -print-rational-18-end-with-original 
        PushD        $print-format-rational-original 
        Jump         -print-rational-18-end-join 
        Label        -print-rational-18-end-join 
        Printf                                 
        PushD        $print-format-space       
        Printf                                 
        PushD        $global-memory-block      
        PushI        144                       
        Add                                    %% r18
        Duplicate                              
        LoadI                                  
        Exchange                               
        PushI        4                         
        Add                                    
        LoadI                                  
        Duplicate                              
        JumpPos      -print-rational-19-positive2 
        Negate                                 
        Exchange                               
        Negate                                 
        Exchange                               
        Label        -print-rational-19-positive2 
        PushD        $first-denominator        
        Exchange                               
        StoreI                                 
        PushD        $first-numerator          
        Exchange                               
        StoreI                                 
        PushD        $first-numerator          
        LoadI                                  
        PushD        $first-denominator        
        LoadI                                  
        Divide                                 
        Duplicate                              
        PushD        $first-denominator        
        LoadI                                  
        Multiply                               
        PushD        $first-numerator          
        LoadI                                  
        Exchange                               
        Subtract                               
        Duplicate                              
        JumpFalse    -print-rational-19-end-with-no-fraction 
        PushD        $first-numerator          
        Exchange                               
        StoreI                                 
        Duplicate                              
        PushD        $print-temp               
        Exchange                               
        StoreI                                 
        JumpFalse    -print-rational-19-end-with-no-int 
        PushD        $first-numerator          
        LoadI                                  
        Duplicate                              
        JumpPos      -print-rational-19-positive1 
        Negate                                 
        Label        -print-rational-19-positive1 
        PushD        $first-denominator        
        LoadI                                  
        Exchange                               
        PushD        $print-temp               
        LoadI                                  
        Jump         -print-rational-19-end-with-original 
        Label        -print-rational-19-end-with-no-fraction 
        Pop                                    
        PushD        $print-format-rational-no-frac 
        Jump         -print-rational-19-end-join 
        Label        -print-rational-19-end-with-no-int 
        PushD        $first-numerator          
        LoadI                                  
        Duplicate                              
        JumpPos      -print-rational-19-end-with-no-int-pos 
        Negate                                 
        Jump         -print-rational-19-end-with-no-int-neg 
        Label        -print-rational-19-end-with-no-int-pos 
        PushD        $first-denominator        
        LoadI                                  
        Exchange                               
        PushD        $print-format-rational-no-int-pos 
        Jump         -print-rational-19-end-join 
        Label        -print-rational-19-end-with-no-int-neg 
        PushD        $first-denominator        
        LoadI                                  
        Exchange                               
        PushD        $print-format-rantional-no-int-neg 
        Jump         -print-rational-19-end-join 
        Label        -print-rational-19-end-with-original 
        PushD        $print-format-rational-original 
        Jump         -print-rational-19-end-join 
        Label        -print-rational-19-end-join 
        Printf                                 
        PushD        $print-format-space       
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        PushD        $global-memory-block      
        PushI        112                       
        Add                                    %% i1
        LoadI                                  
        PushD        $print-format-integer     
        Printf                                 
        PushD        $print-format-space       
        Printf                                 
        PushD        $global-memory-block      
        PushI        116                       
        Add                                    %% i2
        LoadI                                  
        PushD        $print-format-integer     
        Printf                                 
        PushD        $print-format-space       
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        Label        -compare-20-arg1          
        PushD        $global-memory-block      
        PushI        48                        
        Add                                    %% r7
        Duplicate                              
        LoadI                                  
        Exchange                               
        PushI        4                         
        Add                                    
        LoadI                                  
        PushD        $global-memory-block      
        PushI        56                        
        Add                                    %% r8
        Duplicate                              
        LoadI                                  
        Exchange                               
        PushI        4                         
        Add                                    
        LoadI                                  
        PushD        $second-denominator       
        Exchange                               
        StoreI                                 
        PushD        $second-numerator         
        Exchange                               
        StoreI                                 
        PushD        $first-denominator        
        Exchange                               
        StoreI                                 
        PushD        $first-numerator          
        Exchange                               
        StoreI                                 
        PushD        $first-numerator          
        LoadI                                  
        PushD        $second-denominator       
        LoadI                                  
        Multiply                               
        PushD        $first-denominator        
        LoadI                                  
        PushD        $second-numerator         
        LoadI                                  
        Multiply                               
        Add                                    
        PushD        $first-denominator        
        LoadI                                  
        PushD        $second-denominator       
        LoadI                                  
        Multiply                               
        Call         $$convert-to-lowest-terms 
        Divide                                 
        Nop                                    
        Label        -compare-20-arg2          
        PushI        0                         
        Label        -compare-20-sub           
        Subtract                               
        JumpFalse    -compare-20-true          
        Jump         -compare-20-false         
        Label        -compare-20-true          
        PushI        1                         
        Jump         -compare-20-join          
        Label        -compare-20-false         
        PushI        0                         
        Jump         -compare-20-join          
        Label        -compare-20-join          
        JumpTrue     -print-boolean-22-true    
        PushD        $boolean-false-string     
        Jump         -print-boolean-22-join    
        Label        -print-boolean-22-true    
        PushD        $boolean-true-string      
        Label        -print-boolean-22-join    
        PushD        $print-format-boolean     
        Printf                                 
        PushD        $print-format-space       
        Printf                                 
        Label        -compare-21-arg1          
        PushD        $global-memory-block      
        PushI        80                        
        Add                                    %% r11
        Duplicate                              
        LoadI                                  
        Exchange                               
        PushI        4                         
        Add                                    
        LoadI                                  
        ConvertF                               
        Exchange                               
        ConvertF                               
        Exchange                               
        FDivide                                
        Nop                                    
        Label        -compare-21-arg2          
        PushF        -1.750000                 
        Label        -compare-21-sub           
        FSubtract                              
        JumpFZero    -compare-21-true          
        Jump         -compare-21-false         
        Label        -compare-21-true          
        PushI        1                         
        Jump         -compare-21-join          
        Label        -compare-21-false         
        PushI        0                         
        Jump         -compare-21-join          
        Label        -compare-21-join          
        JumpTrue     -print-boolean-23-true    
        PushD        $boolean-false-string     
        Jump         -print-boolean-23-join    
        Label        -print-boolean-23-true    
        PushD        $boolean-true-string      
        Label        -print-boolean-23-join    
        PushD        $print-format-boolean     
        Printf                                 
        PushD        $print-format-space       
        Printf                                 
        PushF        1.750000                  
        PushI        223092870                 
        Duplicate                              
        JumpFalse    $$f-divide-by-zero        
        Duplicate                              
        PushD        $express-over-denominator 
        Exchange                               
        StoreI                                 
        ConvertF                               
        FMultiply                              
        ConvertI                               
        PushD        $express-over-denominator 
        LoadI                                  
        Call         $$convert-to-lowest-terms 
        Duplicate                              
        JumpPos      -print-rational-24-positive2 
        Negate                                 
        Exchange                               
        Negate                                 
        Exchange                               
        Label        -print-rational-24-positive2 
        PushD        $first-denominator        
        Exchange                               
        StoreI                                 
        PushD        $first-numerator          
        Exchange                               
        StoreI                                 
        PushD        $first-numerator          
        LoadI                                  
        PushD        $first-denominator        
        LoadI                                  
        Divide                                 
        Duplicate                              
        PushD        $first-denominator        
        LoadI                                  
        Multiply                               
        PushD        $first-numerator          
        LoadI                                  
        Exchange                               
        Subtract                               
        Duplicate                              
        JumpFalse    -print-rational-24-end-with-no-fraction 
        PushD        $first-numerator          
        Exchange                               
        StoreI                                 
        Duplicate                              
        PushD        $print-temp               
        Exchange                               
        StoreI                                 
        JumpFalse    -print-rational-24-end-with-no-int 
        PushD        $first-numerator          
        LoadI                                  
        Duplicate                              
        JumpPos      -print-rational-24-positive1 
        Negate                                 
        Label        -print-rational-24-positive1 
        PushD        $first-denominator        
        LoadI                                  
        Exchange                               
        PushD        $print-temp               
        LoadI                                  
        Jump         -print-rational-24-end-with-original 
        Label        -print-rational-24-end-with-no-fraction 
        Pop                                    
        PushD        $print-format-rational-no-frac 
        Jump         -print-rational-24-end-join 
        Label        -print-rational-24-end-with-no-int 
        PushD        $first-numerator          
        LoadI                                  
        Duplicate                              
        JumpPos      -print-rational-24-end-with-no-int-pos 
        Negate                                 
        Jump         -print-rational-24-end-with-no-int-neg 
        Label        -print-rational-24-end-with-no-int-pos 
        PushD        $first-denominator        
        LoadI                                  
        Exchange                               
        PushD        $print-format-rational-no-int-pos 
        Jump         -print-rational-24-end-join 
        Label        -print-rational-24-end-with-no-int-neg 
        PushD        $first-denominator        
        LoadI                                  
        Exchange                               
        PushD        $print-format-rantional-no-int-neg 
        Jump         -print-rational-24-end-join 
        Label        -print-rational-24-end-with-original 
        PushD        $print-format-rational-original 
        Jump         -print-rational-24-end-join 
        Label        -print-rational-24-end-join 
        Printf                                 
        PushD        $print-format-space       
        Printf                                 
        PushI        2                         
        PushI        1                         
        Duplicate                              
        JumpPos      -print-rational-25-positive2 
        Negate                                 
        Exchange                               
        Negate                                 
        Exchange                               
        Label        -print-rational-25-positive2 
        PushD        $first-denominator        
        Exchange                               
        StoreI                                 
        PushD        $first-numerator          
        Exchange                               
        StoreI                                 
        PushD        $first-numerator          
        LoadI                                  
        PushD        $first-denominator        
        LoadI                                  
        Divide                                 
        Duplicate                              
        PushD        $first-denominator        
        LoadI                                  
        Multiply                               
        PushD        $first-numerator          
        LoadI                                  
        Exchange                               
        Subtract                               
        Duplicate                              
        JumpFalse    -print-rational-25-end-with-no-fraction 
        PushD        $first-numerator          
        Exchange                               
        StoreI                                 
        Duplicate                              
        PushD        $print-temp               
        Exchange                               
        StoreI                                 
        JumpFalse    -print-rational-25-end-with-no-int 
        PushD        $first-numerator          
        LoadI                                  
        Duplicate                              
        JumpPos      -print-rational-25-positive1 
        Negate                                 
        Label        -print-rational-25-positive1 
        PushD        $first-denominator        
        LoadI                                  
        Exchange                               
        PushD        $print-temp               
        LoadI                                  
        Jump         -print-rational-25-end-with-original 
        Label        -print-rational-25-end-with-no-fraction 
        Pop                                    
        PushD        $print-format-rational-no-frac 
        Jump         -print-rational-25-end-join 
        Label        -print-rational-25-end-with-no-int 
        PushD        $first-numerator          
        LoadI                                  
        Duplicate                              
        JumpPos      -print-rational-25-end-with-no-int-pos 
        Negate                                 
        Jump         -print-rational-25-end-with-no-int-neg 
        Label        -print-rational-25-end-with-no-int-pos 
        PushD        $first-denominator        
        LoadI                                  
        Exchange                               
        PushD        $print-format-rational-no-int-pos 
        Jump         -print-rational-25-end-join 
        Label        -print-rational-25-end-with-no-int-neg 
        PushD        $first-denominator        
        LoadI                                  
        Exchange                               
        PushD        $print-format-rantional-no-int-neg 
        Jump         -print-rational-25-end-join 
        Label        -print-rational-25-end-with-original 
        PushD        $print-format-rational-original 
        Jump         -print-rational-25-end-join 
        Label        -print-rational-25-end-join 
        Printf                                 
        PushD        $print-format-space       
        Printf                                 
        PushI        99                        
        PushI        1                         
        Duplicate                              
        JumpPos      -print-rational-26-positive2 
        Negate                                 
        Exchange                               
        Negate                                 
        Exchange                               
        Label        -print-rational-26-positive2 
        PushD        $first-denominator        
        Exchange                               
        StoreI                                 
        PushD        $first-numerator          
        Exchange                               
        StoreI                                 
        PushD        $first-numerator          
        LoadI                                  
        PushD        $first-denominator        
        LoadI                                  
        Divide                                 
        Duplicate                              
        PushD        $first-denominator        
        LoadI                                  
        Multiply                               
        PushD        $first-numerator          
        LoadI                                  
        Exchange                               
        Subtract                               
        Duplicate                              
        JumpFalse    -print-rational-26-end-with-no-fraction 
        PushD        $first-numerator          
        Exchange                               
        StoreI                                 
        Duplicate                              
        PushD        $print-temp               
        Exchange                               
        StoreI                                 
        JumpFalse    -print-rational-26-end-with-no-int 
        PushD        $first-numerator          
        LoadI                                  
        Duplicate                              
        JumpPos      -print-rational-26-positive1 
        Negate                                 
        Label        -print-rational-26-positive1 
        PushD        $first-denominator        
        LoadI                                  
        Exchange                               
        PushD        $print-temp               
        LoadI                                  
        Jump         -print-rational-26-end-with-original 
        Label        -print-rational-26-end-with-no-fraction 
        Pop                                    
        PushD        $print-format-rational-no-frac 
        Jump         -print-rational-26-end-join 
        Label        -print-rational-26-end-with-no-int 
        PushD        $first-numerator          
        LoadI                                  
        Duplicate                              
        JumpPos      -print-rational-26-end-with-no-int-pos 
        Negate                                 
        Jump         -print-rational-26-end-with-no-int-neg 
        Label        -print-rational-26-end-with-no-int-pos 
        PushD        $first-denominator        
        LoadI                                  
        Exchange                               
        PushD        $print-format-rational-no-int-pos 
        Jump         -print-rational-26-end-join 
        Label        -print-rational-26-end-with-no-int-neg 
        PushD        $first-denominator        
        LoadI                                  
        Exchange                               
        PushD        $print-format-rantional-no-int-neg 
        Jump         -print-rational-26-end-join 
        Label        -print-rational-26-end-with-original 
        PushD        $print-format-rational-original 
        Jump         -print-rational-26-end-join 
        Label        -print-rational-26-end-join 
        Printf                                 
        PushD        $print-format-space       
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        PushD        $global-memory-block      
        PushI        152                       
        Add                                    %% r100
        Duplicate                              
        PushI        10                        
        PushI        3                         
        PushI        -3                        
        Add                                    
        Call         $$convert-to-lowest-terms 
        PushD        $first-denominator        
        Exchange                               
        StoreI                                 
        StoreI                                 
        PushI        4                         
        Add                                    
        PushD        $first-denominator        
        LoadI                                  
        StoreI                                 
        Halt                                   

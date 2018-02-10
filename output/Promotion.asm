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
        DataZ        59                        
        Label        $$main                    
        PushD        $global-memory-block      
        PushI        0                         
        Add                                    %% i
        PushI        3                         
        StoreI                                 
        PushD        $global-memory-block      
        PushI        4                         
        Add                                    %% f
        PushF        3.500000                  
        StoreF                                 
        PushD        $global-memory-block      
        PushI        12                        
        Add                                    %% r
        Duplicate                              
        PushI        5                         
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
        PushI        20                        
        Add                                    %% v1
        PushD        $global-memory-block      
        PushI        0                         
        Add                                    %% i
        LoadI                                  
        PushI        99                        
        Nop                                    
        Add                                    
        StoreI                                 
        PushD        $global-memory-block      
        PushI        24                        
        Add                                    %% v2
        Duplicate                              
        PushD        $global-memory-block      
        PushI        0                         
        Add                                    %% i
        LoadI                                  
        PushI        1                         
        PushD        $global-memory-block      
        PushI        12                        
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
        PushI        32                        
        Add                                    %% v3
        Duplicate                              
        PushI        99                        
        Nop                                    
        PushI        99                        
        Nop                                    
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
        Add                                    %% v4
        Duplicate                              
        PushI        99                        
        Nop                                    
        ConvertF                               
        PushD        $global-memory-block      
        PushI        0                         
        Add                                    %% i
        LoadI                                  
        ConvertF                               
        FAdd                                   
        ConvertI                               
        PushI        1                         
        PushD        $global-memory-block      
        PushI        12                        
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
        PushI        48                        
        Add                                    %% v6
        PushI        99                        
        Nop                                    
        PushI        127                       
        Label        -compare-2-sub            
        Subtract                               
        JumpPos      -compare-2-true           
        Jump         -compare-2-false          
        Label        -compare-2-true           
        PushI        1                         
        Jump         -compare-2-join           
        Label        -compare-2-false          
        PushI        0                         
        Jump         -compare-2-join           
        Label        -compare-2-join           
        StoreC                                 
        PushD        $global-memory-block      
        PushI        49                        
        Add                                    %% v7
        PushI        99                        
        Nop                                    
        PushI        99                        
        Label        -compare-3-sub            
        Subtract                               
        JumpFalse    -compare-3-true           
        Jump         -compare-3-false          
        Label        -compare-3-true           
        PushI        1                         
        Jump         -compare-3-join           
        Label        -compare-3-false          
        PushI        0                         
        Jump         -compare-3-join           
        Label        -compare-3-join           
        StoreC                                 
        PushD        $global-memory-block      
        PushI        50                        
        Add                                    %% v8
        PushI        99                        
        ConvertF                               
        PushF        99.000000                 
        Label        -compare-4-sub            
        FSubtract                              
        JumpFZero    -compare-4-false          
        Jump         -compare-4-true           
        Label        -compare-4-true           
        PushI        1                         
        Jump         -compare-4-join           
        Label        -compare-4-false          
        PushI        0                         
        Jump         -compare-4-join           
        Label        -compare-4-join           
        StoreC                                 
        PushD        $global-memory-block      
        PushI        50                        
        Add                                    %% v8
        PushD        $global-memory-block      
        PushI        50                        
        Add                                    %% v8
        LoadC                                  
        Duplicate                              
        JumpTrue     -SC-Or-6-short-circuit-true 
        Pop                                    
        PushI        99                        
        ConvertF                               
        PushI        199                       
        PushI        2                         
        Call         $$convert-to-lowest-terms 
        ConvertF                               
        Exchange                               
        ConvertF                               
        Exchange                               
        FDivide                                
        Label        -compare-5-sub            
        FSubtract                              
        JumpFPos     -compare-5-false          
        Jump         -compare-5-true           
        Label        -compare-5-true           
        PushI        1                         
        Jump         -compare-5-join           
        Label        -compare-5-false          
        PushI        0                         
        Jump         -compare-5-join           
        Label        -compare-5-join           
        Jump         -SC-Or-6-end              
        Label        -SC-Or-6-short-circuit-true 
        Label        -SC-Or-6-end              
        StoreC                                 
        PushD        $global-memory-block      
        PushI        51                        
        Add                                    %% v10
        PushF        3.500000                  
        StoreF                                 
        PushD        $global-memory-block      
        PushI        51                        
        Add                                    %% v10
        PushI        99                        
        Nop                                    
        PushI        3                         
        Add                                    
        ConvertF                               
        StoreF                                 
        PushD        $global-memory-block      
        PushI        20                        
        Add                                    %% v1
        LoadI                                  
        PushD        $print-format-integer     
        Printf                                 
        PushD        $print-format-space       
        Printf                                 
        PushD        $global-memory-block      
        PushI        24                        
        Add                                    %% v2
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
        PushI        32                        
        Add                                    %% v3
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
        PushI        40                        
        Add                                    %% v4
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
        PushI        48                        
        Add                                    %% v6
        LoadC                                  
        JumpTrue     -print-boolean-10-true    
        PushD        $boolean-false-string     
        Jump         -print-boolean-10-join    
        Label        -print-boolean-10-true    
        PushD        $boolean-true-string      
        Label        -print-boolean-10-join    
        PushD        $print-format-boolean     
        Printf                                 
        PushD        $print-format-space       
        Printf                                 
        PushD        $global-memory-block      
        PushI        49                        
        Add                                    %% v7
        LoadC                                  
        JumpTrue     -print-boolean-11-true    
        PushD        $boolean-false-string     
        Jump         -print-boolean-11-join    
        Label        -print-boolean-11-true    
        PushD        $boolean-true-string      
        Label        -print-boolean-11-join    
        PushD        $print-format-boolean     
        Printf                                 
        PushD        $print-format-space       
        Printf                                 
        PushD        $global-memory-block      
        PushI        50                        
        Add                                    %% v8
        LoadC                                  
        JumpTrue     -print-boolean-12-true    
        PushD        $boolean-false-string     
        Jump         -print-boolean-12-join    
        Label        -print-boolean-12-true    
        PushD        $boolean-true-string      
        Label        -print-boolean-12-join    
        PushD        $print-format-boolean     
        Printf                                 
        PushD        $print-format-space       
        Printf                                 
        PushD        $global-memory-block      
        PushI        51                        
        Add                                    %% v10
        LoadF                                  
        PushD        $print-format-floating    
        Printf                                 
        PushD        $print-format-space       
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        Halt                                   

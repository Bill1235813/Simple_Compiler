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
        DLabel       $array-print-start        
        DataC        91                        %% "["
        DataC        0                         
        DLabel       $array-print-end          
        DataC        93                        %% "]"
        DataC        0                         
        DLabel       $array-print-middle       
        DataC        44                        %% ", "
        DataC        32                        
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
        DLabel       $errors-negative-array-size 
        DataC        110                       %% "negative array size"
        DataC        101                       
        DataC        103                       
        DataC        97                        
        DataC        116                       
        DataC        105                       
        DataC        118                       
        DataC        101                       
        DataC        32                        
        DataC        97                        
        DataC        114                       
        DataC        114                       
        DataC        97                        
        DataC        121                       
        DataC        32                        
        DataC        115                       
        DataC        105                       
        DataC        122                       
        DataC        101                       
        DataC        0                         
        Label        $$array-size-is-negative  
        PushD        $errors-negative-array-size 
        Jump         $$general-runtime-error   
        DLabel       $errors-null-array-size   
        DataC        97                        %% "array is null"
        DataC        114                       
        DataC        114                       
        DataC        97                        
        DataC        121                       
        DataC        32                        
        DataC        105                       
        DataC        115                       
        DataC        32                        
        DataC        110                       
        DataC        117                       
        DataC        108                       
        DataC        108                       
        DataC        0                         
        Label        $$array-is-null           
        PushD        $errors-null-array-size   
        Jump         $$general-runtime-error   
        DLabel       $errors-overflow-array-size 
        DataC        111                       %% "overflow array size"
        DataC        118                       
        DataC        101                       
        DataC        114                       
        DataC        102                       
        DataC        108                       
        DataC        111                       
        DataC        119                       
        DataC        32                        
        DataC        97                        
        DataC        114                       
        DataC        114                       
        DataC        97                        
        DataC        121                       
        DataC        32                        
        DataC        115                       
        DataC        105                       
        DataC        122                       
        DataC        101                       
        DataC        0                         
        Label        $$array-size-is-out-of-bound 
        PushD        $errors-overflow-array-size 
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
        DLabel       $record-creation-temporary 
        DataZ        4                         
        DLabel       $array-datasize-temporary 
        DataZ        4                         
        DLabel       $clear-size-temp          
        DataZ        4                         
        DLabel       $insert-size-temp         
        DataZ        4                         
        DLabel       insert-location-temp      
        DataZ        4                         
        DLabel       clone-new-location-temp   
        DataZ        4                         
        DLabel       clone-location-temp       
        DataZ        4                         
        DLabel       clone-size-temp           
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
        Label        -$function-lowest-1-loop-continue 
        PushD        $gcd-temp-numerator       
        LoadI                                  
        PushD        $gcd-temp-denominator     
        LoadI                                  
        Remainder                              
        Duplicate                              
        JumpFalse    -$function-lowest-1-loop-end 
        PushD        $gcd-temp-denominator     
        LoadI                                  
        PushD        $gcd-temp-numerator       
        Exchange                               
        StoreI                                 
        PushD        $gcd-temp-denominator     
        Exchange                               
        StoreI                                 
        Jump         -$function-lowest-1-loop-continue 
        Label        -$function-lowest-1-loop-end 
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
        Label        $$clear-n-bytes           
        PushD        $return-for-runtime-func  
        Exchange                               
        StoreI                                 
        PushD        $clear-size-temp          
        Exchange                               
        StoreI                                 
        Label        -$function-clear-2-loopflag 
        PushD        $clear-size-temp          
        LoadI                                  
        JumpFalse    -$function-clear-2-endflag 
        Duplicate                              
        PushI        0                         
        StoreC                                 
        PushI        1                         
        Add                                    
        PushI        -1                        
        PushD        $clear-size-temp          
        LoadI                                  
        Add                                    
        PushD        $clear-size-temp          
        Exchange                               
        StoreI                                 
        Jump         -$function-clear-2-loopflag 
        Label        -$function-clear-2-endflag 
        Pop                                    
        PushD        $return-for-runtime-func  
        LoadI                                  
        Return                                 
        Label        $$print-rational          
        PushD        $return-for-runtime-func  
        Exchange                               
        StoreI                                 
        Duplicate                              
        JumpPos      -$print-rational-3-positive2 
        Negate                                 
        Exchange                               
        Negate                                 
        Exchange                               
        Label        -$print-rational-3-positive2 
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
        JumpFalse    -$print-rational-3-end-with-no-fraction 
        PushD        $first-numerator          
        Exchange                               
        StoreI                                 
        Duplicate                              
        PushD        $print-temp               
        Exchange                               
        StoreI                                 
        JumpFalse    -$print-rational-3-end-with-no-int 
        PushD        $first-numerator          
        LoadI                                  
        Duplicate                              
        JumpPos      -$print-rational-3-positive1 
        Negate                                 
        Label        -$print-rational-3-positive1 
        PushD        $first-denominator        
        LoadI                                  
        Exchange                               
        PushD        $print-temp               
        LoadI                                  
        Jump         -$print-rational-3-end-with-original 
        Label        -$print-rational-3-end-with-no-fraction 
        Pop                                    
        PushD        $print-format-rational-no-frac 
        Jump         -$print-rational-3-end-join 
        Label        -$print-rational-3-end-with-no-int 
        PushD        $first-numerator          
        LoadI                                  
        Duplicate                              
        JumpPos      -$print-rational-3-end-with-no-int-pos 
        Negate                                 
        Jump         -$print-rational-3-end-with-no-int-neg 
        Label        -$print-rational-3-end-with-no-int-pos 
        PushD        $first-denominator        
        LoadI                                  
        Exchange                               
        PushD        $print-format-rational-no-int-pos 
        Jump         -$print-rational-3-end-join 
        Label        -$print-rational-3-end-with-no-int-neg 
        PushD        $first-denominator        
        LoadI                                  
        Exchange                               
        PushD        $print-format-rantional-no-int-neg 
        Jump         -$print-rational-3-end-join 
        Label        -$print-rational-3-end-with-original 
        PushD        $print-format-rational-original 
        Jump         -$print-rational-3-end-join 
        Label        -$print-rational-3-end-join 
        Printf                                 
        PushD        $return-for-runtime-func  
        LoadI                                  
        Return                                 
        Label        $$release-reference       
        Exchange                               
        Duplicate                              
        PushI        7                         
        Add                                    
        LoadC                                  
        JumpTrue     -$release-reference-4-endflag 
        Duplicate                              
        PushI        6                         
        Add                                    
        LoadC                                  
        JumpTrue     -$release-reference-4-endflag 
        Duplicate                              
        PushI        5                         
        Add                                    
        LoadC                                  
        JumpTrue     -$release-reference-4-subtypeIsRefflag 
        Duplicate                              
        PushI        6                         
        Add                                    
        PushI        1                         
        StoreC                                 
        Call         -mem-manager-deallocate   
        Jump         -$release-reference-4-returnflag 
        Label        -$release-reference-4-subtypeIsRefflag 
        Duplicate                              
        PushI        12                        
        Add                                    
        LoadI                                  
        Exchange                               
        PushI        16                        
        Add                                    
        Exchange                               
        Label        -$release-subtype-reference-5-loopflag 
        Duplicate                              
        JumpFalse    -$release-subtype-reference-5-endflag 
        Exchange                               
        Duplicate                              
        LoadI                                  
        Call         $$release-reference       
        PushI        4                         
        Add                                    
        Exchange                               
        PushI        -1                        
        Add                                    
        Jump         -$release-subtype-reference-5-loopflag 
        Label        -$release-subtype-reference-5-endflag 
        Pop                                    
        Label        -$release-reference-4-endflag 
        Pop                                    
        Label        -$release-reference-4-returnflag 
        Return                                 
        DLabel       $usable-memory-start      
        DLabel       $global-memory-block      
        DataZ        176                       
        Label        $$main                    
        Label        -mem-manager-initialize   
        DLabel       $heap-start-ptr           
        DataZ        4                         
        DLabel       $heap-after-ptr           
        DataZ        4                         
        DLabel       $heap-first-free          
        DataZ        4                         
        DLabel       $mmgr-newblock-block      
        DataZ        4                         
        DLabel       $mmgr-newblock-size       
        DataZ        4                         
        PushD        $heap-memory              
        Duplicate                              
        PushD        $heap-start-ptr           
        Exchange                               
        StoreI                                 
        PushD        $heap-after-ptr           
        Exchange                               
        StoreI                                 
        PushI        0                         
        PushD        $heap-first-free          
        Exchange                               
        StoreI                                 
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
        PushI        152                       
        Add                                    %% r19
        Duplicate                              
        PushI        28                        
        PushI        -35                       
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
        PushI        160                       
        Add                                    %% r20
        Duplicate                              
        PushI        -20                       
        PushI        -35                       
        Call         $$convert-to-lowest-terms 
        PushI        4                         
        PushI        1                         
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
        PushI        0                         
        Add                                    %% r
        Duplicate                              
        LoadI                                  
        Exchange                               
        PushI        4                         
        Add                                    
        LoadI                                  
        Call         $$print-rational          
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
        Call         $$print-rational          
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
        Call         $$print-rational          
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
        Call         $$print-rational          
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
        Call         $$print-rational          
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
        Call         $$print-rational          
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
        Call         $$print-rational          
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
        Call         $$print-rational          
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
        Call         $$print-rational          
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
        Call         $$print-rational          
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
        Call         $$print-rational          
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
        Call         $$print-rational          
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
        Call         $$print-rational          
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
        Call         $$print-rational          
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
        Call         $$print-rational          
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
        Call         $$print-rational          
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
        Call         $$print-rational          
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
        Call         $$print-rational          
        PushD        $print-format-space       
        Printf                                 
        PushD        $global-memory-block      
        PushI        152                       
        Add                                    %% r19
        Duplicate                              
        LoadI                                  
        Exchange                               
        PushI        4                         
        Add                                    
        LoadI                                  
        Call         $$print-rational          
        PushD        $print-format-space       
        Printf                                 
        PushD        $global-memory-block      
        PushI        160                       
        Add                                    %% r20
        Duplicate                              
        LoadI                                  
        Exchange                               
        PushI        4                         
        Add                                    
        LoadI                                  
        Call         $$print-rational          
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
        PushI        0                         
        Label        -compare-6-sub            
        Subtract                               
        JumpFalse    -compare-6-true           
        Jump         -compare-6-false          
        Label        -compare-6-true           
        PushI        1                         
        Jump         -compare-6-join           
        Label        -compare-6-false          
        PushI        0                         
        Jump         -compare-6-join           
        Label        -compare-6-join           
        JumpTrue     -print-boolean-8-true     
        PushD        $boolean-false-string     
        Jump         -print-boolean-8-join     
        Label        -print-boolean-8-true     
        PushD        $boolean-true-string      
        Label        -print-boolean-8-join     
        PushD        $print-format-boolean     
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
        ConvertF                               
        Exchange                               
        ConvertF                               
        Exchange                               
        FDivide                                
        Nop                                    
        PushF        -1.750000                 
        Label        -compare-7-sub            
        FSubtract                              
        JumpFZero    -compare-7-true           
        Jump         -compare-7-false          
        Label        -compare-7-true           
        PushI        1                         
        Jump         -compare-7-join           
        Label        -compare-7-false          
        PushI        0                         
        Jump         -compare-7-join           
        Label        -compare-7-join           
        JumpTrue     -print-boolean-9-true     
        PushD        $boolean-false-string     
        Jump         -print-boolean-9-join     
        Label        -print-boolean-9-true     
        PushD        $boolean-true-string      
        Label        -print-boolean-9-join     
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
        Call         $$print-rational          
        PushD        $print-format-space       
        Printf                                 
        PushI        2                         
        PushI        1                         
        Call         $$print-rational          
        PushD        $print-format-space       
        Printf                                 
        PushI        99                        
        PushI        1                         
        Call         $$print-rational          
        PushD        $print-format-space       
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        PushD        $global-memory-block      
        PushI        168                       
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
        Label        -mem-manager-make-tags    
        DLabel       $mmgr-tags-size           
        DataZ        4                         
        DLabel       $mmgr-tags-start          
        DataZ        4                         
        DLabel       $mmgr-tags-available      
        DataZ        4                         
        DLabel       $mmgr-tags-nextptr        
        DataZ        4                         
        DLabel       $mmgr-tags-prevptr        
        DataZ        4                         
        DLabel       $mmgr-tags-return         
        DataZ        4                         
        PushD        $mmgr-tags-return         
        Exchange                               
        StoreI                                 
        PushD        $mmgr-tags-size           
        Exchange                               
        StoreI                                 
        PushD        $mmgr-tags-start          
        Exchange                               
        StoreI                                 
        PushD        $mmgr-tags-available      
        Exchange                               
        StoreI                                 
        PushD        $mmgr-tags-nextptr        
        Exchange                               
        StoreI                                 
        PushD        $mmgr-tags-prevptr        
        Exchange                               
        StoreI                                 
        PushD        $mmgr-tags-prevptr        
        LoadI                                  
        PushD        $mmgr-tags-size           
        LoadI                                  
        PushD        $mmgr-tags-available      
        LoadI                                  
        PushD        $mmgr-tags-start          
        LoadI                                  
        Call         -mem-manager-one-tag      
        PushD        $mmgr-tags-nextptr        
        LoadI                                  
        PushD        $mmgr-tags-size           
        LoadI                                  
        PushD        $mmgr-tags-available      
        LoadI                                  
        PushD        $mmgr-tags-start          
        LoadI                                  
        Duplicate                              
        PushI        4                         
        Add                                    
        LoadI                                  
        Add                                    
        PushI        9                         
        Subtract                               
        Call         -mem-manager-one-tag      
        PushD        $mmgr-tags-return         
        LoadI                                  
        Return                                 
        Label        -mem-manager-one-tag      
        DLabel       $mmgr-onetag-return       
        DataZ        4                         
        DLabel       $mmgr-onetag-location     
        DataZ        4                         
        DLabel       $mmgr-onetag-available    
        DataZ        4                         
        DLabel       $mmgr-onetag-size         
        DataZ        4                         
        DLabel       $mmgr-onetag-pointer      
        DataZ        4                         
        PushD        $mmgr-onetag-return       
        Exchange                               
        StoreI                                 
        PushD        $mmgr-onetag-location     
        Exchange                               
        StoreI                                 
        PushD        $mmgr-onetag-available    
        Exchange                               
        StoreI                                 
        PushD        $mmgr-onetag-size         
        Exchange                               
        StoreI                                 
        PushD        $mmgr-onetag-location     
        LoadI                                  
        PushI        0                         
        Add                                    
        Exchange                               
        StoreI                                 
        PushD        $mmgr-onetag-size         
        LoadI                                  
        PushD        $mmgr-onetag-location     
        LoadI                                  
        PushI        4                         
        Add                                    
        Exchange                               
        StoreI                                 
        PushD        $mmgr-onetag-available    
        LoadI                                  
        PushD        $mmgr-onetag-location     
        LoadI                                  
        PushI        8                         
        Add                                    
        Exchange                               
        StoreC                                 
        PushD        $mmgr-onetag-return       
        LoadI                                  
        Return                                 
        Label        -mem-manager-allocate     
        DLabel       $mmgr-alloc-return        
        DataZ        4                         
        DLabel       $mmgr-alloc-size          
        DataZ        4                         
        DLabel       $mmgr-alloc-current-block 
        DataZ        4                         
        DLabel       $mmgr-alloc-remainder-block 
        DataZ        4                         
        DLabel       $mmgr-alloc-remainder-size 
        DataZ        4                         
        PushD        $mmgr-alloc-return        
        Exchange                               
        StoreI                                 
        PushI        18                        
        Add                                    
        PushD        $mmgr-alloc-size          
        Exchange                               
        StoreI                                 
        PushD        $heap-first-free          
        LoadI                                  
        PushD        $mmgr-alloc-current-block 
        Exchange                               
        StoreI                                 
        Label        -mmgr-alloc-process-current 
        PushD        $mmgr-alloc-current-block 
        LoadI                                  
        JumpFalse    -mmgr-alloc-no-block-works 
        Label        -mmgr-alloc-test-block    
        PushD        $mmgr-alloc-current-block 
        LoadI                                  
        PushI        4                         
        Add                                    
        LoadI                                  
        PushD        $mmgr-alloc-size          
        LoadI                                  
        Subtract                               
        PushI        1                         
        Add                                    
        JumpPos      -mmgr-alloc-found-block   
        PushD        $mmgr-alloc-current-block 
        LoadI                                  
        Duplicate                              
        PushI        4                         
        Add                                    
        LoadI                                  
        Add                                    
        PushI        9                         
        Subtract                               
        PushI        0                         
        Add                                    
        LoadI                                  
        PushD        $mmgr-alloc-current-block 
        Exchange                               
        StoreI                                 
        Jump         -mmgr-alloc-process-current 
        Label        -mmgr-alloc-found-block   
        PushD        $mmgr-alloc-current-block 
        LoadI                                  
        Call         -mem-manager-remove-block 
        PushD        $mmgr-alloc-current-block 
        LoadI                                  
        PushI        4                         
        Add                                    
        LoadI                                  
        PushD        $mmgr-alloc-size          
        LoadI                                  
        Subtract                               
        PushI        26                        
        Subtract                               
        JumpNeg      -mmgr-alloc-return-userblock 
        PushD        $mmgr-alloc-current-block 
        LoadI                                  
        PushD        $mmgr-alloc-size          
        LoadI                                  
        Add                                    
        PushD        $mmgr-alloc-remainder-block 
        Exchange                               
        StoreI                                 
        PushD        $mmgr-alloc-size          
        LoadI                                  
        PushD        $mmgr-alloc-current-block 
        LoadI                                  
        PushI        4                         
        Add                                    
        LoadI                                  
        Exchange                               
        Subtract                               
        PushD        $mmgr-alloc-remainder-size 
        Exchange                               
        StoreI                                 
        PushI        0                         
        PushI        0                         
        PushI        0                         
        PushD        $mmgr-alloc-current-block 
        LoadI                                  
        PushD        $mmgr-alloc-size          
        LoadI                                  
        Call         -mem-manager-make-tags    
        PushI        0                         
        PushI        0                         
        PushI        1                         
        PushD        $mmgr-alloc-remainder-block 
        LoadI                                  
        PushD        $mmgr-alloc-remainder-size 
        LoadI                                  
        Call         -mem-manager-make-tags    
        PushD        $mmgr-alloc-remainder-block 
        LoadI                                  
        PushI        9                         
        Add                                    
        Call         -mem-manager-deallocate   
        Jump         -mmgr-alloc-return-userblock 
        Label        -mmgr-alloc-no-block-works 
        PushD        $mmgr-alloc-size          
        LoadI                                  
        PushD        $mmgr-newblock-size       
        Exchange                               
        StoreI                                 
        PushD        $heap-after-ptr           
        LoadI                                  
        PushD        $mmgr-newblock-block      
        Exchange                               
        StoreI                                 
        PushD        $mmgr-newblock-size       
        LoadI                                  
        PushD        $heap-after-ptr           
        LoadI                                  
        Add                                    
        PushD        $heap-after-ptr           
        Exchange                               
        StoreI                                 
        PushI        0                         
        PushI        0                         
        PushI        0                         
        PushD        $mmgr-newblock-block      
        LoadI                                  
        PushD        $mmgr-newblock-size       
        LoadI                                  
        Call         -mem-manager-make-tags    
        PushD        $mmgr-newblock-block      
        LoadI                                  
        PushD        $mmgr-alloc-current-block 
        Exchange                               
        StoreI                                 
        Label        -mmgr-alloc-return-userblock 
        PushD        $mmgr-alloc-current-block 
        LoadI                                  
        PushI        9                         
        Add                                    
        PushD        $mmgr-alloc-return        
        LoadI                                  
        Return                                 
        Label        -mem-manager-deallocate   
        DLabel       $mmgr-dealloc-return      
        DataZ        4                         
        DLabel       $mmgr-dealloc-block       
        DataZ        4                         
        PushD        $mmgr-dealloc-return      
        Exchange                               
        StoreI                                 
        PushI        9                         
        Subtract                               
        PushD        $mmgr-dealloc-block       
        Exchange                               
        StoreI                                 
        PushD        $heap-first-free          
        LoadI                                  
        JumpFalse    -mmgr-bypass-firstFree    
        PushD        $mmgr-dealloc-block       
        LoadI                                  
        PushD        $heap-first-free          
        LoadI                                  
        PushI        0                         
        Add                                    
        Exchange                               
        StoreI                                 
        Label        -mmgr-bypass-firstFree    
        PushI        0                         
        PushD        $mmgr-dealloc-block       
        LoadI                                  
        PushI        0                         
        Add                                    
        Exchange                               
        StoreI                                 
        PushD        $heap-first-free          
        LoadI                                  
        PushD        $mmgr-dealloc-block       
        LoadI                                  
        Duplicate                              
        PushI        4                         
        Add                                    
        LoadI                                  
        Add                                    
        PushI        9                         
        Subtract                               
        PushI        0                         
        Add                                    
        Exchange                               
        StoreI                                 
        PushI        1                         
        PushD        $mmgr-dealloc-block       
        LoadI                                  
        PushI        8                         
        Add                                    
        Exchange                               
        StoreC                                 
        PushI        1                         
        PushD        $mmgr-dealloc-block       
        LoadI                                  
        Duplicate                              
        PushI        4                         
        Add                                    
        LoadI                                  
        Add                                    
        PushI        9                         
        Subtract                               
        PushI        8                         
        Add                                    
        Exchange                               
        StoreC                                 
        PushD        $mmgr-dealloc-block       
        LoadI                                  
        PushD        $heap-first-free          
        Exchange                               
        StoreI                                 
        PushD        $mmgr-dealloc-return      
        LoadI                                  
        Return                                 
        Label        -mem-manager-remove-block 
        DLabel       $mmgr-remove-return       
        DataZ        4                         
        DLabel       $mmgr-remove-block        
        DataZ        4                         
        DLabel       $mmgr-remove-prev         
        DataZ        4                         
        DLabel       $mmgr-remove-next         
        DataZ        4                         
        PushD        $mmgr-remove-return       
        Exchange                               
        StoreI                                 
        PushD        $mmgr-remove-block        
        Exchange                               
        StoreI                                 
        PushD        $mmgr-remove-block        
        LoadI                                  
        PushI        0                         
        Add                                    
        LoadI                                  
        PushD        $mmgr-remove-prev         
        Exchange                               
        StoreI                                 
        PushD        $mmgr-remove-block        
        LoadI                                  
        Duplicate                              
        PushI        4                         
        Add                                    
        LoadI                                  
        Add                                    
        PushI        9                         
        Subtract                               
        PushI        0                         
        Add                                    
        LoadI                                  
        PushD        $mmgr-remove-next         
        Exchange                               
        StoreI                                 
        Label        -mmgr-remove-process-prev 
        PushD        $mmgr-remove-prev         
        LoadI                                  
        JumpFalse    -mmgr-remove-no-prev      
        PushD        $mmgr-remove-next         
        LoadI                                  
        PushD        $mmgr-remove-prev         
        LoadI                                  
        Duplicate                              
        PushI        4                         
        Add                                    
        LoadI                                  
        Add                                    
        PushI        9                         
        Subtract                               
        PushI        0                         
        Add                                    
        Exchange                               
        StoreI                                 
        Jump         -mmgr-remove-process-next 
        Label        -mmgr-remove-no-prev      
        PushD        $mmgr-remove-next         
        LoadI                                  
        PushD        $heap-first-free          
        Exchange                               
        StoreI                                 
        Label        -mmgr-remove-process-next 
        PushD        $mmgr-remove-next         
        LoadI                                  
        JumpFalse    -mmgr-remove-done         
        PushD        $mmgr-remove-prev         
        LoadI                                  
        PushD        $mmgr-remove-next         
        LoadI                                  
        PushI        0                         
        Add                                    
        Exchange                               
        StoreI                                 
        Label        -mmgr-remove-done         
        PushD        $mmgr-remove-return       
        LoadI                                  
        Return                                 
        DLabel       $heap-memory              

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
        DLabel       $usable-memory-start      
        DLabel       $global-memory-block      
        DataZ        48                        
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
        Add                                    %% f
        PushI        5                         
        ConvertF                               
        StoreF                                 
        PushD        $global-memory-block      
        PushI        8                         
        Add                                    %% a1
        PushI        97                        
        ConvertF                               
        PushI        6                         
        ConvertF                               
        PushI        4                         
        ConvertF                               
        PushF        3.500000                  
        PushI        1                         
        ConvertF                               
        PushI        5                         
        Duplicate                              
        JumpNeg      $$array-size-is-negative  
        Duplicate                              
        PushI        8                         
        Multiply                               
        Duplicate                              
        PushD        $array-datasize-temporary 
        Exchange                               
        StoreI                                 
        PushI        16                        
        Add                                    
        Call         -mem-manager-allocate     
        PushD        $record-creation-temporary 
        Exchange                               
        StoreI                                 
        PushD        $record-creation-temporary 
        LoadI                                  
        PushI        0                         
        Add                                    
        PushI        7                         
        StoreI                                 
        PushD        $record-creation-temporary 
        LoadI                                  
        PushI        4                         
        Add                                    
        PushI        0                         
        StoreI                                 
        PushD        $record-creation-temporary 
        LoadI                                  
        PushI        16                        
        Add                                    
        PushD        $array-datasize-temporary 
        LoadI                                  
        Call         $$clear-n-bytes           
        PushD        $record-creation-temporary 
        LoadI                                  
        PushI        8                         
        Add                                    
        PushI        8                         
        StoreI                                 
        PushD        $record-creation-temporary 
        LoadI                                  
        PushI        12                        
        Add                                    
        Exchange                               
        StoreI                                 
        PushI        5                         
        PushD        $record-creation-temporary 
        LoadI                                  
        PushI        16                        
        Add                                    
        PushD        insert-location-temp      
        Exchange                               
        StoreI                                 
        PushD        $insert-size-temp         
        Exchange                               
        StoreI                                 
        Label        -function-insert-4-loopflag 
        PushD        $insert-size-temp         
        LoadI                                  
        JumpFalse    -function-insert-4-endflag 
        PushD        insert-location-temp      
        LoadI                                  
        Exchange                               
        StoreF                                 
        PushI        -1                        
        PushD        $insert-size-temp         
        LoadI                                  
        Add                                    
        PushD        $insert-size-temp         
        Exchange                               
        StoreI                                 
        PushI        8                         
        PushD        insert-location-temp      
        LoadI                                  
        Add                                    
        PushD        insert-location-temp      
        Exchange                               
        StoreI                                 
        Jump         -function-insert-4-loopflag 
        Label        -function-insert-4-endflag 
        PushD        $record-creation-temporary 
        LoadI                                  
        PushI        1                         
        PushD        $a-indexing-index         
        Exchange                               
        StoreI                                 
        PushD        $a-indexing-array         
        Exchange                               
        StoreI                                 
        PushD        $a-indexing-array         
        LoadI                                  
        JumpFalse    $$array-is-null           
        PushD        $a-indexing-index         
        LoadI                                  
        JumpNeg      $$array-size-is-negative  
        PushD        $a-indexing-index         
        LoadI                                  
        PushD        $a-indexing-array         
        LoadI                                  
        PushI        12                        
        Add                                    
        LoadI                                  
        Subtract                               
        JumpNeg      -array-indexing-5-startflag 
        Jump         $$array-size-is-out-of-bound 
        Label        -array-indexing-5-startflag 
        PushD        $a-indexing-array         
        LoadI                                  
        PushI        16                        
        Add                                    
        PushD        $a-indexing-index         
        LoadI                                  
        PushI        8                         
        Multiply                               
        Add                                    
        LoadF                                  
        PushI        2                         
        ConvertF                               
        FAdd                                   
        StoreF                                 
        PushD        $global-memory-block      
        PushI        16                        
        Add                                    %% a2
        PushI        1                         
        PushI        2                         
        Call         $$convert-to-lowest-terms 
        PushI        1                         
        Duplicate                              
        JumpNeg      $$array-size-is-negative  
        Duplicate                              
        PushI        8                         
        Multiply                               
        Duplicate                              
        PushD        $array-datasize-temporary 
        Exchange                               
        StoreI                                 
        PushI        16                        
        Add                                    
        Call         -mem-manager-allocate     
        PushD        $record-creation-temporary 
        Exchange                               
        StoreI                                 
        PushD        $record-creation-temporary 
        LoadI                                  
        PushI        0                         
        Add                                    
        PushI        7                         
        StoreI                                 
        PushD        $record-creation-temporary 
        LoadI                                  
        PushI        4                         
        Add                                    
        PushI        0                         
        StoreI                                 
        PushD        $record-creation-temporary 
        LoadI                                  
        PushI        16                        
        Add                                    
        PushD        $array-datasize-temporary 
        LoadI                                  
        Call         $$clear-n-bytes           
        PushD        $record-creation-temporary 
        LoadI                                  
        PushI        8                         
        Add                                    
        PushI        8                         
        StoreI                                 
        PushD        $record-creation-temporary 
        LoadI                                  
        PushI        12                        
        Add                                    
        Exchange                               
        StoreI                                 
        PushI        1                         
        PushD        $record-creation-temporary 
        LoadI                                  
        PushI        16                        
        Add                                    
        PushD        insert-location-temp      
        Exchange                               
        StoreI                                 
        PushD        $insert-size-temp         
        Exchange                               
        StoreI                                 
        Label        -function-insert-6-loopflag 
        PushD        $insert-size-temp         
        LoadI                                  
        JumpFalse    -function-insert-6-endflag 
        PushD        insert-location-temp      
        LoadI                                  
        PushI        4                         
        Add                                    
        Exchange                               
        StoreI                                 
        PushD        insert-location-temp      
        LoadI                                  
        PushI        0                         
        Add                                    
        Exchange                               
        StoreI                                 
        PushI        -1                        
        PushD        $insert-size-temp         
        LoadI                                  
        Add                                    
        PushD        $insert-size-temp         
        Exchange                               
        StoreI                                 
        PushI        8                         
        PushD        insert-location-temp      
        LoadI                                  
        Add                                    
        PushD        insert-location-temp      
        Exchange                               
        StoreI                                 
        Jump         -function-insert-6-loopflag 
        Label        -function-insert-6-endflag 
        PushD        $record-creation-temporary 
        LoadI                                  
        Nop                                    
        StoreI                                 
        PushD        $global-memory-block      
        PushI        20                        
        Add                                    %% a4
        PushD        $global-memory-block      
        PushI        16                        
        Add                                    %% a2
        LoadI                                  
        PushD        clone-location-temp       
        Exchange                               
        StoreI                                 
        PushD        clone-location-temp       
        LoadI                                  
        PushI        12                        
        Add                                    
        LoadI                                  
        PushD        clone-location-temp       
        LoadI                                  
        PushI        8                         
        Add                                    
        LoadI                                  
        Multiply                               
        PushI        16                        
        Add                                    
        PushD        clone-size-temp           
        Exchange                               
        StoreI                                 
        PushD        clone-size-temp           
        LoadI                                  
        Call         -mem-manager-allocate     
        PushD        clone-new-location-temp   
        Exchange                               
        StoreI                                 
        PushD        clone-new-location-temp   
        LoadI                                  
        PushD        $record-creation-temporary 
        Exchange                               
        StoreI                                 
        Label        -clone-array-7-loopflag   
        PushD        clone-size-temp           
        LoadI                                  
        JumpFalse    -clone-array-7-endflag    
        PushD        clone-location-temp       
        LoadI                                  
        LoadC                                  
        PushD        clone-new-location-temp   
        LoadI                                  
        Exchange                               
        StoreC                                 
        PushI        -1                        
        PushD        clone-size-temp           
        LoadI                                  
        Add                                    
        PushD        clone-size-temp           
        Exchange                               
        StoreI                                 
        PushI        1                         
        PushD        clone-location-temp       
        LoadI                                  
        Add                                    
        PushD        clone-location-temp       
        Exchange                               
        StoreI                                 
        PushI        1                         
        PushD        clone-new-location-temp   
        LoadI                                  
        Add                                    
        PushD        clone-new-location-temp   
        Exchange                               
        StoreI                                 
        Jump         -clone-array-7-loopflag   
        Label        -clone-array-7-endflag    
        PushD        $record-creation-temporary 
        LoadI                                  
        StoreI                                 
        PushD        $global-memory-block      
        PushI        24                        
        Add                                    %% a5
        PushD        $global-memory-block      
        PushI        20                        
        Add                                    %% a4
        LoadI                                  
        PushI        12                        
        Add                                    
        LoadI                                  
        StoreI                                 
        PushD        $global-memory-block      
        PushI        28                        
        Add                                    %% numSets
        PushI        0                         
        Duplicate                              
        JumpNeg      $$array-size-is-negative  
        Duplicate                              
        PushI        4                         
        Multiply                               
        Duplicate                              
        PushD        $array-datasize-temporary 
        Exchange                               
        StoreI                                 
        PushI        16                        
        Add                                    
        Call         -mem-manager-allocate     
        PushD        $record-creation-temporary 
        Exchange                               
        StoreI                                 
        PushD        $record-creation-temporary 
        LoadI                                  
        PushI        0                         
        Add                                    
        PushI        7                         
        StoreI                                 
        PushD        $record-creation-temporary 
        LoadI                                  
        PushI        4                         
        Add                                    
        PushI        0                         
        StoreI                                 
        PushD        $record-creation-temporary 
        LoadI                                  
        PushI        16                        
        Add                                    
        PushD        $array-datasize-temporary 
        LoadI                                  
        Call         $$clear-n-bytes           
        PushD        $record-creation-temporary 
        LoadI                                  
        PushI        8                         
        Add                                    
        PushI        4                         
        StoreI                                 
        PushD        $record-creation-temporary 
        LoadI                                  
        PushI        12                        
        Add                                    
        Exchange                               
        StoreI                                 
        PushD        $record-creation-temporary 
        LoadI                                  
        PushI        8                         
        PushI        7                         
        PushI        6                         
        PushI        3                         
        Duplicate                              
        JumpNeg      $$array-size-is-negative  
        Duplicate                              
        PushI        4                         
        Multiply                               
        Duplicate                              
        PushD        $array-datasize-temporary 
        Exchange                               
        StoreI                                 
        PushI        16                        
        Add                                    
        Call         -mem-manager-allocate     
        PushD        $record-creation-temporary 
        Exchange                               
        StoreI                                 
        PushD        $record-creation-temporary 
        LoadI                                  
        PushI        0                         
        Add                                    
        PushI        7                         
        StoreI                                 
        PushD        $record-creation-temporary 
        LoadI                                  
        PushI        4                         
        Add                                    
        PushI        0                         
        StoreI                                 
        PushD        $record-creation-temporary 
        LoadI                                  
        PushI        16                        
        Add                                    
        PushD        $array-datasize-temporary 
        LoadI                                  
        Call         $$clear-n-bytes           
        PushD        $record-creation-temporary 
        LoadI                                  
        PushI        8                         
        Add                                    
        PushI        4                         
        StoreI                                 
        PushD        $record-creation-temporary 
        LoadI                                  
        PushI        12                        
        Add                                    
        Exchange                               
        StoreI                                 
        PushI        3                         
        PushD        $record-creation-temporary 
        LoadI                                  
        PushI        16                        
        Add                                    
        PushD        insert-location-temp      
        Exchange                               
        StoreI                                 
        PushD        $insert-size-temp         
        Exchange                               
        StoreI                                 
        Label        -function-insert-10-loopflag 
        PushD        $insert-size-temp         
        LoadI                                  
        JumpFalse    -function-insert-10-endflag 
        PushD        insert-location-temp      
        LoadI                                  
        Exchange                               
        StoreI                                 
        PushI        -1                        
        PushD        $insert-size-temp         
        LoadI                                  
        Add                                    
        PushD        $insert-size-temp         
        Exchange                               
        StoreI                                 
        PushI        4                         
        PushD        insert-location-temp      
        LoadI                                  
        Add                                    
        PushD        insert-location-temp      
        Exchange                               
        StoreI                                 
        Jump         -function-insert-10-loopflag 
        Label        -function-insert-10-endflag 
        PushD        $record-creation-temporary 
        LoadI                                  
        PushI        5                         
        PushI        4                         
        PushI        2                         
        Duplicate                              
        JumpNeg      $$array-size-is-negative  
        Duplicate                              
        PushI        4                         
        Multiply                               
        Duplicate                              
        PushD        $array-datasize-temporary 
        Exchange                               
        StoreI                                 
        PushI        16                        
        Add                                    
        Call         -mem-manager-allocate     
        PushD        $record-creation-temporary 
        Exchange                               
        StoreI                                 
        PushD        $record-creation-temporary 
        LoadI                                  
        PushI        0                         
        Add                                    
        PushI        7                         
        StoreI                                 
        PushD        $record-creation-temporary 
        LoadI                                  
        PushI        4                         
        Add                                    
        PushI        0                         
        StoreI                                 
        PushD        $record-creation-temporary 
        LoadI                                  
        PushI        16                        
        Add                                    
        PushD        $array-datasize-temporary 
        LoadI                                  
        Call         $$clear-n-bytes           
        PushD        $record-creation-temporary 
        LoadI                                  
        PushI        8                         
        Add                                    
        PushI        4                         
        StoreI                                 
        PushD        $record-creation-temporary 
        LoadI                                  
        PushI        12                        
        Add                                    
        Exchange                               
        StoreI                                 
        PushI        2                         
        PushD        $record-creation-temporary 
        LoadI                                  
        PushI        16                        
        Add                                    
        PushD        insert-location-temp      
        Exchange                               
        StoreI                                 
        PushD        $insert-size-temp         
        Exchange                               
        StoreI                                 
        Label        -function-insert-9-loopflag 
        PushD        $insert-size-temp         
        LoadI                                  
        JumpFalse    -function-insert-9-endflag 
        PushD        insert-location-temp      
        LoadI                                  
        Exchange                               
        StoreI                                 
        PushI        -1                        
        PushD        $insert-size-temp         
        LoadI                                  
        Add                                    
        PushD        $insert-size-temp         
        Exchange                               
        StoreI                                 
        PushI        4                         
        PushD        insert-location-temp      
        LoadI                                  
        Add                                    
        PushD        insert-location-temp      
        Exchange                               
        StoreI                                 
        Jump         -function-insert-9-loopflag 
        Label        -function-insert-9-endflag 
        PushD        $record-creation-temporary 
        LoadI                                  
        PushI        3                         
        PushI        2                         
        PushI        1                         
        PushI        3                         
        Duplicate                              
        JumpNeg      $$array-size-is-negative  
        Duplicate                              
        PushI        4                         
        Multiply                               
        Duplicate                              
        PushD        $array-datasize-temporary 
        Exchange                               
        StoreI                                 
        PushI        16                        
        Add                                    
        Call         -mem-manager-allocate     
        PushD        $record-creation-temporary 
        Exchange                               
        StoreI                                 
        PushD        $record-creation-temporary 
        LoadI                                  
        PushI        0                         
        Add                                    
        PushI        7                         
        StoreI                                 
        PushD        $record-creation-temporary 
        LoadI                                  
        PushI        4                         
        Add                                    
        PushI        0                         
        StoreI                                 
        PushD        $record-creation-temporary 
        LoadI                                  
        PushI        16                        
        Add                                    
        PushD        $array-datasize-temporary 
        LoadI                                  
        Call         $$clear-n-bytes           
        PushD        $record-creation-temporary 
        LoadI                                  
        PushI        8                         
        Add                                    
        PushI        4                         
        StoreI                                 
        PushD        $record-creation-temporary 
        LoadI                                  
        PushI        12                        
        Add                                    
        Exchange                               
        StoreI                                 
        PushI        3                         
        PushD        $record-creation-temporary 
        LoadI                                  
        PushI        16                        
        Add                                    
        PushD        insert-location-temp      
        Exchange                               
        StoreI                                 
        PushD        $insert-size-temp         
        Exchange                               
        StoreI                                 
        Label        -function-insert-8-loopflag 
        PushD        $insert-size-temp         
        LoadI                                  
        JumpFalse    -function-insert-8-endflag 
        PushD        insert-location-temp      
        LoadI                                  
        Exchange                               
        StoreI                                 
        PushI        -1                        
        PushD        $insert-size-temp         
        LoadI                                  
        Add                                    
        PushD        $insert-size-temp         
        Exchange                               
        StoreI                                 
        PushI        4                         
        PushD        insert-location-temp      
        LoadI                                  
        Add                                    
        PushD        insert-location-temp      
        Exchange                               
        StoreI                                 
        Jump         -function-insert-8-loopflag 
        Label        -function-insert-8-endflag 
        PushD        $record-creation-temporary 
        LoadI                                  
        PushI        4                         
        Duplicate                              
        JumpNeg      $$array-size-is-negative  
        Duplicate                              
        PushI        4                         
        Multiply                               
        Duplicate                              
        PushD        $array-datasize-temporary 
        Exchange                               
        StoreI                                 
        PushI        16                        
        Add                                    
        Call         -mem-manager-allocate     
        PushD        $record-creation-temporary 
        Exchange                               
        StoreI                                 
        PushD        $record-creation-temporary 
        LoadI                                  
        PushI        0                         
        Add                                    
        PushI        7                         
        StoreI                                 
        PushD        $record-creation-temporary 
        LoadI                                  
        PushI        4                         
        Add                                    
        PushI        65536                     
        StoreI                                 
        PushD        $record-creation-temporary 
        LoadI                                  
        PushI        16                        
        Add                                    
        PushD        $array-datasize-temporary 
        LoadI                                  
        Call         $$clear-n-bytes           
        PushD        $record-creation-temporary 
        LoadI                                  
        PushI        8                         
        Add                                    
        PushI        4                         
        StoreI                                 
        PushD        $record-creation-temporary 
        LoadI                                  
        PushI        12                        
        Add                                    
        Exchange                               
        StoreI                                 
        PushI        4                         
        PushD        $record-creation-temporary 
        LoadI                                  
        PushI        16                        
        Add                                    
        PushD        insert-location-temp      
        Exchange                               
        StoreI                                 
        PushD        $insert-size-temp         
        Exchange                               
        StoreI                                 
        Label        -function-insert-11-loopflag 
        PushD        $insert-size-temp         
        LoadI                                  
        JumpFalse    -function-insert-11-endflag 
        PushD        insert-location-temp      
        LoadI                                  
        Exchange                               
        StoreI                                 
        PushI        -1                        
        PushD        $insert-size-temp         
        LoadI                                  
        Add                                    
        PushD        $insert-size-temp         
        Exchange                               
        StoreI                                 
        PushI        4                         
        PushD        insert-location-temp      
        LoadI                                  
        Add                                    
        PushD        insert-location-temp      
        Exchange                               
        StoreI                                 
        Jump         -function-insert-11-loopflag 
        Label        -function-insert-11-endflag 
        PushD        $record-creation-temporary 
        LoadI                                  
        StoreI                                 
        PushD        $global-memory-block      
        PushI        32                        
        Add                                    %% width
        PushI        4                         
        StoreI                                 
        PushD        $global-memory-block      
        PushI        36                        
        Add                                    %% height
        PushI        7                         
        StoreI                                 
        PushD        $global-memory-block      
        PushI        40                        
        Add                                    %% matrix
        PushD        $global-memory-block      
        PushI        32                        
        Add                                    %% width
        LoadI                                  
        Duplicate                              
        JumpNeg      $$array-size-is-negative  
        Duplicate                              
        PushI        4                         
        Multiply                               
        Duplicate                              
        PushD        $array-datasize-temporary 
        Exchange                               
        StoreI                                 
        PushI        16                        
        Add                                    
        Call         -mem-manager-allocate     
        PushD        $record-creation-temporary 
        Exchange                               
        StoreI                                 
        PushD        $record-creation-temporary 
        LoadI                                  
        PushI        0                         
        Add                                    
        PushI        7                         
        StoreI                                 
        PushD        $record-creation-temporary 
        LoadI                                  
        PushI        4                         
        Add                                    
        PushI        65536                     
        StoreI                                 
        PushD        $record-creation-temporary 
        LoadI                                  
        PushI        16                        
        Add                                    
        PushD        $array-datasize-temporary 
        LoadI                                  
        Call         $$clear-n-bytes           
        PushD        $record-creation-temporary 
        LoadI                                  
        PushI        8                         
        Add                                    
        PushI        4                         
        StoreI                                 
        PushD        $record-creation-temporary 
        LoadI                                  
        PushI        12                        
        Add                                    
        Exchange                               
        StoreI                                 
        PushD        $record-creation-temporary 
        LoadI                                  
        StoreI                                 
        PushD        $global-memory-block      
        PushI        44                        
        Add                                    %% x
        PushI        0                         
        StoreI                                 
        Label        -while-14-condition       
        PushD        $global-memory-block      
        PushI        44                        
        Add                                    %% x
        LoadI                                  
        PushD        $global-memory-block      
        PushI        32                        
        Add                                    %% width
        LoadI                                  
        Label        -compare-12-sub           
        Subtract                               
        JumpNeg      -compare-12-true          
        Jump         -compare-12-false         
        Label        -compare-12-true          
        PushI        1                         
        Jump         -compare-12-join          
        Label        -compare-12-false         
        PushI        0                         
        Jump         -compare-12-join          
        Label        -compare-12-join          
        JumpFalse    -while-14-ends            
        Label        -while-14-starts          
        PushD        $global-memory-block      
        PushI        40                        
        Add                                    %% matrix
        LoadI                                  
        PushD        $global-memory-block      
        PushI        44                        
        Add                                    %% x
        LoadI                                  
        PushD        $a-indexing-index         
        Exchange                               
        StoreI                                 
        PushD        $a-indexing-array         
        Exchange                               
        StoreI                                 
        PushD        $a-indexing-array         
        LoadI                                  
        JumpFalse    $$array-is-null           
        PushD        $a-indexing-index         
        LoadI                                  
        JumpNeg      $$array-size-is-negative  
        PushD        $a-indexing-index         
        LoadI                                  
        PushD        $a-indexing-array         
        LoadI                                  
        PushI        12                        
        Add                                    
        LoadI                                  
        Subtract                               
        JumpNeg      -array-indexing-13-startflag 
        Jump         $$array-size-is-out-of-bound 
        Label        -array-indexing-13-startflag 
        PushD        $a-indexing-array         
        LoadI                                  
        PushI        16                        
        Add                                    
        PushD        $a-indexing-index         
        LoadI                                  
        PushI        4                         
        Multiply                               
        Add                                    
        PushD        $global-memory-block      
        PushI        36                        
        Add                                    %% height
        LoadI                                  
        Duplicate                              
        JumpNeg      $$array-size-is-negative  
        Duplicate                              
        PushI        8                         
        Multiply                               
        Duplicate                              
        PushD        $array-datasize-temporary 
        Exchange                               
        StoreI                                 
        PushI        16                        
        Add                                    
        Call         -mem-manager-allocate     
        PushD        $record-creation-temporary 
        Exchange                               
        StoreI                                 
        PushD        $record-creation-temporary 
        LoadI                                  
        PushI        0                         
        Add                                    
        PushI        7                         
        StoreI                                 
        PushD        $record-creation-temporary 
        LoadI                                  
        PushI        4                         
        Add                                    
        PushI        65536                     
        StoreI                                 
        PushD        $record-creation-temporary 
        LoadI                                  
        PushI        16                        
        Add                                    
        PushD        $array-datasize-temporary 
        LoadI                                  
        Call         $$clear-n-bytes           
        PushD        $record-creation-temporary 
        LoadI                                  
        PushI        8                         
        Add                                    
        PushI        8                         
        StoreI                                 
        PushD        $record-creation-temporary 
        LoadI                                  
        PushI        12                        
        Add                                    
        Exchange                               
        StoreI                                 
        PushD        $record-creation-temporary 
        LoadI                                  
        StoreI                                 
        PushD        $global-memory-block      
        PushI        44                        
        Add                                    %% x
        PushD        $global-memory-block      
        PushI        44                        
        Add                                    %% x
        LoadI                                  
        PushI        1                         
        Add                                    
        StoreI                                 
        Jump         -while-14-condition       
        Label        -while-14-ends            
        PushD        $global-memory-block      
        PushI        24                        
        Add                                    %% a5
        LoadI                                  
        PushD        $print-format-integer     
        Printf                                 
        PushD        $print-format-space       
        Printf                                 
        PushD        $global-memory-block      
        PushI        16                        
        Add                                    %% a2
        LoadI                                  
        PushD        $array-print-start        
        Printf                                 
        Duplicate                              
        PushI        12                        
        Add                                    
        LoadI                                  
        Exchange                               
        PushI        16                        
        Add                                    
        Exchange                               
        Label        -recursive-print-array-15-startflag 
        Duplicate                              
        JumpFalse    -recursive-print-array-15-endflag 
        Label        -recursive-print-array-15-loopflag 
        Exchange                               
        Duplicate                              
        Duplicate                              
        LoadI                                  
        Exchange                               
        PushI        4                         
        Add                                    
        LoadI                                  
        Call         $$print-rational          
        PushI        8                         
        Add                                    
        Exchange                               
        PushI        -1                        
        Add                                    
        Duplicate                              
        JumpFalse    -recursive-print-array-15-endflag 
        PushD        $array-print-middle       
        Printf                                 
        Jump         -recursive-print-array-15-loopflag 
        Label        -recursive-print-array-15-endflag 
        Pop                                    
        Pop                                    
        PushD        $array-print-end          
        Printf                                 
        PushD        $print-format-space       
        Printf                                 
        PushD        $global-memory-block      
        PushI        20                        
        Add                                    %% a4
        LoadI                                  
        PushD        $array-print-start        
        Printf                                 
        Duplicate                              
        PushI        12                        
        Add                                    
        LoadI                                  
        Exchange                               
        PushI        16                        
        Add                                    
        Exchange                               
        Label        -recursive-print-array-16-startflag 
        Duplicate                              
        JumpFalse    -recursive-print-array-16-endflag 
        Label        -recursive-print-array-16-loopflag 
        Exchange                               
        Duplicate                              
        Duplicate                              
        LoadI                                  
        Exchange                               
        PushI        4                         
        Add                                    
        LoadI                                  
        Call         $$print-rational          
        PushI        8                         
        Add                                    
        Exchange                               
        PushI        -1                        
        Add                                    
        Duplicate                              
        JumpFalse    -recursive-print-array-16-endflag 
        PushD        $array-print-middle       
        Printf                                 
        Jump         -recursive-print-array-16-loopflag 
        Label        -recursive-print-array-16-endflag 
        Pop                                    
        Pop                                    
        PushD        $array-print-end          
        Printf                                 
        PushD        $print-format-space       
        Printf                                 
        PushD        $global-memory-block      
        PushI        28                        
        Add                                    %% numSets
        LoadI                                  
        PushD        $array-print-start        
        Printf                                 
        Duplicate                              
        PushI        12                        
        Add                                    
        LoadI                                  
        Exchange                               
        PushI        16                        
        Add                                    
        Exchange                               
        Label        -recursive-print-array-17-startflag 
        Duplicate                              
        JumpFalse    -recursive-print-array-17-endflag 
        Label        -recursive-print-array-17-loopflag 
        Exchange                               
        Duplicate                              
        LoadI                                  
        PushD        $array-print-start        
        Printf                                 
        Duplicate                              
        PushI        12                        
        Add                                    
        LoadI                                  
        Exchange                               
        PushI        16                        
        Add                                    
        Exchange                               
        Label        -recursive-print-array-18-startflag 
        Duplicate                              
        JumpFalse    -recursive-print-array-18-endflag 
        Label        -recursive-print-array-18-loopflag 
        Exchange                               
        Duplicate                              
        LoadI                                  
        PushD        $print-format-integer     
        Printf                                 
        PushI        4                         
        Add                                    
        Exchange                               
        PushI        -1                        
        Add                                    
        Duplicate                              
        JumpFalse    -recursive-print-array-18-endflag 
        PushD        $array-print-middle       
        Printf                                 
        Jump         -recursive-print-array-18-loopflag 
        Label        -recursive-print-array-18-endflag 
        Pop                                    
        Pop                                    
        PushD        $array-print-end          
        Printf                                 
        PushI        4                         
        Add                                    
        Exchange                               
        PushI        -1                        
        Add                                    
        Duplicate                              
        JumpFalse    -recursive-print-array-17-endflag 
        PushD        $array-print-middle       
        Printf                                 
        Jump         -recursive-print-array-17-loopflag 
        Label        -recursive-print-array-17-endflag 
        Pop                                    
        Pop                                    
        PushD        $array-print-end          
        Printf                                 
        PushD        $print-format-space       
        Printf                                 
        PushD        $global-memory-block      
        PushI        8                         
        Add                                    %% a1
        LoadF                                  
        PushD        $print-format-floating    
        Printf                                 
        PushD        $print-format-space       
        Printf                                 
        PushD        $global-memory-block      
        PushI        40                        
        Add                                    %% matrix
        LoadI                                  
        PushD        $array-print-start        
        Printf                                 
        Duplicate                              
        PushI        12                        
        Add                                    
        LoadI                                  
        Exchange                               
        PushI        16                        
        Add                                    
        Exchange                               
        Label        -recursive-print-array-19-startflag 
        Duplicate                              
        JumpFalse    -recursive-print-array-19-endflag 
        Label        -recursive-print-array-19-loopflag 
        Exchange                               
        Duplicate                              
        LoadI                                  
        PushD        $array-print-start        
        Printf                                 
        Duplicate                              
        PushI        12                        
        Add                                    
        LoadI                                  
        Exchange                               
        PushI        16                        
        Add                                    
        Exchange                               
        Label        -recursive-print-array-20-startflag 
        Duplicate                              
        JumpFalse    -recursive-print-array-20-endflag 
        Label        -recursive-print-array-20-loopflag 
        Exchange                               
        Duplicate                              
        LoadF                                  
        PushD        $print-format-floating    
        Printf                                 
        PushI        8                         
        Add                                    
        Exchange                               
        PushI        -1                        
        Add                                    
        Duplicate                              
        JumpFalse    -recursive-print-array-20-endflag 
        PushD        $array-print-middle       
        Printf                                 
        Jump         -recursive-print-array-20-loopflag 
        Label        -recursive-print-array-20-endflag 
        Pop                                    
        Pop                                    
        PushD        $array-print-end          
        Printf                                 
        PushI        4                         
        Add                                    
        Exchange                               
        PushI        -1                        
        Add                                    
        Duplicate                              
        JumpFalse    -recursive-print-array-19-endflag 
        PushD        $array-print-middle       
        Printf                                 
        Jump         -recursive-print-array-19-loopflag 
        Label        -recursive-print-array-19-endflag 
        Pop                                    
        Pop                                    
        PushD        $array-print-end          
        Printf                                 
        PushD        $print-format-space       
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
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

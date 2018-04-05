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
        DLabel       $print-format-lambda      
        DataC        123                       %% "{Function at address %d}"
        DataC        70                        
        DataC        117                       
        DataC        110                       
        DataC        99                        
        DataC        116                       
        DataC        105                       
        DataC        111                       
        DataC        110                       
        DataC        32                        
        DataC        97                        
        DataC        116                       
        DataC        32                        
        DataC        97                        
        DataC        100                       
        DataC        100                       
        DataC        114                       
        DataC        101                       
        DataC        115                       
        DataC        115                       
        DataC        32                        
        DataC        37                        
        DataC        100                       
        DataC        125                       
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
        DLabel       $errors-null-string       
        DataC        115                       %% "string is null"
        DataC        116                       
        DataC        114                       
        DataC        105                       
        DataC        110                       
        DataC        103                       
        DataC        32                        
        DataC        105                       
        DataC        115                       
        DataC        32                        
        DataC        110                       
        DataC        117                       
        DataC        108                       
        DataC        108                       
        DataC        0                         
        Label        $$string-is-null          
        PushD        $errors-null-string       
        Jump         $$general-runtime-error   
        DLabel       $errors-negative-string-size 
        DataC        110                       %% "negative string size"
        DataC        101                       
        DataC        103                       
        DataC        97                        
        DataC        116                       
        DataC        105                       
        DataC        118                       
        DataC        101                       
        DataC        32                        
        DataC        115                       
        DataC        116                       
        DataC        114                       
        DataC        105                       
        DataC        110                       
        DataC        103                       
        DataC        32                        
        DataC        115                       
        DataC        105                       
        DataC        122                       
        DataC        101                       
        DataC        0                         
        Label        $$string-size-is-negative 
        PushD        $errors-negative-string-size 
        Jump         $$general-runtime-error   
        DLabel       $errors-overflow-string-size 
        DataC        111                       %% "overflow string size"
        DataC        118                       
        DataC        101                       
        DataC        114                       
        DataC        102                       
        DataC        108                       
        DataC        111                       
        DataC        119                       
        DataC        32                        
        DataC        115                       
        DataC        116                       
        DataC        114                       
        DataC        105                       
        DataC        110                       
        DataC        103                       
        DataC        32                        
        DataC        115                       
        DataC        105                       
        DataC        122                       
        DataC        101                       
        DataC        0                         
        Label        $$string-size-is-out-of-bound 
        PushD        $errors-overflow-string-size 
        Jump         $$general-runtime-error   
        DLabel       $errors-overflow-substring-size 
        DataC        111                       %% "overflow substring size"
        DataC        118                       
        DataC        101                       
        DataC        114                       
        DataC        102                       
        DataC        108                       
        DataC        111                       
        DataC        119                       
        DataC        32                        
        DataC        115                       
        DataC        117                       
        DataC        98                        
        DataC        115                       
        DataC        116                       
        DataC        114                       
        DataC        105                       
        DataC        110                       
        DataC        103                       
        DataC        32                        
        DataC        115                       
        DataC        105                       
        DataC        122                       
        DataC        101                       
        DataC        0                         
        Label        $$substring-size-is-out-of-bound 
        PushD        $errors-overflow-substring-size 
        Jump         $$general-runtime-error   
        DLabel       $errors-function-no-return 
        DataC        102                       %% "function no return"
        DataC        117                       
        DataC        110                       
        DataC        99                        
        DataC        116                       
        DataC        105                       
        DataC        111                       
        DataC        110                       
        DataC        32                        
        DataC        110                       
        DataC        111                       
        DataC        32                        
        DataC        114                       
        DataC        101                       
        DataC        116                       
        DataC        117                       
        DataC        114                       
        DataC        110                       
        DataC        0                         
        Label        $$function-no-return      
        PushD        $errors-function-no-return 
        Jump         $$general-runtime-error   
        DLabel       $errors-fold-with-empty-array 
        DataC        102                       %% "fold with empty array"
        DataC        111                       
        DataC        108                       
        DataC        100                       
        DataC        32                        
        DataC        119                       
        DataC        105                       
        DataC        116                       
        DataC        104                       
        DataC        32                        
        DataC        101                       
        DataC        109                       
        DataC        112                       
        DataC        116                       
        DataC        121                       
        DataC        32                        
        DataC        97                        
        DataC        114                       
        DataC        114                       
        DataC        97                        
        DataC        121                       
        DataC        0                         
        Label        $$fold-with-empty-array   
        PushD        $errors-fold-with-empty-array 
        Jump         $$general-runtime-error   
        DLabel       $errors-zip-with-wrong-length 
        DataC        122                       %% "zip with wrong length"
        DataC        105                       
        DataC        112                       
        DataC        32                        
        DataC        119                       
        DataC        105                       
        DataC        116                       
        DataC        104                       
        DataC        32                        
        DataC        119                       
        DataC        114                       
        DataC        111                       
        DataC        110                       
        DataC        103                       
        DataC        32                        
        DataC        108                       
        DataC        101                       
        DataC        110                       
        DataC        103                       
        DataC        116                       
        DataC        104                       
        DataC        0                         
        Label        $$zip-with-different-array-length 
        PushD        $errors-zip-with-wrong-length 
        Jump         $$general-runtime-error   
        DLabel       $indexing-element         
        DataZ        4                         
        DLabel       $indexing-element2        
        DataZ        4                         
        DLabel       $indexing-index           
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
        DLabel       $insert-location-temp     
        DataZ        4                         
        DLabel       $copy-new-location-temp   
        DataZ        4                         
        DLabel       $copy-location-temp       
        DataZ        4                         
        DLabel       $copy-location-temp2      
        DataZ        4                         
        DLabel       $copy-size-temp           
        DataZ        4                         
        DLabel       $frame-pointer            
        DataZ        4                         
        DLabel       $stack-pointer            
        DataZ        4                         
        DLabel       store-addr-temp           
        DataZ        4                         
        DLabel       $string-size-temp         
        DataZ        4                         
        DLabel       $string-location-temp     
        DataZ        4                         
        DLabel       $string-concatenation-first-temp 
        DataZ        4                         
        DLabel       $string-concatenation-second-temp 
        DataZ        4                         
        DLabel       $function-temp            
        DataZ        4                         
        DLabel       $stack-pop-temp           
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
        Label        -$function-lowest-4-loop-continue 
        PushD        $gcd-temp-numerator       
        LoadI                                  
        PushD        $gcd-temp-denominator     
        LoadI                                  
        Remainder                              
        Duplicate                              
        JumpFalse    -$function-lowest-4-loop-end 
        PushD        $gcd-temp-denominator     
        LoadI                                  
        PushD        $gcd-temp-numerator       
        Exchange                               
        StoreI                                 
        PushD        $gcd-temp-denominator     
        Exchange                               
        StoreI                                 
        Jump         -$function-lowest-4-loop-continue 
        Label        -$function-lowest-4-loop-end 
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
        Label        -$function-clear-5-loopflag 
        PushD        $clear-size-temp          
        LoadI                                  
        JumpFalse    -$function-clear-5-endflag 
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
        Jump         -$function-clear-5-loopflag 
        Label        -$function-clear-5-endflag 
        Pop                                    
        PushD        $return-for-runtime-func  
        LoadI                                  
        Return                                 
        Label        $$print-rational          
        PushD        $return-for-runtime-func  
        Exchange                               
        StoreI                                 
        Duplicate                              
        JumpFalse    $$r-divide-by-zero        
        Duplicate                              
        JumpPos      -$function-print-rational-6-positive2 
        Negate                                 
        Exchange                               
        Negate                                 
        Exchange                               
        Label        -$function-print-rational-6-positive2 
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
        JumpFalse    -$function-print-rational-6-end-with-no-fraction 
        PushD        $first-numerator          
        Exchange                               
        StoreI                                 
        Duplicate                              
        PushD        $print-temp               
        Exchange                               
        StoreI                                 
        JumpFalse    -$function-print-rational-6-end-with-no-int 
        PushD        $first-numerator          
        LoadI                                  
        Duplicate                              
        JumpPos      -$function-print-rational-6-positive1 
        Negate                                 
        Label        -$function-print-rational-6-positive1 
        PushD        $first-denominator        
        LoadI                                  
        Exchange                               
        PushD        $print-temp               
        LoadI                                  
        Jump         -$function-print-rational-6-end-with-original 
        Label        -$function-print-rational-6-end-with-no-fraction 
        Pop                                    
        PushD        $print-format-rational-no-frac 
        Jump         -$function-print-rational-6-end-join 
        Label        -$function-print-rational-6-end-with-no-int 
        PushD        $first-numerator          
        LoadI                                  
        Duplicate                              
        JumpPos      -$function-print-rational-6-end-with-no-int-pos 
        Negate                                 
        Jump         -$function-print-rational-6-end-with-no-int-neg 
        Label        -$function-print-rational-6-end-with-no-int-pos 
        PushD        $first-denominator        
        LoadI                                  
        Exchange                               
        PushD        $print-format-rational-no-int-pos 
        Jump         -$function-print-rational-6-end-join 
        Label        -$function-print-rational-6-end-with-no-int-neg 
        PushD        $first-denominator        
        LoadI                                  
        Exchange                               
        PushD        $print-format-rantional-no-int-neg 
        Jump         -$function-print-rational-6-end-join 
        Label        -$function-print-rational-6-end-with-original 
        PushD        $print-format-rational-original 
        Jump         -$function-print-rational-6-end-join 
        Label        -$function-print-rational-6-end-join 
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
        JumpTrue     -$function-release-reference-7-endflag 
        Duplicate                              
        PushI        6                         
        Add                                    
        LoadC                                  
        JumpTrue     -$function-release-reference-7-endflag 
        Duplicate                              
        PushI        5                         
        Add                                    
        LoadC                                  
        JumpFalse    -$function-release-reference-7-subtypeIsRefflag 
        Duplicate                              
        Duplicate                              
        PushI        12                        
        Add                                    
        LoadI                                  
        Exchange                               
        PushI        16                        
        Add                                    
        Exchange                               
        Label        -$release-subtype-reference-8-loopflag 
        Duplicate                              
        JumpFalse    -$release-subtype-reference-8-endflag 
        Exchange                               
        Duplicate                              
        LoadI                                  
        Call         $$release-reference       
        PushI        4                         
        Add                                    
        Exchange                               
        PushI        -1                        
        Add                                    
        Jump         -$release-subtype-reference-8-loopflag 
        Label        -$release-subtype-reference-8-endflag 
        Pop                                    
        Pop                                    
        Label        -$function-release-reference-7-subtypeIsRefflag 
        Duplicate                              
        PushI        6                         
        Add                                    
        PushI        1                         
        StoreC                                 
        Call         -mem-manager-deallocate   
        Jump         -$function-release-reference-7-returnflag 
        Label        -$function-release-reference-7-endflag 
        Pop                                    
        Label        -$function-release-reference-7-returnflag 
        Return                                 
        DLabel       $usable-memory-start      
        DLabel       $global-memory-block      
        DataZ        56                        
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
        Memtop                                 
        Duplicate                              
        PushD        $frame-pointer            
        Exchange                               
        StoreI                                 
        PushD        $stack-pointer            
        Exchange                               
        StoreI                                 
        PushI        116                       
        PushI        105                       
        PushI        98                        
        PushI        98                        
        PushI        97                        
        PushI        114                       
        PushI        6                         
        PushD        $string-size-temp         
        Exchange                               
        StoreI                                 
        PushD        $string-size-temp         
        LoadI                                  
        PushI        13                        
        Add                                    
        Call         -mem-manager-allocate     
        PushD        $record-creation-temporary 
        Exchange                               
        StoreI                                 
        PushD        $record-creation-temporary 
        LoadI                                  
        PushI        0                         
        Add                                    
        PushI        6                         
        StoreI                                 
        PushD        $record-creation-temporary 
        LoadI                                  
        PushI        4                         
        Add                                    
        PushI        16777217                  
        StoreI                                 
        PushD        $string-size-temp         
        LoadI                                  
        PushD        $record-creation-temporary 
        LoadI                                  
        PushI        12                        
        Add                                    
        Add                                    
        PushI        0                         
        StoreC                                 
        PushD        $string-size-temp         
        LoadI                                  
        PushD        $record-creation-temporary 
        LoadI                                  
        PushI        8                         
        Add                                    
        Exchange                               
        StoreI                                 
        PushD        $string-size-temp         
        LoadI                                  
        PushD        $record-creation-temporary 
        LoadI                                  
        PushI        12                        
        Add                                    
        PushD        $insert-location-temp     
        Exchange                               
        StoreI                                 
        PushD        $insert-size-temp         
        Exchange                               
        StoreI                                 
        Label        -$insert-9-loopflag       
        PushD        $insert-size-temp         
        LoadI                                  
        JumpFalse    -$insert-9-endflag        
        PushD        $insert-location-temp     
        LoadI                                  
        Exchange                               
        StoreC                                 
        PushI        -1                        
        PushD        $insert-size-temp         
        LoadI                                  
        Add                                    
        PushD        $insert-size-temp         
        Exchange                               
        StoreI                                 
        PushI        1                         
        PushD        $insert-location-temp     
        LoadI                                  
        Add                                    
        PushD        $insert-location-temp     
        Exchange                               
        StoreI                                 
        Jump         -$insert-9-loopflag       
        Label        -$insert-9-endflag        
        PushD        $record-creation-temporary 
        LoadI                                  
        PushD        $global-memory-block      
        PushI        0                         
        Add                                    %% s
        PushD        store-addr-temp           
        Exchange                               
        StoreI                                 
        PushD        store-addr-temp           
        LoadI                                  
        Exchange                               
        StoreI                                 
        PushI        9                         
        PushI        8                         
        PushI        7                         
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
        PushD        $insert-location-temp     
        Exchange                               
        StoreI                                 
        PushD        $insert-size-temp         
        Exchange                               
        StoreI                                 
        Label        -$insert-12-loopflag      
        PushD        $insert-size-temp         
        LoadI                                  
        JumpFalse    -$insert-12-endflag       
        PushD        $insert-location-temp     
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
        PushD        $insert-location-temp     
        LoadI                                  
        Add                                    
        PushD        $insert-location-temp     
        Exchange                               
        StoreI                                 
        Jump         -$insert-12-loopflag      
        Label        -$insert-12-endflag       
        PushD        $record-creation-temporary 
        LoadI                                  
        PushI        6                         
        PushI        5                         
        PushI        4                         
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
        PushD        $insert-location-temp     
        Exchange                               
        StoreI                                 
        PushD        $insert-size-temp         
        Exchange                               
        StoreI                                 
        Label        -$insert-11-loopflag      
        PushD        $insert-size-temp         
        LoadI                                  
        JumpFalse    -$insert-11-endflag       
        PushD        $insert-location-temp     
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
        PushD        $insert-location-temp     
        LoadI                                  
        Add                                    
        PushD        $insert-location-temp     
        Exchange                               
        StoreI                                 
        Jump         -$insert-11-loopflag      
        Label        -$insert-11-endflag       
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
        PushD        $insert-location-temp     
        Exchange                               
        StoreI                                 
        PushD        $insert-size-temp         
        Exchange                               
        StoreI                                 
        Label        -$insert-10-loopflag      
        PushD        $insert-size-temp         
        LoadI                                  
        JumpFalse    -$insert-10-endflag       
        PushD        $insert-location-temp     
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
        PushD        $insert-location-temp     
        LoadI                                  
        Add                                    
        PushD        $insert-location-temp     
        Exchange                               
        StoreI                                 
        Jump         -$insert-10-loopflag      
        Label        -$insert-10-endflag       
        PushD        $record-creation-temporary 
        LoadI                                  
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
        PushI        256                       
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
        PushD        $insert-location-temp     
        Exchange                               
        StoreI                                 
        PushD        $insert-size-temp         
        Exchange                               
        StoreI                                 
        Label        -$insert-13-loopflag      
        PushD        $insert-size-temp         
        LoadI                                  
        JumpFalse    -$insert-13-endflag       
        PushD        $insert-location-temp     
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
        PushD        $insert-location-temp     
        LoadI                                  
        Add                                    
        PushD        $insert-location-temp     
        Exchange                               
        StoreI                                 
        Jump         -$insert-13-loopflag      
        Label        -$insert-13-endflag       
        PushD        $record-creation-temporary 
        LoadI                                  
        PushD        $global-memory-block      
        PushI        4                         
        Add                                    %% a1
        PushD        store-addr-temp           
        Exchange                               
        StoreI                                 
        PushD        store-addr-temp           
        LoadI                                  
        Exchange                               
        StoreI                                 
        PushI        15                        
        PushI        16                        
        Call         $$convert-to-lowest-terms 
        PushI        14                        
        PushI        15                        
        Call         $$convert-to-lowest-terms 
        PushI        13                        
        PushI        14                        
        Call         $$convert-to-lowest-terms 
        PushI        3                         
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
        PushI        3                         
        PushD        $record-creation-temporary 
        LoadI                                  
        PushI        16                        
        Add                                    
        PushD        $insert-location-temp     
        Exchange                               
        StoreI                                 
        PushD        $insert-size-temp         
        Exchange                               
        StoreI                                 
        Label        -$insert-15-loopflag      
        PushD        $insert-size-temp         
        LoadI                                  
        JumpFalse    -$insert-15-endflag       
        PushD        $insert-location-temp     
        LoadI                                  
        PushI        4                         
        Add                                    
        Exchange                               
        StoreI                                 
        PushD        $insert-location-temp     
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
        PushI        8                         
        PushD        $insert-location-temp     
        LoadI                                  
        Add                                    
        PushD        $insert-location-temp     
        Exchange                               
        StoreI                                 
        Jump         -$insert-15-loopflag      
        Label        -$insert-15-endflag       
        PushD        $record-creation-temporary 
        LoadI                                  
        PushI        5                         
        PushI        6                         
        Call         $$convert-to-lowest-terms 
        PushI        4                         
        PushI        5                         
        Call         $$convert-to-lowest-terms 
        PushI        3                         
        PushI        4                         
        Call         $$convert-to-lowest-terms 
        PushI        3                         
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
        PushI        3                         
        PushD        $record-creation-temporary 
        LoadI                                  
        PushI        16                        
        Add                                    
        PushD        $insert-location-temp     
        Exchange                               
        StoreI                                 
        PushD        $insert-size-temp         
        Exchange                               
        StoreI                                 
        Label        -$insert-14-loopflag      
        PushD        $insert-size-temp         
        LoadI                                  
        JumpFalse    -$insert-14-endflag       
        PushD        $insert-location-temp     
        LoadI                                  
        PushI        4                         
        Add                                    
        Exchange                               
        StoreI                                 
        PushD        $insert-location-temp     
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
        PushI        8                         
        PushD        $insert-location-temp     
        LoadI                                  
        Add                                    
        PushD        $insert-location-temp     
        Exchange                               
        StoreI                                 
        Jump         -$insert-14-loopflag      
        Label        -$insert-14-endflag       
        PushD        $record-creation-temporary 
        LoadI                                  
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
        PushI        256                       
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
        PushD        $insert-location-temp     
        Exchange                               
        StoreI                                 
        PushD        $insert-size-temp         
        Exchange                               
        StoreI                                 
        Label        -$insert-16-loopflag      
        PushD        $insert-size-temp         
        LoadI                                  
        JumpFalse    -$insert-16-endflag       
        PushD        $insert-location-temp     
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
        PushD        $insert-location-temp     
        LoadI                                  
        Add                                    
        PushD        $insert-location-temp     
        Exchange                               
        StoreI                                 
        Jump         -$insert-16-loopflag      
        Label        -$insert-16-endflag       
        PushD        $record-creation-temporary 
        LoadI                                  
        PushD        $global-memory-block      
        PushI        8                         
        Add                                    %% a2
        PushD        store-addr-temp           
        Exchange                               
        StoreI                                 
        PushD        store-addr-temp           
        LoadI                                  
        Exchange                               
        StoreI                                 
        PushI        100                       
        PushI        114                       
        PushI        105                       
        PushI        104                       
        PushI        116                       
        PushI        5                         
        PushD        $string-size-temp         
        Exchange                               
        StoreI                                 
        PushD        $string-size-temp         
        LoadI                                  
        PushI        13                        
        Add                                    
        Call         -mem-manager-allocate     
        PushD        $record-creation-temporary 
        Exchange                               
        StoreI                                 
        PushD        $record-creation-temporary 
        LoadI                                  
        PushI        0                         
        Add                                    
        PushI        6                         
        StoreI                                 
        PushD        $record-creation-temporary 
        LoadI                                  
        PushI        4                         
        Add                                    
        PushI        16777217                  
        StoreI                                 
        PushD        $string-size-temp         
        LoadI                                  
        PushD        $record-creation-temporary 
        LoadI                                  
        PushI        12                        
        Add                                    
        Add                                    
        PushI        0                         
        StoreC                                 
        PushD        $string-size-temp         
        LoadI                                  
        PushD        $record-creation-temporary 
        LoadI                                  
        PushI        8                         
        Add                                    
        Exchange                               
        StoreI                                 
        PushD        $string-size-temp         
        LoadI                                  
        PushD        $record-creation-temporary 
        LoadI                                  
        PushI        12                        
        Add                                    
        PushD        $insert-location-temp     
        Exchange                               
        StoreI                                 
        PushD        $insert-size-temp         
        Exchange                               
        StoreI                                 
        Label        -$insert-19-loopflag      
        PushD        $insert-size-temp         
        LoadI                                  
        JumpFalse    -$insert-19-endflag       
        PushD        $insert-location-temp     
        LoadI                                  
        Exchange                               
        StoreC                                 
        PushI        -1                        
        PushD        $insert-size-temp         
        LoadI                                  
        Add                                    
        PushD        $insert-size-temp         
        Exchange                               
        StoreI                                 
        PushI        1                         
        PushD        $insert-location-temp     
        LoadI                                  
        Add                                    
        PushD        $insert-location-temp     
        Exchange                               
        StoreI                                 
        Jump         -$insert-19-loopflag      
        Label        -$insert-19-endflag       
        PushD        $record-creation-temporary 
        LoadI                                  
        PushI        100                       
        PushI        110                       
        PushI        111                       
        PushI        99                        
        PushI        101                       
        PushI        115                       
        PushI        6                         
        PushD        $string-size-temp         
        Exchange                               
        StoreI                                 
        PushD        $string-size-temp         
        LoadI                                  
        PushI        13                        
        Add                                    
        Call         -mem-manager-allocate     
        PushD        $record-creation-temporary 
        Exchange                               
        StoreI                                 
        PushD        $record-creation-temporary 
        LoadI                                  
        PushI        0                         
        Add                                    
        PushI        6                         
        StoreI                                 
        PushD        $record-creation-temporary 
        LoadI                                  
        PushI        4                         
        Add                                    
        PushI        16777217                  
        StoreI                                 
        PushD        $string-size-temp         
        LoadI                                  
        PushD        $record-creation-temporary 
        LoadI                                  
        PushI        12                        
        Add                                    
        Add                                    
        PushI        0                         
        StoreC                                 
        PushD        $string-size-temp         
        LoadI                                  
        PushD        $record-creation-temporary 
        LoadI                                  
        PushI        8                         
        Add                                    
        Exchange                               
        StoreI                                 
        PushD        $string-size-temp         
        LoadI                                  
        PushD        $record-creation-temporary 
        LoadI                                  
        PushI        12                        
        Add                                    
        PushD        $insert-location-temp     
        Exchange                               
        StoreI                                 
        PushD        $insert-size-temp         
        Exchange                               
        StoreI                                 
        Label        -$insert-18-loopflag      
        PushD        $insert-size-temp         
        LoadI                                  
        JumpFalse    -$insert-18-endflag       
        PushD        $insert-location-temp     
        LoadI                                  
        Exchange                               
        StoreC                                 
        PushI        -1                        
        PushD        $insert-size-temp         
        LoadI                                  
        Add                                    
        PushD        $insert-size-temp         
        Exchange                               
        StoreI                                 
        PushI        1                         
        PushD        $insert-location-temp     
        LoadI                                  
        Add                                    
        PushD        $insert-location-temp     
        Exchange                               
        StoreI                                 
        Jump         -$insert-18-loopflag      
        Label        -$insert-18-endflag       
        PushD        $record-creation-temporary 
        LoadI                                  
        PushI        116                       
        PushI        115                       
        PushI        114                       
        PushI        105                       
        PushI        102                       
        PushI        5                         
        PushD        $string-size-temp         
        Exchange                               
        StoreI                                 
        PushD        $string-size-temp         
        LoadI                                  
        PushI        13                        
        Add                                    
        Call         -mem-manager-allocate     
        PushD        $record-creation-temporary 
        Exchange                               
        StoreI                                 
        PushD        $record-creation-temporary 
        LoadI                                  
        PushI        0                         
        Add                                    
        PushI        6                         
        StoreI                                 
        PushD        $record-creation-temporary 
        LoadI                                  
        PushI        4                         
        Add                                    
        PushI        16777217                  
        StoreI                                 
        PushD        $string-size-temp         
        LoadI                                  
        PushD        $record-creation-temporary 
        LoadI                                  
        PushI        12                        
        Add                                    
        Add                                    
        PushI        0                         
        StoreC                                 
        PushD        $string-size-temp         
        LoadI                                  
        PushD        $record-creation-temporary 
        LoadI                                  
        PushI        8                         
        Add                                    
        Exchange                               
        StoreI                                 
        PushD        $string-size-temp         
        LoadI                                  
        PushD        $record-creation-temporary 
        LoadI                                  
        PushI        12                        
        Add                                    
        PushD        $insert-location-temp     
        Exchange                               
        StoreI                                 
        PushD        $insert-size-temp         
        Exchange                               
        StoreI                                 
        Label        -$insert-17-loopflag      
        PushD        $insert-size-temp         
        LoadI                                  
        JumpFalse    -$insert-17-endflag       
        PushD        $insert-location-temp     
        LoadI                                  
        Exchange                               
        StoreC                                 
        PushI        -1                        
        PushD        $insert-size-temp         
        LoadI                                  
        Add                                    
        PushD        $insert-size-temp         
        Exchange                               
        StoreI                                 
        PushI        1                         
        PushD        $insert-location-temp     
        LoadI                                  
        Add                                    
        PushD        $insert-location-temp     
        Exchange                               
        StoreI                                 
        Jump         -$insert-17-loopflag      
        Label        -$insert-17-endflag       
        PushD        $record-creation-temporary 
        LoadI                                  
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
        PushI        256                       
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
        PushD        $insert-location-temp     
        Exchange                               
        StoreI                                 
        PushD        $insert-size-temp         
        Exchange                               
        StoreI                                 
        Label        -$insert-20-loopflag      
        PushD        $insert-size-temp         
        LoadI                                  
        JumpFalse    -$insert-20-endflag       
        PushD        $insert-location-temp     
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
        PushD        $insert-location-temp     
        LoadI                                  
        Add                                    
        PushD        $insert-location-temp     
        Exchange                               
        StoreI                                 
        Jump         -$insert-20-loopflag      
        Label        -$insert-20-endflag       
        PushD        $record-creation-temporary 
        LoadI                                  
        PushD        $global-memory-block      
        PushI        12                        
        Add                                    %% a3
        PushD        store-addr-temp           
        Exchange                               
        StoreI                                 
        PushD        store-addr-temp           
        LoadI                                  
        Exchange                               
        StoreI                                 
        PushI        52                        
        PushI        114                       
        PushI        117                       
        PushI        111                       
        PushI        102                       
        PushI        5                         
        PushD        $string-size-temp         
        Exchange                               
        StoreI                                 
        PushD        $string-size-temp         
        LoadI                                  
        PushI        13                        
        Add                                    
        Call         -mem-manager-allocate     
        PushD        $record-creation-temporary 
        Exchange                               
        StoreI                                 
        PushD        $record-creation-temporary 
        LoadI                                  
        PushI        0                         
        Add                                    
        PushI        6                         
        StoreI                                 
        PushD        $record-creation-temporary 
        LoadI                                  
        PushI        4                         
        Add                                    
        PushI        16777217                  
        StoreI                                 
        PushD        $string-size-temp         
        LoadI                                  
        PushD        $record-creation-temporary 
        LoadI                                  
        PushI        12                        
        Add                                    
        Add                                    
        PushI        0                         
        StoreC                                 
        PushD        $string-size-temp         
        LoadI                                  
        PushD        $record-creation-temporary 
        LoadI                                  
        PushI        8                         
        Add                                    
        Exchange                               
        StoreI                                 
        PushD        $string-size-temp         
        LoadI                                  
        PushD        $record-creation-temporary 
        LoadI                                  
        PushI        12                        
        Add                                    
        PushD        $insert-location-temp     
        Exchange                               
        StoreI                                 
        PushD        $insert-size-temp         
        Exchange                               
        StoreI                                 
        Label        -$insert-28-loopflag      
        PushD        $insert-size-temp         
        LoadI                                  
        JumpFalse    -$insert-28-endflag       
        PushD        $insert-location-temp     
        LoadI                                  
        Exchange                               
        StoreC                                 
        PushI        -1                        
        PushD        $insert-size-temp         
        LoadI                                  
        Add                                    
        PushD        $insert-size-temp         
        Exchange                               
        StoreI                                 
        PushI        1                         
        PushD        $insert-location-temp     
        LoadI                                  
        Add                                    
        PushD        $insert-location-temp     
        Exchange                               
        StoreI                                 
        Jump         -$insert-28-loopflag      
        Label        -$insert-28-endflag       
        PushD        $record-creation-temporary 
        LoadI                                  
        PushI        51                        
        PushI        114                       
        PushI        117                       
        PushI        111                       
        PushI        102                       
        PushI        5                         
        PushD        $string-size-temp         
        Exchange                               
        StoreI                                 
        PushD        $string-size-temp         
        LoadI                                  
        PushI        13                        
        Add                                    
        Call         -mem-manager-allocate     
        PushD        $record-creation-temporary 
        Exchange                               
        StoreI                                 
        PushD        $record-creation-temporary 
        LoadI                                  
        PushI        0                         
        Add                                    
        PushI        6                         
        StoreI                                 
        PushD        $record-creation-temporary 
        LoadI                                  
        PushI        4                         
        Add                                    
        PushI        16777217                  
        StoreI                                 
        PushD        $string-size-temp         
        LoadI                                  
        PushD        $record-creation-temporary 
        LoadI                                  
        PushI        12                        
        Add                                    
        Add                                    
        PushI        0                         
        StoreC                                 
        PushD        $string-size-temp         
        LoadI                                  
        PushD        $record-creation-temporary 
        LoadI                                  
        PushI        8                         
        Add                                    
        Exchange                               
        StoreI                                 
        PushD        $string-size-temp         
        LoadI                                  
        PushD        $record-creation-temporary 
        LoadI                                  
        PushI        12                        
        Add                                    
        PushD        $insert-location-temp     
        Exchange                               
        StoreI                                 
        PushD        $insert-size-temp         
        Exchange                               
        StoreI                                 
        Label        -$insert-27-loopflag      
        PushD        $insert-size-temp         
        LoadI                                  
        JumpFalse    -$insert-27-endflag       
        PushD        $insert-location-temp     
        LoadI                                  
        Exchange                               
        StoreC                                 
        PushI        -1                        
        PushD        $insert-size-temp         
        LoadI                                  
        Add                                    
        PushD        $insert-size-temp         
        Exchange                               
        StoreI                                 
        PushI        1                         
        PushD        $insert-location-temp     
        LoadI                                  
        Add                                    
        PushD        $insert-location-temp     
        Exchange                               
        StoreI                                 
        Jump         -$insert-27-loopflag      
        Label        -$insert-27-endflag       
        PushD        $record-creation-temporary 
        LoadI                                  
        PushI        50                        
        PushI        114                       
        PushI        117                       
        PushI        111                       
        PushI        102                       
        PushI        5                         
        PushD        $string-size-temp         
        Exchange                               
        StoreI                                 
        PushD        $string-size-temp         
        LoadI                                  
        PushI        13                        
        Add                                    
        Call         -mem-manager-allocate     
        PushD        $record-creation-temporary 
        Exchange                               
        StoreI                                 
        PushD        $record-creation-temporary 
        LoadI                                  
        PushI        0                         
        Add                                    
        PushI        6                         
        StoreI                                 
        PushD        $record-creation-temporary 
        LoadI                                  
        PushI        4                         
        Add                                    
        PushI        16777217                  
        StoreI                                 
        PushD        $string-size-temp         
        LoadI                                  
        PushD        $record-creation-temporary 
        LoadI                                  
        PushI        12                        
        Add                                    
        Add                                    
        PushI        0                         
        StoreC                                 
        PushD        $string-size-temp         
        LoadI                                  
        PushD        $record-creation-temporary 
        LoadI                                  
        PushI        8                         
        Add                                    
        Exchange                               
        StoreI                                 
        PushD        $string-size-temp         
        LoadI                                  
        PushD        $record-creation-temporary 
        LoadI                                  
        PushI        12                        
        Add                                    
        PushD        $insert-location-temp     
        Exchange                               
        StoreI                                 
        PushD        $insert-size-temp         
        Exchange                               
        StoreI                                 
        Label        -$insert-26-loopflag      
        PushD        $insert-size-temp         
        LoadI                                  
        JumpFalse    -$insert-26-endflag       
        PushD        $insert-location-temp     
        LoadI                                  
        Exchange                               
        StoreC                                 
        PushI        -1                        
        PushD        $insert-size-temp         
        LoadI                                  
        Add                                    
        PushD        $insert-size-temp         
        Exchange                               
        StoreI                                 
        PushI        1                         
        PushD        $insert-location-temp     
        LoadI                                  
        Add                                    
        PushD        $insert-location-temp     
        Exchange                               
        StoreI                                 
        Jump         -$insert-26-loopflag      
        Label        -$insert-26-endflag       
        PushD        $record-creation-temporary 
        LoadI                                  
        PushI        49                        
        PushI        114                       
        PushI        117                       
        PushI        111                       
        PushI        102                       
        PushI        5                         
        PushD        $string-size-temp         
        Exchange                               
        StoreI                                 
        PushD        $string-size-temp         
        LoadI                                  
        PushI        13                        
        Add                                    
        Call         -mem-manager-allocate     
        PushD        $record-creation-temporary 
        Exchange                               
        StoreI                                 
        PushD        $record-creation-temporary 
        LoadI                                  
        PushI        0                         
        Add                                    
        PushI        6                         
        StoreI                                 
        PushD        $record-creation-temporary 
        LoadI                                  
        PushI        4                         
        Add                                    
        PushI        16777217                  
        StoreI                                 
        PushD        $string-size-temp         
        LoadI                                  
        PushD        $record-creation-temporary 
        LoadI                                  
        PushI        12                        
        Add                                    
        Add                                    
        PushI        0                         
        StoreC                                 
        PushD        $string-size-temp         
        LoadI                                  
        PushD        $record-creation-temporary 
        LoadI                                  
        PushI        8                         
        Add                                    
        Exchange                               
        StoreI                                 
        PushD        $string-size-temp         
        LoadI                                  
        PushD        $record-creation-temporary 
        LoadI                                  
        PushI        12                        
        Add                                    
        PushD        $insert-location-temp     
        Exchange                               
        StoreI                                 
        PushD        $insert-size-temp         
        Exchange                               
        StoreI                                 
        Label        -$insert-25-loopflag      
        PushD        $insert-size-temp         
        LoadI                                  
        JumpFalse    -$insert-25-endflag       
        PushD        $insert-location-temp     
        LoadI                                  
        Exchange                               
        StoreC                                 
        PushI        -1                        
        PushD        $insert-size-temp         
        LoadI                                  
        Add                                    
        PushD        $insert-size-temp         
        Exchange                               
        StoreI                                 
        PushI        1                         
        PushD        $insert-location-temp     
        LoadI                                  
        Add                                    
        PushD        $insert-location-temp     
        Exchange                               
        StoreI                                 
        Jump         -$insert-25-loopflag      
        Label        -$insert-25-endflag       
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
        PushI        256                       
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
        PushD        $insert-location-temp     
        Exchange                               
        StoreI                                 
        PushD        $insert-size-temp         
        Exchange                               
        StoreI                                 
        Label        -$insert-29-loopflag      
        PushD        $insert-size-temp         
        LoadI                                  
        JumpFalse    -$insert-29-endflag       
        PushD        $insert-location-temp     
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
        PushD        $insert-location-temp     
        LoadI                                  
        Add                                    
        PushD        $insert-location-temp     
        Exchange                               
        StoreI                                 
        Jump         -$insert-29-loopflag      
        Label        -$insert-29-endflag       
        PushD        $record-creation-temporary 
        LoadI                                  
        PushD        $global-memory-block      
        PushI        12                        
        Add                                    %% a3
        LoadI                                  
        PushI        51                        
        PushI        116                       
        PushI        115                       
        PushI        114                       
        PushI        105                       
        PushI        102                       
        PushI        6                         
        PushD        $string-size-temp         
        Exchange                               
        StoreI                                 
        PushD        $string-size-temp         
        LoadI                                  
        PushI        13                        
        Add                                    
        Call         -mem-manager-allocate     
        PushD        $record-creation-temporary 
        Exchange                               
        StoreI                                 
        PushD        $record-creation-temporary 
        LoadI                                  
        PushI        0                         
        Add                                    
        PushI        6                         
        StoreI                                 
        PushD        $record-creation-temporary 
        LoadI                                  
        PushI        4                         
        Add                                    
        PushI        16777217                  
        StoreI                                 
        PushD        $string-size-temp         
        LoadI                                  
        PushD        $record-creation-temporary 
        LoadI                                  
        PushI        12                        
        Add                                    
        Add                                    
        PushI        0                         
        StoreC                                 
        PushD        $string-size-temp         
        LoadI                                  
        PushD        $record-creation-temporary 
        LoadI                                  
        PushI        8                         
        Add                                    
        Exchange                               
        StoreI                                 
        PushD        $string-size-temp         
        LoadI                                  
        PushD        $record-creation-temporary 
        LoadI                                  
        PushI        12                        
        Add                                    
        PushD        $insert-location-temp     
        Exchange                               
        StoreI                                 
        PushD        $insert-size-temp         
        Exchange                               
        StoreI                                 
        Label        -$insert-23-loopflag      
        PushD        $insert-size-temp         
        LoadI                                  
        JumpFalse    -$insert-23-endflag       
        PushD        $insert-location-temp     
        LoadI                                  
        Exchange                               
        StoreC                                 
        PushI        -1                        
        PushD        $insert-size-temp         
        LoadI                                  
        Add                                    
        PushD        $insert-size-temp         
        Exchange                               
        StoreI                                 
        PushI        1                         
        PushD        $insert-location-temp     
        LoadI                                  
        Add                                    
        PushD        $insert-location-temp     
        Exchange                               
        StoreI                                 
        Jump         -$insert-23-loopflag      
        Label        -$insert-23-endflag       
        PushD        $record-creation-temporary 
        LoadI                                  
        PushI        50                        
        PushI        116                       
        PushI        115                       
        PushI        114                       
        PushI        105                       
        PushI        102                       
        PushI        6                         
        PushD        $string-size-temp         
        Exchange                               
        StoreI                                 
        PushD        $string-size-temp         
        LoadI                                  
        PushI        13                        
        Add                                    
        Call         -mem-manager-allocate     
        PushD        $record-creation-temporary 
        Exchange                               
        StoreI                                 
        PushD        $record-creation-temporary 
        LoadI                                  
        PushI        0                         
        Add                                    
        PushI        6                         
        StoreI                                 
        PushD        $record-creation-temporary 
        LoadI                                  
        PushI        4                         
        Add                                    
        PushI        16777217                  
        StoreI                                 
        PushD        $string-size-temp         
        LoadI                                  
        PushD        $record-creation-temporary 
        LoadI                                  
        PushI        12                        
        Add                                    
        Add                                    
        PushI        0                         
        StoreC                                 
        PushD        $string-size-temp         
        LoadI                                  
        PushD        $record-creation-temporary 
        LoadI                                  
        PushI        8                         
        Add                                    
        Exchange                               
        StoreI                                 
        PushD        $string-size-temp         
        LoadI                                  
        PushD        $record-creation-temporary 
        LoadI                                  
        PushI        12                        
        Add                                    
        PushD        $insert-location-temp     
        Exchange                               
        StoreI                                 
        PushD        $insert-size-temp         
        Exchange                               
        StoreI                                 
        Label        -$insert-22-loopflag      
        PushD        $insert-size-temp         
        LoadI                                  
        JumpFalse    -$insert-22-endflag       
        PushD        $insert-location-temp     
        LoadI                                  
        Exchange                               
        StoreC                                 
        PushI        -1                        
        PushD        $insert-size-temp         
        LoadI                                  
        Add                                    
        PushD        $insert-size-temp         
        Exchange                               
        StoreI                                 
        PushI        1                         
        PushD        $insert-location-temp     
        LoadI                                  
        Add                                    
        PushD        $insert-location-temp     
        Exchange                               
        StoreI                                 
        Jump         -$insert-22-loopflag      
        Label        -$insert-22-endflag       
        PushD        $record-creation-temporary 
        LoadI                                  
        PushI        49                        
        PushI        116                       
        PushI        115                       
        PushI        114                       
        PushI        105                       
        PushI        102                       
        PushI        6                         
        PushD        $string-size-temp         
        Exchange                               
        StoreI                                 
        PushD        $string-size-temp         
        LoadI                                  
        PushI        13                        
        Add                                    
        Call         -mem-manager-allocate     
        PushD        $record-creation-temporary 
        Exchange                               
        StoreI                                 
        PushD        $record-creation-temporary 
        LoadI                                  
        PushI        0                         
        Add                                    
        PushI        6                         
        StoreI                                 
        PushD        $record-creation-temporary 
        LoadI                                  
        PushI        4                         
        Add                                    
        PushI        16777217                  
        StoreI                                 
        PushD        $string-size-temp         
        LoadI                                  
        PushD        $record-creation-temporary 
        LoadI                                  
        PushI        12                        
        Add                                    
        Add                                    
        PushI        0                         
        StoreC                                 
        PushD        $string-size-temp         
        LoadI                                  
        PushD        $record-creation-temporary 
        LoadI                                  
        PushI        8                         
        Add                                    
        Exchange                               
        StoreI                                 
        PushD        $string-size-temp         
        LoadI                                  
        PushD        $record-creation-temporary 
        LoadI                                  
        PushI        12                        
        Add                                    
        PushD        $insert-location-temp     
        Exchange                               
        StoreI                                 
        PushD        $insert-size-temp         
        Exchange                               
        StoreI                                 
        Label        -$insert-21-loopflag      
        PushD        $insert-size-temp         
        LoadI                                  
        JumpFalse    -$insert-21-endflag       
        PushD        $insert-location-temp     
        LoadI                                  
        Exchange                               
        StoreC                                 
        PushI        -1                        
        PushD        $insert-size-temp         
        LoadI                                  
        Add                                    
        PushD        $insert-size-temp         
        Exchange                               
        StoreI                                 
        PushI        1                         
        PushD        $insert-location-temp     
        LoadI                                  
        Add                                    
        PushD        $insert-location-temp     
        Exchange                               
        StoreI                                 
        Jump         -$insert-21-loopflag      
        Label        -$insert-21-endflag       
        PushD        $record-creation-temporary 
        LoadI                                  
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
        PushI        256                       
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
        PushD        $insert-location-temp     
        Exchange                               
        StoreI                                 
        PushD        $insert-size-temp         
        Exchange                               
        StoreI                                 
        Label        -$insert-24-loopflag      
        PushD        $insert-size-temp         
        LoadI                                  
        JumpFalse    -$insert-24-endflag       
        PushD        $insert-location-temp     
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
        PushD        $insert-location-temp     
        LoadI                                  
        Add                                    
        PushD        $insert-location-temp     
        Exchange                               
        StoreI                                 
        Jump         -$insert-24-loopflag      
        Label        -$insert-24-endflag       
        PushD        $record-creation-temporary 
        LoadI                                  
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
        PushI        256                       
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
        PushD        $insert-location-temp     
        Exchange                               
        StoreI                                 
        PushD        $insert-size-temp         
        Exchange                               
        StoreI                                 
        Label        -$insert-30-loopflag      
        PushD        $insert-size-temp         
        LoadI                                  
        JumpFalse    -$insert-30-endflag       
        PushD        $insert-location-temp     
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
        PushD        $insert-location-temp     
        LoadI                                  
        Add                                    
        PushD        $insert-location-temp     
        Exchange                               
        StoreI                                 
        Jump         -$insert-30-loopflag      
        Label        -$insert-30-endflag       
        PushD        $record-creation-temporary 
        LoadI                                  
        PushD        $global-memory-block      
        PushI        16                        
        Add                                    %% a4
        PushD        store-addr-temp           
        Exchange                               
        StoreI                                 
        PushD        store-addr-temp           
        LoadI                                  
        Exchange                               
        StoreI                                 
        PushF        22.400000                 
        PushF        46.500000                 
        PushI        2                         
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
        PushI        2                         
        PushD        $record-creation-temporary 
        LoadI                                  
        PushI        16                        
        Add                                    
        PushD        $insert-location-temp     
        Exchange                               
        StoreI                                 
        PushD        $insert-size-temp         
        Exchange                               
        StoreI                                 
        Label        -$insert-33-loopflag      
        PushD        $insert-size-temp         
        LoadI                                  
        JumpFalse    -$insert-33-endflag       
        PushD        $insert-location-temp     
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
        PushD        $insert-location-temp     
        LoadI                                  
        Add                                    
        PushD        $insert-location-temp     
        Exchange                               
        StoreI                                 
        Jump         -$insert-33-loopflag      
        Label        -$insert-33-endflag       
        PushD        $record-creation-temporary 
        LoadI                                  
        PushF        45.600000                 
        PushF        11.300000                 
        PushF        34.500000                 
        PushI        3                         
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
        PushI        3                         
        PushD        $record-creation-temporary 
        LoadI                                  
        PushI        16                        
        Add                                    
        PushD        $insert-location-temp     
        Exchange                               
        StoreI                                 
        PushD        $insert-size-temp         
        Exchange                               
        StoreI                                 
        Label        -$insert-32-loopflag      
        PushD        $insert-size-temp         
        LoadI                                  
        JumpFalse    -$insert-32-endflag       
        PushD        $insert-location-temp     
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
        PushD        $insert-location-temp     
        LoadI                                  
        Add                                    
        PushD        $insert-location-temp     
        Exchange                               
        StoreI                                 
        Jump         -$insert-32-loopflag      
        Label        -$insert-32-endflag       
        PushD        $record-creation-temporary 
        LoadI                                  
        PushF        8.900000                  
        PushF        3.500000                  
        PushF        1.200000                  
        PushI        3                         
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
        PushI        3                         
        PushD        $record-creation-temporary 
        LoadI                                  
        PushI        16                        
        Add                                    
        PushD        $insert-location-temp     
        Exchange                               
        StoreI                                 
        PushD        $insert-size-temp         
        Exchange                               
        StoreI                                 
        Label        -$insert-31-loopflag      
        PushD        $insert-size-temp         
        LoadI                                  
        JumpFalse    -$insert-31-endflag       
        PushD        $insert-location-temp     
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
        PushD        $insert-location-temp     
        LoadI                                  
        Add                                    
        PushD        $insert-location-temp     
        Exchange                               
        StoreI                                 
        Jump         -$insert-31-loopflag      
        Label        -$insert-31-endflag       
        PushD        $record-creation-temporary 
        LoadI                                  
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
        PushI        256                       
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
        PushD        $insert-location-temp     
        Exchange                               
        StoreI                                 
        PushD        $insert-size-temp         
        Exchange                               
        StoreI                                 
        Label        -$insert-34-loopflag      
        PushD        $insert-size-temp         
        LoadI                                  
        JumpFalse    -$insert-34-endflag       
        PushD        $insert-location-temp     
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
        PushD        $insert-location-temp     
        LoadI                                  
        Add                                    
        PushD        $insert-location-temp     
        Exchange                               
        StoreI                                 
        Jump         -$insert-34-loopflag      
        Label        -$insert-34-endflag       
        PushD        $record-creation-temporary 
        LoadI                                  
        PushD        $global-memory-block      
        PushI        20                        
        Add                                    %% a5
        PushD        store-addr-temp           
        Exchange                               
        StoreI                                 
        PushD        store-addr-temp           
        LoadI                                  
        Exchange                               
        StoreI                                 
        PushI        116                       
        PushI        97                        
        PushI        98                        
        PushI        3                         
        Duplicate                              
        JumpNeg      $$array-size-is-negative  
        Duplicate                              
        PushI        1                         
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
        PushI        1                         
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
        PushD        $insert-location-temp     
        Exchange                               
        StoreI                                 
        PushD        $insert-size-temp         
        Exchange                               
        StoreI                                 
        Label        -$insert-36-loopflag      
        PushD        $insert-size-temp         
        LoadI                                  
        JumpFalse    -$insert-36-endflag       
        PushD        $insert-location-temp     
        LoadI                                  
        Exchange                               
        StoreC                                 
        PushI        -1                        
        PushD        $insert-size-temp         
        LoadI                                  
        Add                                    
        PushD        $insert-size-temp         
        Exchange                               
        StoreI                                 
        PushI        1                         
        PushD        $insert-location-temp     
        LoadI                                  
        Add                                    
        PushD        $insert-location-temp     
        Exchange                               
        StoreI                                 
        Jump         -$insert-36-loopflag      
        Label        -$insert-36-endflag       
        PushD        $record-creation-temporary 
        LoadI                                  
        PushI        98                        
        PushI        97                        
        PushI        114                       
        PushI        3                         
        Duplicate                              
        JumpNeg      $$array-size-is-negative  
        Duplicate                              
        PushI        1                         
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
        PushI        1                         
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
        PushD        $insert-location-temp     
        Exchange                               
        StoreI                                 
        PushD        $insert-size-temp         
        Exchange                               
        StoreI                                 
        Label        -$insert-35-loopflag      
        PushD        $insert-size-temp         
        LoadI                                  
        JumpFalse    -$insert-35-endflag       
        PushD        $insert-location-temp     
        LoadI                                  
        Exchange                               
        StoreC                                 
        PushI        -1                        
        PushD        $insert-size-temp         
        LoadI                                  
        Add                                    
        PushD        $insert-size-temp         
        Exchange                               
        StoreI                                 
        PushI        1                         
        PushD        $insert-location-temp     
        LoadI                                  
        Add                                    
        PushD        $insert-location-temp     
        Exchange                               
        StoreI                                 
        Jump         -$insert-35-loopflag      
        Label        -$insert-35-endflag       
        PushD        $record-creation-temporary 
        LoadI                                  
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
        PushI        256                       
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
        PushD        $insert-location-temp     
        Exchange                               
        StoreI                                 
        PushD        $insert-size-temp         
        Exchange                               
        StoreI                                 
        Label        -$insert-37-loopflag      
        PushD        $insert-size-temp         
        LoadI                                  
        JumpFalse    -$insert-37-endflag       
        PushD        $insert-location-temp     
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
        PushD        $insert-location-temp     
        LoadI                                  
        Add                                    
        PushD        $insert-location-temp     
        Exchange                               
        StoreI                                 
        Jump         -$insert-37-loopflag      
        Label        -$insert-37-endflag       
        PushD        $record-creation-temporary 
        LoadI                                  
        PushD        $global-memory-block      
        PushI        24                        
        Add                                    %% a6
        PushD        store-addr-temp           
        Exchange                               
        StoreI                                 
        PushD        store-addr-temp           
        LoadI                                  
        Exchange                               
        StoreI                                 
        PushPC                                 
        Jump         -function-definition-38-ends 
        Label        -function-definition-38-starts 
        PushD        $stack-pointer            
        LoadI                                  
        Duplicate                              
        PushI        -4                        
        Add                                    
        PushD        $frame-pointer            
        LoadI                                  
        StoreI                                 
        PushI        -8                        
        Add                                    
        Exchange                               
        StoreI                                 
        PushD        $stack-pointer            
        LoadI                                  
        PushD        $frame-pointer            
        Exchange                               
        StoreI                                 
        PushI        -8                        
        PushD        $stack-pointer            
        LoadI                                  
        Add                                    
        PushD        $stack-pointer            
        Exchange                               
        StoreI                                 
        PushD        $frame-pointer            
        LoadI                                  
        PushI        4                         
        Add                                    %% a
        LoadI                                  
        PushD        $frame-pointer            
        LoadI                                  
        PushI        0                         
        Add                                    %% b
        LoadI                                  
        Add                                    
        Jump         -function-exit-1-handshake 
        Jump         $$function-no-return      
        Label        -function-exit-1-handshake 
        PushD        $stack-pop-temp           
        LoadI                                  
        PushD        $stack-pointer            
        LoadI                                  
        Add                                    
        PushD        $stack-pointer            
        Exchange                               
        StoreI                                 
        PushD        $frame-pointer            
        LoadI                                  
        PushI        -8                        
        Add                                    
        LoadI                                  
        PushD        $return-for-runtime-func  
        Exchange                               
        StoreI                                 
        PushD        $frame-pointer            
        LoadI                                  
        PushI        -4                        
        Add                                    
        LoadI                                  
        PushD        $frame-pointer            
        Exchange                               
        StoreI                                 
        PushI        16                        
        PushD        $stack-pointer            
        LoadI                                  
        Add                                    
        PushD        $stack-pointer            
        Exchange                               
        StoreI                                 
        PushI        -4                        
        PushD        $stack-pointer            
        LoadI                                  
        Add                                    
        PushD        $stack-pointer            
        Exchange                               
        StoreI                                 
        PushD        $stack-pointer            
        LoadI                                  
        Exchange                               
        StoreI                                 
        PushD        $stack-pointer            
        LoadI                                  
        LoadI                                  
        PushI        4                         
        PushD        $stack-pointer            
        LoadI                                  
        Add                                    
        PushD        $stack-pointer            
        Exchange                               
        StoreI                                 
        PushD        $stack-pop-temp           
        Exchange                               
        StoreI                                 
        PushD        $return-for-runtime-func  
        LoadI                                  
        Return                                 
        Label        -function-definition-38-ends 
        PushI        1                         
        Add                                    
        PushD        $global-memory-block      
        PushI        28                        
        Add                                    %% add
        PushD        store-addr-temp           
        Exchange                               
        StoreI                                 
        PushD        store-addr-temp           
        LoadI                                  
        Exchange                               
        StoreI                                 
        PushPC                                 
        Jump         -function-definition-39-ends 
        Label        -function-definition-39-starts 
        PushD        $stack-pointer            
        LoadI                                  
        Duplicate                              
        PushI        -4                        
        Add                                    
        PushD        $frame-pointer            
        LoadI                                  
        StoreI                                 
        PushI        -8                        
        Add                                    
        Exchange                               
        StoreI                                 
        PushD        $stack-pointer            
        LoadI                                  
        PushD        $frame-pointer            
        Exchange                               
        StoreI                                 
        PushI        -8                        
        PushD        $stack-pointer            
        LoadI                                  
        Add                                    
        PushD        $stack-pointer            
        Exchange                               
        StoreI                                 
        PushD        $frame-pointer            
        LoadI                                  
        PushI        4                         
        Add                                    %% a
        LoadI                                  
        PushD        $frame-pointer            
        LoadI                                  
        PushI        0                         
        Add                                    %% b
        LoadI                                  
        Subtract                               
        Jump         -function-exit-2-handshake 
        Jump         $$function-no-return      
        Label        -function-exit-2-handshake 
        PushD        $stack-pop-temp           
        LoadI                                  
        PushD        $stack-pointer            
        LoadI                                  
        Add                                    
        PushD        $stack-pointer            
        Exchange                               
        StoreI                                 
        PushD        $frame-pointer            
        LoadI                                  
        PushI        -8                        
        Add                                    
        LoadI                                  
        PushD        $return-for-runtime-func  
        Exchange                               
        StoreI                                 
        PushD        $frame-pointer            
        LoadI                                  
        PushI        -4                        
        Add                                    
        LoadI                                  
        PushD        $frame-pointer            
        Exchange                               
        StoreI                                 
        PushI        16                        
        PushD        $stack-pointer            
        LoadI                                  
        Add                                    
        PushD        $stack-pointer            
        Exchange                               
        StoreI                                 
        PushI        -4                        
        PushD        $stack-pointer            
        LoadI                                  
        Add                                    
        PushD        $stack-pointer            
        Exchange                               
        StoreI                                 
        PushD        $stack-pointer            
        LoadI                                  
        Exchange                               
        StoreI                                 
        PushD        $stack-pointer            
        LoadI                                  
        LoadI                                  
        PushI        4                         
        PushD        $stack-pointer            
        LoadI                                  
        Add                                    
        PushD        $stack-pointer            
        Exchange                               
        StoreI                                 
        PushD        $stack-pop-temp           
        Exchange                               
        StoreI                                 
        PushD        $return-for-runtime-func  
        LoadI                                  
        Return                                 
        Label        -function-definition-39-ends 
        PushI        1                         
        Add                                    
        PushD        $global-memory-block      
        PushI        32                        
        Add                                    %% minus
        PushD        store-addr-temp           
        Exchange                               
        StoreI                                 
        PushD        store-addr-temp           
        LoadI                                  
        Exchange                               
        StoreI                                 
        PushD        $global-memory-block      
        PushI        32                        
        Add                                    %% minus
        LoadI                                  
        PushD        $global-memory-block      
        PushI        28                        
        Add                                    %% add
        LoadI                                  
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
        PushD        $insert-location-temp     
        Exchange                               
        StoreI                                 
        PushD        $insert-size-temp         
        Exchange                               
        StoreI                                 
        Label        -$insert-40-loopflag      
        PushD        $insert-size-temp         
        LoadI                                  
        JumpFalse    -$insert-40-endflag       
        PushD        $insert-location-temp     
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
        PushD        $insert-location-temp     
        LoadI                                  
        Add                                    
        PushD        $insert-location-temp     
        Exchange                               
        StoreI                                 
        Jump         -$insert-40-loopflag      
        Label        -$insert-40-endflag       
        PushD        $record-creation-temporary 
        LoadI                                  
        PushD        $global-memory-block      
        PushI        36                        
        Add                                    %% a7
        PushD        store-addr-temp           
        Exchange                               
        StoreI                                 
        PushD        store-addr-temp           
        LoadI                                  
        Exchange                               
        StoreI                                 
        PushI        120                       
        PushD        $global-memory-block      
        PushI        40                        
        Add                                    %% i
        PushD        store-addr-temp           
        Exchange                               
        StoreI                                 
        PushD        store-addr-temp           
        LoadI                                  
        Exchange                               
        StoreI                                 
        PushD        $global-memory-block      
        PushI        44                        
        Add                                    %% i
        PushD        $global-memory-block      
        PushI        0                         
        Add                                    %% s
        LoadI                                  
        PushD        $copy-location-temp       
        Exchange                               
        StoreI                                 
        PushD        store-addr-temp           
        Exchange                               
        StoreI                                 
        PushD        $copy-location-temp       
        LoadI                                  
        PushI        8                         
        Add                                    
        LoadI                                  
        PushD        $copy-size-temp           
        Exchange                               
        StoreI                                 
        PushI        12                        
        PushD        $copy-location-temp       
        LoadI                                  
        Add                                    
        PushD        $copy-location-temp       
        Exchange                               
        StoreI                                 
        Label        -for-43-continue          
        PushD        $copy-size-temp           
        LoadI                                  
        JumpFalse    -for-43-ends              
        PushI        -1                        
        PushD        $copy-size-temp           
        LoadI                                  
        Add                                    
        PushD        $copy-size-temp           
        Exchange                               
        StoreI                                 
        PushD        $copy-location-temp       
        LoadI                                  
        LoadC                                  
        PushI        1                         
        PushD        $copy-location-temp       
        LoadI                                  
        Add                                    
        PushD        $copy-location-temp       
        Exchange                               
        StoreI                                 
        PushD        store-addr-temp           
        LoadI                                  
        Exchange                               
        StoreC                                 
        PushI        12                        
        PushD        $stack-pop-temp           
        LoadI                                  
        Add                                    
        PushD        $stack-pop-temp           
        Exchange                               
        StoreI                                 
        PushD        $copy-location-temp       
        LoadI                                  
        PushI        -4                        
        PushD        $stack-pointer            
        LoadI                                  
        Add                                    
        PushD        $stack-pointer            
        Exchange                               
        StoreI                                 
        PushD        $stack-pointer            
        LoadI                                  
        Exchange                               
        StoreI                                 
        PushD        $copy-size-temp           
        LoadI                                  
        PushI        -4                        
        PushD        $stack-pointer            
        LoadI                                  
        Add                                    
        PushD        $stack-pointer            
        Exchange                               
        StoreI                                 
        PushD        $stack-pointer            
        LoadI                                  
        Exchange                               
        StoreI                                 
        PushD        store-addr-temp           
        LoadI                                  
        PushI        -4                        
        PushD        $stack-pointer            
        LoadI                                  
        Add                                    
        PushD        $stack-pointer            
        Exchange                               
        StoreI                                 
        PushD        $stack-pointer            
        LoadI                                  
        Exchange                               
        StoreI                                 
        PushPC                                 
        Jump         -function-definition-41-ends 
        Label        -function-definition-41-starts 
        PushD        $stack-pointer            
        LoadI                                  
        Duplicate                              
        PushI        -4                        
        Add                                    
        PushD        $frame-pointer            
        LoadI                                  
        StoreI                                 
        PushI        -8                        
        Add                                    
        Exchange                               
        StoreI                                 
        PushD        $stack-pointer            
        LoadI                                  
        PushD        $frame-pointer            
        Exchange                               
        StoreI                                 
        PushI        -8                        
        PushD        $stack-pointer            
        LoadI                                  
        Add                                    
        PushD        $stack-pointer            
        Exchange                               
        StoreI                                 
        PushI        1                         
        Jump         -function-exit-3-handshake 
        Jump         $$function-no-return      
        Label        -function-exit-3-handshake 
        PushD        $stack-pop-temp           
        LoadI                                  
        PushD        $stack-pointer            
        LoadI                                  
        Add                                    
        PushD        $stack-pointer            
        Exchange                               
        StoreI                                 
        PushD        $frame-pointer            
        LoadI                                  
        PushI        -8                        
        Add                                    
        LoadI                                  
        PushD        $return-for-runtime-func  
        Exchange                               
        StoreI                                 
        PushD        $frame-pointer            
        LoadI                                  
        PushI        -4                        
        Add                                    
        LoadI                                  
        PushD        $frame-pointer            
        Exchange                               
        StoreI                                 
        PushI        16                        
        PushD        $stack-pointer            
        LoadI                                  
        Add                                    
        PushD        $stack-pointer            
        Exchange                               
        StoreI                                 
        PushI        -4                        
        PushD        $stack-pointer            
        LoadI                                  
        Add                                    
        PushD        $stack-pointer            
        Exchange                               
        StoreI                                 
        PushD        $stack-pointer            
        LoadI                                  
        Exchange                               
        StoreI                                 
        PushD        $stack-pointer            
        LoadI                                  
        LoadI                                  
        PushI        4                         
        PushD        $stack-pointer            
        LoadI                                  
        Add                                    
        PushD        $stack-pointer            
        Exchange                               
        StoreI                                 
        PushD        $stack-pop-temp           
        Exchange                               
        StoreI                                 
        PushD        $return-for-runtime-func  
        LoadI                                  
        Return                                 
        Label        -function-definition-41-ends 
        PushI        1                         
        Add                                    
        PushD        $global-memory-block      
        PushI        45                        
        Add                                    %% i
        PushD        store-addr-temp           
        Exchange                               
        StoreI                                 
        PushD        store-addr-temp           
        LoadI                                  
        Exchange                               
        StoreI                                 
        PushD        $global-memory-block      
        PushI        45                        
        Add                                    %% i
        LoadI                                  
        PushI        5                         
        PushI        4                         
        PushD        $stack-pop-temp           
        LoadI                                  
        PushI        -4                        
        PushD        $stack-pointer            
        LoadI                                  
        Add                                    
        PushD        $stack-pointer            
        Exchange                               
        StoreI                                 
        PushD        $stack-pointer            
        LoadI                                  
        Exchange                               
        StoreI                                 
        PushI        0                         
        PushD        $stack-pop-temp           
        Exchange                               
        StoreI                                 
        PushI        -4                        
        PushD        $stack-pointer            
        LoadI                                  
        Add                                    
        PushD        $stack-pointer            
        Exchange                               
        StoreI                                 
        PushD        $stack-pointer            
        LoadI                                  
        Exchange                               
        StoreI                                 
        PushI        -4                        
        PushD        $stack-pointer            
        LoadI                                  
        Add                                    
        PushD        $stack-pointer            
        Exchange                               
        StoreI                                 
        PushD        $stack-pointer            
        LoadI                                  
        Exchange                               
        StoreI                                 
        CallV                                  
        PushD        $stack-pointer            
        LoadI                                  
        LoadI                                  
        PushI        4                         
        PushD        $stack-pointer            
        LoadI                                  
        Add                                    
        PushD        $stack-pointer            
        Exchange                               
        StoreI                                 
        PushD        $print-format-integer     
        Printf                                 
        PushD        $print-format-space       
        Printf                                 
        PushI        116                       
        PushI        105                       
        PushI        98                        
        PushI        98                        
        PushI        97                        
        PushI        82                        
        PushI        103                       
        PushI        105                       
        PushI        66                        
        PushI        9                         
        PushD        $string-size-temp         
        Exchange                               
        StoreI                                 
        PushD        $string-size-temp         
        LoadI                                  
        PushI        13                        
        Add                                    
        Call         -mem-manager-allocate     
        PushD        $record-creation-temporary 
        Exchange                               
        StoreI                                 
        PushD        $record-creation-temporary 
        LoadI                                  
        PushI        0                         
        Add                                    
        PushI        6                         
        StoreI                                 
        PushD        $record-creation-temporary 
        LoadI                                  
        PushI        4                         
        Add                                    
        PushI        16777217                  
        StoreI                                 
        PushD        $string-size-temp         
        LoadI                                  
        PushD        $record-creation-temporary 
        LoadI                                  
        PushI        12                        
        Add                                    
        Add                                    
        PushI        0                         
        StoreC                                 
        PushD        $string-size-temp         
        LoadI                                  
        PushD        $record-creation-temporary 
        LoadI                                  
        PushI        8                         
        Add                                    
        Exchange                               
        StoreI                                 
        PushD        $string-size-temp         
        LoadI                                  
        PushD        $record-creation-temporary 
        LoadI                                  
        PushI        12                        
        Add                                    
        PushD        $insert-location-temp     
        Exchange                               
        StoreI                                 
        PushD        $insert-size-temp         
        Exchange                               
        StoreI                                 
        Label        -$insert-42-loopflag      
        PushD        $insert-size-temp         
        LoadI                                  
        JumpFalse    -$insert-42-endflag       
        PushD        $insert-location-temp     
        LoadI                                  
        Exchange                               
        StoreC                                 
        PushI        -1                        
        PushD        $insert-size-temp         
        LoadI                                  
        Add                                    
        PushD        $insert-size-temp         
        Exchange                               
        StoreI                                 
        PushI        1                         
        PushD        $insert-location-temp     
        LoadI                                  
        Add                                    
        PushD        $insert-location-temp     
        Exchange                               
        StoreI                                 
        Jump         -$insert-42-loopflag      
        Label        -$insert-42-endflag       
        PushD        $record-creation-temporary 
        LoadI                                  
        PushD        $global-memory-block      
        PushI        0                         
        Add                                    %% s
        PushD        store-addr-temp           
        Exchange                               
        StoreI                                 
        PushD        store-addr-temp           
        LoadI                                  
        Exchange                               
        StoreI                                 
        PushD        $global-memory-block      
        PushI        44                        
        Add                                    %% i
        LoadC                                  
        PushD        $print-format-character   
        Printf                                 
        PushD        $stack-pointer            
        LoadI                                  
        LoadI                                  
        PushI        4                         
        PushD        $stack-pointer            
        LoadI                                  
        Add                                    
        PushD        $stack-pointer            
        Exchange                               
        StoreI                                 
        PushD        store-addr-temp           
        Exchange                               
        StoreI                                 
        PushD        $stack-pointer            
        LoadI                                  
        LoadI                                  
        PushI        4                         
        PushD        $stack-pointer            
        LoadI                                  
        Add                                    
        PushD        $stack-pointer            
        Exchange                               
        StoreI                                 
        PushD        $copy-size-temp           
        Exchange                               
        StoreI                                 
        PushD        $stack-pointer            
        LoadI                                  
        LoadI                                  
        PushI        4                         
        PushD        $stack-pointer            
        LoadI                                  
        Add                                    
        PushD        $stack-pointer            
        Exchange                               
        StoreI                                 
        PushD        $copy-location-temp       
        Exchange                               
        StoreI                                 
        Jump         -for-43-continue          
        Label        -for-43-starts            
        PushI        12                        
        PushD        $stack-pointer            
        LoadI                                  
        Add                                    
        PushD        $stack-pointer            
        Exchange                               
        StoreI                                 
        Label        -for-43-ends              
        PushI        -12                       
        PushD        $stack-pop-temp           
        LoadI                                  
        Add                                    
        PushD        $stack-pop-temp           
        Exchange                               
        StoreI                                 
        PushD        $print-format-space       
        Printf                                 
        PushD        $global-memory-block      
        PushI        40                        
        Add                                    %% i
        LoadI                                  
        PushD        $print-format-integer     
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        PushD        $global-memory-block      
        PushI        44                        
        Add                                    %% i
        PushD        $global-memory-block      
        PushI        4                         
        Add                                    %% a1
        LoadI                                  
        PushD        $copy-location-temp       
        Exchange                               
        StoreI                                 
        PushD        store-addr-temp           
        Exchange                               
        StoreI                                 
        PushD        $copy-location-temp       
        LoadI                                  
        PushI        12                        
        Add                                    
        LoadI                                  
        PushD        $copy-size-temp           
        Exchange                               
        StoreI                                 
        PushI        16                        
        PushD        $copy-location-temp       
        LoadI                                  
        Add                                    
        PushD        $copy-location-temp       
        Exchange                               
        StoreI                                 
        Label        -for-49-continue          
        PushD        $copy-size-temp           
        LoadI                                  
        JumpFalse    -for-49-ends              
        PushI        -1                        
        PushD        $copy-size-temp           
        LoadI                                  
        Add                                    
        PushD        $copy-size-temp           
        Exchange                               
        StoreI                                 
        PushD        $copy-location-temp       
        LoadI                                  
        LoadI                                  
        PushI        4                         
        PushD        $copy-location-temp       
        LoadI                                  
        Add                                    
        PushD        $copy-location-temp       
        Exchange                               
        StoreI                                 
        PushD        store-addr-temp           
        LoadI                                  
        Exchange                               
        StoreI                                 
        PushI        12                        
        PushD        $stack-pop-temp           
        LoadI                                  
        Add                                    
        PushD        $stack-pop-temp           
        Exchange                               
        StoreI                                 
        PushD        $copy-location-temp       
        LoadI                                  
        PushI        -4                        
        PushD        $stack-pointer            
        LoadI                                  
        Add                                    
        PushD        $stack-pointer            
        Exchange                               
        StoreI                                 
        PushD        $stack-pointer            
        LoadI                                  
        Exchange                               
        StoreI                                 
        PushD        $copy-size-temp           
        LoadI                                  
        PushI        -4                        
        PushD        $stack-pointer            
        LoadI                                  
        Add                                    
        PushD        $stack-pointer            
        Exchange                               
        StoreI                                 
        PushD        $stack-pointer            
        LoadI                                  
        Exchange                               
        StoreI                                 
        PushD        store-addr-temp           
        LoadI                                  
        PushI        -4                        
        PushD        $stack-pointer            
        LoadI                                  
        Add                                    
        PushD        $stack-pointer            
        Exchange                               
        StoreI                                 
        PushD        $stack-pointer            
        LoadI                                  
        Exchange                               
        StoreI                                 
        PushD        $global-memory-block      
        PushI        44                        
        Add                                    %% i
        LoadI                                  
        Duplicate                              
        JumpFalse    $$array-is-null           
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
        Label        -recursive-print-array-44-startflag 
        Duplicate                              
        JumpFalse    -recursive-print-array-44-endflag 
        Label        -recursive-print-array-44-loopflag 
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
        JumpFalse    -recursive-print-array-44-endflag 
        PushD        $array-print-middle       
        Printf                                 
        Jump         -recursive-print-array-44-loopflag 
        Label        -recursive-print-array-44-endflag 
        Pop                                    
        Pop                                    
        PushD        $array-print-end          
        Printf                                 
        PushD        $print-format-space       
        Printf                                 
        PushD        $global-memory-block      
        PushI        48                        
        Add                                    %% j
        PushD        $global-memory-block      
        PushI        44                        
        Add                                    %% i
        LoadI                                  
        PushD        $copy-location-temp       
        Exchange                               
        StoreI                                 
        PushD        store-addr-temp           
        Exchange                               
        StoreI                                 
        PushD        $copy-location-temp       
        LoadI                                  
        PushI        12                        
        Add                                    
        LoadI                                  
        PushD        $copy-size-temp           
        Exchange                               
        StoreI                                 
        PushI        16                        
        PushD        $copy-location-temp       
        LoadI                                  
        Add                                    
        PushD        $copy-location-temp       
        Exchange                               
        StoreI                                 
        Label        -loop-continue-46-condition 
        PushD        $copy-size-temp           
        LoadI                                  
        JumpFalse    -for-48-ends              
        PushI        -1                        
        PushD        $copy-size-temp           
        LoadI                                  
        Add                                    
        PushD        $copy-size-temp           
        Exchange                               
        StoreI                                 
        PushD        $copy-location-temp       
        LoadI                                  
        LoadI                                  
        PushI        4                         
        PushD        $copy-location-temp       
        LoadI                                  
        Add                                    
        PushD        $copy-location-temp       
        Exchange                               
        StoreI                                 
        PushD        store-addr-temp           
        LoadI                                  
        Exchange                               
        StoreI                                 
        PushI        12                        
        PushD        $stack-pop-temp           
        LoadI                                  
        Add                                    
        PushD        $stack-pop-temp           
        Exchange                               
        StoreI                                 
        PushD        $copy-location-temp       
        LoadI                                  
        PushI        -4                        
        PushD        $stack-pointer            
        LoadI                                  
        Add                                    
        PushD        $stack-pointer            
        Exchange                               
        StoreI                                 
        PushD        $stack-pointer            
        LoadI                                  
        Exchange                               
        StoreI                                 
        PushD        $copy-size-temp           
        LoadI                                  
        PushI        -4                        
        PushD        $stack-pointer            
        LoadI                                  
        Add                                    
        PushD        $stack-pointer            
        Exchange                               
        StoreI                                 
        PushD        $stack-pointer            
        LoadI                                  
        Exchange                               
        StoreI                                 
        PushD        store-addr-temp           
        LoadI                                  
        PushI        -4                        
        PushD        $stack-pointer            
        LoadI                                  
        Add                                    
        PushD        $stack-pointer            
        Exchange                               
        StoreI                                 
        PushD        $stack-pointer            
        LoadI                                  
        Exchange                               
        StoreI                                 
        Label        -if-47-condition          
        PushD        $global-memory-block      
        PushI        48                        
        Add                                    %% j
        LoadI                                  
        PushI        1                         
        Label        -compare-45-sub           
        Subtract                               
        JumpFalse    -compare-45-true          
        Jump         -compare-45-false         
        Label        -compare-45-true          
        PushI        1                         
        Jump         -compare-45-join          
        Label        -compare-45-false         
        PushI        0                         
        Jump         -compare-45-join          
        Label        -compare-45-join          
        JumpFalse    -if-47-false              
        Label        -if-47-true               
        Jump         -loop-continue-46-condition 
        Jump         -if-47-join               
        Label        -if-47-false              
        Jump         -if-47-join               
        Label        -if-47-join               
        PushD        $global-memory-block      
        PushI        48                        
        Add                                    %% j
        LoadI                                  
        PushD        $print-format-integer     
        Printf                                 
        PushD        $print-format-space       
        Printf                                 
        PushD        $stack-pointer            
        LoadI                                  
        LoadI                                  
        PushI        4                         
        PushD        $stack-pointer            
        LoadI                                  
        Add                                    
        PushD        $stack-pointer            
        Exchange                               
        StoreI                                 
        PushD        store-addr-temp           
        Exchange                               
        StoreI                                 
        PushD        $stack-pointer            
        LoadI                                  
        LoadI                                  
        PushI        4                         
        PushD        $stack-pointer            
        LoadI                                  
        Add                                    
        PushD        $stack-pointer            
        Exchange                               
        StoreI                                 
        PushD        $copy-size-temp           
        Exchange                               
        StoreI                                 
        PushD        $stack-pointer            
        LoadI                                  
        LoadI                                  
        PushI        4                         
        PushD        $stack-pointer            
        LoadI                                  
        Add                                    
        PushD        $stack-pointer            
        Exchange                               
        StoreI                                 
        PushD        $copy-location-temp       
        Exchange                               
        StoreI                                 
        Jump         -loop-continue-46-condition 
        Label        -for-48-starts            
        PushI        12                        
        PushD        $stack-pointer            
        LoadI                                  
        Add                                    
        PushD        $stack-pointer            
        Exchange                               
        StoreI                                 
        Label        -for-48-ends              
        PushI        -12                       
        PushD        $stack-pop-temp           
        LoadI                                  
        Add                                    
        PushD        $stack-pop-temp           
        Exchange                               
        StoreI                                 
        PushD        $stack-pointer            
        LoadI                                  
        LoadI                                  
        PushI        4                         
        PushD        $stack-pointer            
        LoadI                                  
        Add                                    
        PushD        $stack-pointer            
        Exchange                               
        StoreI                                 
        PushD        store-addr-temp           
        Exchange                               
        StoreI                                 
        PushD        $stack-pointer            
        LoadI                                  
        LoadI                                  
        PushI        4                         
        PushD        $stack-pointer            
        LoadI                                  
        Add                                    
        PushD        $stack-pointer            
        Exchange                               
        StoreI                                 
        PushD        $copy-size-temp           
        Exchange                               
        StoreI                                 
        PushD        $stack-pointer            
        LoadI                                  
        LoadI                                  
        PushI        4                         
        PushD        $stack-pointer            
        LoadI                                  
        Add                                    
        PushD        $stack-pointer            
        Exchange                               
        StoreI                                 
        PushD        $copy-location-temp       
        Exchange                               
        StoreI                                 
        Jump         -for-49-continue          
        Label        -for-49-starts            
        PushI        12                        
        PushD        $stack-pointer            
        LoadI                                  
        Add                                    
        PushD        $stack-pointer            
        Exchange                               
        StoreI                                 
        Label        -for-49-ends              
        PushI        -12                       
        PushD        $stack-pop-temp           
        LoadI                                  
        Add                                    
        PushD        $stack-pop-temp           
        Exchange                               
        StoreI                                 
        PushD        $print-format-newline     
        Printf                                 
        PushD        $global-memory-block      
        PushI        44                        
        Add                                    %% i
        PushD        $global-memory-block      
        PushI        8                         
        Add                                    %% a2
        LoadI                                  
        PushD        $copy-location-temp       
        Exchange                               
        StoreI                                 
        PushD        store-addr-temp           
        Exchange                               
        StoreI                                 
        PushD        $copy-location-temp       
        LoadI                                  
        PushI        12                        
        Add                                    
        LoadI                                  
        PushD        $copy-size-temp           
        Exchange                               
        StoreI                                 
        PushI        16                        
        PushD        $copy-location-temp       
        LoadI                                  
        Add                                    
        PushD        $copy-location-temp       
        Exchange                               
        StoreI                                 
        Label        -for-52-continue          
        PushD        $copy-size-temp           
        LoadI                                  
        JumpFalse    -for-52-ends              
        PushI        -1                        
        PushD        $copy-size-temp           
        LoadI                                  
        Add                                    
        PushD        $copy-size-temp           
        Exchange                               
        StoreI                                 
        PushD        $copy-location-temp       
        LoadI                                  
        LoadI                                  
        PushI        4                         
        PushD        $copy-location-temp       
        LoadI                                  
        Add                                    
        PushD        $copy-location-temp       
        Exchange                               
        StoreI                                 
        PushD        store-addr-temp           
        LoadI                                  
        Exchange                               
        StoreI                                 
        PushI        12                        
        PushD        $stack-pop-temp           
        LoadI                                  
        Add                                    
        PushD        $stack-pop-temp           
        Exchange                               
        StoreI                                 
        PushD        $copy-location-temp       
        LoadI                                  
        PushI        -4                        
        PushD        $stack-pointer            
        LoadI                                  
        Add                                    
        PushD        $stack-pointer            
        Exchange                               
        StoreI                                 
        PushD        $stack-pointer            
        LoadI                                  
        Exchange                               
        StoreI                                 
        PushD        $copy-size-temp           
        LoadI                                  
        PushI        -4                        
        PushD        $stack-pointer            
        LoadI                                  
        Add                                    
        PushD        $stack-pointer            
        Exchange                               
        StoreI                                 
        PushD        $stack-pointer            
        LoadI                                  
        Exchange                               
        StoreI                                 
        PushD        store-addr-temp           
        LoadI                                  
        PushI        -4                        
        PushD        $stack-pointer            
        LoadI                                  
        Add                                    
        PushD        $stack-pointer            
        Exchange                               
        StoreI                                 
        PushD        $stack-pointer            
        LoadI                                  
        Exchange                               
        StoreI                                 
        PushD        $global-memory-block      
        PushI        44                        
        Add                                    %% i
        LoadI                                  
        Duplicate                              
        JumpFalse    $$array-is-null           
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
        Label        -recursive-print-array-50-startflag 
        Duplicate                              
        JumpFalse    -recursive-print-array-50-endflag 
        Label        -recursive-print-array-50-loopflag 
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
        JumpFalse    -recursive-print-array-50-endflag 
        PushD        $array-print-middle       
        Printf                                 
        Jump         -recursive-print-array-50-loopflag 
        Label        -recursive-print-array-50-endflag 
        Pop                                    
        Pop                                    
        PushD        $array-print-end          
        Printf                                 
        PushD        $print-format-space       
        Printf                                 
        PushD        $global-memory-block      
        PushI        48                        
        Add                                    %% j
        PushD        $global-memory-block      
        PushI        44                        
        Add                                    %% i
        LoadI                                  
        PushD        $copy-location-temp       
        Exchange                               
        StoreI                                 
        PushD        store-addr-temp           
        Exchange                               
        StoreI                                 
        PushD        $copy-location-temp       
        LoadI                                  
        PushI        12                        
        Add                                    
        LoadI                                  
        PushD        $copy-size-temp           
        Exchange                               
        StoreI                                 
        PushI        16                        
        PushD        $copy-location-temp       
        LoadI                                  
        Add                                    
        PushD        $copy-location-temp       
        Exchange                               
        StoreI                                 
        Label        -for-51-continue          
        PushD        $copy-size-temp           
        LoadI                                  
        JumpFalse    -for-51-ends              
        PushI        -1                        
        PushD        $copy-size-temp           
        LoadI                                  
        Add                                    
        PushD        $copy-size-temp           
        Exchange                               
        StoreI                                 
        PushD        $copy-location-temp       
        LoadI                                  
        Duplicate                              
        LoadI                                  
        Exchange                               
        PushI        4                         
        Add                                    
        LoadI                                  
        PushI        8                         
        PushD        $copy-location-temp       
        LoadI                                  
        Add                                    
        PushD        $copy-location-temp       
        Exchange                               
        StoreI                                 
        PushD        store-addr-temp           
        LoadI                                  
        PushI        4                         
        Add                                    
        Exchange                               
        StoreI                                 
        PushD        store-addr-temp           
        LoadI                                  
        Exchange                               
        StoreI                                 
        PushI        12                        
        PushD        $stack-pop-temp           
        LoadI                                  
        Add                                    
        PushD        $stack-pop-temp           
        Exchange                               
        StoreI                                 
        PushD        $copy-location-temp       
        LoadI                                  
        PushI        -4                        
        PushD        $stack-pointer            
        LoadI                                  
        Add                                    
        PushD        $stack-pointer            
        Exchange                               
        StoreI                                 
        PushD        $stack-pointer            
        LoadI                                  
        Exchange                               
        StoreI                                 
        PushD        $copy-size-temp           
        LoadI                                  
        PushI        -4                        
        PushD        $stack-pointer            
        LoadI                                  
        Add                                    
        PushD        $stack-pointer            
        Exchange                               
        StoreI                                 
        PushD        $stack-pointer            
        LoadI                                  
        Exchange                               
        StoreI                                 
        PushD        store-addr-temp           
        LoadI                                  
        PushI        -4                        
        PushD        $stack-pointer            
        LoadI                                  
        Add                                    
        PushD        $stack-pointer            
        Exchange                               
        StoreI                                 
        PushD        $stack-pointer            
        LoadI                                  
        Exchange                               
        StoreI                                 
        PushD        $global-memory-block      
        PushI        48                        
        Add                                    %% j
        Duplicate                              
        LoadI                                  
        Exchange                               
        PushI        4                         
        Add                                    
        LoadI                                  
        Call         $$print-rational          
        PushD        $print-format-space       
        Printf                                 
        PushD        $stack-pointer            
        LoadI                                  
        LoadI                                  
        PushI        4                         
        PushD        $stack-pointer            
        LoadI                                  
        Add                                    
        PushD        $stack-pointer            
        Exchange                               
        StoreI                                 
        PushD        store-addr-temp           
        Exchange                               
        StoreI                                 
        PushD        $stack-pointer            
        LoadI                                  
        LoadI                                  
        PushI        4                         
        PushD        $stack-pointer            
        LoadI                                  
        Add                                    
        PushD        $stack-pointer            
        Exchange                               
        StoreI                                 
        PushD        $copy-size-temp           
        Exchange                               
        StoreI                                 
        PushD        $stack-pointer            
        LoadI                                  
        LoadI                                  
        PushI        4                         
        PushD        $stack-pointer            
        LoadI                                  
        Add                                    
        PushD        $stack-pointer            
        Exchange                               
        StoreI                                 
        PushD        $copy-location-temp       
        Exchange                               
        StoreI                                 
        Jump         -for-51-continue          
        Label        -for-51-starts            
        PushI        12                        
        PushD        $stack-pointer            
        LoadI                                  
        Add                                    
        PushD        $stack-pointer            
        Exchange                               
        StoreI                                 
        Label        -for-51-ends              
        PushI        -12                       
        PushD        $stack-pop-temp           
        LoadI                                  
        Add                                    
        PushD        $stack-pop-temp           
        Exchange                               
        StoreI                                 
        PushD        $stack-pointer            
        LoadI                                  
        LoadI                                  
        PushI        4                         
        PushD        $stack-pointer            
        LoadI                                  
        Add                                    
        PushD        $stack-pointer            
        Exchange                               
        StoreI                                 
        PushD        store-addr-temp           
        Exchange                               
        StoreI                                 
        PushD        $stack-pointer            
        LoadI                                  
        LoadI                                  
        PushI        4                         
        PushD        $stack-pointer            
        LoadI                                  
        Add                                    
        PushD        $stack-pointer            
        Exchange                               
        StoreI                                 
        PushD        $copy-size-temp           
        Exchange                               
        StoreI                                 
        PushD        $stack-pointer            
        LoadI                                  
        LoadI                                  
        PushI        4                         
        PushD        $stack-pointer            
        LoadI                                  
        Add                                    
        PushD        $stack-pointer            
        Exchange                               
        StoreI                                 
        PushD        $copy-location-temp       
        Exchange                               
        StoreI                                 
        Jump         -for-52-continue          
        Label        -for-52-starts            
        PushI        12                        
        PushD        $stack-pointer            
        LoadI                                  
        Add                                    
        PushD        $stack-pointer            
        Exchange                               
        StoreI                                 
        Label        -for-52-ends              
        PushI        -12                       
        PushD        $stack-pop-temp           
        LoadI                                  
        Add                                    
        PushD        $stack-pop-temp           
        Exchange                               
        StoreI                                 
        PushD        $print-format-newline     
        Printf                                 
        PushD        $global-memory-block      
        PushI        44                        
        Add                                    %% i
        PushD        $global-memory-block      
        PushI        12                        
        Add                                    %% a3
        LoadI                                  
        PushD        $copy-location-temp       
        Exchange                               
        StoreI                                 
        PushD        store-addr-temp           
        Exchange                               
        StoreI                                 
        PushD        $copy-location-temp       
        LoadI                                  
        PushI        12                        
        Add                                    
        LoadI                                  
        PushD        $copy-size-temp           
        Exchange                               
        StoreI                                 
        PushI        16                        
        PushD        $copy-location-temp       
        LoadI                                  
        Add                                    
        PushD        $copy-location-temp       
        Exchange                               
        StoreI                                 
        Label        -for-53-continue          
        PushD        $copy-size-temp           
        LoadI                                  
        JumpFalse    -for-53-ends              
        PushI        -1                        
        PushD        $copy-size-temp           
        LoadI                                  
        Add                                    
        PushD        $copy-size-temp           
        Exchange                               
        StoreI                                 
        PushD        $copy-location-temp       
        LoadI                                  
        LoadI                                  
        PushI        4                         
        PushD        $copy-location-temp       
        LoadI                                  
        Add                                    
        PushD        $copy-location-temp       
        Exchange                               
        StoreI                                 
        PushD        store-addr-temp           
        LoadI                                  
        Exchange                               
        StoreI                                 
        PushI        12                        
        PushD        $stack-pop-temp           
        LoadI                                  
        Add                                    
        PushD        $stack-pop-temp           
        Exchange                               
        StoreI                                 
        PushD        $copy-location-temp       
        LoadI                                  
        PushI        -4                        
        PushD        $stack-pointer            
        LoadI                                  
        Add                                    
        PushD        $stack-pointer            
        Exchange                               
        StoreI                                 
        PushD        $stack-pointer            
        LoadI                                  
        Exchange                               
        StoreI                                 
        PushD        $copy-size-temp           
        LoadI                                  
        PushI        -4                        
        PushD        $stack-pointer            
        LoadI                                  
        Add                                    
        PushD        $stack-pointer            
        Exchange                               
        StoreI                                 
        PushD        $stack-pointer            
        LoadI                                  
        Exchange                               
        StoreI                                 
        PushD        store-addr-temp           
        LoadI                                  
        PushI        -4                        
        PushD        $stack-pointer            
        LoadI                                  
        Add                                    
        PushD        $stack-pointer            
        Exchange                               
        StoreI                                 
        PushD        $stack-pointer            
        LoadI                                  
        Exchange                               
        StoreI                                 
        PushD        $global-memory-block      
        PushI        44                        
        Add                                    %% i
        LoadI                                  
        Duplicate                              
        JumpFalse    $$string-is-null          
        PushI        12                        
        Add                                    
        PushD        $print-format-string      
        Printf                                 
        PushD        $print-format-space       
        Printf                                 
        PushD        $stack-pointer            
        LoadI                                  
        LoadI                                  
        PushI        4                         
        PushD        $stack-pointer            
        LoadI                                  
        Add                                    
        PushD        $stack-pointer            
        Exchange                               
        StoreI                                 
        PushD        store-addr-temp           
        Exchange                               
        StoreI                                 
        PushD        $stack-pointer            
        LoadI                                  
        LoadI                                  
        PushI        4                         
        PushD        $stack-pointer            
        LoadI                                  
        Add                                    
        PushD        $stack-pointer            
        Exchange                               
        StoreI                                 
        PushD        $copy-size-temp           
        Exchange                               
        StoreI                                 
        PushD        $stack-pointer            
        LoadI                                  
        LoadI                                  
        PushI        4                         
        PushD        $stack-pointer            
        LoadI                                  
        Add                                    
        PushD        $stack-pointer            
        Exchange                               
        StoreI                                 
        PushD        $copy-location-temp       
        Exchange                               
        StoreI                                 
        Jump         -for-53-continue          
        Label        -for-53-starts            
        PushI        12                        
        PushD        $stack-pointer            
        LoadI                                  
        Add                                    
        PushD        $stack-pointer            
        Exchange                               
        StoreI                                 
        Label        -for-53-ends              
        PushI        -12                       
        PushD        $stack-pop-temp           
        LoadI                                  
        Add                                    
        PushD        $stack-pop-temp           
        Exchange                               
        StoreI                                 
        PushD        $print-format-newline     
        Printf                                 
        PushD        $global-memory-block      
        PushI        44                        
        Add                                    %% i
        PushD        $global-memory-block      
        PushI        16                        
        Add                                    %% a4
        LoadI                                  
        PushD        $copy-location-temp       
        Exchange                               
        StoreI                                 
        PushD        store-addr-temp           
        Exchange                               
        StoreI                                 
        PushD        $copy-location-temp       
        LoadI                                  
        PushI        12                        
        Add                                    
        LoadI                                  
        PushD        $copy-size-temp           
        Exchange                               
        StoreI                                 
        PushI        16                        
        PushD        $copy-location-temp       
        LoadI                                  
        Add                                    
        PushD        $copy-location-temp       
        Exchange                               
        StoreI                                 
        Label        -for-56-continue          
        PushD        $copy-size-temp           
        LoadI                                  
        JumpFalse    -for-56-ends              
        PushI        -1                        
        PushD        $copy-size-temp           
        LoadI                                  
        Add                                    
        PushD        $copy-size-temp           
        Exchange                               
        StoreI                                 
        PushD        $copy-location-temp       
        LoadI                                  
        LoadI                                  
        PushI        4                         
        PushD        $copy-location-temp       
        LoadI                                  
        Add                                    
        PushD        $copy-location-temp       
        Exchange                               
        StoreI                                 
        PushD        store-addr-temp           
        LoadI                                  
        Exchange                               
        StoreI                                 
        PushI        12                        
        PushD        $stack-pop-temp           
        LoadI                                  
        Add                                    
        PushD        $stack-pop-temp           
        Exchange                               
        StoreI                                 
        PushD        $copy-location-temp       
        LoadI                                  
        PushI        -4                        
        PushD        $stack-pointer            
        LoadI                                  
        Add                                    
        PushD        $stack-pointer            
        Exchange                               
        StoreI                                 
        PushD        $stack-pointer            
        LoadI                                  
        Exchange                               
        StoreI                                 
        PushD        $copy-size-temp           
        LoadI                                  
        PushI        -4                        
        PushD        $stack-pointer            
        LoadI                                  
        Add                                    
        PushD        $stack-pointer            
        Exchange                               
        StoreI                                 
        PushD        $stack-pointer            
        LoadI                                  
        Exchange                               
        StoreI                                 
        PushD        store-addr-temp           
        LoadI                                  
        PushI        -4                        
        PushD        $stack-pointer            
        LoadI                                  
        Add                                    
        PushD        $stack-pointer            
        Exchange                               
        StoreI                                 
        PushD        $stack-pointer            
        LoadI                                  
        Exchange                               
        StoreI                                 
        PushD        $global-memory-block      
        PushI        44                        
        Add                                    %% i
        LoadI                                  
        Duplicate                              
        JumpFalse    $$array-is-null           
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
        Label        -recursive-print-array-54-startflag 
        Duplicate                              
        JumpFalse    -recursive-print-array-54-endflag 
        Label        -recursive-print-array-54-loopflag 
        Exchange                               
        Duplicate                              
        LoadI                                  
        Duplicate                              
        JumpFalse    $$string-is-null          
        PushI        12                        
        Add                                    
        PushD        $print-format-string      
        Printf                                 
        PushI        4                         
        Add                                    
        Exchange                               
        PushI        -1                        
        Add                                    
        Duplicate                              
        JumpFalse    -recursive-print-array-54-endflag 
        PushD        $array-print-middle       
        Printf                                 
        Jump         -recursive-print-array-54-loopflag 
        Label        -recursive-print-array-54-endflag 
        Pop                                    
        Pop                                    
        PushD        $array-print-end          
        Printf                                 
        PushD        $print-format-space       
        Printf                                 
        PushD        $global-memory-block      
        PushI        48                        
        Add                                    %% j
        PushD        $global-memory-block      
        PushI        44                        
        Add                                    %% i
        LoadI                                  
        PushD        $copy-location-temp       
        Exchange                               
        StoreI                                 
        PushD        store-addr-temp           
        Exchange                               
        StoreI                                 
        PushD        $copy-location-temp       
        LoadI                                  
        PushI        12                        
        Add                                    
        LoadI                                  
        PushD        $copy-size-temp           
        Exchange                               
        StoreI                                 
        PushI        16                        
        PushD        $copy-location-temp       
        LoadI                                  
        Add                                    
        PushD        $copy-location-temp       
        Exchange                               
        StoreI                                 
        Label        -for-55-continue          
        PushD        $copy-size-temp           
        LoadI                                  
        JumpFalse    -for-55-ends              
        PushI        -1                        
        PushD        $copy-size-temp           
        LoadI                                  
        Add                                    
        PushD        $copy-size-temp           
        Exchange                               
        StoreI                                 
        PushD        $copy-location-temp       
        LoadI                                  
        LoadI                                  
        PushI        4                         
        PushD        $copy-location-temp       
        LoadI                                  
        Add                                    
        PushD        $copy-location-temp       
        Exchange                               
        StoreI                                 
        PushD        store-addr-temp           
        LoadI                                  
        Exchange                               
        StoreI                                 
        PushI        12                        
        PushD        $stack-pop-temp           
        LoadI                                  
        Add                                    
        PushD        $stack-pop-temp           
        Exchange                               
        StoreI                                 
        PushD        $copy-location-temp       
        LoadI                                  
        PushI        -4                        
        PushD        $stack-pointer            
        LoadI                                  
        Add                                    
        PushD        $stack-pointer            
        Exchange                               
        StoreI                                 
        PushD        $stack-pointer            
        LoadI                                  
        Exchange                               
        StoreI                                 
        PushD        $copy-size-temp           
        LoadI                                  
        PushI        -4                        
        PushD        $stack-pointer            
        LoadI                                  
        Add                                    
        PushD        $stack-pointer            
        Exchange                               
        StoreI                                 
        PushD        $stack-pointer            
        LoadI                                  
        Exchange                               
        StoreI                                 
        PushD        store-addr-temp           
        LoadI                                  
        PushI        -4                        
        PushD        $stack-pointer            
        LoadI                                  
        Add                                    
        PushD        $stack-pointer            
        Exchange                               
        StoreI                                 
        PushD        $stack-pointer            
        LoadI                                  
        Exchange                               
        StoreI                                 
        PushD        $global-memory-block      
        PushI        48                        
        Add                                    %% j
        LoadI                                  
        Duplicate                              
        JumpFalse    $$string-is-null          
        PushI        12                        
        Add                                    
        PushD        $print-format-string      
        Printf                                 
        PushD        $print-format-space       
        Printf                                 
        PushD        $stack-pointer            
        LoadI                                  
        LoadI                                  
        PushI        4                         
        PushD        $stack-pointer            
        LoadI                                  
        Add                                    
        PushD        $stack-pointer            
        Exchange                               
        StoreI                                 
        PushD        store-addr-temp           
        Exchange                               
        StoreI                                 
        PushD        $stack-pointer            
        LoadI                                  
        LoadI                                  
        PushI        4                         
        PushD        $stack-pointer            
        LoadI                                  
        Add                                    
        PushD        $stack-pointer            
        Exchange                               
        StoreI                                 
        PushD        $copy-size-temp           
        Exchange                               
        StoreI                                 
        PushD        $stack-pointer            
        LoadI                                  
        LoadI                                  
        PushI        4                         
        PushD        $stack-pointer            
        LoadI                                  
        Add                                    
        PushD        $stack-pointer            
        Exchange                               
        StoreI                                 
        PushD        $copy-location-temp       
        Exchange                               
        StoreI                                 
        Jump         -for-55-continue          
        Label        -for-55-starts            
        PushI        12                        
        PushD        $stack-pointer            
        LoadI                                  
        Add                                    
        PushD        $stack-pointer            
        Exchange                               
        StoreI                                 
        Label        -for-55-ends              
        PushI        -12                       
        PushD        $stack-pop-temp           
        LoadI                                  
        Add                                    
        PushD        $stack-pop-temp           
        Exchange                               
        StoreI                                 
        PushD        $stack-pointer            
        LoadI                                  
        LoadI                                  
        PushI        4                         
        PushD        $stack-pointer            
        LoadI                                  
        Add                                    
        PushD        $stack-pointer            
        Exchange                               
        StoreI                                 
        PushD        store-addr-temp           
        Exchange                               
        StoreI                                 
        PushD        $stack-pointer            
        LoadI                                  
        LoadI                                  
        PushI        4                         
        PushD        $stack-pointer            
        LoadI                                  
        Add                                    
        PushD        $stack-pointer            
        Exchange                               
        StoreI                                 
        PushD        $copy-size-temp           
        Exchange                               
        StoreI                                 
        PushD        $stack-pointer            
        LoadI                                  
        LoadI                                  
        PushI        4                         
        PushD        $stack-pointer            
        LoadI                                  
        Add                                    
        PushD        $stack-pointer            
        Exchange                               
        StoreI                                 
        PushD        $copy-location-temp       
        Exchange                               
        StoreI                                 
        Jump         -for-56-continue          
        Label        -for-56-starts            
        PushI        12                        
        PushD        $stack-pointer            
        LoadI                                  
        Add                                    
        PushD        $stack-pointer            
        Exchange                               
        StoreI                                 
        Label        -for-56-ends              
        PushI        -12                       
        PushD        $stack-pop-temp           
        LoadI                                  
        Add                                    
        PushD        $stack-pop-temp           
        Exchange                               
        StoreI                                 
        PushD        $print-format-newline     
        Printf                                 
        PushD        $global-memory-block      
        PushI        44                        
        Add                                    %% i
        PushD        $global-memory-block      
        PushI        20                        
        Add                                    %% a5
        LoadI                                  
        PushD        $copy-location-temp       
        Exchange                               
        StoreI                                 
        PushD        store-addr-temp           
        Exchange                               
        StoreI                                 
        PushD        $copy-location-temp       
        LoadI                                  
        PushI        12                        
        Add                                    
        LoadI                                  
        PushD        $copy-size-temp           
        Exchange                               
        StoreI                                 
        PushI        16                        
        PushD        $copy-location-temp       
        LoadI                                  
        Add                                    
        PushD        $copy-location-temp       
        Exchange                               
        StoreI                                 
        Label        -for-59-continue          
        PushD        $copy-size-temp           
        LoadI                                  
        JumpFalse    -for-59-ends              
        PushI        -1                        
        PushD        $copy-size-temp           
        LoadI                                  
        Add                                    
        PushD        $copy-size-temp           
        Exchange                               
        StoreI                                 
        PushD        $copy-location-temp       
        LoadI                                  
        LoadI                                  
        PushI        4                         
        PushD        $copy-location-temp       
        LoadI                                  
        Add                                    
        PushD        $copy-location-temp       
        Exchange                               
        StoreI                                 
        PushD        store-addr-temp           
        LoadI                                  
        Exchange                               
        StoreI                                 
        PushI        12                        
        PushD        $stack-pop-temp           
        LoadI                                  
        Add                                    
        PushD        $stack-pop-temp           
        Exchange                               
        StoreI                                 
        PushD        $copy-location-temp       
        LoadI                                  
        PushI        -4                        
        PushD        $stack-pointer            
        LoadI                                  
        Add                                    
        PushD        $stack-pointer            
        Exchange                               
        StoreI                                 
        PushD        $stack-pointer            
        LoadI                                  
        Exchange                               
        StoreI                                 
        PushD        $copy-size-temp           
        LoadI                                  
        PushI        -4                        
        PushD        $stack-pointer            
        LoadI                                  
        Add                                    
        PushD        $stack-pointer            
        Exchange                               
        StoreI                                 
        PushD        $stack-pointer            
        LoadI                                  
        Exchange                               
        StoreI                                 
        PushD        store-addr-temp           
        LoadI                                  
        PushI        -4                        
        PushD        $stack-pointer            
        LoadI                                  
        Add                                    
        PushD        $stack-pointer            
        Exchange                               
        StoreI                                 
        PushD        $stack-pointer            
        LoadI                                  
        Exchange                               
        StoreI                                 
        PushD        $global-memory-block      
        PushI        44                        
        Add                                    %% i
        LoadI                                  
        Duplicate                              
        JumpFalse    $$array-is-null           
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
        Label        -recursive-print-array-57-startflag 
        Duplicate                              
        JumpFalse    -recursive-print-array-57-endflag 
        Label        -recursive-print-array-57-loopflag 
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
        JumpFalse    -recursive-print-array-57-endflag 
        PushD        $array-print-middle       
        Printf                                 
        Jump         -recursive-print-array-57-loopflag 
        Label        -recursive-print-array-57-endflag 
        Pop                                    
        Pop                                    
        PushD        $array-print-end          
        Printf                                 
        PushD        $print-format-space       
        Printf                                 
        PushD        $global-memory-block      
        PushI        48                        
        Add                                    %% j
        PushD        $global-memory-block      
        PushI        44                        
        Add                                    %% i
        LoadI                                  
        PushD        $copy-location-temp       
        Exchange                               
        StoreI                                 
        PushD        store-addr-temp           
        Exchange                               
        StoreI                                 
        PushD        $copy-location-temp       
        LoadI                                  
        PushI        12                        
        Add                                    
        LoadI                                  
        PushD        $copy-size-temp           
        Exchange                               
        StoreI                                 
        PushI        16                        
        PushD        $copy-location-temp       
        LoadI                                  
        Add                                    
        PushD        $copy-location-temp       
        Exchange                               
        StoreI                                 
        Label        -for-58-continue          
        PushD        $copy-size-temp           
        LoadI                                  
        JumpFalse    -for-58-ends              
        PushI        -1                        
        PushD        $copy-size-temp           
        LoadI                                  
        Add                                    
        PushD        $copy-size-temp           
        Exchange                               
        StoreI                                 
        PushD        $copy-location-temp       
        LoadI                                  
        LoadF                                  
        PushI        8                         
        PushD        $copy-location-temp       
        LoadI                                  
        Add                                    
        PushD        $copy-location-temp       
        Exchange                               
        StoreI                                 
        PushD        store-addr-temp           
        LoadI                                  
        Exchange                               
        StoreF                                 
        PushI        12                        
        PushD        $stack-pop-temp           
        LoadI                                  
        Add                                    
        PushD        $stack-pop-temp           
        Exchange                               
        StoreI                                 
        PushD        $copy-location-temp       
        LoadI                                  
        PushI        -4                        
        PushD        $stack-pointer            
        LoadI                                  
        Add                                    
        PushD        $stack-pointer            
        Exchange                               
        StoreI                                 
        PushD        $stack-pointer            
        LoadI                                  
        Exchange                               
        StoreI                                 
        PushD        $copy-size-temp           
        LoadI                                  
        PushI        -4                        
        PushD        $stack-pointer            
        LoadI                                  
        Add                                    
        PushD        $stack-pointer            
        Exchange                               
        StoreI                                 
        PushD        $stack-pointer            
        LoadI                                  
        Exchange                               
        StoreI                                 
        PushD        store-addr-temp           
        LoadI                                  
        PushI        -4                        
        PushD        $stack-pointer            
        LoadI                                  
        Add                                    
        PushD        $stack-pointer            
        Exchange                               
        StoreI                                 
        PushD        $stack-pointer            
        LoadI                                  
        Exchange                               
        StoreI                                 
        PushD        $global-memory-block      
        PushI        48                        
        Add                                    %% j
        LoadF                                  
        PushD        $print-format-floating    
        Printf                                 
        PushD        $print-format-space       
        Printf                                 
        PushD        $stack-pointer            
        LoadI                                  
        LoadI                                  
        PushI        4                         
        PushD        $stack-pointer            
        LoadI                                  
        Add                                    
        PushD        $stack-pointer            
        Exchange                               
        StoreI                                 
        PushD        store-addr-temp           
        Exchange                               
        StoreI                                 
        PushD        $stack-pointer            
        LoadI                                  
        LoadI                                  
        PushI        4                         
        PushD        $stack-pointer            
        LoadI                                  
        Add                                    
        PushD        $stack-pointer            
        Exchange                               
        StoreI                                 
        PushD        $copy-size-temp           
        Exchange                               
        StoreI                                 
        PushD        $stack-pointer            
        LoadI                                  
        LoadI                                  
        PushI        4                         
        PushD        $stack-pointer            
        LoadI                                  
        Add                                    
        PushD        $stack-pointer            
        Exchange                               
        StoreI                                 
        PushD        $copy-location-temp       
        Exchange                               
        StoreI                                 
        Jump         -for-58-continue          
        Label        -for-58-starts            
        PushI        12                        
        PushD        $stack-pointer            
        LoadI                                  
        Add                                    
        PushD        $stack-pointer            
        Exchange                               
        StoreI                                 
        Label        -for-58-ends              
        PushI        -12                       
        PushD        $stack-pop-temp           
        LoadI                                  
        Add                                    
        PushD        $stack-pop-temp           
        Exchange                               
        StoreI                                 
        PushD        $stack-pointer            
        LoadI                                  
        LoadI                                  
        PushI        4                         
        PushD        $stack-pointer            
        LoadI                                  
        Add                                    
        PushD        $stack-pointer            
        Exchange                               
        StoreI                                 
        PushD        store-addr-temp           
        Exchange                               
        StoreI                                 
        PushD        $stack-pointer            
        LoadI                                  
        LoadI                                  
        PushI        4                         
        PushD        $stack-pointer            
        LoadI                                  
        Add                                    
        PushD        $stack-pointer            
        Exchange                               
        StoreI                                 
        PushD        $copy-size-temp           
        Exchange                               
        StoreI                                 
        PushD        $stack-pointer            
        LoadI                                  
        LoadI                                  
        PushI        4                         
        PushD        $stack-pointer            
        LoadI                                  
        Add                                    
        PushD        $stack-pointer            
        Exchange                               
        StoreI                                 
        PushD        $copy-location-temp       
        Exchange                               
        StoreI                                 
        Jump         -for-59-continue          
        Label        -for-59-starts            
        PushI        12                        
        PushD        $stack-pointer            
        LoadI                                  
        Add                                    
        PushD        $stack-pointer            
        Exchange                               
        StoreI                                 
        Label        -for-59-ends              
        PushI        -12                       
        PushD        $stack-pop-temp           
        LoadI                                  
        Add                                    
        PushD        $stack-pop-temp           
        Exchange                               
        StoreI                                 
        PushD        $print-format-newline     
        Printf                                 
        PushD        $global-memory-block      
        PushI        44                        
        Add                                    %% i
        PushD        $global-memory-block      
        PushI        24                        
        Add                                    %% a6
        LoadI                                  
        PushD        $copy-location-temp       
        Exchange                               
        StoreI                                 
        PushD        store-addr-temp           
        Exchange                               
        StoreI                                 
        PushD        $copy-location-temp       
        LoadI                                  
        PushI        12                        
        Add                                    
        LoadI                                  
        PushD        $copy-size-temp           
        Exchange                               
        StoreI                                 
        PushI        16                        
        PushD        $copy-location-temp       
        LoadI                                  
        Add                                    
        PushD        $copy-location-temp       
        Exchange                               
        StoreI                                 
        Label        -for-64-continue          
        PushD        $copy-size-temp           
        LoadI                                  
        JumpFalse    -for-64-ends              
        PushI        -1                        
        PushD        $copy-size-temp           
        LoadI                                  
        Add                                    
        PushD        $copy-size-temp           
        Exchange                               
        StoreI                                 
        PushD        $copy-location-temp       
        LoadI                                  
        LoadI                                  
        PushI        4                         
        PushD        $copy-location-temp       
        LoadI                                  
        Add                                    
        PushD        $copy-location-temp       
        Exchange                               
        StoreI                                 
        PushD        store-addr-temp           
        LoadI                                  
        Exchange                               
        StoreI                                 
        PushI        12                        
        PushD        $stack-pop-temp           
        LoadI                                  
        Add                                    
        PushD        $stack-pop-temp           
        Exchange                               
        StoreI                                 
        PushD        $copy-location-temp       
        LoadI                                  
        PushI        -4                        
        PushD        $stack-pointer            
        LoadI                                  
        Add                                    
        PushD        $stack-pointer            
        Exchange                               
        StoreI                                 
        PushD        $stack-pointer            
        LoadI                                  
        Exchange                               
        StoreI                                 
        PushD        $copy-size-temp           
        LoadI                                  
        PushI        -4                        
        PushD        $stack-pointer            
        LoadI                                  
        Add                                    
        PushD        $stack-pointer            
        Exchange                               
        StoreI                                 
        PushD        $stack-pointer            
        LoadI                                  
        Exchange                               
        StoreI                                 
        PushD        store-addr-temp           
        LoadI                                  
        PushI        -4                        
        PushD        $stack-pointer            
        LoadI                                  
        Add                                    
        PushD        $stack-pointer            
        Exchange                               
        StoreI                                 
        PushD        $stack-pointer            
        LoadI                                  
        Exchange                               
        StoreI                                 
        PushD        $global-memory-block      
        PushI        44                        
        Add                                    %% i
        LoadI                                  
        Duplicate                              
        JumpFalse    $$array-is-null           
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
        Label        -recursive-print-array-60-startflag 
        Duplicate                              
        JumpFalse    -recursive-print-array-60-endflag 
        Label        -recursive-print-array-60-loopflag 
        Exchange                               
        Duplicate                              
        LoadC                                  
        PushD        $print-format-character   
        Printf                                 
        PushI        1                         
        Add                                    
        Exchange                               
        PushI        -1                        
        Add                                    
        Duplicate                              
        JumpFalse    -recursive-print-array-60-endflag 
        PushD        $array-print-middle       
        Printf                                 
        Jump         -recursive-print-array-60-loopflag 
        Label        -recursive-print-array-60-endflag 
        Pop                                    
        Pop                                    
        PushD        $array-print-end          
        Printf                                 
        PushD        $print-format-space       
        Printf                                 
        PushD        $global-memory-block      
        PushI        48                        
        Add                                    %% j
        PushD        $global-memory-block      
        PushI        44                        
        Add                                    %% i
        LoadI                                  
        PushD        $copy-location-temp       
        Exchange                               
        StoreI                                 
        PushD        store-addr-temp           
        Exchange                               
        StoreI                                 
        PushD        $copy-location-temp       
        LoadI                                  
        PushI        12                        
        Add                                    
        LoadI                                  
        PushD        $copy-size-temp           
        Exchange                               
        StoreI                                 
        PushI        16                        
        PushD        $copy-location-temp       
        LoadI                                  
        Add                                    
        PushD        $copy-location-temp       
        Exchange                               
        StoreI                                 
        Label        -for-63-continue          
        PushD        $copy-size-temp           
        LoadI                                  
        JumpFalse    -for-63-ends              
        PushI        -1                        
        PushD        $copy-size-temp           
        LoadI                                  
        Add                                    
        PushD        $copy-size-temp           
        Exchange                               
        StoreI                                 
        PushD        $copy-location-temp       
        LoadI                                  
        LoadC                                  
        PushI        1                         
        PushD        $copy-location-temp       
        LoadI                                  
        Add                                    
        PushD        $copy-location-temp       
        Exchange                               
        StoreI                                 
        PushD        store-addr-temp           
        LoadI                                  
        Exchange                               
        StoreC                                 
        PushI        12                        
        PushD        $stack-pop-temp           
        LoadI                                  
        Add                                    
        PushD        $stack-pop-temp           
        Exchange                               
        StoreI                                 
        PushD        $copy-location-temp       
        LoadI                                  
        PushI        -4                        
        PushD        $stack-pointer            
        LoadI                                  
        Add                                    
        PushD        $stack-pointer            
        Exchange                               
        StoreI                                 
        PushD        $stack-pointer            
        LoadI                                  
        Exchange                               
        StoreI                                 
        PushD        $copy-size-temp           
        LoadI                                  
        PushI        -4                        
        PushD        $stack-pointer            
        LoadI                                  
        Add                                    
        PushD        $stack-pointer            
        Exchange                               
        StoreI                                 
        PushD        $stack-pointer            
        LoadI                                  
        Exchange                               
        StoreI                                 
        PushD        store-addr-temp           
        LoadI                                  
        PushI        -4                        
        PushD        $stack-pointer            
        LoadI                                  
        Add                                    
        PushD        $stack-pointer            
        Exchange                               
        StoreI                                 
        PushD        $stack-pointer            
        LoadI                                  
        Exchange                               
        StoreI                                 
        PushD        $global-memory-block      
        PushI        48                        
        Add                                    %% j
        LoadC                                  
        PushD        $global-memory-block      
        PushI        0                         
        Add                                    %% s
        LoadI                                  
        PushD        $string-concatenation-second-temp 
        Exchange                               
        StoreI                                 
        PushD        $string-concatenation-first-temp 
        Exchange                               
        StoreI                                 
        PushI        1                         
        PushD        $string-concatenation-first-temp 
        LoadI                                  
        PushI        8                         
        Add                                    
        LoadI                                  
        Add                                    
        PushD        $string-size-temp         
        Exchange                               
        StoreI                                 
        PushD        $string-size-temp         
        LoadI                                  
        PushI        13                        
        Add                                    
        Call         -mem-manager-allocate     
        PushD        $record-creation-temporary 
        Exchange                               
        StoreI                                 
        PushD        $record-creation-temporary 
        LoadI                                  
        PushI        0                         
        Add                                    
        PushI        6                         
        StoreI                                 
        PushD        $record-creation-temporary 
        LoadI                                  
        PushI        4                         
        Add                                    
        PushI        16777217                  
        StoreI                                 
        PushD        $string-size-temp         
        LoadI                                  
        PushD        $record-creation-temporary 
        LoadI                                  
        PushI        12                        
        Add                                    
        Add                                    
        PushI        0                         
        StoreC                                 
        PushD        $string-size-temp         
        LoadI                                  
        PushD        $record-creation-temporary 
        LoadI                                  
        PushI        8                         
        Add                                    
        Exchange                               
        StoreI                                 
        PushD        $record-creation-temporary 
        LoadI                                  
        PushI        12                        
        Add                                    
        PushD        $string-location-temp     
        Exchange                               
        StoreI                                 
        PushD        $string-concatenation-first-temp 
        LoadI                                  
        PushD        $string-location-temp     
        LoadI                                  
        Exchange                               
        StoreC                                 
        PushI        1                         
        PushD        $string-location-temp     
        LoadI                                  
        Add                                    
        PushD        $string-location-temp     
        Exchange                               
        StoreI                                 
        PushD        $string-concatenation-second-temp 
        LoadI                                  
        Duplicate                              
        PushI        12                        
        Add                                    
        PushD        $copy-location-temp       
        Exchange                               
        StoreI                                 
        PushI        8                         
        Add                                    
        LoadI                                  
        Duplicate                              
        PushD        $string-location-temp     
        LoadI                                  
        PushD        $copy-new-location-temp   
        Exchange                               
        StoreI                                 
        PushD        $copy-size-temp           
        Exchange                               
        StoreI                                 
        Label        -$move-62-loopflag        
        PushD        $copy-size-temp           
        LoadI                                  
        JumpFalse    -$move-62-endflag         
        PushD        $copy-location-temp       
        LoadI                                  
        LoadC                                  
        PushD        $copy-new-location-temp   
        LoadI                                  
        Exchange                               
        StoreC                                 
        PushI        -1                        
        PushD        $copy-size-temp           
        LoadI                                  
        Add                                    
        PushD        $copy-size-temp           
        Exchange                               
        StoreI                                 
        PushI        1                         
        PushD        $copy-location-temp       
        LoadI                                  
        Add                                    
        PushD        $copy-location-temp       
        Exchange                               
        StoreI                                 
        PushI        1                         
        PushD        $copy-new-location-temp   
        LoadI                                  
        Add                                    
        PushD        $copy-new-location-temp   
        Exchange                               
        StoreI                                 
        Jump         -$move-62-loopflag        
        Label        -$move-62-endflag         
        PushD        $string-location-temp     
        LoadI                                  
        Add                                    
        PushD        $string-location-temp     
        Exchange                               
        StoreI                                 
        PushD        $record-creation-temporary 
        LoadI                                  
        Duplicate                              
        JumpFalse    $$string-is-null          
        PushI        12                        
        Add                                    
        PushD        $print-format-string      
        Printf                                 
        PushD        $print-format-space       
        Printf                                 
        PushD        $stack-pointer            
        LoadI                                  
        LoadI                                  
        PushI        4                         
        PushD        $stack-pointer            
        LoadI                                  
        Add                                    
        PushD        $stack-pointer            
        Exchange                               
        StoreI                                 
        PushD        store-addr-temp           
        Exchange                               
        StoreI                                 
        PushD        $stack-pointer            
        LoadI                                  
        LoadI                                  
        PushI        4                         
        PushD        $stack-pointer            
        LoadI                                  
        Add                                    
        PushD        $stack-pointer            
        Exchange                               
        StoreI                                 
        PushD        $copy-size-temp           
        Exchange                               
        StoreI                                 
        PushD        $stack-pointer            
        LoadI                                  
        LoadI                                  
        PushI        4                         
        PushD        $stack-pointer            
        LoadI                                  
        Add                                    
        PushD        $stack-pointer            
        Exchange                               
        StoreI                                 
        PushD        $copy-location-temp       
        Exchange                               
        StoreI                                 
        Jump         -for-63-continue          
        Label        -for-63-starts            
        PushI        12                        
        PushD        $stack-pointer            
        LoadI                                  
        Add                                    
        PushD        $stack-pointer            
        Exchange                               
        StoreI                                 
        Label        -for-63-ends              
        PushI        -12                       
        PushD        $stack-pop-temp           
        LoadI                                  
        Add                                    
        PushD        $stack-pop-temp           
        Exchange                               
        StoreI                                 
        PushD        $stack-pointer            
        LoadI                                  
        LoadI                                  
        PushI        4                         
        PushD        $stack-pointer            
        LoadI                                  
        Add                                    
        PushD        $stack-pointer            
        Exchange                               
        StoreI                                 
        PushD        store-addr-temp           
        Exchange                               
        StoreI                                 
        PushD        $stack-pointer            
        LoadI                                  
        LoadI                                  
        PushI        4                         
        PushD        $stack-pointer            
        LoadI                                  
        Add                                    
        PushD        $stack-pointer            
        Exchange                               
        StoreI                                 
        PushD        $copy-size-temp           
        Exchange                               
        StoreI                                 
        PushD        $stack-pointer            
        LoadI                                  
        LoadI                                  
        PushI        4                         
        PushD        $stack-pointer            
        LoadI                                  
        Add                                    
        PushD        $stack-pointer            
        Exchange                               
        StoreI                                 
        PushD        $copy-location-temp       
        Exchange                               
        StoreI                                 
        Jump         -for-64-continue          
        Label        -for-64-starts            
        PushI        12                        
        PushD        $stack-pointer            
        LoadI                                  
        Add                                    
        PushD        $stack-pointer            
        Exchange                               
        StoreI                                 
        Label        -for-64-ends              
        PushI        -12                       
        PushD        $stack-pop-temp           
        LoadI                                  
        Add                                    
        PushD        $stack-pop-temp           
        Exchange                               
        StoreI                                 
        PushD        $print-format-newline     
        Printf                                 
        PushD        $global-memory-block      
        PushI        44                        
        Add                                    %% i
        PushD        $global-memory-block      
        PushI        36                        
        Add                                    %% a7
        LoadI                                  
        PushD        $copy-location-temp       
        Exchange                               
        StoreI                                 
        PushD        store-addr-temp           
        Exchange                               
        StoreI                                 
        PushD        $copy-location-temp       
        LoadI                                  
        PushI        12                        
        Add                                    
        LoadI                                  
        PushD        $copy-size-temp           
        Exchange                               
        StoreI                                 
        PushI        16                        
        PushD        $copy-location-temp       
        LoadI                                  
        Add                                    
        PushD        $copy-location-temp       
        Exchange                               
        StoreI                                 
        Label        -for-65-continue          
        PushD        $copy-size-temp           
        LoadI                                  
        JumpFalse    -for-65-ends              
        PushI        -1                        
        PushD        $copy-size-temp           
        LoadI                                  
        Add                                    
        PushD        $copy-size-temp           
        Exchange                               
        StoreI                                 
        PushD        $copy-location-temp       
        LoadI                                  
        LoadI                                  
        PushI        4                         
        PushD        $copy-location-temp       
        LoadI                                  
        Add                                    
        PushD        $copy-location-temp       
        Exchange                               
        StoreI                                 
        PushD        store-addr-temp           
        LoadI                                  
        Exchange                               
        StoreI                                 
        PushI        12                        
        PushD        $stack-pop-temp           
        LoadI                                  
        Add                                    
        PushD        $stack-pop-temp           
        Exchange                               
        StoreI                                 
        PushD        $copy-location-temp       
        LoadI                                  
        PushI        -4                        
        PushD        $stack-pointer            
        LoadI                                  
        Add                                    
        PushD        $stack-pointer            
        Exchange                               
        StoreI                                 
        PushD        $stack-pointer            
        LoadI                                  
        Exchange                               
        StoreI                                 
        PushD        $copy-size-temp           
        LoadI                                  
        PushI        -4                        
        PushD        $stack-pointer            
        LoadI                                  
        Add                                    
        PushD        $stack-pointer            
        Exchange                               
        StoreI                                 
        PushD        $stack-pointer            
        LoadI                                  
        Exchange                               
        StoreI                                 
        PushD        store-addr-temp           
        LoadI                                  
        PushI        -4                        
        PushD        $stack-pointer            
        LoadI                                  
        Add                                    
        PushD        $stack-pointer            
        Exchange                               
        StoreI                                 
        PushD        $stack-pointer            
        LoadI                                  
        Exchange                               
        StoreI                                 
        PushD        $global-memory-block      
        PushI        44                        
        Add                                    %% i
        LoadI                                  
        PushI        9                         
        PushI        4                         
        PushD        $stack-pop-temp           
        LoadI                                  
        PushI        -4                        
        PushD        $stack-pointer            
        LoadI                                  
        Add                                    
        PushD        $stack-pointer            
        Exchange                               
        StoreI                                 
        PushD        $stack-pointer            
        LoadI                                  
        Exchange                               
        StoreI                                 
        PushI        0                         
        PushD        $stack-pop-temp           
        Exchange                               
        StoreI                                 
        PushI        -4                        
        PushD        $stack-pointer            
        LoadI                                  
        Add                                    
        PushD        $stack-pointer            
        Exchange                               
        StoreI                                 
        PushD        $stack-pointer            
        LoadI                                  
        Exchange                               
        StoreI                                 
        PushI        -4                        
        PushD        $stack-pointer            
        LoadI                                  
        Add                                    
        PushD        $stack-pointer            
        Exchange                               
        StoreI                                 
        PushD        $stack-pointer            
        LoadI                                  
        Exchange                               
        StoreI                                 
        CallV                                  
        PushD        $stack-pointer            
        LoadI                                  
        LoadI                                  
        PushI        4                         
        PushD        $stack-pointer            
        LoadI                                  
        Add                                    
        PushD        $stack-pointer            
        Exchange                               
        StoreI                                 
        PushD        $print-format-integer     
        Printf                                 
        PushD        $print-format-space       
        Printf                                 
        PushD        $stack-pointer            
        LoadI                                  
        LoadI                                  
        PushI        4                         
        PushD        $stack-pointer            
        LoadI                                  
        Add                                    
        PushD        $stack-pointer            
        Exchange                               
        StoreI                                 
        PushD        store-addr-temp           
        Exchange                               
        StoreI                                 
        PushD        $stack-pointer            
        LoadI                                  
        LoadI                                  
        PushI        4                         
        PushD        $stack-pointer            
        LoadI                                  
        Add                                    
        PushD        $stack-pointer            
        Exchange                               
        StoreI                                 
        PushD        $copy-size-temp           
        Exchange                               
        StoreI                                 
        PushD        $stack-pointer            
        LoadI                                  
        LoadI                                  
        PushI        4                         
        PushD        $stack-pointer            
        LoadI                                  
        Add                                    
        PushD        $stack-pointer            
        Exchange                               
        StoreI                                 
        PushD        $copy-location-temp       
        Exchange                               
        StoreI                                 
        Jump         -for-65-continue          
        Label        -for-65-starts            
        PushI        12                        
        PushD        $stack-pointer            
        LoadI                                  
        Add                                    
        PushD        $stack-pointer            
        Exchange                               
        StoreI                                 
        Label        -for-65-ends              
        PushI        -12                       
        PushD        $stack-pop-temp           
        LoadI                                  
        Add                                    
        PushD        $stack-pop-temp           
        Exchange                               
        StoreI                                 
        PushD        $print-format-newline     
        Printf                                 
        PushD        $global-memory-block      
        PushI        44                        
        Add                                    %% i
        PushD        $global-memory-block      
        PushI        4                         
        Add                                    %% a1
        LoadI                                  
        PushD        $copy-location-temp       
        Exchange                               
        StoreI                                 
        PushD        store-addr-temp           
        Exchange                               
        StoreI                                 
        PushD        $copy-location-temp       
        LoadI                                  
        PushI        12                        
        Add                                    
        LoadI                                  
        PushD        $copy-size-temp           
        Exchange                               
        StoreI                                 
        PushI        16                        
        PushD        $copy-location-temp       
        LoadI                                  
        Add                                    
        PushD        $copy-location-temp       
        Exchange                               
        StoreI                                 
        Label        -for-76-continue          
        PushD        $copy-size-temp           
        LoadI                                  
        JumpFalse    -for-76-ends              
        PushI        -1                        
        PushD        $copy-size-temp           
        LoadI                                  
        Add                                    
        PushD        $copy-size-temp           
        Exchange                               
        StoreI                                 
        PushD        $copy-location-temp       
        LoadI                                  
        LoadI                                  
        PushI        4                         
        PushD        $copy-location-temp       
        LoadI                                  
        Add                                    
        PushD        $copy-location-temp       
        Exchange                               
        StoreI                                 
        PushD        store-addr-temp           
        LoadI                                  
        Exchange                               
        StoreI                                 
        PushI        12                        
        PushD        $stack-pop-temp           
        LoadI                                  
        Add                                    
        PushD        $stack-pop-temp           
        Exchange                               
        StoreI                                 
        PushD        $copy-location-temp       
        LoadI                                  
        PushI        -4                        
        PushD        $stack-pointer            
        LoadI                                  
        Add                                    
        PushD        $stack-pointer            
        Exchange                               
        StoreI                                 
        PushD        $stack-pointer            
        LoadI                                  
        Exchange                               
        StoreI                                 
        PushD        $copy-size-temp           
        LoadI                                  
        PushI        -4                        
        PushD        $stack-pointer            
        LoadI                                  
        Add                                    
        PushD        $stack-pointer            
        Exchange                               
        StoreI                                 
        PushD        $stack-pointer            
        LoadI                                  
        Exchange                               
        StoreI                                 
        PushD        store-addr-temp           
        LoadI                                  
        PushI        -4                        
        PushD        $stack-pointer            
        LoadI                                  
        Add                                    
        PushD        $stack-pointer            
        Exchange                               
        StoreI                                 
        PushD        $stack-pointer            
        LoadI                                  
        Exchange                               
        StoreI                                 
        PushD        $global-memory-block      
        PushI        44                        
        Add                                    %% i
        LoadI                                  
        Duplicate                              
        JumpFalse    $$array-is-null           
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
        Label        -recursive-print-array-66-startflag 
        Duplicate                              
        JumpFalse    -recursive-print-array-66-endflag 
        Label        -recursive-print-array-66-loopflag 
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
        JumpFalse    -recursive-print-array-66-endflag 
        PushD        $array-print-middle       
        Printf                                 
        Jump         -recursive-print-array-66-loopflag 
        Label        -recursive-print-array-66-endflag 
        Pop                                    
        Pop                                    
        PushD        $array-print-end          
        Printf                                 
        PushD        $print-format-space       
        Printf                                 
        PushD        $global-memory-block      
        PushI        48                        
        Add                                    %% j
        PushD        $global-memory-block      
        PushI        44                        
        Add                                    %% i
        LoadI                                  
        PushD        $copy-location-temp       
        Exchange                               
        StoreI                                 
        PushD        store-addr-temp           
        Exchange                               
        StoreI                                 
        PushD        $copy-location-temp       
        LoadI                                  
        PushI        12                        
        Add                                    
        LoadI                                  
        PushD        $copy-size-temp           
        Exchange                               
        StoreI                                 
        PushI        16                        
        PushD        $copy-location-temp       
        LoadI                                  
        Add                                    
        PushD        $copy-location-temp       
        Exchange                               
        StoreI                                 
        Label        -for-75-continue          
        PushD        $copy-size-temp           
        LoadI                                  
        JumpFalse    -for-75-ends              
        PushI        -1                        
        PushD        $copy-size-temp           
        LoadI                                  
        Add                                    
        PushD        $copy-size-temp           
        Exchange                               
        StoreI                                 
        PushD        $copy-location-temp       
        LoadI                                  
        LoadI                                  
        PushI        4                         
        PushD        $copy-location-temp       
        LoadI                                  
        Add                                    
        PushD        $copy-location-temp       
        Exchange                               
        StoreI                                 
        PushD        store-addr-temp           
        LoadI                                  
        Exchange                               
        StoreI                                 
        PushI        12                        
        PushD        $stack-pop-temp           
        LoadI                                  
        Add                                    
        PushD        $stack-pop-temp           
        Exchange                               
        StoreI                                 
        PushD        $copy-location-temp       
        LoadI                                  
        PushI        -4                        
        PushD        $stack-pointer            
        LoadI                                  
        Add                                    
        PushD        $stack-pointer            
        Exchange                               
        StoreI                                 
        PushD        $stack-pointer            
        LoadI                                  
        Exchange                               
        StoreI                                 
        PushD        $copy-size-temp           
        LoadI                                  
        PushI        -4                        
        PushD        $stack-pointer            
        LoadI                                  
        Add                                    
        PushD        $stack-pointer            
        Exchange                               
        StoreI                                 
        PushD        $stack-pointer            
        LoadI                                  
        Exchange                               
        StoreI                                 
        PushD        store-addr-temp           
        LoadI                                  
        PushI        -4                        
        PushD        $stack-pointer            
        LoadI                                  
        Add                                    
        PushD        $stack-pointer            
        Exchange                               
        StoreI                                 
        PushD        $stack-pointer            
        LoadI                                  
        Exchange                               
        StoreI                                 
        PushI        1                         
        PushD        $global-memory-block      
        PushI        52                        
        Add                                    %% x
        PushD        store-addr-temp           
        Exchange                               
        StoreI                                 
        PushD        store-addr-temp           
        LoadI                                  
        Exchange                               
        StoreI                                 
        Label        -loop-continue-72-condition 
        PushD        $global-memory-block      
        PushI        52                        
        Add                                    %% x
        LoadI                                  
        PushD        $global-memory-block      
        PushI        48                        
        Add                                    %% j
        LoadI                                  
        Label        -compare-67-sub           
        Subtract                               
        JumpNeg      -compare-67-true          
        Jump         -compare-67-false         
        Label        -compare-67-true          
        PushI        1                         
        Jump         -compare-67-join          
        Label        -compare-67-false         
        PushI        0                         
        Jump         -compare-67-join          
        Label        -compare-67-join          
        JumpFalse    -loop-break-69-ends       
        Label        -while-74-starts          
        PushD        $global-memory-block      
        PushI        52                        
        Add                                    %% x
        LoadI                                  
        PushI        1                         
        Add                                    
        PushD        $global-memory-block      
        PushI        52                        
        Add                                    %% x
        PushD        store-addr-temp           
        Exchange                               
        StoreI                                 
        PushD        store-addr-temp           
        LoadI                                  
        Exchange                               
        StoreI                                 
        Label        -if-70-condition          
        PushD        $global-memory-block      
        PushI        52                        
        Add                                    %% x
        LoadI                                  
        PushI        5                         
        Label        -compare-68-sub           
        Subtract                               
        JumpFalse    -compare-68-true          
        Jump         -compare-68-false         
        Label        -compare-68-true          
        PushI        1                         
        Jump         -compare-68-join          
        Label        -compare-68-false         
        PushI        0                         
        Jump         -compare-68-join          
        Label        -compare-68-join          
        JumpFalse    -if-70-false              
        Label        -if-70-true               
        Jump         -loop-break-69-ends       
        Jump         -if-70-join               
        Label        -if-70-false              
        Jump         -if-70-join               
        Label        -if-70-join               
        Label        -if-73-condition          
        PushD        $global-memory-block      
        PushI        52                        
        Add                                    %% x
        LoadI                                  
        PushI        3                         
        Label        -compare-71-sub           
        Subtract                               
        JumpFalse    -compare-71-true          
        Jump         -compare-71-false         
        Label        -compare-71-true          
        PushI        1                         
        Jump         -compare-71-join          
        Label        -compare-71-false         
        PushI        0                         
        Jump         -compare-71-join          
        Label        -compare-71-join          
        JumpFalse    -if-73-false              
        Label        -if-73-true               
        Jump         -loop-continue-72-condition 
        Jump         -if-73-join               
        Label        -if-73-false              
        Jump         -if-73-join               
        Label        -if-73-join               
        PushD        $global-memory-block      
        PushI        52                        
        Add                                    %% x
        LoadI                                  
        PushD        $print-format-integer     
        Printf                                 
        PushD        $print-format-space       
        Printf                                 
        Jump         -loop-continue-72-condition 
        Label        -loop-break-69-ends       
        PushD        $stack-pointer            
        LoadI                                  
        LoadI                                  
        PushI        4                         
        PushD        $stack-pointer            
        LoadI                                  
        Add                                    
        PushD        $stack-pointer            
        Exchange                               
        StoreI                                 
        PushD        store-addr-temp           
        Exchange                               
        StoreI                                 
        PushD        $stack-pointer            
        LoadI                                  
        LoadI                                  
        PushI        4                         
        PushD        $stack-pointer            
        LoadI                                  
        Add                                    
        PushD        $stack-pointer            
        Exchange                               
        StoreI                                 
        PushD        $copy-size-temp           
        Exchange                               
        StoreI                                 
        PushD        $stack-pointer            
        LoadI                                  
        LoadI                                  
        PushI        4                         
        PushD        $stack-pointer            
        LoadI                                  
        Add                                    
        PushD        $stack-pointer            
        Exchange                               
        StoreI                                 
        PushD        $copy-location-temp       
        Exchange                               
        StoreI                                 
        Jump         -for-75-continue          
        Label        -for-75-starts            
        PushI        12                        
        PushD        $stack-pointer            
        LoadI                                  
        Add                                    
        PushD        $stack-pointer            
        Exchange                               
        StoreI                                 
        Label        -for-75-ends              
        PushI        -12                       
        PushD        $stack-pop-temp           
        LoadI                                  
        Add                                    
        PushD        $stack-pop-temp           
        Exchange                               
        StoreI                                 
        PushD        $stack-pointer            
        LoadI                                  
        LoadI                                  
        PushI        4                         
        PushD        $stack-pointer            
        LoadI                                  
        Add                                    
        PushD        $stack-pointer            
        Exchange                               
        StoreI                                 
        PushD        store-addr-temp           
        Exchange                               
        StoreI                                 
        PushD        $stack-pointer            
        LoadI                                  
        LoadI                                  
        PushI        4                         
        PushD        $stack-pointer            
        LoadI                                  
        Add                                    
        PushD        $stack-pointer            
        Exchange                               
        StoreI                                 
        PushD        $copy-size-temp           
        Exchange                               
        StoreI                                 
        PushD        $stack-pointer            
        LoadI                                  
        LoadI                                  
        PushI        4                         
        PushD        $stack-pointer            
        LoadI                                  
        Add                                    
        PushD        $stack-pointer            
        Exchange                               
        StoreI                                 
        PushD        $copy-location-temp       
        Exchange                               
        StoreI                                 
        Jump         -for-76-continue          
        Label        -for-76-starts            
        PushI        12                        
        PushD        $stack-pointer            
        LoadI                                  
        Add                                    
        PushD        $stack-pointer            
        Exchange                               
        StoreI                                 
        Label        -for-76-ends              
        PushI        -12                       
        PushD        $stack-pop-temp           
        LoadI                                  
        Add                                    
        PushD        $stack-pop-temp           
        Exchange                               
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

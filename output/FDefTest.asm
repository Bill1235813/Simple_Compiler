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
        DLabel       $frame-pointer            
        DataZ        4                         
        DLabel       $stack-pointer            
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
        JumpFalse    $$r-divide-by-zero        
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
        JumpFalse    -$release-reference-4-subtypeIsRefflag 
        Duplicate                              
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
        Pop                                    
        Label        -$release-reference-4-subtypeIsRefflag 
        Duplicate                              
        PushI        6                         
        Add                                    
        PushI        1                         
        StoreC                                 
        Call         -mem-manager-deallocate   
        Jump         -$release-reference-4-returnflag 
        Label        -$release-reference-4-endflag 
        Pop                                    
        Label        -$release-reference-4-returnflag 
        Return                                 
        DLabel       $usable-memory-start      
        DLabel       $global-memory-block      
        DataZ        38                        
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
        PushD        $global-memory-block      
        PushI        0                         
        Add                                    %% bill2
        PushPC                                 
        Jump         -function-definition-8-ends 
        Label        -function-definition-8-starts 
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
        Label        -if-7-condition           
        PushD        $frame-pointer            
        LoadI                                  
        PushI        0                         
        Add                                    %% c
        LoadC                                  
        PushI        1                         
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
        JumpFalse    -if-7-false               
        Label        -if-7-true                
        PushD        $global-memory-block      
        PushI        4                         
        Add                                    %% bill0
        LoadI                                  
        PushD        $frame-pointer            
        LoadI                                  
        PushI        -8                        
        Add                                    
        LoadI                                  
        PushD        $frame-pointer            
        LoadI                                  
        PushI        -4                        
        Add                                    
        LoadI                                  
        PushD        $frame-pointer            
        Exchange                               
        StoreI                                 
        PushI        17                        
        PushD        $stack-pointer            
        LoadI                                  
        Add                                    
        PushD        $stack-pointer            
        Exchange                               
        StoreI                                 
        Exchange                               
        PushD        $stack-pointer            
        LoadI                                  
        PushI        -4                        
        Add                                    
        Duplicate                              
        PushD        $stack-pointer            
        Exchange                               
        StoreI                                 
        Exchange                               
        StoreI                                 
        Return                                 
        Jump         -if-7-join                
        Label        -if-7-false               
        PushD        $frame-pointer            
        LoadI                                  
        PushI        1                         
        Add                                    %% b
        LoadI                                  
        PushD        $frame-pointer            
        LoadI                                  
        PushI        -8                        
        Add                                    
        LoadI                                  
        PushD        $frame-pointer            
        LoadI                                  
        PushI        -4                        
        Add                                    
        LoadI                                  
        PushD        $frame-pointer            
        Exchange                               
        StoreI                                 
        PushI        17                        
        PushD        $stack-pointer            
        LoadI                                  
        Add                                    
        PushD        $stack-pointer            
        Exchange                               
        StoreI                                 
        Exchange                               
        PushD        $stack-pointer            
        LoadI                                  
        PushI        -4                        
        Add                                    
        Duplicate                              
        PushD        $stack-pointer            
        Exchange                               
        StoreI                                 
        Exchange                               
        StoreI                                 
        Return                                 
        Jump         -if-7-join                
        Label        -if-7-join                
        Jump         $$function-no-return      
        Label        -function-definition-8-ends 
        PushI        1                         
        Add                                    
        StoreI                                 
        PushD        $global-memory-block      
        PushI        4                         
        Add                                    %% bill0
        PushPC                                 
        Jump         -function-definition-11-ends 
        Label        -function-definition-11-starts 
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
        PushI        -12                       
        PushD        $stack-pointer            
        LoadI                                  
        Add                                    
        PushD        $stack-pointer            
        Exchange                               
        StoreI                                 
        PushD        $frame-pointer            
        LoadI                                  
        PushI        -12                       
        Add                                    %% a
        PushI        7                         
        StoreI                                 
        PushD        $frame-pointer            
        LoadI                                  
        PushI        -12                       
        Add                                    %% a
        PushD        $frame-pointer            
        LoadI                                  
        PushI        -12                       
        Add                                    %% a
        LoadI                                  
        PushD        $frame-pointer            
        LoadI                                  
        PushI        1                         
        Add                                    %% b
        LoadI                                  
        Add                                    
        StoreI                                 
        Label        -if-10-condition          
        PushD        $frame-pointer            
        LoadI                                  
        PushI        0                         
        Add                                    %% c
        LoadC                                  
        PushI        1                         
        Label        -compare-9-sub            
        Subtract                               
        JumpFalse    -compare-9-true           
        Jump         -compare-9-false          
        Label        -compare-9-true           
        PushI        1                         
        Jump         -compare-9-join           
        Label        -compare-9-false          
        PushI        0                         
        Jump         -compare-9-join           
        Label        -compare-9-join           
        JumpFalse    -if-10-false              
        Label        -if-10-true               
        PushD        $frame-pointer            
        LoadI                                  
        PushI        -12                       
        Add                                    %% a
        LoadI                                  
        PushD        $frame-pointer            
        LoadI                                  
        PushI        1                         
        Add                                    %% b
        LoadI                                  
        Call         $$convert-to-lowest-terms 
        PushD        $frame-pointer            
        LoadI                                  
        PushI        -8                        
        Add                                    
        LoadI                                  
        PushD        $frame-pointer            
        LoadI                                  
        PushI        -4                        
        Add                                    
        LoadI                                  
        PushD        $frame-pointer            
        Exchange                               
        StoreI                                 
        PushI        21                        
        PushD        $stack-pointer            
        LoadI                                  
        Add                                    
        PushD        $stack-pointer            
        Exchange                               
        StoreI                                 
        Exchange                               
        PushD        $stack-pointer            
        LoadI                                  
        PushI        -4                        
        Add                                    
        Duplicate                              
        PushD        $stack-pointer            
        Exchange                               
        StoreI                                 
        Exchange                               
        StoreI                                 
        Exchange                               
        PushD        $stack-pointer            
        LoadI                                  
        PushI        -4                        
        Add                                    
        Duplicate                              
        PushD        $stack-pointer            
        Exchange                               
        StoreI                                 
        Exchange                               
        StoreI                                 
        Return                                 
        Jump         -if-10-join               
        Label        -if-10-false              
        PushD        $frame-pointer            
        LoadI                                  
        PushI        1                         
        Add                                    %% b
        LoadI                                  
        PushD        $frame-pointer            
        LoadI                                  
        PushI        -12                       
        Add                                    %% a
        LoadI                                  
        Call         $$convert-to-lowest-terms 
        PushD        $frame-pointer            
        LoadI                                  
        PushI        -8                        
        Add                                    
        LoadI                                  
        PushD        $frame-pointer            
        LoadI                                  
        PushI        -4                        
        Add                                    
        LoadI                                  
        PushD        $frame-pointer            
        Exchange                               
        StoreI                                 
        PushI        21                        
        PushD        $stack-pointer            
        LoadI                                  
        Add                                    
        PushD        $stack-pointer            
        Exchange                               
        StoreI                                 
        Exchange                               
        PushD        $stack-pointer            
        LoadI                                  
        PushI        -4                        
        Add                                    
        Duplicate                              
        PushD        $stack-pointer            
        Exchange                               
        StoreI                                 
        Exchange                               
        StoreI                                 
        Exchange                               
        PushD        $stack-pointer            
        LoadI                                  
        PushI        -4                        
        Add                                    
        Duplicate                              
        PushD        $stack-pointer            
        Exchange                               
        StoreI                                 
        Exchange                               
        StoreI                                 
        Return                                 
        Jump         -if-10-join               
        Label        -if-10-join               
        Jump         $$function-no-return      
        Label        -function-definition-11-ends 
        PushI        1                         
        Add                                    
        StoreI                                 
        PushD        $global-memory-block      
        PushI        8                         
        Add                                    %% bill1
        PushPC                                 
        Jump         -function-definition-14-ends 
        Label        -function-definition-14-starts 
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
        PushI        -9                        
        PushD        $stack-pointer            
        LoadI                                  
        Add                                    
        PushD        $stack-pointer            
        Exchange                               
        StoreI                                 
        PushD        $frame-pointer            
        LoadI                                  
        PushI        -9                        
        Add                                    %% con
        PushI        97                        
        StoreC                                 
        Label        -if-13-condition          
        PushD        $frame-pointer            
        LoadI                                  
        PushI        0                         
        Add                                    %% c
        LoadC                                  
        PushI        0                         
        Label        -compare-12-sub           
        Subtract                               
        JumpFalse    -compare-12-true          
        Jump         -compare-12-false         
        Label        -compare-12-true          
        PushI        1                         
        Jump         -compare-12-join          
        Label        -compare-12-false         
        PushI        0                         
        Jump         -compare-12-join          
        Label        -compare-12-join          
        JumpFalse    -if-13-false              
        Label        -if-13-true               
        PushD        $frame-pointer            
        LoadI                                  
        PushI        5                         
        Add                                    %% a
        LoadI                                  
        PushI        1                         
        Add                                    
        PushD        $frame-pointer            
        LoadI                                  
        PushI        1                         
        Add                                    %% b
        LoadI                                  
        Call         $$convert-to-lowest-terms 
        PushD        $frame-pointer            
        LoadI                                  
        PushI        -9                        
        Add                                    %% con
        LoadC                                  
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
        Add                                    
        PushD        $first-denominator        
        LoadI                                  
        PushD        $second-denominator       
        LoadI                                  
        Multiply                               
        Call         $$convert-to-lowest-terms 
        PushD        $frame-pointer            
        LoadI                                  
        PushI        -8                        
        Add                                    
        LoadI                                  
        PushD        $frame-pointer            
        LoadI                                  
        PushI        -4                        
        Add                                    
        LoadI                                  
        PushD        $frame-pointer            
        Exchange                               
        StoreI                                 
        PushI        18                        
        PushD        $stack-pointer            
        LoadI                                  
        Add                                    
        PushD        $stack-pointer            
        Exchange                               
        StoreI                                 
        Exchange                               
        PushD        $stack-pointer            
        LoadI                                  
        PushI        -4                        
        Add                                    
        Duplicate                              
        PushD        $stack-pointer            
        Exchange                               
        StoreI                                 
        Exchange                               
        StoreI                                 
        Exchange                               
        PushD        $stack-pointer            
        LoadI                                  
        PushI        -4                        
        Add                                    
        Duplicate                              
        PushD        $stack-pointer            
        Exchange                               
        StoreI                                 
        Exchange                               
        StoreI                                 
        Return                                 
        Jump         -if-13-join               
        Label        -if-13-false              
        PushD        $frame-pointer            
        LoadI                                  
        PushI        1                         
        Add                                    %% b
        LoadI                                  
        PushI        1                         
        Add                                    
        PushD        $frame-pointer            
        LoadI                                  
        PushI        5                         
        Add                                    %% a
        LoadI                                  
        Call         $$convert-to-lowest-terms 
        PushD        $frame-pointer            
        LoadI                                  
        PushI        -9                        
        Add                                    %% con
        LoadC                                  
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
        Add                                    
        PushD        $first-denominator        
        LoadI                                  
        PushD        $second-denominator       
        LoadI                                  
        Multiply                               
        Call         $$convert-to-lowest-terms 
        PushD        $frame-pointer            
        LoadI                                  
        PushI        -8                        
        Add                                    
        LoadI                                  
        PushD        $frame-pointer            
        LoadI                                  
        PushI        -4                        
        Add                                    
        LoadI                                  
        PushD        $frame-pointer            
        Exchange                               
        StoreI                                 
        PushI        18                        
        PushD        $stack-pointer            
        LoadI                                  
        Add                                    
        PushD        $stack-pointer            
        Exchange                               
        StoreI                                 
        Exchange                               
        PushD        $stack-pointer            
        LoadI                                  
        PushI        -4                        
        Add                                    
        Duplicate                              
        PushD        $stack-pointer            
        Exchange                               
        StoreI                                 
        Exchange                               
        StoreI                                 
        Exchange                               
        PushD        $stack-pointer            
        LoadI                                  
        PushI        -4                        
        Add                                    
        Duplicate                              
        PushD        $stack-pointer            
        Exchange                               
        StoreI                                 
        Exchange                               
        StoreI                                 
        Return                                 
        Jump         -if-13-join               
        Label        -if-13-join               
        Jump         $$function-no-return      
        Label        -function-definition-14-ends 
        PushI        1                         
        Add                                    
        StoreI                                 
        PushD        $global-memory-block      
        PushI        12                        
        Add                                    %% a
        PushI        1                         
        StoreI                                 
        PushD        $global-memory-block      
        PushI        16                        
        Add                                    %% b
        PushI        5                         
        StoreI                                 
        PushD        $global-memory-block      
        PushI        20                        
        Add                                    %% re2
        Duplicate                              
        PushD        $global-memory-block      
        PushI        0                         
        Add                                    %% bill2
        LoadI                                  
        PushI        1                         
        PushD        $global-memory-block      
        PushI        8                         
        Add                                    %% bill1
        LoadI                                  
        PushD        $global-memory-block      
        PushI        4                         
        Add                                    %% bill0
        LoadI                                  
        PushD        $stack-pointer            
        LoadI                                  
        PushI        -4                        
        Add                                    
        Duplicate                              
        PushD        $stack-pointer            
        Exchange                               
        StoreI                                 
        Exchange                               
        StoreI                                 
        PushD        $stack-pointer            
        LoadI                                  
        PushI        -4                        
        Add                                    
        Duplicate                              
        PushD        $stack-pointer            
        Exchange                               
        StoreI                                 
        Exchange                               
        StoreI                                 
        PushD        $stack-pointer            
        LoadI                                  
        PushI        -1                        
        Add                                    
        Duplicate                              
        PushD        $stack-pointer            
        Exchange                               
        StoreI                                 
        Exchange                               
        StoreC                                 
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
        PushI        1                         
        PushD        $global-memory-block      
        PushI        16                        
        Add                                    %% b
        LoadI                                  
        PushD        $global-memory-block      
        PushI        12                        
        Add                                    %% a
        LoadI                                  
        PushD        $stack-pointer            
        LoadI                                  
        PushI        -4                        
        Add                                    
        Duplicate                              
        PushD        $stack-pointer            
        Exchange                               
        StoreI                                 
        Exchange                               
        StoreI                                 
        PushD        $stack-pointer            
        LoadI                                  
        PushI        -4                        
        Add                                    
        Duplicate                              
        PushD        $stack-pointer            
        Exchange                               
        StoreI                                 
        Exchange                               
        StoreI                                 
        PushD        $stack-pointer            
        LoadI                                  
        PushI        -1                        
        Add                                    
        Duplicate                              
        PushD        $stack-pointer            
        Exchange                               
        StoreI                                 
        Exchange                               
        StoreC                                 
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
        PushI        28                        
        Add                                    %% b1
        PushD        $global-memory-block      
        PushI        4                         
        Add                                    %% bill0
        LoadI                                  
        PushD        $global-memory-block      
        PushI        8                         
        Add                                    %% bill1
        LoadI                                  
        Label        -compare-15-sub           
        Subtract                               
        JumpFalse    -compare-15-true          
        Jump         -compare-15-false         
        Label        -compare-15-true          
        PushI        1                         
        Jump         -compare-15-join          
        Label        -compare-15-false         
        PushI        0                         
        Jump         -compare-15-join          
        Label        -compare-15-join          
        StoreC                                 
        PushD        $global-memory-block      
        PushI        29                        
        Add                                    %% b2
        PushD        $global-memory-block      
        PushI        4                         
        Add                                    %% bill0
        LoadI                                  
        PushD        $global-memory-block      
        PushI        4                         
        Add                                    %% bill0
        LoadI                                  
        Label        -compare-16-sub           
        Subtract                               
        JumpFalse    -compare-16-true          
        Jump         -compare-16-false         
        Label        -compare-16-true          
        PushI        1                         
        Jump         -compare-16-join          
        Label        -compare-16-false         
        PushI        0                         
        Jump         -compare-16-join          
        Label        -compare-16-join          
        StoreC                                 
        PushD        $global-memory-block      
        PushI        30                        
        Add                                    %% inside
        PushPC                                 
        Jump         -function-definition-17-ends 
        Label        -function-definition-17-starts 
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
        PushI        -8                        
        Add                                    
        LoadI                                  
        PushD        $frame-pointer            
        LoadI                                  
        PushI        -4                        
        Add                                    
        LoadI                                  
        PushD        $frame-pointer            
        Exchange                               
        StoreI                                 
        PushI        28                        
        PushD        $stack-pointer            
        LoadI                                  
        Add                                    
        PushD        $stack-pointer            
        Exchange                               
        StoreI                                 
        Return                                 
        Jump         $$function-no-return      
        Label        -function-definition-17-ends 
        PushI        1                         
        Add                                    
        StoreI                                 
        PushD        $global-memory-block      
        PushI        34                        
        Add                                    %% inside2
        PushPC                                 
        Jump         -function-definition-18-ends 
        Label        -function-definition-18-starts 
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
        Jump         $$function-no-return      
        Label        -function-definition-18-ends 
        PushI        1                         
        Add                                    
        StoreI                                 
        PushD        $global-memory-block      
        PushI        30                        
        Add                                    %% inside
        LoadI                                  
        PushD        $global-memory-block      
        PushI        12                        
        Add                                    %% a
        LoadI                                  
        PushD        $global-memory-block      
        PushI        16                        
        Add                                    %% b
        LoadI                                  
        PushD        $global-memory-block      
        PushI        12                        
        Add                                    %% a
        LoadI                                  
        PushD        $global-memory-block      
        PushI        16                        
        Add                                    %% b
        LoadI                                  
        PushD        $global-memory-block      
        PushI        12                        
        Add                                    %% a
        LoadI                                  
        PushD        $stack-pointer            
        LoadI                                  
        PushI        -4                        
        Add                                    
        Duplicate                              
        PushD        $stack-pointer            
        Exchange                               
        StoreI                                 
        Exchange                               
        StoreI                                 
        PushD        $stack-pointer            
        LoadI                                  
        PushI        -4                        
        Add                                    
        Duplicate                              
        PushD        $stack-pointer            
        Exchange                               
        StoreI                                 
        Exchange                               
        StoreI                                 
        PushD        $stack-pointer            
        LoadI                                  
        PushI        -4                        
        Add                                    
        Duplicate                              
        PushD        $stack-pointer            
        Exchange                               
        StoreI                                 
        Exchange                               
        StoreI                                 
        PushD        $stack-pointer            
        LoadI                                  
        PushI        -4                        
        Add                                    
        Duplicate                              
        PushD        $stack-pointer            
        Exchange                               
        StoreI                                 
        Exchange                               
        StoreI                                 
        PushD        $stack-pointer            
        LoadI                                  
        PushI        -4                        
        Add                                    
        Duplicate                              
        PushD        $stack-pointer            
        Exchange                               
        StoreI                                 
        Exchange                               
        StoreI                                 
        CallV                                  
        PushD        $stack-pointer            
        LoadI                                  
        Pop                                    
        PushD        $global-memory-block      
        PushI        4                         
        Add                                    %% bill0
        LoadI                                  
        PushI        1                         
        PushD        $global-memory-block      
        PushI        16                        
        Add                                    %% b
        LoadI                                  
        PushD        $global-memory-block      
        PushI        12                        
        Add                                    %% a
        LoadI                                  
        PushD        $stack-pointer            
        LoadI                                  
        PushI        -4                        
        Add                                    
        Duplicate                              
        PushD        $stack-pointer            
        Exchange                               
        StoreI                                 
        Exchange                               
        StoreI                                 
        PushD        $stack-pointer            
        LoadI                                  
        PushI        -4                        
        Add                                    
        Duplicate                              
        PushD        $stack-pointer            
        Exchange                               
        StoreI                                 
        Exchange                               
        StoreI                                 
        PushD        $stack-pointer            
        LoadI                                  
        PushI        -1                        
        Add                                    
        Duplicate                              
        PushD        $stack-pointer            
        Exchange                               
        StoreI                                 
        Exchange                               
        StoreC                                 
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
        Pop                                    
        Pop                                    
        PushD        $global-memory-block      
        PushI        12                        
        Add                                    %% a
        LoadI                                  
        PushD        $print-format-integer     
        Printf                                 
        PushD        $print-format-space       
        Printf                                 
        PushD        $global-memory-block      
        PushI        16                        
        Add                                    %% b
        LoadI                                  
        PushD        $print-format-integer     
        Printf                                 
        PushD        $print-format-space       
        Printf                                 
        PushD        $global-memory-block      
        PushI        20                        
        Add                                    %% re2
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
        PushI        0                         
        Add                                    %% bill2
        LoadI                                  
        PushI        0                         
        PushD        $global-memory-block      
        PushI        8                         
        Add                                    %% bill1
        LoadI                                  
        PushD        $global-memory-block      
        PushI        4                         
        Add                                    %% bill0
        LoadI                                  
        PushD        $stack-pointer            
        LoadI                                  
        PushI        -4                        
        Add                                    
        Duplicate                              
        PushD        $stack-pointer            
        Exchange                               
        StoreI                                 
        Exchange                               
        StoreI                                 
        PushD        $stack-pointer            
        LoadI                                  
        PushI        -4                        
        Add                                    
        Duplicate                              
        PushD        $stack-pointer            
        Exchange                               
        StoreI                                 
        Exchange                               
        StoreI                                 
        PushD        $stack-pointer            
        LoadI                                  
        PushI        -1                        
        Add                                    
        Duplicate                              
        PushD        $stack-pointer            
        Exchange                               
        StoreI                                 
        Exchange                               
        StoreC                                 
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
        PushI        0                         
        PushD        $global-memory-block      
        PushI        16                        
        Add                                    %% b
        LoadI                                  
        PushD        $global-memory-block      
        PushI        12                        
        Add                                    %% a
        LoadI                                  
        PushD        $stack-pointer            
        LoadI                                  
        PushI        -4                        
        Add                                    
        Duplicate                              
        PushD        $stack-pointer            
        Exchange                               
        StoreI                                 
        Exchange                               
        StoreI                                 
        PushD        $stack-pointer            
        LoadI                                  
        PushI        -4                        
        Add                                    
        Duplicate                              
        PushD        $stack-pointer            
        Exchange                               
        StoreI                                 
        Exchange                               
        StoreI                                 
        PushD        $stack-pointer            
        LoadI                                  
        PushI        -1                        
        Add                                    
        Duplicate                              
        PushD        $stack-pointer            
        Exchange                               
        StoreI                                 
        Exchange                               
        StoreC                                 
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
        Call         $$print-rational          
        PushD        $print-format-space       
        Printf                                 
        PushD        $global-memory-block      
        PushI        0                         
        Add                                    %% bill2
        LoadI                                  
        PushI        0                         
        PushD        $global-memory-block      
        PushI        8                         
        Add                                    %% bill1
        LoadI                                  
        PushD        $global-memory-block      
        PushI        4                         
        Add                                    %% bill0
        LoadI                                  
        PushD        $stack-pointer            
        LoadI                                  
        PushI        -4                        
        Add                                    
        Duplicate                              
        PushD        $stack-pointer            
        Exchange                               
        StoreI                                 
        Exchange                               
        StoreI                                 
        PushD        $stack-pointer            
        LoadI                                  
        PushI        -4                        
        Add                                    
        Duplicate                              
        PushD        $stack-pointer            
        Exchange                               
        StoreI                                 
        Exchange                               
        StoreI                                 
        PushD        $stack-pointer            
        LoadI                                  
        PushI        -1                        
        Add                                    
        Duplicate                              
        PushD        $stack-pointer            
        Exchange                               
        StoreI                                 
        Exchange                               
        StoreC                                 
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
        PushI        1                         
        PushD        $global-memory-block      
        PushI        16                        
        Add                                    %% b
        LoadI                                  
        PushD        $global-memory-block      
        PushI        12                        
        Add                                    %% a
        LoadI                                  
        PushD        $stack-pointer            
        LoadI                                  
        PushI        -4                        
        Add                                    
        Duplicate                              
        PushD        $stack-pointer            
        Exchange                               
        StoreI                                 
        Exchange                               
        StoreI                                 
        PushD        $stack-pointer            
        LoadI                                  
        PushI        -4                        
        Add                                    
        Duplicate                              
        PushD        $stack-pointer            
        Exchange                               
        StoreI                                 
        Exchange                               
        StoreI                                 
        PushD        $stack-pointer            
        LoadI                                  
        PushI        -1                        
        Add                                    
        Duplicate                              
        PushD        $stack-pointer            
        Exchange                               
        StoreI                                 
        Exchange                               
        StoreC                                 
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
        Call         $$print-rational          
        PushD        $print-format-space       
        Printf                                 
        PushD        $global-memory-block      
        PushI        0                         
        Add                                    %% bill2
        LoadI                                  
        PushI        1                         
        PushD        $global-memory-block      
        PushI        8                         
        Add                                    %% bill1
        LoadI                                  
        PushD        $global-memory-block      
        PushI        4                         
        Add                                    %% bill0
        LoadI                                  
        PushD        $stack-pointer            
        LoadI                                  
        PushI        -4                        
        Add                                    
        Duplicate                              
        PushD        $stack-pointer            
        Exchange                               
        StoreI                                 
        Exchange                               
        StoreI                                 
        PushD        $stack-pointer            
        LoadI                                  
        PushI        -4                        
        Add                                    
        Duplicate                              
        PushD        $stack-pointer            
        Exchange                               
        StoreI                                 
        Exchange                               
        StoreI                                 
        PushD        $stack-pointer            
        LoadI                                  
        PushI        -1                        
        Add                                    
        Duplicate                              
        PushD        $stack-pointer            
        Exchange                               
        StoreI                                 
        Exchange                               
        StoreC                                 
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
        PushI        0                         
        PushD        $global-memory-block      
        PushI        16                        
        Add                                    %% b
        LoadI                                  
        PushD        $global-memory-block      
        PushI        16                        
        Add                                    %% b
        LoadI                                  
        PushD        $stack-pointer            
        LoadI                                  
        PushI        -4                        
        Add                                    
        Duplicate                              
        PushD        $stack-pointer            
        Exchange                               
        StoreI                                 
        Exchange                               
        StoreI                                 
        PushD        $stack-pointer            
        LoadI                                  
        PushI        -4                        
        Add                                    
        Duplicate                              
        PushD        $stack-pointer            
        Exchange                               
        StoreI                                 
        Exchange                               
        StoreI                                 
        PushD        $stack-pointer            
        LoadI                                  
        PushI        -1                        
        Add                                    
        Duplicate                              
        PushD        $stack-pointer            
        Exchange                               
        StoreI                                 
        Exchange                               
        StoreC                                 
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
        Call         $$print-rational          
        PushD        $print-format-space       
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        PushD        $global-memory-block      
        PushI        30                        
        Add                                    %% inside
        PushD        $global-memory-block      
        PushI        34                        
        Add                                    %% inside2
        LoadI                                  
        StoreI                                 
        PushD        $global-memory-block      
        PushI        30                        
        Add                                    %% inside
        LoadI                                  
        PushD        $global-memory-block      
        PushI        12                        
        Add                                    %% a
        LoadI                                  
        PushD        $global-memory-block      
        PushI        12                        
        Add                                    %% a
        LoadI                                  
        PushD        $global-memory-block      
        PushI        12                        
        Add                                    %% a
        LoadI                                  
        PushD        $global-memory-block      
        PushI        12                        
        Add                                    %% a
        LoadI                                  
        PushD        $global-memory-block      
        PushI        12                        
        Add                                    %% a
        LoadI                                  
        PushD        $stack-pointer            
        LoadI                                  
        PushI        -4                        
        Add                                    
        Duplicate                              
        PushD        $stack-pointer            
        Exchange                               
        StoreI                                 
        Exchange                               
        StoreI                                 
        PushD        $stack-pointer            
        LoadI                                  
        PushI        -4                        
        Add                                    
        Duplicate                              
        PushD        $stack-pointer            
        Exchange                               
        StoreI                                 
        Exchange                               
        StoreI                                 
        PushD        $stack-pointer            
        LoadI                                  
        PushI        -4                        
        Add                                    
        Duplicate                              
        PushD        $stack-pointer            
        Exchange                               
        StoreI                                 
        Exchange                               
        StoreI                                 
        PushD        $stack-pointer            
        LoadI                                  
        PushI        -4                        
        Add                                    
        Duplicate                              
        PushD        $stack-pointer            
        Exchange                               
        StoreI                                 
        Exchange                               
        StoreI                                 
        PushD        $stack-pointer            
        LoadI                                  
        PushI        -4                        
        Add                                    
        Duplicate                              
        PushD        $stack-pointer            
        Exchange                               
        StoreI                                 
        Exchange                               
        StoreI                                 
        CallV                                  
        PushD        $stack-pointer            
        LoadI                                  
        Pop                                    
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

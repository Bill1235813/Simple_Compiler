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
        DataZ        35                        
        Label        $$main                    
        PushD        $global-memory-block      
        PushI        0                         
        Add                                    %% _ch
        PushI        97                        
        StoreC                                 
        PushD        $global-memory-block      
        PushI        1                         
        Add                                    %% _$string
        DLabel       -string-2-constant        
        DataC        49                        %% "12345"
        DataC        50                        
        DataC        51                        
        DataC        52                        
        DataC        53                        
        DataC        0                         
        PushD        -string-2-constant        
        StoreI                                 
        PushD        $global-memory-block      
        PushI        5                         
        Add                                    %% _s
        DLabel       -string-3-constant        
        DataC        66                        %% "Bill"
        DataC        105                       
        DataC        108                       
        DataC        108                       
        DataC        0                         
        PushD        -string-3-constant        
        StoreI                                 
        PushD        $global-memory-block      
        PushI        9                         
        Add                                    %% _f1
        PushF        0.800000                  
        StoreF                                 
        PushD        $global-memory-block      
        PushI        17                        
        Add                                    %% _i1
        PushI        2                         
        StoreI                                 
        PushD        $global-memory-block      
        PushI        21                        
        Add                                    %% _bool
        PushD        $global-memory-block      
        PushI        17                        
        Add                                    %% _i1
        LoadI                                  
        PushD        $global-memory-block      
        PushI        9                         
        Add                                    %% _f1
        LoadF                                  
        ConvertI                               
        Label        -compare-4-sub            
        Subtract                               
        JumpPos      -compare-4-true           
        Jump         -compare-4-false          
        Label        -compare-4-true           
        PushI        1                         
        Jump         -compare-4-join           
        Label        -compare-4-false          
        PushI        0                         
        Jump         -compare-4-join           
        Label        -compare-4-join           
        StoreC                                 
        PushD        $global-memory-block      
        PushI        17                        
        Add                                    %% _i1
        PushI        2                         
        PushI        2                         
        PushD        $global-memory-block      
        PushI        17                        
        Add                                    %% _i1
        LoadI                                  
        Multiply                               
        Add                                    
        PushD        $global-memory-block      
        PushI        17                        
        Add                                    %% _i1
        LoadI                                  
        PushI        1                         
        PushI        2                         
        Multiply                               
        Add                                    
        Duplicate                              
        JumpFalse    $$i-divide-by-zero        
        Divide                                 
        PushF        2.500000                  
        ConvertI                               
        Add                                    
        StoreI                                 
        PushD        $global-memory-block      
        PushI        0                         
        Add                                    %% _ch
        LoadC                                  
        PushD        $print-format-character   
        Printf                                 
        PushD        $print-format-space       
        Printf                                 
        PushD        $global-memory-block      
        PushI        1                         
        Add                                    %% _$string
        LoadI                                  
        PushD        $print-format-string      
        Printf                                 
        PushD        $print-format-space       
        Printf                                 
        PushD        $global-memory-block      
        PushI        5                         
        Add                                    %% _s
        LoadI                                  
        PushD        $print-format-string      
        Printf                                 
        PushD        $print-format-space       
        Printf                                 
        PushD        $global-memory-block      
        PushI        9                         
        Add                                    %% _f1
        LoadF                                  
        PushD        $print-format-floating    
        Printf                                 
        PushD        $print-format-space       
        Printf                                 
        PushD        $print-format-tab         
        Printf                                 
        PushD        $print-format-space       
        Printf                                 
        PushD        $global-memory-block      
        PushI        17                        
        Add                                    %% _i1
        LoadI                                  
        PushD        $print-format-integer     
        Printf                                 
        PushD        $print-format-space       
        Printf                                 
        PushD        $global-memory-block      
        PushI        21                        
        Add                                    %% _bool
        LoadC                                  
        JumpTrue     -print-boolean-5-true     
        PushD        $boolean-false-string     
        Jump         -print-boolean-5-join     
        Label        -print-boolean-5-true     
        PushD        $boolean-true-string      
        Label        -print-boolean-5-join     
        PushD        $print-format-boolean     
        Printf                                 
        PushD        $print-format-space       
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        PushD        $global-memory-block      
        PushI        22                        
        Add                                    %% _f1
        PushF        -20.000000                
        StoreF                                 
        PushD        $global-memory-block      
        PushI        22                        
        Add                                    %% _f1
        PushF        2.030000                  
        PushD        $global-memory-block      
        PushI        22                        
        Add                                    %% _f1
        LoadF                                  
        FMultiply                              
        PushI        1                         
        PushI        2                         
        Add                                    
        ConvertF                               
        FAdd                                   
        StoreF                                 
        PushD        $global-memory-block      
        PushI        22                        
        Add                                    %% _f1
        PushD        $global-memory-block      
        PushI        22                        
        Add                                    %% _f1
        LoadF                                  
        ConvertI                               
        ConvertF                               
        StoreF                                 
        PushD        $global-memory-block      
        PushI        5                         
        Add                                    %% _s
        DLabel       -string-6-constant        
        DataC        49                        %% "123"
        DataC        50                        
        DataC        51                        
        DataC        0                         
        PushD        -string-6-constant        
        StoreI                                 
        PushD        $global-memory-block      
        PushI        22                        
        Add                                    %% _f1
        LoadF                                  
        PushD        $print-format-floating    
        Printf                                 
        PushD        $print-format-space       
        Printf                                 
        PushD        $global-memory-block      
        PushI        5                         
        Add                                    %% _s
        LoadI                                  
        PushD        $print-format-string      
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        PushD        $global-memory-block      
        PushI        22                        
        Add                                    %% splus
        PushD        $global-memory-block      
        PushI        5                         
        Add                                    %% _s
        LoadI                                  
        StoreI                                 
        PushD        $global-memory-block      
        PushI        26                        
        Add                                    %% scomp
        PushD        $global-memory-block      
        PushI        22                        
        Add                                    %% splus
        LoadI                                  
        PushD        $global-memory-block      
        PushI        5                         
        Add                                    %% _s
        LoadI                                  
        Label        -compare-7-sub            
        Subtract                               
        JumpFalse    -compare-7-true           
        Jump         -compare-7-false          
        Label        -compare-7-true           
        PushI        1                         
        Jump         -compare-7-join           
        Label        -compare-7-false          
        PushI        0                         
        Jump         -compare-7-join           
        Label        -compare-7-join           
        StoreC                                 
        PushD        $global-memory-block      
        PushI        27                        
        Add                                    %% fcomp
        PushF        1.000000                  
        PushF        1.500000                  
        ConvertI                               
        ConvertF                               
        Label        -compare-8-sub            
        FSubtract                              
        JumpFNeg     -compare-8-false          
        Jump         -compare-8-true           
        Label        -compare-8-true           
        PushI        1                         
        Jump         -compare-8-join           
        Label        -compare-8-false          
        PushI        0                         
        Jump         -compare-8-join           
        Label        -compare-8-join           
        StoreC                                 
        PushD        $global-memory-block      
        PushI        28                        
        Add                                    %% icomp
        PushI        1234                      
        PushI        12345                     
        PushI        127                       
        BTAnd                                  
        Nop                                    
        Label        -compare-9-sub            
        Subtract                               
        JumpPos      -compare-9-true           
        Jump         -compare-9-false          
        Label        -compare-9-true           
        PushI        1                         
        Jump         -compare-9-join           
        Label        -compare-9-false          
        PushI        0                         
        Jump         -compare-9-join           
        Label        -compare-9-join           
        StoreC                                 
        PushD        $global-memory-block      
        PushI        29                        
        Add                                    %% bcomp
        PushD        $global-memory-block      
        PushI        27                        
        Add                                    %% fcomp
        LoadC                                  
        PushD        $global-memory-block      
        PushI        28                        
        Add                                    %% icomp
        LoadC                                  
        Label        -compare-10-sub           
        Xor                                    
        JumpFalse    -compare-10-false         
        Jump         -compare-10-true          
        Label        -compare-10-true          
        PushI        1                         
        Jump         -compare-10-join          
        Label        -compare-10-false         
        PushI        0                         
        Jump         -compare-10-join          
        Label        -compare-10-join          
        StoreC                                 
        PushD        $global-memory-block      
        PushI        30                        
        Add                                    %% ch
        PushI        97                        
        StoreC                                 
        PushD        $global-memory-block      
        PushI        31                        
        Add                                    %% ccomp
        PushD        $global-memory-block      
        PushI        0                         
        Add                                    %% _ch
        LoadC                                  
        PushD        $global-memory-block      
        PushI        30                        
        Add                                    %% ch
        LoadC                                  
        Label        -compare-11-sub           
        Subtract                               
        JumpPos      -compare-11-false         
        Jump         -compare-11-true          
        Label        -compare-11-true          
        PushI        1                         
        Jump         -compare-11-join          
        Label        -compare-11-false         
        PushI        0                         
        Jump         -compare-11-join          
        Label        -compare-11-join          
        StoreC                                 
        PushD        $global-memory-block      
        PushI        32                        
        Add                                    %% ccomp2
        PushD        $global-memory-block      
        PushI        0                         
        Add                                    %% _ch
        LoadC                                  
        PushD        $global-memory-block      
        PushI        30                        
        Add                                    %% ch
        LoadC                                  
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
        StoreC                                 
        PushD        $global-memory-block      
        PushI        33                        
        Add                                    %% _ch
        PushI        98                        
        StoreC                                 
        PushD        $global-memory-block      
        PushI        34                        
        Add                                    %% ccomp3
        PushD        $global-memory-block      
        PushI        33                        
        Add                                    %% _ch
        LoadC                                  
        PushD        $global-memory-block      
        PushI        30                        
        Add                                    %% ch
        LoadC                                  
        Label        -compare-13-sub           
        Subtract                               
        JumpPos      -compare-13-false         
        Jump         -compare-13-true          
        Label        -compare-13-true          
        PushI        1                         
        Jump         -compare-13-join          
        Label        -compare-13-false         
        PushI        0                         
        Jump         -compare-13-join          
        Label        -compare-13-join          
        StoreC                                 
        PushD        $global-memory-block      
        PushI        26                        
        Add                                    %% scomp
        LoadC                                  
        JumpTrue     -print-boolean-14-true    
        PushD        $boolean-false-string     
        Jump         -print-boolean-14-join    
        Label        -print-boolean-14-true    
        PushD        $boolean-true-string      
        Label        -print-boolean-14-join    
        PushD        $print-format-boolean     
        Printf                                 
        PushD        $print-format-space       
        Printf                                 
        PushD        $global-memory-block      
        PushI        27                        
        Add                                    %% fcomp
        LoadC                                  
        JumpTrue     -print-boolean-15-true    
        PushD        $boolean-false-string     
        Jump         -print-boolean-15-join    
        Label        -print-boolean-15-true    
        PushD        $boolean-true-string      
        Label        -print-boolean-15-join    
        PushD        $print-format-boolean     
        Printf                                 
        PushD        $print-format-space       
        Printf                                 
        PushD        $global-memory-block      
        PushI        28                        
        Add                                    %% icomp
        LoadC                                  
        JumpTrue     -print-boolean-16-true    
        PushD        $boolean-false-string     
        Jump         -print-boolean-16-join    
        Label        -print-boolean-16-true    
        PushD        $boolean-true-string      
        Label        -print-boolean-16-join    
        PushD        $print-format-boolean     
        Printf                                 
        PushD        $print-format-space       
        Printf                                 
        PushD        $global-memory-block      
        PushI        29                        
        Add                                    %% bcomp
        LoadC                                  
        JumpTrue     -print-boolean-17-true    
        PushD        $boolean-false-string     
        Jump         -print-boolean-17-join    
        Label        -print-boolean-17-true    
        PushD        $boolean-true-string      
        Label        -print-boolean-17-join    
        PushD        $print-format-boolean     
        Printf                                 
        PushD        $print-format-space       
        Printf                                 
        PushD        $global-memory-block      
        PushI        31                        
        Add                                    %% ccomp
        LoadC                                  
        JumpTrue     -print-boolean-18-true    
        PushD        $boolean-false-string     
        Jump         -print-boolean-18-join    
        Label        -print-boolean-18-true    
        PushD        $boolean-true-string      
        Label        -print-boolean-18-join    
        PushD        $print-format-boolean     
        Printf                                 
        PushD        $print-format-space       
        Printf                                 
        PushD        $global-memory-block      
        PushI        32                        
        Add                                    %% ccomp2
        LoadC                                  
        JumpTrue     -print-boolean-19-true    
        PushD        $boolean-false-string     
        Jump         -print-boolean-19-join    
        Label        -print-boolean-19-true    
        PushD        $boolean-true-string      
        Label        -print-boolean-19-join    
        PushD        $print-format-boolean     
        Printf                                 
        PushD        $print-format-space       
        Printf                                 
        PushD        $global-memory-block      
        PushI        34                        
        Add                                    %% ccomp3
        LoadC                                  
        JumpTrue     -print-boolean-20-true    
        PushD        $boolean-false-string     
        Jump         -print-boolean-20-join    
        Label        -print-boolean-20-true    
        PushD        $boolean-true-string      
        Label        -print-boolean-20-join    
        PushD        $print-format-boolean     
        Printf                                 
        PushD        $print-format-space       
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        PushD        $print-format-space       
        Printf                                 
        PushD        $global-memory-block      
        PushI        9                         
        Add                                    %% _f1
        LoadF                                  
        PushD        $print-format-floating    
        Printf                                 
        PushD        $print-format-space       
        Printf                                 
        PushD        $global-memory-block      
        PushI        17                        
        Add                                    %% _i1
        LoadI                                  
        PushI        0                         
        Duplicate                              
        JumpFalse    $$i-divide-by-zero        
        Divide                                 
        PushD        $print-format-integer     
        Printf                                 
        PushD        $print-format-space       
        Printf                                 
        PushD        $global-memory-block      
        PushI        9                         
        Add                                    %% _f1
        LoadF                                  
        PushF        0.000000                  
        Duplicate                              
        JumpFZero    $$f-divide-by-zero        
        FDivide                                
        PushD        $print-format-floating    
        Printf                                 
        Halt                                   

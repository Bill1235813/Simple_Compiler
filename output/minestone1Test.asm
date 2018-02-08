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
        DLabel       -string-1-constant        
        DataC        49                        %% "12345"
        DataC        50                        
        DataC        51                        
        DataC        52                        
        DataC        53                        
        DataC        0                         
        PushD        -string-1-constant        
        StoreI                                 
        PushD        $global-memory-block      
        PushI        5                         
        Add                                    %% _s
        DLabel       -string-2-constant        
        DataC        66                        %% "Bill"
        DataC        105                       
        DataC        108                       
        DataC        108                       
        DataC        0                         
        PushD        -string-2-constant        
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
        Label        -compare-3-arg1           
        PushD        $global-memory-block      
        PushI        17                        
        Add                                    %% _i1
        LoadI                                  
        Label        -compare-3-arg2           
        PushD        $global-memory-block      
        PushI        9                         
        Add                                    %% _f1
        LoadF                                  
        ConvertI                               
        Label        -compare-3-sub            
        Subtract                               
        JumpPos      -compare-3-true           
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
        JumpTrue     -print-boolean-4-true     
        PushD        $boolean-false-string     
        Jump         -print-boolean-4-join     
        Label        -print-boolean-4-true     
        PushD        $boolean-true-string      
        Label        -print-boolean-4-join     
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
        DLabel       -string-5-constant        
        DataC        49                        %% "123"
        DataC        50                        
        DataC        51                        
        DataC        0                         
        PushD        -string-5-constant        
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
        Label        -compare-6-arg1           
        PushD        $global-memory-block      
        PushI        22                        
        Add                                    %% splus
        LoadI                                  
        Label        -compare-6-arg2           
        PushD        $global-memory-block      
        PushI        5                         
        Add                                    %% _s
        LoadI                                  
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
        StoreC                                 
        PushD        $global-memory-block      
        PushI        27                        
        Add                                    %% fcomp
        Label        -compare-7-arg1           
        PushF        1.000000                  
        Label        -compare-7-arg2           
        PushF        1.500000                  
        ConvertI                               
        ConvertF                               
        Label        -compare-7-sub            
        FSubtract                              
        JumpFNeg     -compare-7-false          
        Jump         -compare-7-true           
        Label        -compare-7-true           
        PushI        1                         
        Jump         -compare-7-join           
        Label        -compare-7-false          
        PushI        0                         
        Jump         -compare-7-join           
        Label        -compare-7-join           
        StoreC                                 
        PushD        $global-memory-block      
        PushI        28                        
        Add                                    %% icomp
        Label        -compare-8-arg1           
        PushI        1234                      
        Label        -compare-8-arg2           
        PushI        12345                     
        PushI        127                       
        BTAnd                                  
        Nop                                    
        Label        -compare-8-sub            
        Subtract                               
        JumpPos      -compare-8-true           
        Jump         -compare-8-false          
        Label        -compare-8-true           
        PushI        1                         
        Jump         -compare-8-join           
        Label        -compare-8-false          
        PushI        0                         
        Jump         -compare-8-join           
        Label        -compare-8-join           
        StoreC                                 
        PushD        $global-memory-block      
        PushI        29                        
        Add                                    %% bcomp
        Label        -compare-9-arg1           
        PushD        $global-memory-block      
        PushI        27                        
        Add                                    %% fcomp
        LoadC                                  
        Label        -compare-9-arg2           
        PushD        $global-memory-block      
        PushI        28                        
        Add                                    %% icomp
        LoadC                                  
        Label        -compare-9-sub            
        Xor                                    
        JumpFalse    -compare-9-false          
        Jump         -compare-9-true           
        Label        -compare-9-true           
        PushI        1                         
        Jump         -compare-9-join           
        Label        -compare-9-false          
        PushI        0                         
        Jump         -compare-9-join           
        Label        -compare-9-join           
        StoreC                                 
        PushD        $global-memory-block      
        PushI        30                        
        Add                                    %% ch
        PushI        97                        
        StoreC                                 
        PushD        $global-memory-block      
        PushI        31                        
        Add                                    %% ccomp
        Label        -compare-10-arg1          
        PushD        $global-memory-block      
        PushI        0                         
        Add                                    %% _ch
        LoadC                                  
        Label        -compare-10-arg2          
        PushD        $global-memory-block      
        PushI        30                        
        Add                                    %% ch
        LoadC                                  
        Label        -compare-10-sub           
        Subtract                               
        JumpPos      -compare-10-false         
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
        PushI        32                        
        Add                                    %% ccomp2
        Label        -compare-11-arg1          
        PushD        $global-memory-block      
        PushI        0                         
        Add                                    %% _ch
        LoadC                                  
        Label        -compare-11-arg2          
        PushD        $global-memory-block      
        PushI        30                        
        Add                                    %% ch
        LoadC                                  
        Label        -compare-11-sub           
        Subtract                               
        JumpNeg      -compare-11-true          
        Jump         -compare-11-false         
        Label        -compare-11-true          
        PushI        1                         
        Jump         -compare-11-join          
        Label        -compare-11-false         
        PushI        0                         
        Jump         -compare-11-join          
        Label        -compare-11-join          
        StoreC                                 
        PushD        $global-memory-block      
        PushI        33                        
        Add                                    %% _ch
        PushI        98                        
        StoreC                                 
        PushD        $global-memory-block      
        PushI        34                        
        Add                                    %% ccomp3
        Label        -compare-12-arg1          
        PushD        $global-memory-block      
        PushI        33                        
        Add                                    %% _ch
        LoadC                                  
        Label        -compare-12-arg2          
        PushD        $global-memory-block      
        PushI        30                        
        Add                                    %% ch
        LoadC                                  
        Label        -compare-12-sub           
        Subtract                               
        JumpPos      -compare-12-false         
        Jump         -compare-12-true          
        Label        -compare-12-true          
        PushI        1                         
        Jump         -compare-12-join          
        Label        -compare-12-false         
        PushI        0                         
        Jump         -compare-12-join          
        Label        -compare-12-join          
        StoreC                                 
        PushD        $global-memory-block      
        PushI        26                        
        Add                                    %% scomp
        LoadC                                  
        JumpTrue     -print-boolean-13-true    
        PushD        $boolean-false-string     
        Jump         -print-boolean-13-join    
        Label        -print-boolean-13-true    
        PushD        $boolean-true-string      
        Label        -print-boolean-13-join    
        PushD        $print-format-boolean     
        Printf                                 
        PushD        $print-format-space       
        Printf                                 
        PushD        $global-memory-block      
        PushI        27                        
        Add                                    %% fcomp
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
        PushI        28                        
        Add                                    %% icomp
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
        PushI        29                        
        Add                                    %% bcomp
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
        PushI        31                        
        Add                                    %% ccomp
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
        PushI        32                        
        Add                                    %% ccomp2
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
        PushI        34                        
        Add                                    %% ccomp3
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

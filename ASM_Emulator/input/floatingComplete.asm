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
        DLabel       $print-format-boolean     
        DataC        37                        %% "%s"
        DataC        115                       
        DataC        0                         
        DLabel       $print-format-newline     
        DataC        10                        %% "\n"
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
        DataZ        57                        
        Label        $$main                    
        PushD        $global-memory-block      
        PushI        0                         
        Add                                    %% avogadro
        PushF        602200000000000000000000.000000 
        StoreF                                 
        PushD        $global-memory-block      
        PushI        8                         
        Add                                    %% pi
        PushF        3.141590                  
        StoreF                                 
        PushD        $global-memory-block      
        PushI        16                        
        Add                                    %% twoPi
        PushD        $global-memory-block      
        PushI        8                         
        Add                                    %% pi
        LoadF                                  
        PushD        $global-memory-block      
        PushI        8                         
        Add                                    %% pi
        LoadF                                  
        FAdd                                   
        StoreF                                 
        PushD        $global-memory-block      
        PushI        24                        
        Add                                    %% squarePi
        PushD        $global-memory-block      
        PushI        8                         
        Add                                    %% pi
        LoadF                                  
        PushD        $global-memory-block      
        PushI        8                         
        Add                                    %% pi
        LoadF                                  
        FMultiply                              
        StoreF                                 
        PushD        $global-memory-block      
        PushI        32                        
        Add                                    %% morePi
        Label        -compare-1-arg1           
        PushD        $global-memory-block      
        PushI        24                        
        Add                                    %% squarePi
        LoadF                                  
        Label        -compare-1-arg2           
        PushD        $global-memory-block      
        PushI        16                        
        Add                                    %% twoPi
        LoadF                                  
        Label        -compare-1-sub            
        FSubtract                              
        JumpFPos     -compare-1-true           
        Jump         -compare-1-false          
        Label        -compare-1-true           
        PushI        1                         
        Jump         -compare-1-join           
        Label        -compare-1-false          
        PushI        0                         
        Jump         -compare-1-join           
        Label        -compare-1-join           
        StoreC                                 
        PushD        $global-memory-block      
        PushI        33                        
        Add                                    %% subPi
        PushD        $global-memory-block      
        PushI        24                        
        Add                                    %% squarePi
        LoadF                                  
        PushD        $global-memory-block      
        PushI        16                        
        Add                                    %% twoPi
        LoadF                                  
        FSubtract                              
        StoreF                                 
        PushD        $global-memory-block      
        PushI        41                        
        Add                                    %% dividePi
        PushD        $global-memory-block      
        PushI        24                        
        Add                                    %% squarePi
        LoadF                                  
        PushD        $global-memory-block      
        PushI        8                         
        Add                                    %% pi
        LoadF                                  
        Duplicate                              
        JumpFZero    $$f-divide-by-zero        
        FDivide                                
        StoreF                                 
        PushD        $global-memory-block      
        PushI        16                        
        Add                                    %% twoPi
        LoadF                                  
        PushD        $print-format-floating    
        Printf                                 
        PushD        $print-format-space       
        Printf                                 
        PushD        $global-memory-block      
        PushI        24                        
        Add                                    %% squarePi
        LoadF                                  
        PushD        $print-format-floating    
        Printf                                 
        PushD        $print-format-space       
        Printf                                 
        PushD        $global-memory-block      
        PushI        32                        
        Add                                    %% morePi
        LoadC                                  
        JumpTrue     -print-boolean-2-true     
        PushD        $boolean-false-string     
        Jump         -print-boolean-2-join     
        Label        -print-boolean-2-true     
        PushD        $boolean-true-string      
        Label        -print-boolean-2-join     
        PushD        $print-format-boolean     
        Printf                                 
        PushD        $print-format-space       
        Printf                                 
        PushD        $global-memory-block      
        PushI        33                        
        Add                                    %% subPi
        LoadF                                  
        PushD        $print-format-floating    
        Printf                                 
        PushD        $print-format-space       
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        PushD        $global-memory-block      
        PushI        41                        
        Add                                    %% dividePi
        LoadF                                  
        PushD        $print-format-floating    
        Printf                                 
        PushD        $global-memory-block      
        PushI        49                        
        Add                                    %% errorPi
        PushD        $global-memory-block      
        PushI        8                         
        Add                                    %% pi
        LoadF                                  
        PushF        0.000000                  
        Duplicate                              
        JumpFZero    $$f-divide-by-zero        
        FDivide                                
        StoreF                                 
        Halt                                   

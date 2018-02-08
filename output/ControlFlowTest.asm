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
        DataZ        12                        
        Label        $$main                    
        PushD        $global-memory-block      
        PushI        0                         
        Add                                    %% Bill
        PushI        7                         
        StoreI                                 
        Label        -if-4-condition           
        Label        -compare-1-arg1           
        PushD        $global-memory-block      
        PushI        0                         
        Add                                    %% Bill
        LoadI                                  
        Label        -compare-1-arg2           
        PushI        8                         
        Label        -compare-1-sub            
        Subtract                               
        JumpPos      -compare-1-false          
        Jump         -compare-1-true           
        Label        -compare-1-true           
        PushI        1                         
        Jump         -compare-1-join           
        Label        -compare-1-false          
        PushI        0                         
        Jump         -compare-1-join           
        Label        -compare-1-join           
        JumpFalse    -if-4-false               
        Label        -if-4-true                
        Label        -if-3-condition           
        Label        -compare-2-arg1           
        PushD        $global-memory-block      
        PushI        0                         
        Add                                    %% Bill
        LoadI                                  
        Label        -compare-2-arg2           
        PushI        6                         
        Label        -compare-2-sub            
        Subtract                               
        JumpNeg      -compare-2-false          
        Jump         -compare-2-true           
        Label        -compare-2-true           
        PushI        1                         
        Jump         -compare-2-join           
        Label        -compare-2-false          
        PushI        0                         
        Jump         -compare-2-join           
        Label        -compare-2-join           
        BNegate                                
        BNegate                                
        JumpFalse    -if-3-false               
        Label        -if-3-true                
        PushD        $global-memory-block      
        PushI        0                         
        Add                                    %% Bill
        LoadI                                  
        PushD        $print-format-integer     
        Printf                                 
        PushD        $print-format-space       
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        Jump         -if-3-join                
        Label        -if-3-false               
        Jump         -if-3-join                
        Label        -if-3-join                
        PushD        $global-memory-block      
        PushI        0                         
        Add                                    %% Bill
        LoadI                                  
        PushI        1                         
        Add                                    
        PushD        $print-format-integer     
        Printf                                 
        PushD        $print-format-space       
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        Jump         -if-4-join                
        Label        -if-4-false               
        PushD        $global-memory-block      
        PushI        0                         
        Add                                    %% Bill
        PushI        100                       
        StoreI                                 
        PushD        $global-memory-block      
        PushI        0                         
        Add                                    %% Bill
        LoadI                                  
        PushD        $print-format-integer     
        Printf                                 
        PushD        $print-format-space       
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        Jump         -if-4-join                
        Label        -if-4-join                
        PushD        $global-memory-block      
        PushI        4                         
        Add                                    %% i
        PushI        100                       
        StoreI                                 
        PushD        $global-memory-block      
        PushI        8                         
        Add                                    %% sum
        PushI        0                         
        StoreI                                 
        Label        -while-6-condition        
        Label        -compare-5-arg1           
        PushD        $global-memory-block      
        PushI        4                         
        Add                                    %% i
        LoadI                                  
        Label        -compare-5-arg2           
        PushI        0                         
        Label        -compare-5-sub            
        Subtract                               
        JumpPos      -compare-5-true           
        Jump         -compare-5-false          
        Label        -compare-5-true           
        PushI        1                         
        Jump         -compare-5-join           
        Label        -compare-5-false          
        PushI        0                         
        Jump         -compare-5-join           
        Label        -compare-5-join           
        JumpFalse    -while-6-ends             
        Label        -while-6-starts           
        PushD        $global-memory-block      
        PushI        8                         
        Add                                    %% sum
        PushD        $global-memory-block      
        PushI        8                         
        Add                                    %% sum
        LoadI                                  
        PushD        $global-memory-block      
        PushI        4                         
        Add                                    %% i
        LoadI                                  
        Add                                    
        StoreI                                 
        PushD        $global-memory-block      
        PushI        4                         
        Add                                    %% i
        PushD        $global-memory-block      
        PushI        4                         
        Add                                    %% i
        LoadI                                  
        PushI        1                         
        Subtract                               
        StoreI                                 
        Jump         -while-6-condition        
        Label        -while-6-ends             
        PushD        $global-memory-block      
        PushI        8                         
        Add                                    %% sum
        LoadI                                  
        PushD        $print-format-integer     
        Printf                                 
        PushD        $print-format-space       
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        Halt                                   

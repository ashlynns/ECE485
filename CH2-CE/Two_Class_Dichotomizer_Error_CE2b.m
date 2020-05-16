function[w1_classification_error, w2_classification_error] = Two_Class_Dichotomizer_Error_CE2b(w1_classifications, w2_classifications)
    
    w1_error_counter = 0; 
    w2_error_counter = 0;
    
    for i = 1:length(w1_classifications)
        if w1_classifications(i) ~= 1
            w1_error_counter = w1_error_counter +1; 
        end 
    end 
    
    w1_classification_error = (w1_error_counter/length(w1_classifications))*100;
       
    for i = 1:length(w2_classifications)
        if w2_classifications(i) ~= 2
            w2_error_counter = w2_error_counter +1; 
        end 
    end  
    
    w2_classification_error = (w2_error_counter/length(w2_classifications))*100;
    
end 
        

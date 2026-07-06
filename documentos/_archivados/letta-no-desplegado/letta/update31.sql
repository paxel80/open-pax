UPDATE provider_models 
SET handle='ollama/llama3.1:8b', 
    name='llama3.1:8b', 
    display_name='Llama 3.1 8B' 
WHERE handle='ollama/llama3:8b';

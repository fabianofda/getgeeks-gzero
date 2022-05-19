# chmod +x run.sh - > comando para dar permissao de exec do arquivo
#robot -d ./logs tests 
chmod +x run.sh
robot --xunit xunit.xml -d ./logs tests  

# chmod +x run.sh - > comando para dar permissao de exec do arquivo
#robot -d ./logs tests  

robot --xunit file xunit.xml -d ./logs tests  
*Settings*
Documentation    Attempt BeGeek test suite

Resource    ${EXECDIR}/resources/Base.robot

Suite Setup      Start Session For Attempt Be a Geek    
Test Template    Attempt Be a Geek                      

*Variables*
${logn_desc}    Descrição... Uma Distribuição Linux é composta por uma coleção de aplicativos
...             mais o kernel (núcleo) do sistema operacional. O Linux, na realidade, 
...             é apenas o nome do kernel do sistema operacional. Isto significa que todas 
...             as distribuições usam                                                            mesmo kernel

*Test Cases*
Whats only DDD        whats             11                O Whatsapp deve ter 11 digitos contando com o DDD
Whats only number     whats             999999999         O Whatsapp deve ter 11 digitos contando com o DDD
Whats empty           whats             ${EMPTY}          O Whatsapp deve ter 11 digitos contando com o DDD
Short desc            desc              Formato seu pc    A descrição deve ter no minimo 80 caracteres
Long desc             desc              ${logn_desc}      A descrição deve ter no máximo 255 caracteres
Empty desc            desc              ${EMPTY}          Informe a descrição do seu trabalho
Cost letters          cost              aaaa              Valor hora deve ser numérico
Cost alpha            cost              aa12              Valor hora deve ser numérico
Cost special chars    cost              @#$%              Valor hora deve ser numérico
Empty cost            cost              ${EMPTY}          Valor hora deve ser numérico
No printer repair     printer_repair    ${EMPTY}          Por favor, informe se você é um Geek Supremo
No work               work              ${EMPTY}          Por favor, selecione o modelo de trabalho
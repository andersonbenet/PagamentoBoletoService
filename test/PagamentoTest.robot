*** Settings ***
Resource  ../resource/PagamentoResource.robot

*** Test Cases ***
TC 001: Pagar Boleto na Cobrança
  Executar Pagamento

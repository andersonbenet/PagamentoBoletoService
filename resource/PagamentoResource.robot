*** Settings ***
Library  SudsLibrary
Library  OperatingSystem
Library  XML
Library  String
Library  BuiltIn



*** Variable ***
${WSDL_URL}  http://ws-cobranca.hom.sicredi.net:80/PagamentoBoletoBean/v2/PagamentoBoletoService?wsdl


*** Keywords ***
#TC 001: Pagar Boleto na Cobrança
Executar Pagamento

  Create Soap Client  ${WSDL_URL}
  ${MESSAGE}  Get File  ${CURDIR}\\xml\\payload_pagamento.xml
  ${MESSAGE}  Create Raw Soap Message  ${MESSAGE}

  Call Soap Method    regularizarBoletoCobranca    ${MESSAGE}
  ${RESPOSTA_XML}  Get Last Received

  ${text} =	Get Element Text	${RESPOSTA_XML}	Envelope
  Log  Mensagem recebida:\n${RESPOSTA_XML}

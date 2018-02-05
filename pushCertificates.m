openssl pkcs12 -in asukabuDebugPush.p12 -out asukabu_cer_push1.pem -nodes -clcerts

openssl x509 -enddate -noout -in asukabu_cer_push1.pem
--> notAfter=Dec  4 09:18:49 2018 GMT

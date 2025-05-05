Come concedere tutti i privilegi a un utente in Oracle

Introduzione: In questa lezione vediamo come utilizzare il comando Oracle GRANT ALL PRIVILEGES per concedere tutti i privilegi a un utente.

Concedere tutti i privilegi a un nuovo utente
Per prima cosa, creiamo un nuovo utente chiamato super con una password:

CREATE USER super IDENTIFIED BY abcd1234;

Nota: è consigliato utilizzare una password sicura al posto di "abcd1234".

Successivamente, utilizziamo il comando GRANT ALL PRIVILEGES per assegnare tutti i privilegi all’utente super:

GRANT ALL PRIVILEGES TO super;

Ora puoi accedere al database Oracle come utente super:

Enter user-name: super@pdborcl
Enter password:

Per verificare i privilegi dell’utente super:

SELECT * FROM session_privs
ORDER BY privilege;

Esempio di output (Oracle 12c):

PRIVILEGE                              
----------------------------------------
ADMINISTER ANY SQL TUNING SET           
ADMINISTER DATABASE TRIGGER             
ADMINISTER RESOURCE MANAGER             
ADMINISTER SQL MANAGEMENT OBJECT        
ADMINISTER SQL TUNING SET               
ADVISOR                                 
ALTER ANY ANALYTIC VIEW                 
ALTER ANY ASSEMBLY                      
ALTER ANY ATTRIBUTE DIMENSION           
ALTER ANY CLUSTER                       
ALTER ANY CUBE                          
... (segue elenco esteso dei privilegi) ...
UNLIMITED TABLESPACE                    
UPDATE ANY CUBE                         
UPDATE ANY CUBE BUILD PROCESS          
UPDATE ANY CUBE DIMENSION               
UPDATE ANY TABLE                        
USE ANY JOB RESOURCE                    
USE ANY SQL TRANSLATION PROFILE         

Concedere tutti i privilegi a un utente esistente
Per concedere tutti i privilegi a un utente già esistente, basta eseguire:

GRANT ALL PRIVILEGES TO alice;

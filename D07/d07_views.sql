create or replace view d07_acquisto_vw as
select a.id,
       a.fornitore_id,
       f.fornitore,  
       a.prodotto_id,
       p.prodotto,
       p.prezzo_acquisto,
       p.tipo_prodotto_id,
       tp.tipo_prodotto,
       a.data,
       a.quantita,
       a.quantita*p.prezzo_acquisto importo
  from d07_acquisto a
  join d07_fornitore f on a.fornitore_id = f.id
  join d07_prodotto p on a.prodotto_id = p.id
  join d07_tipo_prodotto tp on p.tipo_prodotto_id = tp.id;

  create or replace view d07_prodotto_vw as
select p.ID,p.TIPO_PRODOTTO_ID,p.PRODOTTO,p.PREZZO_ACQUISTO,p.PREZZO_VENDITA,tp.TIPO_PRODOTTO,GRUPPO
  from d07_prodotto p
  join d07_tipo_prodotto tp on p.tipo_prodotto_id = tp.id ;

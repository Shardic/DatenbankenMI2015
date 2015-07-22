CREATE VIEW rechnungsansicht AS

Select rechnungsnummer, rechnungsbetrag, rkundennummer, starttag, endtag, nummernschild, fahrzeugnummer, fmodellnummer
FROM terminmanagement ter 

JOIN rechnung r
ON ter.mrechnungsnummer = r.rechnungsnummer

JOIN fahrzeug f
ON ter.mfahrzeugnummer = f.fahrzeugnummer